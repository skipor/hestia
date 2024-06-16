import hestia
import logging
import asyncio
import pickle
import os
import secrets
import re
from datetime import datetime
from telegram import Update
from telegram.error import BadRequest
from telegram.ext import filters, MessageHandler, ApplicationBuilder, CommandHandler, ContextTypes
from time import sleep
from secrets import OWN_CHAT_ID
from targets import targets


def initialize():
    logging.warning("Initializing application...")

    if hestia.check_scraper_halted():
        logging.warning("Scraper is halted.")
        
    if hestia.check_dev_mode():
        logging.warning("Dev mode is enabled.")
    
def privileged(update, context, command, check_only=True):
    admins = hestia.query_db("SELECT * FROM subscribers WHERE user_level = 9")
    admin_chat_ids = [int(admin["telegram_id"]) for admin in admins]
    
    if update.effective_chat.id in admin_chat_ids:
        if not check_only:
            logging.warning(f"Command {command} by ID {update.effective_chat.id}: {update.message.text}")
        return True
    else:
        if not check_only:
            logging.warning(f"Unauthorized {command} attempted by ID {update.effective_chat.id}.")
        return False
        
def parse_argument(text, key) -> dict:
    arg = re.search(f"{key}=(.*?)(?:\s|$)", text)
    
    if not arg:
        return dict()
    
    start, end = arg.span()
    stripped_text = text[:start] + text[end:]
    
    value = arg.group(1)
    
    return {"text": stripped_text, "key": key, "value": value}
        
async def get_sub_name(update, context):
    name = update.effective_chat.username
    if name is None:
        chat = await context.bot.get_chat(update.effective_chat.id)
        name = chat.first_name
    return name

async def new_sub(update, context, reenable=False):
    name = await get_sub_name(update, context)
    log_msg = f"New subscriber: {name} ({update.effective_chat.id})"
    logging.info(log_msg)
#    await context.bot.send_message(chat_id=secrets.OWN_CHAT_ID, text=log_msg)
    
    # If the user existed before, then re-enable the telegram updates
    if reenable:
        hestia.query_db("UPDATE subscribers SET telegram_enabled = true WHERE telegram_id = %s", params=[str(update.effective_chat.id)])
    else:
        hestia.query_db("INSERT INTO subscribers VALUES (DEFAULT, '2099-01-01T00:00:00', DEFAULT, DEFAULT, DEFAULT, true, %s)", params=[str(update.effective_chat.id)])
        
    message ="""Hi there!

I scrape real estate websites for new rental homes in The Netherlands. For more info on which websites I scrape, say /websites. To see and modify your personal filters, say /filter.

You will receive a message when I find a new home that matches your filters! If you want me to stop, just say /stop."""
    await context.bot.send_message(update.effective_chat.id, message)

async def make_admin(update, context):
    hestia.query_db("UPDATE subscribers SET user_level = 9 WHERE telegram_id = %s", params=[str(update.effective_chat.id)])
    await context.bot.send_message(update.effective_chat.id, "You are now admin!")

async def start(update, context):
    checksub = hestia.query_db("SELECT * FROM subscribers WHERE telegram_id = %s", params=[str(update.effective_chat.id)], fetchOne=True)

    if checksub is not None:
        if checksub["telegram_enabled"]:
            message = "You are already a subscriber, I'll let you know if I see any new rental homes online!"
            await context.bot.send_message(update.effective_chat.id, message)
        else:
            await new_sub(update, context, reenable=True)
    else:
        await new_sub(update, context)

    if str(update.effective_chat.id) == OWN_CHAT_ID:
        await make_admin(update, context)

async def stop(update, context):
    checksub = hestia.query_db("SELECT * FROM subscribers WHERE telegram_id = %s", params=[str(update.effective_chat.id)], fetchOne=True)

    if checksub is not None:
        if checksub["telegram_enabled"]:
            # Disabling is setting telegram_enabled to false in the db
            hestia.query_db("UPDATE subscribers SET telegram_enabled = false WHERE telegram_id = %s", params=[str(update.effective_chat.id)])
            
            name = await get_sub_name(update, context)
            log_msg = f"Removed subscriber: {name} ({update.effective_chat.id})"
            logging.warning(log_msg)
#            await context.bot.send_message(chat_id=secrets.OWN_CHAT_ID, text=log_msg)

    donation_link = hestia.query_db("SELECT donation_link FROM meta", fetchOne=True)["donation_link"]

    await context.bot.send_message(
        chat_id=update.effective_chat.id,
        text=f"""You will no longer recieve updates for new listings\. I hope this is because you've found a new home\!
        
Consider [buying me a beer]({donation_link}) if this bot has helped you in your search {hestia.LOVE_EMOJI}""",
        parse_mode="MarkdownV2",
        disable_web_page_preview=True
    )

async def reply(update, context):
    await context.bot.send_message(
        chat_id=update.effective_chat.id,
        text="Sorry, I can't talk to you, I'm just a scraper. If you want to see what commands I support, say /help. If you are lonely and want to chat, try ChatGPT."
    )

async def websites(update, context):
    # targets = hestia.query_db("SELECT agency, website FROM targets WHERE enabled = true")

    message = "Here are the websites I scrape every minute:\n\n"
    
    for target in targets:
        message += f"Agency: {target.agency}\n"
        # message += f"Website: {target['website']}\n"
        message += f"\n"
        
    await context.bot.send_message(update.effective_chat.id, message[:-1])
    sleep(1)


async def get_sub_info(update, context):
    if not privileged(update, context, "get_sub_info", check_only=False): return
        
    sub = update.message.text.split(' ')[1]
    try:
        chat = await context.bot.get_chat(sub)
        message = f"Username: {chat.username}\n"
        message += f"Name: {chat.first_name} {chat.last_name}\n"
        message += f"Bio: {chat.bio}"
    except:
        logging.error(f"/getsubinfo for unknown chat id: {sub}")
        message = f"Unknown chat id."
    
    await context.bot.send_message(update.effective_chat.id, message)
    
async def halt(update, context):
    if not privileged(update, context, "halt", check_only=False): return
    
    hestia.query_db("UPDATE meta SET scraper_halted = true WHERE id = %s", params=[hestia.SETTINGS_ID])
    
    message = "Halting scraper."
    await context.bot.send_message(update.effective_chat.id, message)
    
async def resume(update, context):
    if not privileged(update, context, "resume", check_only=False): return
    
    settings = hestia.query_db("SELECT scraper_halted FROM meta WHERE id = %s", params=[hestia.SETTINGS_ID], fetchOne=True)
    
    if settings["scraper_halted"]:
        hestia.query_db("UPDATE meta SET scraper_halted = false WHERE id = %s", params=[hestia.SETTINGS_ID])
        message = "Resuming scraper. Note that this may create a massive update within the next 5 minutes. Consider enabling /dev mode."
    else:
        message = "Scraper is not halted."
        
    await context.bot.send_message(update.effective_chat.id, message)

async def enable_dev(update, context):
    if not privileged(update, context, "dev", check_only=False): return
    
    hestia.query_db("UPDATE meta SET devmode_enabled = true WHERE id = %s", params=[hestia.SETTINGS_ID])
    
    message = "Dev mode enabled."
    await context.bot.send_message(update.effective_chat.id, message)
    
async def disable_dev(update, context):
    if not privileged(update, context, "nodev", check_only=False): return
    
    hestia.query_db("UPDATE meta SET devmode_enabled = false WHERE id = %s", params=[hestia.SETTINGS_ID])
    
    message = "Dev mode disabled."
    await context.bot.send_message(update.effective_chat.id, message)
    
async def get_all_subs(update, context):
    if not privileged(update, context, "get_all_subs", check_only=False): return
    
    subs = hestia.query_db("SELECT * FROM subscribers WHERE subscription_expiry IS NOT NULL AND telegram_enabled = true")
    
    message = "Current active subscribers:\n\n"
    for sub in subs:
        try:
            chat = await context.bot.get_chat(sub["telegram_id"])
        except BadRequest:
            # This means a user in the db has blocked the bot without unsubscribing
            continue
        message += f"{sub['telegram_id']} {chat.username} ({chat.first_name} {chat.last_name})\n"
    
    await context.bot.send_message(update.effective_chat.id, message)
    
async def status(update, context):
    if not privileged(update, context, "status", check_only=False): return

    settings = hestia.query_db("SELECT * FROM meta WHERE id = %s", params=[hestia.SETTINGS_ID], fetchOne=True)
    
    message = f"Running version: {hestia.APP_VERSION}\n\n"
    
    if settings["devmode_enabled"]:
        message += f"{hestia.CROSS_EMOJI} Dev mode: enabled\n"
    else:
        message += f"{hestia.CHECK_EMOJI} Dev mode: disabled\n"
        
    if settings["scraper_halted"]:
        message += f"{hestia.CROSS_EMOJI} Scraper: halted\n"
    else:
        message += f"{hestia.CHECK_EMOJI} Scraper: active\n"

    sub_count = hestia.query_db("SELECT COUNT(*) FROM subscribers WHERE telegram_enabled = true", fetchOne=True)
    message += "\n"
    message += f"Active subscriber count: {sub_count['count']}\n"
    

    # targets = hestia.query_db("SELECT * FROM targets")
    message += "\n"
    message += "Targets (id): listings in past 7 days\n"
        
    for target in targets:
        agency = target.agency
        count = hestia.query_db("SELECT COUNT(*) FROM homes WHERE agency = %s AND date_added > now() - '1 week'::interval", params=[agency], fetchOne=True)
        lastHome_q = hestia.query_db("SELECT date_added FROM homes WHERE agency = %s ORDER BY date_added DESC LIMIT 1", params=[agency], fetchOne=True)
        lastHome = lastHome_q["date_added"] if lastHome_q != None else ""
        message += f"{agency}\t{count['count']} listings\t{lastHome}\n"

    await context.bot.send_message(update.effective_chat.id, message, disable_web_page_preview=True)
    
async def help(update, context):
    message = "*I can do the following for you:*\n"
    message += "/help - Show this message\n"
    message += "/start - Subscribe to updates\n"
    message += "/stop - Stop receiving updates\n\n"
    message += "/websites - Show info about the websites I scrape"

    if privileged(update, context, "help", check_only=True):
        message += "\n\n"
        message += "*Admin commands:*\n"
        message += "/announce - Broadcast a message to all subscribers\n"
        message += "/getallsubs - Get all subscriber info\n"
        message += "/getsubinfo <id> - Get info by Telegram chat ID\n"
        message += "/status - Get system status\n"
        message += "/halt - Halts the scraper\n"
        message += "/resume - Resumes the scraper\n"
        message += "/dev - Enables dev mode\n"
        message += "/nodev - Disables dev mode\n"

    await context.bot.send_message(update.effective_chat.id, message, parse_mode="Markdown")

if __name__ == '__main__':
    initialize()

    application = ApplicationBuilder().token(secrets.TOKEN).build()

    application.add_handler(CommandHandler("start", start))
    application.add_handler(CommandHandler("stop", stop))
    application.add_handler(CommandHandler("websites", websites))
    application.add_handler(CommandHandler("getsubinfo", get_sub_info))
    application.add_handler(CommandHandler("getallsubs", get_all_subs))
    application.add_handler(CommandHandler("status", status))
    application.add_handler(CommandHandler("halt", halt))
    application.add_handler(CommandHandler("resume", resume))
    application.add_handler(CommandHandler("dev", enable_dev))
    application.add_handler(CommandHandler("nodev", disable_dev))
    application.add_handler(CommandHandler("help", help))
    application.add_handler(MessageHandler(filters.TEXT & (~filters.COMMAND), reply))
    
    application.run_polling()

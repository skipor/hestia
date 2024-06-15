import hestia
import logging
import requests
import secrets
from datetime import datetime, timedelta
from asyncio import run

from targets import scrapeAllTargets

async def main():
    
    # Once a day at 7pm, check some stuff and send an alert if necessary
    if datetime.now().hour == 19 and datetime.now().minute < 4:
        message = ""
    
        if hestia.check_dev_mode():
            message += "\n\nDev mode is enabled."
            
        if hestia.check_scraper_halted() and 'dev' not in hestia.APP_VERSION:
            message += "\n\nScraper is halted."
    
        if message:
            await hestia.BOT.send_message(text=message[2:], chat_id=secrets.OWN_CHAT_ID)
    
    if hestia.check_scraper_halted():
        logging.warning("Scraper is halted.")
        exit()

    logging.debug('Scarping targets...')

    await scrapeAllTargets()
    

if __name__ == '__main__':
    run(main())

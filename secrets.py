import os
import logging

def getEnv(key: str):
  if key in os.environ:
    return os.environ
  else:
    logging.warn(f"Config value {key} not found in env. Setting placeholder")
    return "PLACEHOLDER"

OWN_CHAT_ID = getEnv('OWN_CHAT_ID') # Obtained by messaging the bot and then checking https://api.telegram.org/bot<BOTID>/getUpdates
TOKEN = getEnv('TOKEN') # telegram

DB_DB = getEnv('DB_DB')
DB_HOST = getEnv('DB_HOST')
DB_USER = getEnv('DB_USER')
DB_PASSWORD = getEnv('DB_PASSWORD')
DB_PORT = getEnv('DB_PORT')
import logging
logging.basicConfig(
    format="%(asctime)s [%(levelname)s]: %(message)s",
    level=logging.DEBUG,
)

from targets import *


target = Vesteda()

homes = target.testScrape()
# print(homes)
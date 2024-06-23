import logging
logging.basicConfig(
    format="%(asctime)s [%(levelname)s]: %(message)s",
    level=logging.DEBUG,
)

from targets import *


target = VanDerLinden()

homes = target.testScrape()
# print(homes)
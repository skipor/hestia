import logging
logging.basicConfig(
    format="%(asctime)s [%(levelname)s]: %(message)s",
    level=logging.DEBUG,
)

from targets import SelectAHouse


target = SelectAHouse()

homes = target.testScrape()
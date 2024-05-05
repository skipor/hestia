import logging
logging.basicConfig(
    format="%(asctime)s [%(levelname)s]: %(message)s",
    level=logging.DEBUG,
)

from targets import WoningnetEemvallei


target = WoningnetEemvallei()

homes = target.testScrape()
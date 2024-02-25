# Hestia

Hestia scrapes real estate websites for new rental listings, and broadcasts the results via Telegram. Check out @hestia_homes_bot on Telegram: https://t.me/hestia_homes_bot

## Dev install

- `docker compose -f docker-compose-dev.yml up --build`
- postgres admin available under localhost:8080, credentials are `a@a.com` and `verysecret`.

## Developing a new target

The workflow for adding new targets to the scraper is as follows:
1. Add a target child class, to the `targets.py` file. This is done by taking another target as a template and modifying it. For example the `Spotmakelaardij` class parses the HTML returned by the page, while the `Vbtverhuurmakelaars` target parses a JSON request.
2. Add the created class to the `targets` variable at the bottom of the `targets.py` file.
3. To test the scraper standalone from the whole system, modify the `test.py` file to import your scraper class. Run it with `python3 test.py`. The parsed homes should be printed to the terminal.
4. Commit and push, the scraper will be automatically active on the live system.

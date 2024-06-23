#!/usr/bin/env bash

set -euxo pipefail
cd $(dirname $(readlink -f $0))

curl -v 'https://www.vanderlinden.nl/woning-huren/' \
  --data-raw 'zoekterm=Amsterdam&min-prijs=1200&max-prijs=5000' \
  --output /dev/null --cookie-jar ./cookie.txt

curl -v 'https://www.vanderlinden.nl/woning-huren/' --cookie cookie.txt



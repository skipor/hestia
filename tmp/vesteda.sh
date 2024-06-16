#!/usr/bin/env bash
curl 'https://www.vesteda.com/api/units/search/facet' \
  -H 'content-type: application/json' \
  -H 'referer: https://www.vesteda.com/en/unit-search?placeType=1&sortType=0&radius=3&s=Amstelveen,%20Nederland&sc=woning&latitude=52.348495150540856&longitude=4.8904783499999915&filters=0,6873,6883,6889,6899,6870,6972,6875,6898,6882,6872,6847&priceFrom=500&priceTo=9999' \
  --data-raw '{"filters":[0,6873,6883,6889,6899,6870,6972,6875,6898,6882,6872,6847],"latitude":52.348495150540856,"longitude":4.8904783499999915,"place":"Amstelveen, Nederland","placeObject":{"placeType":"1","name":"Amstelveen, Nederland","latitude":"52.348495150540856","longitude":"4.8904783499999915"},"placeType":1,"radius":3,"sorting":0,"priceFrom":500,"priceTo":9999,"language":"en"}'

#!/usr/bin/env bash
curl 'https://www.vesteda.com/api/units/search/facet' \
  -H 'accept: application/json' \
  -H 'accept-language: en-US,en;q=0.9,ru;q=0.8,it;q=0.7' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -H 'cookie: trafficType=extern; CookieConsent={stamp:%27e8sq2KfwU4Hhjgbepar9ShVxFzsZrEpSeijPu6IN15UKfWRDx8uskg==%27%2Cnecessary:true%2Cpreferences:true%2Cstatistics:true%2Cmarketing:true%2Cmethod:%27explicit%27%2Cver:1%2Cutc:1714764317742%2Cregion:%27nl%27}; _gcl_au=1.1.350171605.1714764318; _ga=GA1.1.1432331555.1714764318; 5da451d1e48514.00659317__cbs=%7B%22i%22%3A%22cw4fe%22%2C%22v%22%3A%22TRyBurCxXRmJkroY5licqyiRcz4cmtGrkqmrKZyR1714764330684%22%7D; 5da451d1e48514.00659317__cbv=%7B%22i%22%3A%22cw4fe%22%2C%22v%22%3A%22ql5G8kJKc6GpBAVXwhtFglq6en8pGg2PlK-sb7SL1714764330685%22%7D; _hjSessionUser_2032788=eyJpZCI6IjA5YjQ5ZjY4LTcxYmEtNWM0Mi05ODlhLTJjNWNlNjMwZDM3NCIsImNyZWF0ZWQiOjE3MTQ3NjQzMTgwODYsImV4aXN0aW5nIjp0cnVlfQ==; loid=922244a53368c28e224c811a42003e63; ARRAffinity=b3ab359c4ca6aa3ecdd6e61996ab677eba545d81029a2f999191c2aecff3687a; ARRAffinitySameSite=b3ab359c4ca6aa3ecdd6e61996ab677eba545d81029a2f999191c2aecff3687a; MSopened=38729269ca6a8f8ee4ca0f1af92f77e4081a8e9a; MSopened.38729269ca6a8f8ee4ca0f1af92f77e4081a8e9a=true; ARRAffinity=b3ab359c4ca6aa3ecdd6e61996ab677eba545d81029a2f999191c2aecff3687a; ARRAffinitySameSite=b3ab359c4ca6aa3ecdd6e61996ab677eba545d81029a2f999191c2aecff3687a; _hjSession_2032788=eyJpZCI6IjVmODM2YmU0LTJhMjMtNGI3NC04NjA4LWI4Y2FhNWJmNGVmMyIsImMiOjE3MTg1Mjk0MzIxNzEsInMiOjAsInIiOjAsInNiIjowLCJzciI6MCwic2UiOjAsImZzIjowLCJzcCI6MH0=; _ga_CZ61GGJQ6X=GS1.1.1718529432.11.1.1718531062.0.0.0' \
  -H 'origin: https://www.vesteda.com' \
  -H 'pragma: no-cache' \
  -H 'priority: u=1, i' \
  -H 'referer: https://www.vesteda.com/en/unit-search?placeType=1&sortType=0&radius=5&s=Amstelveen,%20Nederland&sc=woning&latitude=52.32954207727795&longitude=4.871770866748051&filters=0,6873,6883,6889,6899,6870,6972,6875,6898,6882,6872,6847&priceFrom=500&priceTo=9999' \
  -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: same-origin' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
  --data-raw '{"filters":[0,6873,6883,6889,6899,6870,6972,6875,6898,6882,6872,6847],"latitude":52.32954207727795,"longitude":4.871770866748051,"place":"Amstelveen, Nederland","placeObject":{"placeType":"1","name":"Amstelveen, Nederland","latitude":"52.32954207727795","longitude":"4.871770866748051"},"placeType":1,"radius":5,"sorting":0,"priceFrom":500,"priceTo":9999,"language":"en"}'

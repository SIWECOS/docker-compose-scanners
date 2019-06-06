#!/bin/bash

declare -A SCANNER_URL
SCANNER_URL[ALL]=http://localhost:8000/api/v2/scan
SCANNER_URL[CORE]=http://localhost:8000/api/v2/scan
SCANNER_URL[INI_S]=http://localhost:8090/api/v1/check
SCANNER_URL[DOMXSS]=http://localhost:8091/api/v1/domxss
SCANNER_URL[HEADER]=http://localhost:8091/api/v1/header
SCANNER_URL[INFOLEAK]=http://localhost:8093/api/start
SCANNER_URL[PORT]=http://localhost:8094/start
SCANNER_URL[HTTPS]=http://localhost:8095/https
# SCANNER_URL[MAIL]=
SCANNER_URL[VERSION]=http://localhost:8096/api/v1/version



while read domain; do
curl -X POST \
  ${SCANNER_URL[$1]} \
  -H 'Content-Type: application/json' \
  -d '{
  "url": "'$domain'",
  "dangerLevel": 10,
  "callbackurls": [
    "http://callback:3000/scans"
  ]
}'

done < domainList.txt

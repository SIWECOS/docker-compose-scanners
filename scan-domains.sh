#!/bin/bash
case "$1" in
ALL)      url=http://localhost:8000/api/v2/scan ;;
CORE)     url=http://localhost:8000/api/v2/scan ;;
INI_S)    url=http://localhost:8090/api/v1/check ;;
DOMXSS)   url=http://localhost:8091/api/v1/domxss ;;
HEADER)   url=http://localhost:8091/api/v1/header ;;
INFOLEAK) url=http://localhost:8093/api/v2/start ;;
PORT)     url=http://localhost:8094/start ;;
TLS)      url=http://localhost:8095/tls ;;
# SCANNER_URL[MAIL]=
VERSION)  url=http://localhost:8096/api/v1/version ;;
*)        echo "Don't know about $1" 
          exit 1
          ;;
esac

while read domain; do
curl -X POST \
  ${url} \
  -H 'Content-Type: application/json' \
  -d '{
  "url": "'$domain'",
  "dangerLevel": 10,
  "callbackurls": [
    "http://callback:3000/scans"
  ]
}'

done < domainList.txt

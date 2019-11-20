#!/bin/bash
if [ -z "$1" ] ; then
  cat <<USAGE
$0 OPTION
where OPTION is one of
  ALL          CORE         INI_S        DOMXSS
  HEADER       INFOLEAK     PORT         TLS
  IMAP_TLS     IMAPS_TLS    POP3_TLS     POP3S_TLS
  SMTP_TLS     SMTPS_TLS    SMTP_MSA_TLS VERSION
USAGE
  exit;
fi
case "$1" in
ALL)          url=http://localhost:8000/api/v2/scan ;;
CORE)         url=http://localhost:8000/api/v2/scan ;;
INI_S)        url=http://localhost:8090/api/v1/check ;;
DOMXSS)       url=http://localhost:8091/api/v1/domxss ;;
HEADER)       url=http://localhost:8091/api/v1/header ;;
INFOLEAK)     url=http://localhost:8093/api/v2/start ;;
PORT)         url=http://localhost:8094/start ;;
TLS)          url=http://localhost:8095/tls ;;
IMAP_TLS)     url=http://localhost:8095/imap ;;
IMAPS_TLS)    url=http://localhost:8095/imaps ;;
POP3_TLS)     url=http://localhost:8095/pop3 ;;
POP3S_TLS)    url=http://localhost:8095/pop3s ;;
SMTP_TLS)     url=http://localhost:8095/smtp ;;
SMTPS_TLS)    url=http://localhost:8095/smtps ;;
SMTP_MSA_TLS) url=http://localhost:8095/smtp_msa ;;
VERSION)      url=http://localhost:8096/api/v1/version ;;
*)            echo "Don't know about $1"
              exit 1
              ;;
esac

tr -d $'\015' < domainList.txt |
while read domain; do
  if [ -z "$domain" ] ; then continue ; fi
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
done

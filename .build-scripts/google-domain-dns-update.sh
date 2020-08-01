#!/bin/bash

# https://support.google.com/domains/answer/6147083

USERNAME=$GOOGLE_CRED_USERNAME
PASSWORD=$GOOGLE_CRED_PASSWORD
HOSTNAME=$GOOGLE_DOMAIN

# resole current public IP
IP=$( dig +short myip.opendns.com @resolver1.opendns.com )

URL="https://${USERNAME}:${PASSWORD}@domains.google.com/nic/update?hostname=${HOSTNAME}&myip=${IP}"

curl -s $URL

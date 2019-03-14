#!/bin/bash

if [ $# -eq 3 ]; then

ZHOST=$1
ZIP=$2
PASS=$3

if [[ $2 =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
sed -e "s/ZHOSTNAME/${1}/g" -e "s/ZIPADDR/${2}/g" -e "s/ZPASS/$PASS/g" template.yml > docker-compose.yml
docker-compose up -d
rm docker-compose.yml
else
echo "$2 not valid IP ADDR"
exit 1
fi
else
echo "Use ARG './run.sh HostName IP PASSWD'"
exit 1
fi

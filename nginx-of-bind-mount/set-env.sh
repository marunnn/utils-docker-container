#!/bin/bash

if [ 1 -lt $# ]; then
	echo "error argument:must have no more than 1 argument"
	exit 1
fi

SOURCE_DATA=../../bind-mount/nginx-of-bind-mount/data
SOURCE_WORK=../../bind-mount/nginx-of-bind-mount/work
mkdir -p $SOURCE_DATA
mkdir -p $SOURCE_WORK
UNAME=root

touch .env
cat << EOF > .env
SOURCE_DATA=$SOURCE_DATA
SOURCE_WORK=$SOURCE_WORK
VERSION=${1:-latest}
UNAME=$UNAME
EOF

echo "set .env"
echo "-----"
cat ./.env

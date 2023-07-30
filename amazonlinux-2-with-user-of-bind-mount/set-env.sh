#!/bin/bash

if [ 3 -lt $# ]; then
	echo "error argument:must have no more than 3 argument"
	exit 1
fi

SOURCE=../../bind-mount/amazonlinux-2-with-user-of-bind-mount
mkdir -p $SOURCE

touch .env
cat << EOF > .env
SOURCE=$SOURCE
AMAZONLINUX_2_WITH_USER_VERSION=${1:-latest}
UNAME=${2:-user}
PW=${3:-user}
EOF

echo "set .env"
echo "-----"
cat ./.env

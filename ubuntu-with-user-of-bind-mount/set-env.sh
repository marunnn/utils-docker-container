#!/bin/bash

if [ 2 -lt $# ]; then
	echo "error argument:must have no more than 2 argument"
	exit 1
fi

SOURCE=../../bind-mount/ubuntu-with-user-of-bind-mount
mkdir -p $SOURCE

touch .env
cat << EOF > .env
SOURCE=$SOURCE
UID=$(id -u $USER)
GID=$(id -g $USER)
UNAME=${1:-user}
GNAME=${1:-user}
PW=${2:-user}
EOF

echo "set .env"
echo "-----"
cat ./.env

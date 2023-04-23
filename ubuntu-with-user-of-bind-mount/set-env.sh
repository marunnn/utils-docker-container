#!/bin/bash

if [ 2 -lt $# ]; then
	echo "error argument:must have no more than 2 argument"
	exit 1
fi

rm -f ./.env

SOURCE=../../bind-mount/ubuntu-with-user-of-bind-mount
mkdir -p $SOURCE

touch .env
echo "SOURCE=$SOURCE" >> .env
echo "UID=$(id -u $USER)" >> .env
echo "GID=$(id -g $USER)" >> .env
echo "UNAME=${1:-user}" >> .env
echo "GNAME=${1:-user}" >> .env
echo "PW=${2:-user}" >> .env

echo "set .env"
echo "-----"
cat ./.env

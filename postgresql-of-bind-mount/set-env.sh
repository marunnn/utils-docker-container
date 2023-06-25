#!/bin/bash

if [ 3 -lt $# ]; then
	echo "error argument:must have no more than 3 argument"
	exit 1
fi

SOURCE_INIT=../../bind-mount/postgresql-of-bind-mount/init
SOURCE_DATA=../../bind-mount/postgresql-of-bind-mount/data
SOURCE_WORK=../../bind-mount/postgresql-of-bind-mount/work
mkdir -p $SOURCE_INIT
mkdir -p $SOURCE_DATA
mkdir -p $SOURCE_WORK

touch .env
cat << EOF > .env
SOURCE_INIT=$SOURCE_INIT
SOURCE_DATA=$SOURCE_DATA
SOURCE_WORK=$SOURCE_WORK
POSTGRES_VERSION=${1:-latest}
POSTGRES_USER=${2:-sample}
POSTGRES_PASSWORD=${2:-sample}
POSTGRES_DB=${3:-sample}
EOF

echo "set .env"
echo "-----"
cat ./.env

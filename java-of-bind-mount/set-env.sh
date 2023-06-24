#!/bin/bash

if [ 1 -lt $# ]; then
	echo "error argument:must have no more than 1 argument"
	exit 1
fi

SOURCE=../../bind-mount/java-of-bind-mount
mkdir -p $SOURCE

touch .env
cat << EOF > .env
SOURCE=$SOURCE
JAVA_VERSION=${1:-latest}
EOF

echo "set .env"
echo "-----"
cat ./.env

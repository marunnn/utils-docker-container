#!/bin/bash

echo; echo 'Info: start'

set -eu

if [ 1 -lt $# ]; then
	echo 'Error: must have no more than 1 argument'
	exit 1
fi

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
DOT_ENV_PATH=${SCRIPT_DIR}/.env
PYTHON_VERSION=${1:-3.12.2-slim-bullseye}
SOURCE_DIR=${SCRIPT_DIR}/bind-mount
TARGET_DIR=/root/bind-mount

mkdir -p "${SOURCE_DIR}"

touch "${DOT_ENV_PATH}"
cat << EOF > "${DOT_ENV_PATH}"
PYTHON_VERSION=${PYTHON_VERSION}
SOURCE_DIR=${SOURCE_DIR}
TARGET_DIR=${TARGET_DIR}
EOF

echo; echo 'Info: .env completed creation'
echo '----------'
cat "${DOT_ENV_PATH}"
echo '----------'

echo; echo 'Info: end'
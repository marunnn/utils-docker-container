#!/bin/bash

echo; echo 'Info: start'

set -eu

if [ 1 -lt $# ]; then
	echo 'Error: must have no more than 1 argument'
	exit 1
fi

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
DOT_ENV_PATH=${SCRIPT_DIR}/.env
NGINX_VERSION=${1:-1.25.3}
SOURCE_DATA_DIR=${SCRIPT_DIR}/bind-mount/data
TARGET_DATA_DIR=/data
SOURCE_WORK_DIR=${SCRIPT_DIR}/bind-mount/work
TARGET_WORK_DIR=/root/bind-mount

mkdir -p "${SOURCE_DATA_DIR}"
mkdir -p "${SOURCE_WORK_DIR}"

touch "${DOT_ENV_PATH}"
cat << EOF > "${DOT_ENV_PATH}"
NGINX_VERSION=${NGINX_VERSION}
SOURCE_DATA_DIR=${SOURCE_DATA_DIR}
TARGET_DATA_DIR=${TARGET_DATA_DIR}
SOURCE_WORK_DIR=${SOURCE_WORK_DIR}
TARGET_WORK_DIR=${TARGET_WORK_DIR}
EOF

echo; echo 'Info: .env completed creation'
echo '----------'
cat "${DOT_ENV_PATH}"
echo '----------'

echo; echo 'Info: end'
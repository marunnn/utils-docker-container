#!/bin/bash

echo; echo 'Info: start'

set -eu

if [ 3 -lt $# ]; then
	echo 'Error: must have no more than 3 argument'
	exit 1
fi

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
DOT_ENV_PATH=${SCRIPT_DIR}/.env
POSTGRES_VERSION=${1:-16.1-bullseye}
POSTGRES_USER=${2:-sample}
POSTGRES_PASSWORD=${2:-sample}
POSTGRES_DB=${3:-sample}
SOURCE_INIT_DIR=${SCRIPT_DIR}/bind-mount/init
TARGET_INIT_DIR=/docker-entrypoint-initdb.d
SOURCE_DATA_DIR=${SCRIPT_DIR}/bind-mount/data
TARGET_DATA_DIR=/var/lib/postgresql/data
SOURCE_WORK_DIR=${SCRIPT_DIR}/bind-mount/work
TARGET_WORK_DIR=/root/bind-mount

mkdir -p "${SOURCE_INIT_DIR}"
mkdir -p "${SOURCE_DATA_DIR}"
mkdir -p "${SOURCE_WORK_DIR}"

touch "${DOT_ENV_PATH}"
cat << EOF > "${DOT_ENV_PATH}"
POSTGRES_VERSION=${POSTGRES_VERSION}
POSTGRES_USER=${POSTGRES_USER}
POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
POSTGRES_DB=${POSTGRES_DB}
SOURCE_INIT_DIR=${SOURCE_INIT_DIR}
TARGET_INIT_DIR=${TARGET_INIT_DIR}
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
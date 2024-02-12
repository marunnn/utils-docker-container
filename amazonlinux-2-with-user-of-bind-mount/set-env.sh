#!/bin/bash

echo; echo 'Info: start'

set -eu

if [ 3 -lt $# ]; then
	echo 'Error: must have no more than 3 argument'
	exit 1
fi

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
DOT_ENV_PATH=${SCRIPT_DIR}/.env
AMAZONLINUX_2_WITH_USER_VERSION=${1:-latest}
USER_NAME=${2:-user}
USER_PW=${3:-user}
SOURCE_DIR=${SCRIPT_DIR}/bind-mount
TARGET_DIR=/home/${USER_NAME}/bind-mount

mkdir -p "${SOURCE_DIR}"

touch "${DOT_ENV_PATH}"
cat << EOF > "${DOT_ENV_PATH}"
AMAZONLINUX_2_WITH_USER_VERSION=${AMAZONLINUX_2_WITH_USER_VERSION}
USER_NAME=${USER_NAME}
USER_PW=${USER_PW}
SOURCE_DIR=${SOURCE_DIR}
TARGET_DIR=${TARGET_DIR}
EOF

echo; echo 'Info: .env completed creation'
echo '----------'
cat "${DOT_ENV_PATH}"
echo '----------'

echo; echo 'Info: end'
#!/bin/bash

echo; echo 'Info: start'

set -eu

if [ 3 -lt $# ]; then
	echo 'Error: must have no more than 3 argument'
	exit 1
fi

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
DOT_ENV_PATH=${SCRIPT_DIR}/.env
UBUNTU_VERSION=${1:-22.04}
USER_ID=$(id -u "${USER}")
GROUP_ID=$(id -g "${USER}")
USER_NAME=${2:-user}
GROUP_NAME=${2:-user}
PW=${3:-user}

touch "${DOT_ENV_PATH}"
cat << EOF > "${DOT_ENV_PATH}"
UBUNTU_VERSION=${UBUNTU_VERSION}
USER_ID=${USER_ID}
GROUP_ID=${GROUP_ID}
USER_NAME=${USER_NAME}
GROUP_NAME=${GROUP_NAME}
PW=${PW}
EOF

echo; echo 'Info: .env completed creation'
echo '----------'
cat "${DOT_ENV_PATH}"
echo '----------'

echo; echo 'Info: end'
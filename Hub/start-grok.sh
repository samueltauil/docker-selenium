#!/usr/bin/env bash

# set -e: exit asap if a command exits with a non-zero status
set -e

ROOT=/opt/selenium
CONF=${ROOT}/config.yml
GROK_VERSION=grok_exporter-1.0.0.RC3.linux-amd64
echo "Starting Grok configuration:"
cat ${CONF}

cd ${ROOT}/${GROK_VERSION}

./grok_exporter -config ${CONF}

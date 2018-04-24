#!/bin/bash -e
set -o pipefail

CONTAINER_NAME="spring-boot"

docker build -t ${CONTAINER_NAME} .


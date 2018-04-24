#!/bin/bash -e
set -o pipefail

APPDIR=/opt/app/do_run
mkdir -p $APPDIR
cd $APPDIR

addSysProp "server.port" "$SERVER_PORT"

java $JAVA_OPTS -jar $APPDIR/app.jar

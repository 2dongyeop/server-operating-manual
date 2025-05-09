#!/bin/bash

PROFILE_ENV="dev"
SERVICE_NAME="configserver"
WORK_DIR="/wisoft/backend/$PROFILE_ENV/$SERVICE_NAME"


sh $WORK_DIR/stop.sh

java -Xms256m -Xmx256m \
-XX:+HeapDumpOnOutOfMemoryError \
-XX:HeapDumpPath=$WORK_DIR/dump \
-javaagent:/wisoft/monitoring/pinpoint/pinpoint-agent-3.0.0/pinpoint-bootstrap-3.0.0.jar \
-Dpinpoint.agentId=$PROFILE_ENV-$SERVICE_NAME \
-Dpinpoint.applicationName=dongyeop-service \
-jar $WORK_DIR/io.wisoft.$SERVICE_NAME.jar &
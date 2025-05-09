#!/bin/bash

PROFILE_ENV="dev"
SERVICE_NAME="apiexample"
WORK_DIR="/wisoft/backend/$PROFILE_ENV/$SERVICE_NAME"


sh $WORK_DIR/stop.sh

java -Xms512m -Xmx512m \
-XX:+HeapDumpOnOutOfMemoryError \
-XX:HeapDumpPath=$WORK_DIR/dump \
-Dspring.profiles.active=$PROFILE_ENV \
-javaagent:/wisoft/monitoring/pinpoint/pinpoint-agent-3.0.0/pinpoint-bootstrap-3.0.0.jar \
-Dpinpoint.agentId=$PROFILE_ENV-$SERVICE_NAME \
-Dpinpoint.applicationName=dongyeop-service \
-jar $WORK_DIR/io.wisoft.$SERVICE_NAME.jar &
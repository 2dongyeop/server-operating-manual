#!/bin/bash

SERVICE_NAME="gateway"
pid=`ps -elf | grep io.wisoft.$SERVICE_NAME.jar | grep java | awk '{print$4}'`

#echo $pid
if [ -z "$pid" ]; then
  echo "$SERVICE_NAME already kill"
else
  kill -9 $pid
  echo $SERVICE_NAME $pid process exit
fi

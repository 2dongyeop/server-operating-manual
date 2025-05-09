
#!/bin/bash

# DB만 Docker로 구성하여, 기동 확인 방식이 다름.
if [ -z "$(docker ps -q -f name=mysql-container-dev)" ]; then
  echo "dev mysql service running"
  docker-compose -f /wisoft/database/mysql/dev/docker-compose.yml up -d
fi

pid_config_server=`ps -elf | grep io.wisoft.configserver.jar | grep java | awk '{print$4}'`
if [ -z "$pid_config" ]; then
  echo "configserver service running"
  sh /wisoft/backend/dev/configserver/start.sh
fi

echo "Waiting for [dev_mysql] and [dev_configserver] to start..."
while ! (nc -z localhost 17770 && nc -z localhost 17771); do
  sleep 1
done
echo "[dev_mysql] and [dev_configserver] are started!"

pid_dev_gw=`ps -elf | grep active=dev | grep io.wisoft.gateway.jar | grep java | awk '{print$4}'`
if [ -z "$pid_dev_gw" ]; then
  echo "dev gateway service running"
  sh /wisoft/backend/dev/gateway/start.sh
fi

pid_dev_api_example=`ps -elf | grep active=dev | grep io.wisoft.apiexample.jar | grep java | awk '{print$4}'`
if [ -z "$pid_dev_api_example" ]; then
  echo "dev api example service running"
  sh /wisoft/backend/dev/apiexample/start.sh
fi

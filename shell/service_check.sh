
#!/bin/bash

echo "\ndev =============================\n"

PORT_DEV_MYSQL=":::17770"
pid=`netstat -ano | grep LISTEN | grep $PORT_DEV_MYSQL | awk '{print$4}'`
if [ -z "$pid" ]; then
  echo "dev mysql [$PORT_DEV_MYSQL]"
fi

PORT_DEV_CONFIG_SERVER=":::17771"
pid=`netstat -ano | grep LISTEN | grep $PORT_DEV_CONFIG_SERVER | awk '{print$4}'`
if [ -z "$pid" ]; then
  echo "dev configserver [$PORT_DEV_CONFIG_SERVER]"
fi

PORT_DEV_GATEWAY=":::17772"
pid=`netstat -ano | grep LISTEN | grep $PORT_DEV_GATEWAY | awk '{print$4}'`
if [ -z "$pid" ]; then
  echo "dev gateway [$PORT_DEV_GATEWAY]"
fi

PORT_DEV_API_EXAMPLE=":::17773"
pid=`netstat -ano | grep LISTEN | grep $PORT_DEV_API_EXAMPLE | awk '{print$4}'`
if [ -z "$pid" ]; then
  echo "dev example [$PORT_DEV_API_EXAMPLE]"
fi

# TODO : Stage/Prod 추가 구성 시, 추가 필요.

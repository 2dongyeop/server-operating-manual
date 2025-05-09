#!/bin/bash

# nginx_prometheus_exporter는 컨테이너(exporter) 1개당 1개의 scrape-uri을 제공
# 따라서 여러 웹서버를 모니터링하고 싶을 경우, 각각의 컨테이너(exporter)를 띄워야 함.
# scrape-uri 옵션 참고 링크 : https://github.com/nginxinc/nginx-prometheus-exporter?tab=readme-ov-file#command-line-arguments
WEB_SERVER_NAME=dev_nginx
WEB_SERVER_URI=http://localhost:80
EXPORTER_PORT=17775
EXPORTER_NAME=nginx-prometheus-exporter_$WEB_SERVER_NAME

# 이미 아래 이름으로 존재할 경우, 컨테이너 제거
docker rm -f $EXPORTER_NAME

docker run -d --rm --network bridge --name $EXPORTER_NAME -p $EXPORTER_PORT:9113 \
    nginx/nginx-prometheus-exporter:latest \
    --nginx.scrape-uri=$WEB_SERVER_URI/stub_status
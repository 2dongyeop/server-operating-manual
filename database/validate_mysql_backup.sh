#!/bin/bash

SLACK_CHANNEL_NAME="PLEASE_INPUT_SLACK_CHANNEL_NAME"  # 입력 필요
SLACK_TOKEN="PLEASE_INPUT_SLACK_API_TOKEN"            # 입력 필요
PROFILE_ENV="dev"

# Slack 알림 함수
send_slack_notification() {
    local message="$1"
    curl -X POST -d "text=$1" -d "channel=${CHANNEL_NAME}"  \
    -H "Authorization: Bearer ${SLACK_TOKEN}" \
    https://slack.com/api/chat.postMessage
}

# 파일 존재 및 크기 확인 함수
validate_mysql_backup_file() {
    local file=$1
    if [ ! -e "$file" ]; then
        send_slack_notification "${PROFILE_ENV}:: MySQL backup file does not created!"
        return 1
    elif [ ! -s "$file" ]; then
        send_slack_notification "${PROFILE_ENV}:: MySQL backup file is empty!"
        return 1
    else
        return 0
    fi
}

BACKUP_DIR="/wisoft/database/mysql/${PROFILE_ENV}/backup"
BACKUP_FILE="$BACKUP_DIR/$(date +%Y%m%d)_AllDB_${PROFILE_ENV}.sql"

validate_mysql_backup_file "$BACKUP_FILE"
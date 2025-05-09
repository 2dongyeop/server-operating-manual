#!/bin/bash

# 인자에서 사용자 이름과 비밀번호를 받음
USER="$1"
PASSWORD="$2"

# 인자 확인
if [ -z "$USER" ] || [ -z "$PASSWORD" ]; then
  echo "Usage: $0 <user> <password>"
  exit 1
fi

# 환경 설정 => dev/prod 구분
ENV_PROFILE="dev"

# 백업 저장 경로
BACKUP_DIR="/wisoft/database/mysql/${ENV_PROFILE}/backup"

# DB 전체를 한번에 백업할 경우
ALLDEVDB_BACKUP_FILE="$BACKUP_DIR/$(date +%Y%m%d)_AllDB_${ENV_PROFILE}.sql"
mysqldump -u "$USER" -p"$PASSWORD" --single-transaction --all-databases > "$ALLDEVDB_BACKUP_FILE"

# mysqldump 명령어가 오래 걸릴 수 있으니, 바로 실행되지 않게 10초 대기
sleep 10

# 최근 3개 버전만 남기고 나머지를 삭제
ls -t "$BACKUP_DIR"/*_AllDB_${ENV_PROFILE}.sql | tail -n +4 | xargs rm -f

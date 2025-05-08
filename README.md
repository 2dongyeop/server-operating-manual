# server-operating-manual

## Overview.

- Ubuntu 환경에서 API 서버를 운영하기 위한 메뉴얼을 작성합니다.
- **Spring 기반 프로젝트가 아니더라도, 전체적인 설계를 참고하실 수 있습니다.**
- 편의상 Config-Gateway-API Server를 하나의 Git Repo 로 관리중인 것을 감안해주시면 감사하겠습니다.

<br/>

## Table Of Contents.

1. [설계 목표 작성](https://www.notion.so/wisoft/1edef97b47b581db9e92eeaf33480873)
    1. 디렉토리 구조 구성
    2. 서비스 포트 구성
2. [Ubuntu 초기 세팅](https://www.notion.so/wisoft/Ubuntu-1edef97b47b581e3b45ff5016ae7f67e)
    1. Common Setting
        - Package Management, Timezone, Locale
        - Swap Memory, Docker, User Group
        - 운영에 필요한 라이브러리 및 alias 설정
    2. API Server Setting
    3. Web Server Setting
3. [Database 구성](https://www.notion.so/wisoft/Database-1edef97b47b581a78c2cd611fe13ef32)
    1. MySQL Docker 환경 구성
    2. MySQL Backup 자동화
4. [API Server 구성](https://www.notion.so/wisoft/API-Server-1edef97b47b581b195d5ee823bfad012)
    1. 공통 로그 정책 설립
    2. Config Server, Gateway, API Server 구성
    3. 각 서버별 기동/중지 쉘 스크립트 작성
    4. 전체 서비스 헬스체크 쉘 스크립트 작성
    5. 전체 서비스 기동 쉘 스크립트 작성
    6. 시스템 리소스 헬스체크 쉘 스크립트 작성
5. [Monitoring 및 APM 구성](https://www.notion.so/wisoft/Monitoring-APM-1edef97b47b581358c9fe021c6718843)
    1. Grafana & Prometheus 기반 API 서버 모니터링 구축
    2. Pinpoint APM 구축
    3. Grafana & Prometheus 기반 웹 서버 모니터링 구축
    4. Nginx 접속 경로 관리
6. [Jenkins CI/CD 구성](https://www.notion.so/wisoft/Jenkins-CI-CD-1edef97b47b5812a8826dc78dfe45a6f)
    1. Jenkins Docker 환경 구축
    2. Jenkins Job Pipeline 구축
7. nGrinder 성능테스트 환경 구성
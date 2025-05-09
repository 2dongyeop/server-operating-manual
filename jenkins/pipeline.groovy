pipeline {
    // Jenkins가 사용할 agent를 지정
    // any는 "가용한 어떤 노드에서든 실행"이라는 뜻
    agent any

    // Jenkins UI에서 사용자가 입력할 파라미터 정의
    // BRANCH라는 이름의 string 파라미터로 브랜치 이름을 받음
    parameters {
        string(name: 'BRANCH', defaultValue: 'main', description: 'Git branch to build')
    }

    // 환경변수 정의. 프로젝트마다 다르게 지정이 필요.
    environment {
        JAR_FILE_NAME = 'io.wisoft.configserver.jar'
        DEPLOY_DIR = '/wisoft/backend/dev/configserver'
        GIT_DIR_NAME = 'config-server'
        JAR_FILE_PATH = "${GIT_DIR_NAME}/build/libs"
    }

    // 파이프라인은 여러 단계로 구성
    stages {
        stage('Checkout') {
            steps {
                echo "#############################"
                echo "## 1. Checkout Stage Start ##"
                echo "#############################"

                git branch: "${params.BRANCH}", url: 'https://github.com/2dongyeop/server-operating-manual.git'

                echo ">>>>> 1. Checkout Stage End"
            }
        }

        stage('Build') {
            steps {
                echo "##########################"
                echo "## 2. Build Stage Start ##"
                echo "##########################"

                echo "Building branch: ${params.BRANCH}"

                dir("${GIT_DIR_NAME}") {
                    sh './gradlew clean build -x test'
                }

                echo ">>>>> 2. Build Stage End"
            }
        }

        stage('Deploy') {
            steps {
                echo "###########################"
                echo "## 3. Deploy Stage Start ##"
                echo "###########################"
                echo "Deploying ${params.BRANCH}"

                // 동일한 서버에서 실행하므로, 빌드한 jar 파일 위치 이동.
                // 다른 서버일 경우에는 ssh agent를 이용해 적절한 서버로 전송하는 과정이 필요.
                sh "cp ${JAR_FILE_PATH}/${JAR_FILE_NAME} ${DEPLOY_DIR}"

                // 이 부분은 Config Server에만 해당. 나머지 Pipeline에서는 제거.
                sh "cp -r ${GIT_DIR_NAME}/config-file ${DEPLOY_DIR}"

                // 서버 기동
                sh "${DEPLOY_DIR}/start.sh"
                echo ">>>>> 3. Deploy Stage End"
            }
        }
    }
}
pipeline {
    agent any
    
    environment {
        // Harbor 정보 및 신규 프로젝트(test_project_repo) 설정
        HARBOR_URL = '192.168.56.13:80'
        PROJECT_NAME = 'test_project_repo'
        IMAGE_NAME = 'test-project'
        FULL_IMAGE = "${HARBOR_URL}/${PROJECT_NAME}/${IMAGE_NAME}:${BUILD_NUMBER}"
        
        // ★ 중요: BuildKit 활성화 (Dockerfile의 --mount 옵션 사용을 위함)
        DOCKER_BUILDKIT = '1'
    }

    stages {
        stage('Checkout') {
            steps {
                // GitHub 자격 증명(github-auth)을 사용하여 소스 코드 가져오기
                checkout scm
            }
        }

        stage('Docker Build & Tag') {
            steps {
                script {
                    // 프로젝트 내 scripts/deploy/Dockerfile 경로 지정 빌드
                    sh "docker build -f scripts/deploy/Dockerfile -t ${FULL_IMAGE} ."
                }
            }
        }

        stage('Push to Harbor') {
            steps {
                // Harbor 자격 증명(harbor-auth)을 사용하여 로그인 및 푸시
                withCredentials([usernamePassword(credentialsId: 'harbor-auth', passwordVariable: 'HARBOR_PW', usernameVariable: 'HARBOR_USER')]) {
                    sh "docker login ${HARBOR_URL} -u ${HARBOR_USER} -p ${HARBOR_PW}"
                    sh "docker push ${FULL_IMAGE}"
                }
            }
        }

        stage('Deploy to Kubernetes (Helm)') {
            steps {
                script {
                    // Harbor에 저장된 차트와 이미지를 활용하여 K8S 배포
                    sh """
                    helm upgrade --install test-project-deploy oci://${HARBOR_URL}/helm-repo/my-k8s-app \
                    --version 0.1.0 \
                    --set image.repository=${HARBOR_URL}/${PROJECT_NAME}/${IMAGE_NAME} \
                    --set image.tag=${BUILD_NUMBER} \
                    --plain-http
                    """
                }
            }
        }
    }

    post {
        always {
            // 빌드 완료 후 로컬 캐시 정리
            sh "docker logout ${HARBOR_URL} || true"
            sh "docker rmi ${FULL_IMAGE} || true"
        }
    }
}

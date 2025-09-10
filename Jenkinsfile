pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = 'docker-hub-creds'   // Jenkins credentials ID for Docker Hub
        DOCKER_IMAGE = 'llparagranell/your-node-app'  // Docker Hub repo
        DOCKER_TAG = 'latest'
    }

    stages {
        stage('Checkout') {
            steps {
                cleanWs()  // optional
                git branch: 'master', url: 'https://github.com/llparagranell/automated-nodePipeline.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // build image and store reference
                    dockerImage = docker.build("${DOCKER_IMAGE}:${DOCKER_TAG}")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // authenticate and push
                    docker.withRegistry('', "${DOCKER_HUB_CREDENTIALS}") {
                        dockerImage.push()
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // For Windows agent
                    bat """
                    docker rm -f my-node-app || exit 0
                    docker run -d --name my-node-app -p 3000:3000 ${DOCKER_IMAGE}:${DOCKER_TAG}
                    """
                }
            }
        }
    }

    post {
        always {
            echo "Pipeline completed."
        }
    }
}

pipeline {
    environment {
        registry = "gweedore/gweedore"
        registryCredential = 'dockerhub'
        dockerImage = ''
    }

    agent any

    stages {
        stage('build') {
            script {
                dockerImage = docker.build registry + ":$BUILD_NUMBER"
            }
            post {
                success {
                    sh 'echo "Success!"'
                }
                failure {
                    sh 'echo "Failure :("'
                }
            }
        }
        stage('Deploy Image') {
            steps{
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                    }
                }
            }
        }
    }
}
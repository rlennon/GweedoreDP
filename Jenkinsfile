pipeline {
    environment {
        registry = "gweedore/gweedore"
        registryCredential = 'dockerhub'
        dockerImage = ''
    }

    agent any

    stages {
        stage('build') {
            steps{
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
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
            when {
                branch 'master'
            }
            steps{
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Cleaning up') {
            steps{
                sh "docker rmi $registry:$BUILD_NUMBER"
            }
        }
    }
}
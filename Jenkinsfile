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
                    sh 'systemctl start docker'
                    dockerImage = docker.build registry + ":latest"
                }
            }
            post {
                success {
                    sh 'echo "Success!"'
                }
                failure {
                    sh 'echo "Failure"'
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
                sh "docker rmi $registry:latest"
            }
        }
    }
}
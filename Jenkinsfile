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
                    dockerImage = docker.build registry + ":latest"
                }
            }
            post {
                success {
                    sh 'echo "Success!"'
                }
                failure {
                    sh 'echo "Build Failed"'
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
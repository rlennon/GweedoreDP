pipeline {
    environment {
        registry = "gweedore/gweedore"
        registryCredential = 'dockerhub'
    }

    agent any

    stages {
        stage('build') {
            steps {
                sh 'docker build -t gweedore/gweedore:latest .'
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
          steps {
            script {
              docker.withRegistry( '', registryCredential ) {
                dockerImage.push()
              }
            }
          }
        }
    }
}
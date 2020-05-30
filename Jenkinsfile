pipeline {
    agent { dockerfile true }
    stages {
        stage('build') {
            steps {
                def customImage = docker.build("my-image:${env.BUILD_ID}")
                echo '${customImage}'
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
        stage('Master Deploy') {
            when {
               branch 'master'
            }
            steps {
                sh 'echo "Hello World from Master!"'
                sh '''
                    echo "Only runs in Master Branch"
                    ls -lah
                '''
            }
        }
    }
}
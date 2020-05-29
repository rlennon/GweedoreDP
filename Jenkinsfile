pipeline {
    agent any

    triggers {
        pollSCM('') // Enabling being build on Push
    }

    stages {
        stage('Build') {
            steps {
                sh 'echo "Hello World"'
                sh '''
                    echo "Multiline shell steps works too"
                    ls -lah
                '''
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
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
    }
}
pipeline {
    agent { docker { image 'maven:3.6.3' } }
        stages {
            stage('build') {
                steps {
                    sh 'mvn --version'
                    sh 'mvn clean package'
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
}
pipeline {
    agent any 
    stages {
        stage('pull') { 
            steps {
                echo "" 
            }
        }
        stage('build') { 
            steps {
                // 
            }
        }
        stage('test') { 
            steps {
                // 
            }
        }
        stage('Deploy') { 
            steps {
                // 
            }
        }
    }
}
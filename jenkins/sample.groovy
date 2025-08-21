pipeline {
    agent any 
    stages {
        stage('pull') { 
            steps {
                git clone url
                echo "pulling successful" 
            }
        }
        stage('build') { 
            steps {
               echo "building successful"  
            }
        }
        stage('test') { 
            steps {
               echo "testing successful" 
            }
        }
        stage('Deploy') { 
            steps {
                echo "deployed successful" 
            }
        }
    }
}
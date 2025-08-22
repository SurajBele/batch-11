pipeline {
    agent {
        labels 'node1'
    } 
    stages {
        stage('pull') { 
            steps {
                git branch: 'main', url: 'https://github.com/SurajBele/studentdata.git'
                echo "pulling successful" 
            }
        }
        stage('build') { 
            steps {
                sh 'mvn clean package'
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
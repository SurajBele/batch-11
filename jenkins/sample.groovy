pipeline {
    agent {
        label 'node1'
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
                sh '/opt/apache-maven-3.9.11/bin/mvn clean package'
               echo "building successful"  
            }
        }
        stage('test') { 
            steps {
                withSonarQubeEnv(installation name: sonar-servercredentialsId: 'sonar-token') {
                sh '/opt/apache-maven-3.9.11/bin/mvn clean package sonar:sonar   -Dsonar.projectKey=myproject'
                }
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


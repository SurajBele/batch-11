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
                sh 'mvn clean package sonar:sonar   -Dsonar.projectKey=myproject   -Dsonar.host.url=http://34.203.206.247:9000   -Dsonar.login=sqp_60acb5ba14c83cf72deee2902a49e2d0bf75efb1'
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


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
                withSonarQubeEnv(installationName: 'sonar-server', credentialsId: 'sonar-token') {
                sh '/opt/apache-maven-3.9.11/bin/mvn clean package sonar:sonar   -Dsonar.projectKey=myproject'
                }
               echo "testing successful" 
            }
        }
        stage('quality-gate') { 
            steps {
                waitForQualityGate abortPipeline: true
                echo "quality-gate successful" 
            }
        }
        stage('Deploy') { 
            steps {
                deploy adapters: [tomcat9(alternativeDeploymentContext: '', credentialsId: 'tomcat-pass', path: '', url: 'http://3.93.182.79:8080/')], contextPath: '/', war: '**/*.war'
                echo "deployed successful" 
            }
        }
    }
}


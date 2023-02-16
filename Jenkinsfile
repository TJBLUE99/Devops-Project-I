pipeline{
    agent any
    stages {
        stage('checkout') {  
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'fcd4fde4-7928-4b91-aa27-ccc8bcd03da3', url: 'https://github.com/TJBLUE99/ProjectZ.git']])
                
            }
        }
        stage('Maven Build'){
            steps{
                sh 'mvn clean install package'
            }
        }
        stage ('Docker build'){
            steps{
                  sh 'docker image build --tag myapp-$BUILD_NUMBER .'
                }
            }
        stage('Pushing to Nexus'){
            steps{
                sh 'docker login http://localhost:8082/repository/maven-docker --username <user>--password <password>'
                sh 'docker tag myapp-$BUILD_NUMBER localhost:8082/repository/maven-docker/myapp-$BUILD_NUMBER:latest'
                sh 'docker push localhost:8082/repository/maven-docker/myapp-$BUILD_NUMBER:latest'
            }
        }
    }
}

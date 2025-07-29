pipeline {
    agent { label 'webserver-prod' }
    stages {
        stage('pull') {
            steps {
                echo "we are pulling the source code from git repository"
                git 'https://github.com/AnupDudhe/studentapp-ui.git'
            }
        }
        stage('Build') {
            steps {
                echo "Building this app using maven"
            }
        }
        stage('Test') {
            steps {
                echo "Testing this app using Sonarqube"
            }
        }
        stage('Deploy') {
            steps {
                echo "Deploying this app to the prod server in apache tomcat"
            }
        }
    }
}

pipeline {
    agent { label 'webserver-prod' }
    stages {
        stage('pull') {
            steps {
                echo "we are pulling the source code from git repository"
                git branch: 'main', changelog: false, poll: false, url: 'https://github.com/AnupDudhe/cloudblitz-student-app.git'
                //git 'https://github.com/AnupDudhe/studentapp-ui.git'
            }
        }
        stage('Build') {
            steps {
                echo "Building this app using maven"
                sh '''cd backend
                mvn clean package -Dmaven.test.skip=true
                aws s3 cp target/student-registration-backend-0.0.1-SNAPSHOT.jar s3://cbzstudentappversion/'''
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

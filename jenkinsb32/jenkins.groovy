pipeline {
    agent any
    stages {
        stage ('Pull') {
            steps {
                git 'https://github.com/AnupDudhe/studentapp-ui.git'
            }
        }
        stage('Build') {
            steps {
                sh 'echo "this is build stage"'
            }
        }
        stage('Test') {
            steps {
                sh 'echo "this is test stage"'
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo "this is deploy stage"'
            }
        }
    }
}
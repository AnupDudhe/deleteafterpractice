pipeline {
    agent any
    stages {
        stage("Pull") {
            steps{
                sh 'echo "this is pull stage"'
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
                sh 'echo "this is Test stage"'
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo "this is Deploy stage"'
            }
        }
    }
}
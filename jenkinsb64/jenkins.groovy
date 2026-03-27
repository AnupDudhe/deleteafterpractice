pipeline {
    agent any
    stages {
        stage('pull') {
            steps {
                echo 'this is pull stage'
                git 'https://github.com/AnupDudhe/studentapp-ui.git'
            }
        }
        stage('build') {
            steps {
                echo 'this is pull stage'
                sh 'echo right now we are in build stage'
            }
        }
        stage('test') {
            steps {
                echo 'this is pull stage'
                sh 'echo right now we are in test stage'
            }
        }
            stage('deploy') {
            steps {
                echo 'this is pull stage'
                sh 'echo right now we are in deploy stage'
            }
        }
    }
}
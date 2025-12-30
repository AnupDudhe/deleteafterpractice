pipeline {
    agent { label 'webserver' }

    stages {
        stage('pull') {
            steps {
                //
                git 'https://github.com/AnupDudhe/studentapp-ui.git'
                sh '''
                echo we are in pull stage'''
            }
        }
        stage('build') {
            steps {
                sh '''mvn clean package
                echo we are in build stage'''
            }
        }
        stage('test') {
            steps {
                sh '''
                echo we are in test stage'''
            }
        }

         stage('deploy') {
            steps {
            sh '''
                echo we are in deploy stage'''
            }
        }
    }
} 


// https://www.jenkins.io/doc/book/pipeline/

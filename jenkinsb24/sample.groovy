pipeline {
    agent any
    stages {
        stage ('Pull') {
            steps {
                // we are pulling in this stage 
                git 'https://github.com/AnupDudhe/studentapp-ui.git'
                sh '''echo "we are in pull stage" 
                    touch b34.txt'''
            }
        }
        stage('Build') {
            steps {
                // 
                sh '''echo "we are in build stage" 
                '''
            }
        }
        stage('Test') {
            steps {
                sh '''echo "we are in build stage" 
               '''
            }
        }
        stage('Deploy') {
            steps {
                sh '''echo "we are in build stage" 
           '''
            }
        }
    }
}
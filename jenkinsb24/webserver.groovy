pipeline {
    agent { label 'webserver' }
    stages {
        stage ('Pull') {
            steps {
                // we are pulling in this stage 
                git 'https://github.com/AnupDudhe/studentapp-ui.git'
                sh '''echo "we are in pull stage" 
                   '''
            }
        }
        stage('Build') {
            steps {
                // 
                sh '''
                mvn  clean package
                echo "we are in build stage" 
                '''
            }
        }
        stage('Test') {
            steps {
                sh '''echo "we are in test stage" 
               '''
            }
        }
        stage('Deploy') {
            steps {
                sh '''echo "we are in deploy stage" 
           '''
            }
        }
    }
}

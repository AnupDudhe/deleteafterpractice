pipeline {
    agent {label "webserver"}
    stages {
        stage('Pull step') {
            steps{ 
                git 'https://github.com/AnupDudhe/studentapp-ui.git'
                sh 'echo "this is pull stage"'
            }
        }
        stage('Build Step') {
            steps {
                // Build the application
               sh '''mvn clean package
               echo "this is build stage"'''
            }
        }
        stage('Test Step') {
            steps {
                // Run tests
                sh 'echo "this is Test stage"'
                //sh 'mvn test'
            }
        }
        stage('Deploy Step') {
            steps {
                // Deploy the application
                sh 'echo "this is Deploy stage"'
                // sh 'deploy.sh'
            }
        }
    }
} 

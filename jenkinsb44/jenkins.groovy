pipeline {
    agent {label 'webserver'}
    stages {
        stage("Pull") {
            steps{
                sh 'echo "this is pull stage"'
                git 'https://github.com/AnupDudhe/studentapp-ui.git'
            }
        }
        stage('Build') {
            steps {
               sh '''mvn clean package
              echo "this is build stage"'''
            }
        }
        stage('Test') {
            steps {
                sh '''mvn clean verify sonar:sonar \\
                  -Dsonar.projectKey=studentapp \\
                  -Dsonar.host.url=http://3.141.107.90:9000 \\
                  -Dsonar.login=sqp_9adecc4911e6d45ba1556fc0d7a2398d9b92675b
                   echo "this is test stage"'''
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo "this is Deploy stage"'
            }
        }
    }
}

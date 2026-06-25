pipeline {
    agent any
    stages {
        stage('Build Step') {
            steps {
                // Build the application
                sh 'mvn clean install'
            }
        }
        stage('Test Step') {
            steps {
                // Run tests
                sh 'mvn test'
            }
        }
        stage('Deploy Step') {
            steps {
                // Deploy the application
                sh 'deploy.sh'
            }
        }
    }
} 

YAML 
pipeline{ 
    stages{
        stage{ "Test stage"
          steps{ 
               git clone studentapp.git    
          }
        }
        stage{ "deploy stage"
           steps{
               apt install httpd -y 
           }
        }
    }          
}
pipeline {
    agent {label "webserver"}   //{label "master"}
    stages {
        stage('pull') {
            steps {
                 git 'https://github.com/AnupDudhe/studentapp-ui.git'
            }
        }
        stage('Test') {
            steps {
                 echo 'we are deploying in this stage'
                //
            }
        }
        stage('Deploy') {
            steps {
                echo 'we are deploying in this stage' 
                sh '''
                      apt install nginx -y
                      echo "hello world" > /usr/share/nginx/html/index.html
                      systemctl start nginx
                      systemctl enable nginx
                      systemctl restart nginx
                      '''
                //
            }
        }
    }
}
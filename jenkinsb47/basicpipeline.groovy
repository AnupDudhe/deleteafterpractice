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
                sh ''' 
                 mvn sonar:sonar \
                 -Dsonar.projectKey=studentapp \
                 -Dsonar.host.url=http://52.66.213.94:9000 \
                 -Dsonar.login=9719d6a02a9625636b841cc8bfb44b512246f562
                 '''
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
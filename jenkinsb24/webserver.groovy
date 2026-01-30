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
                sh '''
               mvn clean verify sonar:sonar \
                -Dsonar.projectKey=studentapp \
                -Dsonar.host.url=http://3.110.41.166:9000 \
                -Dsonar.login=sqp_e7678baa3c794ce32bff770fbe935d2cd3432d92
                echo "we are in test stage" 
               '''
            }
        }
        stage('Deploy') {
            steps {
                sh '''echo "we are in deploy stage" 
                curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.111/bin/apache-tomcat-9.0.111.zip
                sudo apt install unzip -y 
                sudo unzip apache-tomcat-9.0.111.zip
                sudo mv apache-tomcat-9.0.111 /opt/
                sudo mv /home/ubuntu/workspace/webserver/target/studentapp-2.2-SNAPSHOT.war /opt/apache-tomcat-9.0.111/webapps/student.war
                sudo curl -O https://s3-us-west-2.amazonaws.com/studentapi-cit/mysql-connector.jar 
                sudo mv mysql-connector.jar /opt/apache-tomcat-9.0.111/lib/mysql-connector.jar
                sudo bash /opt/apache-tomcat-9.0.111/bin/catalina.sh stop  
                sudo bash /opt/apache-tomcat-9.0.111/bin/catalina.sh start 
           '''
            }
        }
    }
}

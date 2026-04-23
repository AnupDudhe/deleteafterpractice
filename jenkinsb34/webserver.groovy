pipeline {
    agent { label 'webserver' }
    stages {
        stage('Pull') {
            steps {
                git 'https://github.com/AnupDudhe/studentapp-ui.git'
            }
        }

        stage('Build') {
            steps {
                sh '''mvn clean package
                sudo mv /home/ubuntu/workspace/webserver/target/studentapp-2.2-SNAPSHOT.war /home/ubuntu/workspace/webserver/target/student.war 
                aws s3 cp /home/ubuntu/workspace/webserver/target/student.war  s3://studentappcbz
                echo "this is build stage"'''
            }
        }
        stage('Test') {
            steps {
                sh '''echo "this is test stage"
                mvn clean verify sonar:sonar \\
                  -Dsonar.projectKey=studentappcicd \\
                  -Dsonar.host.url=http://13.218.197.97:9000 \\
                  -Dsonar.login=sqp_a7bcb1e415c56ddbe330ecb2446372a8b1bd6a0c'''
            }
        }
        stage('Deploy') {
            steps {
                sh '''echo "this is deploy stage"
                sudo curl -L -o /home/ubuntu/apache-tomcat-9.0.117.zip         https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.117/bin/apache-tomcat-9.0.117.zip
                sudo unzip  /home/ubuntu/apache-tomcat-9.0.117.zip -d  /opt/
                sudo aws s3 cp  s3://studentappcbz/student.war  /opt/apache-tomcat-9.0.117/webapps/
                sudo bash /opt/apache-tomcat-9.0.117/bin/catalina.sh start
                '''
            }
        }
    }
}

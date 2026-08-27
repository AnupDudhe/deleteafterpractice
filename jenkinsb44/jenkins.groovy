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
              mv /home/ubuntu/workspace/webserver/target/studentapp-2.2-SNAPSHOT.war   /home/ubuntu/workspace/webserver/target/student.war 
              aws s3 cp  /home/ubuntu/workspace/webserver/target/student.war  s3://webappartifactscbz
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
                   sh '''
                sudo curl -L -o /home/ubuntu/apache-tomcat-9.0.121.zip https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.121/bin/apache-tomcat-9.0.121.zip
                sudo unzip /home/ubuntu/apache-tomcat-9.0.121.zip -d /opt/
                sudo aws s3 cp  s3://webappartifactscbz/student.war  /opt/apache-tomcat-9.0.121/webapps/
                sudo bash /opt/apache-tomcat-9.0.121/bin/catalina.sh start'''
            }
        }
    }
}

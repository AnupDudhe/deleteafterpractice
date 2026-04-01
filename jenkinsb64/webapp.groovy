pipeline {
    agent {
        label 'webserver'
    }
    stages {
        stage('pull') {
            steps {
                echo 'this is pull stage'
                git 'https://github.com/AnupDudhe/studentapp-ui.git'
            }
        }
        stage('build') {
            steps {
                echo 'this is pull stage'
               sh '''mvn clean package
                sudo mv /home/ubuntu/workspace/webserver/target/studentapp-2.2-SNAPSHOT.war /home/ubuntu/workspace/webserver/target/student.war
                sudo aws s3 cp /home/ubuntu/workspace/webserver/target/student.war s3://cbzapp'''
            }
        }
        stage('test') {
            steps {
                echo 'this is pull stage'
                sh '''mvn clean verify sonar:sonar \\
                  -Dsonar.projectKey=studentappcicd \\
                  -Dsonar.host.url=http://13.51.70.21:9000 \\
                  -Dsonar.login=sqp_f0b64326d421b4998d261beef82a8070b6e0a331'''
            }
        }
            stage('deploy') {
            steps {
                echo 'this is pull stage'
                sh '''
                sudo curl -L -o /home/ubuntu/apache-tomcat-9.0.116.zip https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.116/bin/apache-tomcat-9.0.116.zip
                sudo unzip /home/ubuntu/apache-tomcat-9.0.116.zip -d /opt/
                sudo aws s3 cp  s3://cbzapp/student.war  /opt/apache-tomcat-9.0.116/webapps/
                
                sudo bash /opt/apache-tomcat-9.0.116/bin/catalina.sh start'''
            }
        }
    }
}

//http://13.61.173.155:8080/github-webhook/
//sudo cp -r /home/ubuntu/workspace/webserver/context.xml  /opt/apache-tomcat-9.0.116/conf/
// sudo cp -r /home/ubuntu/workspace/webserver/mysql-connector.jar /opt/apache-tomcat-9.0.116/lib/

pipeline {
    agent {
        label 'webserver'
    }
    stages {
        stage ('Pull') {
            steps {
                git 'https://github.com/AnupDudhe/studentapp-ui.git'
            }
        }
        stage('Build') {
            steps {
                sh '''mvn clean package
                echo we are in build stage
                aws s3 cp /home/ubuntu/workspace/webserver/target/studentapp-2.2-SNAPSHOT.war s3://artificatsbackupcbz '''
            }
        }
        stage('Test') {
            steps {
               sh '''mvn clean verify sonar:sonar \\
              -Dsonar.projectKey=studentapp \\
              -Dsonar.host.url=http://44.249.88.44:9000 \\
              -Dsonar.login=sqp_55591c0c1c37ecc021ea62cee2953aa885b0dfab 
            echo "we are in test stage"'''
            }
        }
        stage('Deploy') {
            steps {
                sh '''sudo curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.115/bin/apache-tomcat-9.0.115.zip 
                sudo mv apache-tomcat-9.0.115.zip /opt/
                sudo apt-get install unzip -y 
                sudo unzip /opt/apache-tomcat-9.0.115.zip  -d  /opt/ 
                sudo rm -rf  /opt/apache-tomcat-9.0.115.zip  
                sudo mv /home/ubuntu/workspace/webserver/target/studentapp-2.2-SNAPSHOT.war  /opt/apache-tomcat-9.0.115/webapps/student.war
                sudo bash /opt/apache-tomcat-9.0.115/bin/catalina.sh start
                '''
            }
        }
    }
}

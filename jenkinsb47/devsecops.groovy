
pipeline {
    agent {label "webserver"}   //{label "master"}
    stages {
        stage('pull') {
            steps {
                 git 'https://github.com/AnupDudhe/studentapp-ui.git'
            }
        }
        

        stage('Build') {
            steps {
                 echo 'we are building in this stage'
                 sh '''mvn package'''
                //
            }
        }
        stage('Test') {
            steps {
                 echo 'we are deploying in this stage'
                 sh '''
                 mvn sonar:sonar \
                 -Dsonar.projectKey=studentappnew3 \
                 -Dsonar.host.url=http://13.232.205.86:9000 \
                 -Dsonar.login=950d02ba80b726257b35dd44a6000577e2cb04f2
                 '''
                //
            }
        }
        stage('Deploy') {
            steps {
                echo 'we are deploying in this stage' 
                sh ''' 
                    sudo curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.102/bin/apache-tomcat-9.0.102.zip
                    sudo mv apache-tomcat-9.0.102.zip /opt/
                    sudo apt-get install unzip -y
                    sudo unzip /opt/apache-tomcat-9.0.102.zip -d /opt/
                    sudo rm -rf /opt/apache-tomcat-9.0.102.zip
                    sudo mv    /home/ubuntu/workspace/webserver/target/studentapp-2.2-SNAPSHOT.war /opt/apache-tomcat-9.0.102/webapps/studentapp.war
                    sudo aws s3 cp /opt/apache-tomcat-9.0.102/webapps/studentapp.war s3://artifactscbz
                    sudo curl -O https://s3-us-west-2.amazonaws.com/studentapi-cit/mysql-connector.jar 
                    sudo mv mysql-connector.jar /opt/apache-tomcat-9.0.102/lib/mysql-connector.jar
                    sudo bash /opt/apache-tomcat-9.0.102/bin/catalina.sh stop  
                    sudo bash /opt/apache-tomcat-9.0.102/bin/catalina.sh start 
                    '''
                //
            }
        }
    }
}

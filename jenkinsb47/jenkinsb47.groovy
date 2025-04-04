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
                 mvn sonar:sonar   
                 -Dsonar.projectKey=studentapp   
                 -Dsonar.host.url=http://52.66.213.94:9000   
                 -Dsonar.login=9719d6a02a9625636b841cc8bfb44b512246f562
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

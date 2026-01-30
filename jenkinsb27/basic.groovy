pipeline {
    agent { label 'webserver' } 
    stages {
        stage('pull') {
            steps {
                echo "we are pulling from github"
                git 'https://github.com/AnupDudhe/studentapp-ui.git'
            }
        }
        stage('Build') {
            steps {
                echo "we are building webserver in this stage"
                sh '''
                mvn clean package
                '''
            }
        }
        stage('Test') {
            steps {
                //
                echo "we are testing in this stage from sonarqube server"
            }
        }
        stage('Deploy') {
            steps {
                //
                echo "we are deploying in this stage" 
                	sh ''' 
                    sudo curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.109/bin/apache-tomcat-9.0.109.zip
                    sudo mv apache-tomcat-9.0.109.zip /opt/
                    sudo apt-get install unzip -y
                    sudo unzip /opt/apache-tomcat-9.0.109.zip -d /opt/
                    sudo rm -rf /opt/apache-tomcat-9.0.109.zip
                    sudo mv    /home/ubuntu/workspace/webserver/target/studentapp-2.2-SNAPSHOT.war /opt/apache-tomcat-9.0.109/webapps/studentapp.war
                    sudo curl -O https://s3-us-west-2.amazonaws.com/studentapi-cit/mysql-connector.jar 
                    sudo mv mysql-connector.jar /opt/apache-tomcat-9.0.109/lib/mysql-connector.jar
                    sudo bash /opt/apache-tomcat-9.0.109/bin/catalina.sh stop  
                    sudo bash /opt/apache-tomcat-9.0.109/bin/catalina.sh start 
                    '''
            }
        }
    }
}

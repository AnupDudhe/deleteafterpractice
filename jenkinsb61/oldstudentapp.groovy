pipeline {
    agent { label 'webserver' }

    stages {
        stage('pull') {
            steps {
                //
                git 'https://github.com/AnupDudhe/studentapp-ui.git'
                sh '''
                echo we are in pull stage'''
            }
        }
        stage('build') {
            steps {
                sh '''mvn clean package
                echo we are in build stage'''
            }
        }
        stage('test') {
            steps {
               sh '''mvn clean verify sonar:sonar \\
               -Dsonar.projectKey=studentapp \\
               -Dsonar.host.url=http://13.48.44.231:9000 \\
               -Dsonar.login=sqp_44febe25ac23d5fba28969fe6d07dbdc41964ec3
                echo "we are in test stage"'''
            }
        }

         stage('deploy') {
            steps {
               sh ''' 
               curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.113/bin/apache-tomcat-9.0.113.zip
               sudo apt install unzip -y
               sudo unzip apache-tomcat-9.0.113.zip
               sudo cp -rf apache-tomcat-9.0.113 /opt/apache-tomcat-9.0.113
               sudo cp -r /home/ubuntu/workspace/webserver/target/studentapp-2.2-SNAPSHOT.war /opt/apache-tomcat-9.0.113/webapps/
               sudo mv /home/ubuntu/workspace/webserver/target/studentapp-2.2-SNAPSHOT.war student.war
               sudo cp -rf /home/ubuntu/workspace/webserver/student.war /opt/apache-tomcat-9.0.113/webapps/
               aws s3 cp /opt/apache-tomcat-9.0.113/webapps/student.war s3://bucketname/
               sudo chmod 777 /opt/apache-tomcat-9.0.113/bin/*.sh
               sudo sh /opt/apache-tomcat-9.0.113/bin/catalina.sh start
               sudo echo "we are in deploy stage" '''
            }
        }
    }
} 


// https://www.jenkins.io/doc/book/pipeline/

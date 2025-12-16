FROM ubuntu:22.04 
#baseimage

LABEL name="devops_enggr"
#labeling and tagging the image 

RUN apt-get update && \
    apt-get install unzip openjdk-11-jdk -y 
#executing commands to update the base image and install required packages 

ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.113/bin/apache-tomcat-9.0.113.zip /opt/ 
#downloading and adding tomcat server to the image 

WORKDIR /opt 
#setting working directory 

RUN unzip apache-tomcat-9.0.113.zip && \
    rm apache-tomcat-9.0.113.zip

ADD https://s3-us-west-2.amazonaws.com/studentapi-cit/student.war /opt/apache-tomcat-9.0.113/webapps/ 
#downloading and adding the student.war file to the webapps directory of tomcat server 

ADD https://s3-us-west-2.amazonaws.com/studentapi-cit/mysql-connector.jar /opt/apache-tomcat-9.0.113/lib/ 
#downloading and adding mysql-connector.jar to the lib directory of tomcat server 


COPY context.xml /opt/apache-tomcat-9.0.113/conf/
#copying the context.xml file with jdbc string to the conf directory of tomcat server

EXPOSE 8080

RUN chmod +x /opt/apache-tomcat-9.0.113/bin/catalina.sh
#giving execute permission to catalina.sh file

CMD ["/opt/apache-tomcat-9.0.113/bin/catalina.sh", "run"]
#exposing port 8080 and running the tomcat server
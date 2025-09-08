#Base image selection
FROM ubuntu:22.04

#Tag given to your container 
LABEL DEV="anup"


#downloading java dependencies for your project 11
RUN apt-get update -y && \
    apt-get install unzip openjdk-11-jdk -y     

ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.109/bin/apache-tomcat-9.0.109.zip /opt/ 

WORKDIR /opt 
RUN unzip apache-tomcat-9.0.109.zip 
COPY context.xml /opt/apache-tomcat-9.0.109/conf/
ADD https://s3-us-west-2.amazonaws.com/studentapi-cit/student.war /opt/apache-tomcat-9.0.109/webapps/student.war
ADD https://s3-us-west-2.amazonaws.com/studentapi-cit/mysql-connector.jar /opt/apache-tomcat-9.0.109/lib/mysql-connector.jar
RUN chmod +x /opt/apache-tomcat-9.0.109/bin/*.sh

EXPOSE 8080
CMD ["/opt/apache-tomcat-9.0.109/bin/catalina.sh","run"]
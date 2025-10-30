FROM ubuntu:22.04 
#base image 

LABEL DEV="anup" 

RUN apt-get update -y && \
    apt-get install unzip openjdk-11-jdk -y       


#installing java and unzip  

ADD  https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.111/bin/apache-tomcat-9.0.111.zip   /opt/ 

 
#ran unzip command 


WORKDIR /opt/
RUN unzip apache-tomcat-9.0.111.zip 
#changing working directory  
COPY context.xml apache-tomcat-9.0.111/conf/ 
#LOCALly copying context.xml to conf folder of tomcat
ADD https://s3-us-west-2.amazonaws.com/studentapi-cit/student.war /opt/apache-tomcat-9.0.111/webapps/student.war
ADD https://s3-us-west-2.amazonaws.com/studentapi-cit/mysql-connector.jar /opt/apache-tomcat-9.0.111/lib/mysql-connector.jar
#remote copy of war file and mysql-connector jar file
#USER root
RUN chmod +x /opt/apache-tomcat-9.0.111/bin/catalina.sh


EXPOSE 8080 

CMD ["/opt/apache-tomcat-9.0.111/bin/catalina.sh","run"]
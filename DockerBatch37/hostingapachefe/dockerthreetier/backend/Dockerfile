FROM ubuntu:latest
LABEL purpose="backend"
WORKDIR /opt
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.93/bin/apache-tomcat-9.0.93.zip /opt
RUN apt update && \
    apt install unzip openjdk-11-jdk -y && \
    unzip apache-tomcat-9.0.93.zip
ADD https://s3-us-west-2.amazonaws.com/studentapi-cit/student.war  apache-tomcat-9.0.93/webapps/
ADD https://s3-us-west-2.amazonaws.com/studentapi-cit/mysql-connector.jar apache-tomcat-9.0.93/lib/
COPY context.xml apache-tomcat-9.0.93/conf/
RUN chmod +rwx /opt/apache-tomcat-9.0.93/bin/*.sh

EXPOSE 8080
CMD ["/opt/apache-tomcat-9.0.93/bin/catalina.sh", "run"]    

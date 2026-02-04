FROM ubuntu:22.04  


LABEL dev="anup"

RUN apt-get update && \
apt-get install unzip openjdk-11-jdk -y  

ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.115/bin/apache-tomcat-9.0.115.zip  /opt/

WORKDIR /opt 
RUN unzip apache-tomcat-9.0.115.zip 
COPY context.xml  /opt/apache-tomcat-9.0.115/conf/

ADD https://s3-us-west-2.amazonaws.com/studentapi-cit/student.war       /opt/apache-tomcat-9.0.115/webapps/student.war 
ADD https://s3-us-west-2.amazonaws.com/studentapi-cit/mysql-connector.jar  /opt/apache-tomcat-9.0.115/lib/mysql-connector.jar  

EXPOSE 8080 

RUN chmod +x /opt/apache-tomcat-9.0.115/bin/catalina.sh


CMD ["/opt/apache-tomcat-9.0.115/bin/catalina.sh","run"]

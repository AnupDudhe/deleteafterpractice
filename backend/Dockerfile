FROM centos:7
LABEL  devloper ="anup"


ADD https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.99/bin/apache-tomcat-8.5.99.tar.gz /opt
WORKDIR /opt
RUN tar -xzvf /opt/apache-tomcat-8.5.99.tar.gz
RUN yum install java-11-openjdk -y
ADD https://s3-us-west-2.amazonaws.com/studentapi-cit/student.war /opt/apache-tomcat-8.5.99/webapps/
COPY context.xml /opt/apache-tomcat-8.5.99/conf/
ADD https://s3-us-west-2.amazonaws.com/studentapi-cit/mysql-connector.jar  /opt/apache-tomcat-8.5.99/lib/
ENV db_pw="1234"
#ARG db_pw

EXPOSE 8080
#CMD [ "bin/catalina.sh" RUN ]
#CMDbin/catalina.sh RUN


CMD ["/opt/apache-tomcat-8.5.99/bin/catalina.sh", "run"]

#docker rmi -f $(docker images -q)
#docker rm -f $(docker ps -a -q)

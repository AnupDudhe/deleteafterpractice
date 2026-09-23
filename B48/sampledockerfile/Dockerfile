
FROM ubuntu:latest 
#for deploying static app we will use ubuntu as base image.


LABEL dev="anup"
#mentions engineer name that created this docker and container 

RUN apt-get update 
RUN apt-get install unzip -y
RUN apt-get install apache2 -y 
#we are installing here webserver apache2 in our container image 
#and unzip package 

ADD https://templatemo.com/download/templatemo_633_celadon  /var/www/html/templatemo_633_celadon.zip
#downloaded static application and moved it to /var/www/html/


WORKDIR /var/www/html 
#for changing directory location

RUN unzip templatemo_633_celadon.zip 
RUN mv templatemo_633_celadon/*  /var/www/html/

EXPOSE 80 
#httpd webserver will be working on 80 port 

CMD ["apachectl", "-D", "FOREGROUND"]




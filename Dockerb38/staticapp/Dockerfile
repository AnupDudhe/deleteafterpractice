#assign a base image 
FROM ubuntu:latest 


LABEL dev="anup"
#will use a tags 


RUN apt-get update 
RUN apt-get install unzip -y 
RUN apt-get install apache2 -y
#to execute linux commands we use RUN 

ADD https://templatemo.com/download/templatemo_614_quantix_saas  /var/www/html/templatemo_614_quantix_saas.zip

#remote downloading add 

WORKDIR /var/www/html 
#for changing directory use workdir 

RUN unzip templatemo_614_quantix_saas.zip
RUN mv templatemo_614_quantix_saas/* /var/www/html/


EXPOSE 80 

CMD ["apache2ctl", "-D", "FOREGROUND"]
#apache process is executed
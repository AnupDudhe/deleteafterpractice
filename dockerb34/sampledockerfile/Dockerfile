FROM ubuntu:latest 
#base image used to nginx app 

LABEL dev="anup"

RUN apt-get update && \ 
    apt-get install apache2 unzip -y && \ 
    rm -rf /var/www/html/index.html 

ADD https://templatemo.com/download/templatemo_578_first_portfolio  /var/www/html/templatemo_578_first_portfolio.zip

WORKDIR /var/www/html 

RUN unzip templatemo_578_first_portfolio.zip && \ 
    mv templatemo_578_first_portfolio/*  /var/www/html/ 


EXPOSE 80 

CMD ["apache2ctl", "-D", "FOREGROUND"]
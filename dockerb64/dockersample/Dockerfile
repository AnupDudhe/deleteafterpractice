FROM ubuntu:latest   
#bases image is been selected 

LABEL dev="anup" 
#here we have set up a key and value for our cont 


RUN apt-get update && \
    apt-get install unzip -y && \
    apt install apache2 -y
#we are running linux commands using run arg 

ADD https://templatemo.com/download/templatemo_564_plot_listing  /var/www/html/templatemo_564_plot_listing.zip
#using add we are downloading app in the location 

WORKDIR /var/www/html
#changin directory 

RUN unzip templatemo_564_plot_listing.zip && \
    mv templatemo_564_plot_listing/*  /var/www/html

EXPOSE 80 
#we are exposing cont on 80 

CMD ["apache2ctl", "-D", "FOREGROUND"]
#default single process is executed 






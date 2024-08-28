
#we are placing a base for our docker image
FROM ubuntu:latest
#we are labeling our docker image here
LABEL image="frontendstatic"
#we are running few commands in our container(during container creation)
RUN apt update 
RUN apt install apache2 unzip -y
RUN rm -rf /var/www/html/index.html
#we are copying source code from local storage
COPY oxer.zip /var/www/html/oxer.zip
#we are moving to /var/www/html
WORKDIR /var/www/html
#we are unzipping and extracting the source code in default deployment enviornment location
RUN unzip oxer.zip
RUN mv oxer-html/* .
#we are exposing our container to a port
EXPOSE 80
#we are providing container a processs 
CMD ["apachectl", "-D" ,"FOREGROUND"]

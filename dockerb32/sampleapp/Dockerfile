FROM ubuntu:latest  
#this is my base image on which deployment is done 
LABEL author="dev anup"
#this is lavel to add metadata to image
RUN apt-get update  && \ 
    apt-get install apache2 unzip -y 
#we are updating the image , installing apache2 server and unzip utility   

ADD https://templatemo.com/download/templatemo_578_first_portfolio /var/www/html/
#in here we have downloaded a sample webapp from internet and added to our apache server root directory

RUN rm -rf /var/www/html/index.html && \
    unzip /var/www/html/templatemo_578_first_portfolio.zip  && \
    mv /var/www/html/templatemo_578_first_portfolio/* /var/www/html/
#in here we have removed the default index.html file of apache server and unzipped the downloaded webapp 
#and moved all the content to apache server root directory
#WORKDIR   /var/www/html 

EXPOSE 80
#we are exposing port 80 to access our webapp

CMD [ "apache2ctl", "-D",  "FOREGROUND" ] 



















     
    
 


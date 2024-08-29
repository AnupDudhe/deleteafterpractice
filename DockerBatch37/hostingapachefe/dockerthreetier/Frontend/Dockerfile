FROM ubuntu:latest
LABEL purpose="Frontend"

RUN apt update && \
    apt install apache2 -y
WORKDIR /var/www/html/
COPY index.html .
EXPOSE 80
CMD ["apachectl", "-D" ,"FOREGROUND"]
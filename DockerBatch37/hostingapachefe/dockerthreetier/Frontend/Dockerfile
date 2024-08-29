FROM ubuntu:latest
LABEL purpose="Frontend"

RUN apt update && \
    apt install apache2 -y
    rm -rf /var/www/html/index.html
WORKDIR /var/www/html/
COPY index.html .
EXPOSE 80
CMD ["apachectl", "-D" ,"FOREGROUND"]
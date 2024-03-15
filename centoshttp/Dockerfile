
FROM centos
LABEL Dev="anup"
RUN yum install httpd -y
RUN rm -rf /var/www/html/index.html &&\
    yum instalL unzip -y
WORKDIR /var/www/html/
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/oxer.zip .
RUN unzip oxer.zip &&\
    mv oxer-html/*  .

EXPOSE 80
CMD ["httpd" , "-DFOREGROUND]  

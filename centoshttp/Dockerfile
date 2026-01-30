
FROM centos:7
LABEL Dev="anup"
RUN yum install unzip httpd -y && \
    yum clean all
RUN rm -rf /var/www/html/index.html     
WORKDIR /var/www/html/
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/oxer.zip .
RUN unzip oxer.zip && \
    mv oxer-html/*  .

EXPOSE 80
CMD ["httpd" , "-DFOREGROUND"]


FROM centos:7
LABEL devops="anup"
RUN yum install httpd -y
COPY index.html /var/www/html/index.html
EXPOSE 80
ENTRYPOINT ["httpd", "-DFOREGROUND"]
#RUN chmod 777 /var/www
#RUN chmod 777 /var/www/index.html
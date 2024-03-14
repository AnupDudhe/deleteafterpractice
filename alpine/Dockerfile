FROM centos:7
LABEL devops_Engg="Anup"

RUN  yum install httpd -y
RUN ECHO "HELLO WOLRD THIS IS FROM IMAGE" >> /var/www/html/index.html

EXPOSE 80
CMD httpd -DFOREGROUND
#CMD ["httpd" , "-DFOREGROUND"]
#ENTRYPOINT httpd -DFOREGROUND
#ENTRYPOINT ["httpd", "-DFOREGROUND"]

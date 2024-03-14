
FROM httpd:2.4.58-alpine
LABEL DEVOPS="alpine_image"

RUN echo "hello world this is from alpine image" > /usr/local/apache2/htdocs/index.html

EXPOSE 80 
CMD ["httpd" , "-DFOREGROUND"]
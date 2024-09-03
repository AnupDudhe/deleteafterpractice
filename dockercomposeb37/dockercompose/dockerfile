
FROM ubuntu:latest
LABEL ubuntu="latest"
RUN apt update
RUN apt install nginx -y
RUN rm -rf /usr/share/nginx/html/index.html
RUN apt install unzip -y
COPY oxer.zip /usr/share/nginx/html/
WORKDIR /usr/share/nginx/html/
RUN unzip /usr/share/nginx/html/oxer.zip
RUN mv oxer-html/* . 
#RUN echo "hello world this is from nginx containers" > /usr/share/nginx/html/index.html
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
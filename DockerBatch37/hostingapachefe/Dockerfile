
#we are placing a base for our docker image
FROM ubuntu:latest
#we are labeling our docker image here
LABEL "image=frontendstatic"
#we are running few commands in our container(during container creation)
RUN apt update 
RUN apt install apache2 unzip -y
#we are copying source code from local storage
COPY 
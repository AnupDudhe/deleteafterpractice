docker ps - list out all the containers that are created running state 
docker ps -a - deleted and running container list
docker ps -q - only running containers id listed 


docker lifecycle commands.
container -> create -> run -> stop -> delete 

docker create image -> container create but container is in stopped state
docker start containerid -> container will go in running state 
docker run imagename --> container start running state (foreground)
docker stop containerid -> container will go in stop state
docker rm -f container id -> container will be deleted 

docker exec -it containerid bash -> take access of your container 

docker exec containerid  ls /tmp
docker cp filename containerid:/mnt 

docker images - list all the images through which container are created 

docker images 
pull push 

docker volume 

docker networking


docker images - list images 
docker pull imagename - will clone image 
docker tag profilename/reponame:tag imageid - to rename your image 
docker login 
docker push imagename - to push image

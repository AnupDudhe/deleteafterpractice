```
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


31  docker rename 06a9dcf54fed nginxb48
   32  docker ps
   33  docker
   34  clear
   35  docker ps
   36  docker network ls
   37  docker run -d --network host nginx:latest
   38  docker ps
   39  docker inspect 0c354e58132d
   40  clear
   41  ls
   42  docker network ls
   43  docker inspect 02e2a5dc26fb
   44  docker run -d httpd
   45  docker ps
   46  docker inspect 22e046cbaae2 
   47  docker inspect 02e2a5dc26fb

   53  docker network create --subnet "10.0.0.0/18" --driver bridge  cbzb48
   54  docker network ls
   55  docker inspect 43c4377e9301
   56  docker run -d -p 8080:8080 --network cbzb48  tomcat:latest
   57  docker ps
   58  docker inspect 0d418d529a2
   59  docker run -d --network none  nginx:latest
   60  docker ps
   61  docker inspect 1e385b9f626d
   62  clear

docker volume
   90  docker volume ls
   91  docker volume create Newvol1
   92  docker volume ls
   93  ls /var
   94  ls /var/lib/
   95  ls /var/lib/docker/
   96  ls /var/lib/docker/volumes
   97  cd /var/lib/docker/volumes/
   98  ls
   99  cd Newvol1/
  100  ls
  101  cd _data/
  102  ls
  103  pwd
  104  ls -a
  105  #docker run -d -p 80:80 -v Newvol1:
  106  docker run -d -p 80:80 -v Newvol1:/usr/share/nginx/html  nginx:latest
  107  docker ps
  108  docker inspect 8ddc2d5d933a
  109  ls /var/lib/docker/volumes/Newvol1/_data
  110  cat index.html 
  111  vim index.html 
```

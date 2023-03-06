sudo service docker start

docker container ls

docker container ls -a


#see line 158 of .txt
#run detach
docker run -dt --restart always --name bg-container alpine
#run and deletes on exit
docker run -it --name rm-test --rm alpine

docker container start a-container

docker exec a-container apk add nginx

docker exec -it a-container ash

cd /etc/nginx

#           source                                      destination
docker cp a-container:/etc/nginx/conf.d/default.conf .


vim default.conf
server {
        listen 80 default_server;
        listen [::]:80 default_server;

        root /var/www/;
}
            source          destination
docker cp default.conf a-container:/etc/nginx/conf.d/default.conf


docker exec a-container cat /etc/nginx/conf.d/default.conf


docker start <container>: Start a container


#MANAGEMENT

docker stop bg-container

docker rm bg-container
#remove all stoped container
docker container prune 

docker rename a-container web01
docker stats
#See 317 350
docker inspect <container>: View container information
docker commit <container> <image-name>: Create an image of an existing container
docker run -p <host_port>:<container_port> <container>: Publish to host port



#Create Docker Image












#LAB

docker run --name web -dt nginx
docker exec web mkdir /var/www

docker cp webfiles/default.conf web:/etc/nginx/conf.d/default.conf
docker cp webfiles/html/ web:/var/www/
#default.conf
#server {
#        listen 80 default_server;
#        listen [::]:80 default_server;
#
#        root /var/www/html/;
#}
docker exec web ls /var/www

docker exec web chown -R nginx:nginx /var/www/html
docker exec web nginx -s reload
docker inspect web | grep IP #172.17.0.2

docker commit web web-image

docker run -dt --name web01 -p 80:80 web-image

scp -r cloud_user@34.227.104.0:/home/cloud_user/webfiles ./destination/

#End Lab

#Create Docker Image with Docker file

tar -xf demo-app.tar

#Steps for building a DockerFile
#7 Copy more file

docker build . -t appimage
#!/bin/bash
registration_name="192.168.29.158:5000/lnmp-php-nginx-alpine"

docker stop $(docker ps -a -q)|xargs docker rm ; docker rmi $(docker images | grep "$registration_name" | awk '{print $3}') -f
#docker-compose stop
#docker-compose build
#docker tag & docker push
docker-compose -f docker-compose-registry.yml up -d mysql mongo
sleep 30s
docker-compose -f docker-compose-registry.yml up -d php_nginx

container_id=$(docker ps|grep "$registration_name"|awk '{print $1}')
docker exec -it --user www-data $container_id git pull
docker exec -it --user www-data $container_id composer install
docker exec -it --user www-data $container_id php artisan migrate:install
docker exec -it --user www-data $container_id php artisan migrate
docker exec -it --user www-data $container_id php artisan db:seed
docker commit $container_id $registration_name:latest
docker push $registration_name:latest
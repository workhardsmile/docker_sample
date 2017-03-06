#!/bin/bash
#docker-compose build
mkdir -p $HOME/opt/htdocs/ && cp -f hellotest.php $HOME/opt/htdocs/index.php
[ ! -d "$HOME/opt/htdocs/covision" ] && git clone --no-checkout "git@10.0.10.120:OnlineTestSystem/covision.git" $HOME/opt/htdocs/covision
#cd $HOME/opt/htdocs/covision&&git pull
#git checkout $(git tag|sort -r|head -n 1)
cd - && docker-compose up -d
docker exec -it $(docker ps|grep php|awk '{print $1}') /usr/local/bin/composer install

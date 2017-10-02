#!/bin/bash

mkdir -p /data/docker/varlibmysql && chmod 777 /data/docker/varlibmysql
docker run -it --name mysql -p 3306:3306 -v /data/docker/varlibmysql:/var/lib/mysql -e MYSQL_DATABASE=mag2 -e MYSQL_USER=magento -e MYSQL_PASSWORD=m4g3nt01 -e MYSQL_ROOT_PASSWORD=m4g3nt001 alpine-mariadb

mkdir /data/docker/etcmysql && chmod 777 /data/docker/etcmysql
docker cp mysql:/etc/mysql/my.cnf /data/docker/etcmysql/
#edit my.cnf

docker stop mysql && docker rm mysql
docker run -id --name mysql -p 3306:3306 -v /data/docker/varlibmysql:/var/lib/mysql -v /data/docker/etc-mysql:/etc/mysql alpine-mariadb

#!/bin/bash

# variables
IMG_NAME="mjaglan/ubuntuhadoop2017"
HOST_NAME="testbed"
NETWORK_NAME=$HOST_NAME

# clean up containers
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

# if desired, clean up images
#docker rmi $(docker images -q)
#docker rmi  "$IMG_NAME"

# build the Dockerfile
docker build  -t "$IMG_NAME" "$(pwd)"

# Default docker network name is 'bridge', driver is 'bridge', scope is 'local'
# Create a new network with any name, and keep 'bridge' driver for 'local' scope.
NET_QUERY=$(docker network ls | grep -i $NETWORK_NAME)
if [ -z "$NET_QUERY" ]; then
	echo "Create network >>> $NETWORK_NAME"
	docker network create --driver=bridge $NETWORK_NAME
fi

# start hadoop container
: '
LINK: https://stackoverflow.com/a/35901232
Daemon                   Default Port  Configuration Parameter
-----------------------  ------------ ----------------------------------
ResourceManager          8088         yarn.resourcemanager.webapp.address
Namenode                 50070        dfs.http.address
Datanodes                50075        dfs.datanode.http.address
Secondarynamenode        50090        dfs.secondary.http.address
'
docker run --name "$HOST_NAME" -h "$HOST_NAME" --net=$NETWORK_NAME \
		-p  8088:8088  -p 50070:50070 \
		-p 50075:50075 -p 50090:50090 \
		-itd "$IMG_NAME"

# see active docker containers
docker ps

# attach to hadoop container
docker attach "$HOST_NAME"

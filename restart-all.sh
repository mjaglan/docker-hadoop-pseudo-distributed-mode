#!/bin/bash

# variables
IMG_NAME="mjaglan/ubuntuhadoop2017"
HOST_NAME="testbed"

# clean up containers
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

# if desired, clean up images
#docker rmi $(docker images -q)
#docker rmi  "$IMG_NAME"

# build the Dockerfile
docker build  -t "$IMG_NAME" "$(pwd)"

# start hadoop container
docker run --name "$HOST_NAME" -h "$HOST_NAME" -p 50070:50070 -p 8088:8088 -itd "$IMG_NAME"

# see active docker containers
docker ps

# attach to hadoop container
docker attach "$HOST_NAME"

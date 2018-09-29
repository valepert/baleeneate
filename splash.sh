#!/bin/bash

CONTAINER_NAME=baleeneate

# works on Mac
IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
xhost + $IP
docker run --rm --name baleeneate -e DISPLAY=$IP:0 -v /tmp/.X11-unix:/tmp/.X11-unix valepert/baleeneate

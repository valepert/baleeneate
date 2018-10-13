#!/bin/bash

CONTAINER_NAME=baleeneate

# works on Mac (XQuartz needed)
IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
xhost + $IP
DISPLAY=${IP}:0 docker-compose up

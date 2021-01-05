#!/bin/bash
SOURCE_DIR=$(dirname $(readlink -f $0))

if [ "$1" == "init" ]; then
    apt-get update
    apt-get install php5-cli php5-mysql mysql-server mysql-client -y
    service mysql start
    mysql < db-init.sql
    php5 -S 0.0.0.0:8000 -t /workspace/src
else
    CONTAINER_NAME="optimy-exam-container"
    docker build -t $CONTAINER_NAME .
    docker run --rm \
        --mount type=bind,src=$SOURCE_DIR,dst=/workspace \
        --name $CONTAINER_NAME \
        --cap-add NET_ADMIN \
        --publish 127.0.0.1:8001:8000 \
        --publish 3306:3306 \
        -it $CONTAINER_NAME bash;
fi

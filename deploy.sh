#!/bin/bash

DATA_DIR=minecraft-paper-data

function install {
    DATA_DIR=$DATA_DIR bash plugins_dl.sh dl
    docker-compose up -d
    docker-compose logs -f
}

function restall {
    docker-compose down
    docker-compose up -d
    docker-compose logs -f
}

function unstall {
    docker-compose down
    mv $DATA_DIR $DATA_DIR$(date +"%s")
}

function unstall_rm {
    docker-compose down
    rm -rf $DATA_DIR
}

function restart {
    docker exec mc-paper rcon-cli restart
}

function start {
    docker-compose start
}

function stop {
    docker-compose stop
}

case "$1" in
install)
    install;;
restall)
    restall;;
unstall)
    unstall;;
unstall_rm)
    unstall_rm;;
restart)
    restart;;
start)
    start;;
stop)
    stop;;
esac

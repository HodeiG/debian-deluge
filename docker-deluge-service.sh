#! /bin/bash

GID=$(id -g "$USERNAME")
DELUGE_CONFIG="${DELUGE_CONFIG:-$HOME/.config/deluge}"
DELUGE_DOWNLOAD="${DELUGE_DOWNLOAD:-$HOME/Downloads}"

function start() {
    mkdir -p "$DELUGE_CONFIG"
    mkdir -p "$DELUGE_DOWNLOAD"

    docker run \
        --rm \
        -d \
        -p 8112:8112 \
        -p 58846:58846 \
        -p 58946:58946 \
        --user "$UID:$GID" \
        -v /etc/localtime:/etc/localtime:ro \
        -v /etc/passwd:/etc/passwd:ro \
        -v /etc/group:/etc/group:ro \
        -v "$DELUGE_CONFIG":"$DELUGE_CONFIG" \
        -v "$DELUGE_DOWNLOAD":"$DELUGE_DOWNLOAD" \
        --name=deluge debian:deluge
}

function stop() {
    CONTAINER_ID=$(docker ps | awk '{if ($2=="debian:deluge") print $1}')
    docker kill "$CONTAINER_ID"
}

function status() {
    docker ps | awk 'NR==1 {print}; {if ($2=="debian:deluge") print $0}'
}

command=$1
case "$command" in
    "start"|"stop"|"status")
        $command
        ;;
    *)
        echo "Unknown option '$command'."
        exit 1
        ;;
esac

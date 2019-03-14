**Application**

[Deluge](http://deluge-torrent.org/)

**Description**

Deluge is a full-featured BitTorrent client for Linux, OS X, Unix and Windows.
It uses libtorrent in its backend and features multiple user-interfaces
including: GTK+, web and console. It has been designed using the client server
model with a daemon process that handles all the bittorrent activity. The
Deluge daemon is able to run on headless machines with the user-interfaces
being able to connect remotely from any platform.

**Build notes**

Latest stable Deluge release from Arch Linux repo.

**Usage**
```
#! /bin/bash

UID=$(id -u "$USERNAME")
GID=$(id -g "$USERNAME")
DELUGE_CONFIG="$HOME/.config/deluge"
DELUGE_DOWNLOAD="$HOME/Downloads"

mkdir -p "$DELUGE_CONFIG"
mkdir -p "$DELUGE_DOWNLOAD"

docker run \
    --rm \
    -d \
    -p 8112:8112 \
    -p 58846:58846 \
    -p 58946:58946 \
    --user ":$GID" \
    -v /etc/localtime:/etc/localtime:ro \
    -v /etc/passwd:/etc/passwd:ro \
    -v /etc/group:/etc/group:ro \
    -v "$DELUGE_CONFIG":"$DELUGE_CONFIG" \
    -v "$DELUGE_DOWNLOAD":"$DELUGE_DOWNLOAD" \
    --name=deluge debian:deluge
```

The above script will use your current username to launch the deluge torrent
client.

**Access application**<br>

`http://localhost:8112`

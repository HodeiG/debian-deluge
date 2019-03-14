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

Latest stable Deluge release from Debian Linux repo.

Build it using the below command and see Usage section to create the container.

```
docker build -t "debian:deluge" git@github.com:HodeiG/debian-deluge.git
```

**Usage**

Start the docker image:
```
./docker-deluge-service.sh start
```

Start the docker image with a different download folder:
```
DELUGE_DOWNLOAD=$HOME/torrentdl/ ./docker-deluge-service.sh start
```

Start the docker image with a different config folder:
```
DELUGE_CONFIG=$HOME/config/ ./docker-deluge-service.sh start
```

Get the container status:
```
./docker-deluge-service.sh status
```

Stop the container:
```
./docker-deluge-service.sh stop
```

The above script will use your current username to launch the deluge torrent
client.

**Access application**

`http://localhost:8112`

**Docker container maintenance**

List containers:
```
docker container ls
```

Kill container:
```
docker kill <container_id>
```

Delete image:
```
docker rmi <image_id>
```

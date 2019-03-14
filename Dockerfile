FROM debian:latest

RUN \
 echo "**** install packages ****" && \
 apt-get update && \
 apt-get install -y \
    deluged \
    deluge-web && \
 apt-get --purge autoremove -y && \
 apt-get clean && \
 rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/*

EXPOSE 8112 58846 58946 58946/udp

CMD deluged && deluge-web

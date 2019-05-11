FROM ubuntu:18.04
MAINTAINER David Parrish <daveparrish@tutanota.com>

RUN useradd -u 1000 mumble \
 && apt-get update \
 && apt-get install -y mumble-server libssl1.0-dev \
 && mkdir /data && chown 1000 /data

ADD mumble-server.ini /config/mumble-server.ini

VOLUME ["/data", "/config"]
EXPOSE 64738/udp

USER mumble
ENTRYPOINT ["/usr/sbin/murmurd", "-fg", "-ini", "/config/mumble-server.ini"]

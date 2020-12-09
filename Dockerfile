# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive
MAINTAINER Pterodactyl Software, <support@pterodactyl.io>

RUN apt update && apt -y install openjdk-11-jre curl ca-certificates openssl git tar bash sqlite fontconfig iproute2
RUN adduser --disabled-password --gecos "" --home /home/container container

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]

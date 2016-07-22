FROM phusion/baseimage:0.9.19
MAINTAINER Pete McWilliams <pmcwilliams@augustash.com>

# environment
ENV DEBIAN_FRONTEND="noninteractive" \
    TERM="xterm-256color" \
    LANG="en_US.UTF-8" \
    LANGUAGE="en_US:en" \
    LC_ALL="en_US.UTF-8" \
    HOME="/root" \
    PUID="501" \
    PGID="20" \
    APTLIST="apt-utils rsync"

# configure base system, user & directories
RUN echo "/root" > /etc/container_environment/HOME && \
    locale-gen en_US.UTF-8 && \
    useradd -u "$PUID" -U -m -d /home/ash -s /bin/false ash && \
    usermod -G users ash && \
    mkdir -p /config /defaults /src

# add base scripts
COPY defaults/sources.list /etc/apt/sources.list
COPY init/ /etc/my_init.d/
RUN  chmod +x /etc/service/*/run /etc/my_init.d/*.sh

# update packages & confd
RUN apt-get -yqq update && \
    apt-get -yqq -o Dpkg::Options::="--force-confold" upgrade && \
    curl -L -sS -o /usr/local/bin/confd https://github.com/kelseyhightower/confd/releases/download/v0.11.0/confd-0.11.0-linux-amd64 && \
    chmod +x /usr/local/bin/confd && \
    mkdir -p /etc/confd/{templates,conf.d,init}

# install/update packages
RUN apt-get -yqq update && \
    apt-get -yqq install $APTLIST && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# exports
VOLUME ["/config", "/defaults", "/src"]
CMD    ["/sbin/my_init"]

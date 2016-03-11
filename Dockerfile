FROM phusion/baseimage:0.9.18
MAINTAINER Pete McWilliams <pmcwilliams@augustash.com>

# environment
ENV DEBIAN_FRONTEND="noninteractive" TERM="xterm-256color" \
    LANG="en_US.UTF-8" LANGUAGE="en_US:en" LC_ALL="en_US.UTF-8" \
    HOME="/root"
ENV PUID="501" PGID="20"

# configure base user & directories
RUN useradd -u $PUID -U -m -d /home/ash -s /bin/false ash && \
    usermod -G users ash && \
    mkdir -p /src /config && \
    chown -R ash:ash /src /config

# add base scripts
COPY defaults/sources.list /etc/apt/sources.list
COPY init/ /etc/my_init.d/
RUN  chmod +x /etc/service/*/run /etc/my_init.d/*.sh

# install/update packages
RUN apt-get -yqq update && \
    apt-get -yqq -o Dpkg::Options::="--force-confold" upgrade && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN curl -L -sS -o /usr/local/bin/confd https://github.com/kelseyhightower/confd/releases/download/v0.11.0/confd-0.11.0-linux-amd64 && \
    chmod +x /usr/local/bin/confd && \
    mkdir -p /etc/confd/{templates,conf.d,init}

# exports
VOLUME ["/src", "/config"]
CMD    ["/sbin/my_init"]

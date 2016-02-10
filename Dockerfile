FROM phusion/baseimage:0.9.18
MAINTAINER Pete McWilliams <pmcwilliams@augustash.com>

# environment
ENV DEBIAN_FRONTEND="noninteractive" TERM="xterm-256color" \
    LANG="en_US.UTF-8" LANGUAGE="en_US:en" LC_ALL="en_US.UTF-8" \
    HOME="/root"
ENV PUID="501" PGID="20"

# configure base user & directories
RUN useradd -u 501 -U -d /config -s /bin/false ash && \
    usermod -G users ash && \
    mkdir -p /src /config

# add base scripts
COPY defaults/sources.list /etc/apt/sources.list
COPY init/ /etc/my_init.d/
RUN  chmod +x /etc/service/*/run /etc/my_init.d/*.sh

# install/update packages
RUN apt-get -yqq update && \
    apt-get -yqq -o Dpkg::Options::="--force-confold" upgrade && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# exports
VOLUME ["/src", "/config"]
CMD    ["/sbin/my_init"]

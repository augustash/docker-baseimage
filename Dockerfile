FROM phusion/baseimage:0.9.17
MAINTAINER Pete McWilliams <pmcwilliams@augustash.com>

# environment
ENV DEBIAN_FRONTEND="noninteractive" TERM="xterm-256color" HOME="/root"
ENV LANG="en_US.UTF-8" LANGUAGE="en_US:en" LC_ALL="en_US.UTF-8"

# configure base user & directories
RUN useradd -u 911 -U -d /config -s /bin/false ash && \
    usermod -G users ash && \
    mkdir -p /app /config

# add base scripts
COPY defaults/sources.list /etc/apt/sources.list
COPY init/ /etc/my_init.d/
RUN  chmod +x /etc/service/*/run && \
     chmod +x /etc/my_init.d/*.sh

# install/update packages
RUN apt-get -yqq update && \
    apt-get -yqq -o Dpkg::Options::="--force-confold" upgrade && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# startup
CMD ["/sbin/my_init"]

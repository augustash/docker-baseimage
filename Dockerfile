FROM ubuntu:16.04
MAINTAINER Pete McWilliams <pmcwilliams@augustash.com>

ARG DEBIAN_FRONTEND="noninteractive"
ARG OVERLAY_ARCH="amd64"
ARG OVERLAY_VERSION="1.18.1.5"
ARG CONFD_ARCH="amd64"
ARG CONFD_VERSION="0.11.0"

# s6 overlay
ADD https://github.com/just-containers/s6-overlay/releases/download/v${OVERLAY_VERSION}/s6-overlay-${OVERLAY_ARCH}.tar.gz /tmp/
RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C /

# locale
RUN \
    locale-gen en_US en_US.UTF-8 && \
    dpkg-reconfigure locales

# environment
ENV HOME="/root" \
    LANG="en_US.UTF-8" \
    LANGUAGE="en_US:en" \
    LC_ALL="en_US.UTF-8" \
    PUID="501" \
    PGID="20" \
    TERM="xterm-256color"
ENV APTLIST \
    apt-utils \
    ca-certificates \
    cron \
    curl \
    logrotate \
    rsync \
    vim \
    xz-utils
ENV BUILD_DEPS=""

# packages & configure
RUN \
    apt-get -yqq update && \
    apt-get -yqq install --no-install-recommends --no-install-suggests $APTLIST $BUILD_DEPS && \
    apt-get -yqq purge --auto-remove -o APT::AutoRemove::RecommendsImportant=false $BUILD_DEPS && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \

    curl -sSL -o /usr/local/bin/confd \
      https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-${CONFD_ARCH} && \
    chmod +x /usr/local/bin/confd && \
    mkdir -p /etc/confd/{templates,conf.d,init} && \

    useradd -u "$PUID" -U -d /config -s /bin/false ash && \
    usermod -G users ash && \
    mkdir -p /backups /config /defaults /src

# root filesystem
COPY rootfs /

# run s6 supervisor
ENTRYPOINT ["/init"]

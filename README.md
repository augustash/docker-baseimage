![https://www.augustash.com](http://augustash.s3.amazonaws.com/logos/ash-inline-color-500.png)

[![](https://badge.imagelayers.io/augustash/baseimage:latest.svg)](https://imagelayers.io/?images=augustash/baseimage:latest 'Get your own badge on imagelayers.io')

**This base container is not currently aimed at public consumption. It exists as a starting point for August Ash containers and is built upon [Phusion](http://phusion.github.io/baseimage-docker/) with special thanks to the group at [LinuxServer.io](http://linuxserver.io/).**

## Usage

To build the Docker image, clone the repository and from within the project directory run:

```bash
docker-compose build
```

## Push the Image

This project is not an automated build within [Docker Hub](https://hub.docker.com). Because other containers are based on this, we do not want accidental errors automatically pushed out.

After making changes, create a new tagged build from within the project directory:

```bash
docker build -t augustash/baseimage:<tag> .
```

Push the new tagged image:

```bash
docker push augustash/baseimage:<tag>
```

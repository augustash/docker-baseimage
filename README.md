![https://www.augustash.com](http://augustash.s3.amazonaws.com/logos/ash-inline-color-500.png)

[![](https://badge.imagelayers.io/augustash/baseimage:latest.svg)](https://imagelayers.io/?images=augustash/baseimage:latest 'Get your own badge on imagelayers.io')

**This base container is not currently aimed at public consumption. It exists as a starting point for August Ash containers and is built upon [Phusion](http://phusion.github.io/baseimage-docker/).**

## Create the Image

To build the Docker image, clone the repository and from within the project directory run:

```bash
docker build -t augustash/baseimage .
```

## Push the Image

This project is not an automated build. Because other containers are based on this, we do not want accidental errors automatically pushed out. Push changes to [Docker Hub](https://docs.docker.com/docker-hub/repos/):

```bash
docker push augustash/baseimage:<tag>
```

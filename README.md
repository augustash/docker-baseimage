![https://www.augustash.com](http://augustash.s3.amazonaws.com/logos/ash-inline-color-500.png)

**This base container is not currently aimed at public consumption. It exists as a starting point for August Ash containers and is built upon [Phusion](http://phusion.github.io/baseimage-docker/).**

## Create an Image

To build this as a Docker image, clone the repository and from within the project directory run:

```bash
docker build -t augustash/baseimage .
```

## Push an Image

This project is not an automated build. Because other containers are based on this, we do not want accidental errors automatically pushed out. Push changes to [Docker Hub](https://docs.docker.com/docker-hub/repos/):

```bash
docker push augustash/baseimage:<tag>
```

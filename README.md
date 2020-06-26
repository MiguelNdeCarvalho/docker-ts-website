# docker-ts-website

## Description

This is the docker image of the [ts-website](https://github.com/Revadike/epicgames-freebies-claimer) made by [Wruczek](https://github.com/Wruczek).

## Running the Container

To run the container simply do this:

```bash
docker run \
  -d \
  --name=ts-website \
  -p 8080:8080 \
  -e UID='UID' \
  -e GID='GID' \
  -v ${PWD}:/var/www/html/ \
  --restart unless-stopped \
  miguelndecarvalho/docker-ts-website
```

You will need a MySQL or MariaDB to use the Website.

## Thanks

[Wruczek](https://github.com/Wruczek)(for making this great website)
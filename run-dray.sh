#!/bin/sh

IMAGE=${IMAGE_NAME:-centurylink/dray}

docker run --name redis -d redis:latest
docker run --name dray -d --link redis:redis -v /var/run/docker.sock:/var/run/docker.sock -p 3009:3000 $IMAGE:latest

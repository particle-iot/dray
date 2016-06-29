#!/bin/sh

IMAGE=${IMAGE_NAME:-centurylink/dray}

docker run --rm \
  -v $(pwd):/src \
  -v /var/run/docker.sock:/var/run/docker.sock \
  centurylink/golang-builder:latest \
  $IMAGE:latest

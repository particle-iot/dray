#!/bin/sh

docker run --rm -v $(pwd):/src \
  -w /src \
  golang:1.15 \
  go test -v ./...

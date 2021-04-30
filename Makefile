TAG := $(shell git rev-parse --short HEAD) 

test:
	docker run --rm -v $(shell pwd):/src -w /src golang:1.15 go test -v ./...

docker:
	docker build . -t particle/dray:local-$(TAG)
	docker push particle/dray:local-$(TAG)

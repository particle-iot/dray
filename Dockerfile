FROM golang:1.8.1 as builder

WORKDIR /tmp
# Install glide
RUN wget https://github.com/Masterminds/glide/releases/download/v0.13.3/glide-v0.13.3-linux-amd64.tar.gz && \
  tar -zxf glide-v0.13.3-linux-amd64.tar.gz --strip-components=1  -C /usr/local/bin/ linux-amd64/glide && \
  rm glide-v0.13.3-linux-amd64.tar.gz

WORKDIR /go/src/github.com/CenturyLinkLabs/dray

COPY glide.lock glide.yaml ./
RUN glide install
COPY . .

ENV CGO_ENABLED=0
RUN go build -o /dray -a --installsuffix cgo --ldflags="-s" .

FROM scratch
EXPOSE 3000

COPY --from=builder /dray /

ENTRYPOINT ["/dray"]

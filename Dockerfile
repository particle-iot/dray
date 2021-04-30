FROM golang:1.15 as builder

WORKDIR /src

COPY . .

ENV CGO_ENABLED=0
RUN go build -o /dray -a --installsuffix cgo --ldflags="-s" .

FROM scratch
EXPOSE 3000

COPY --from=builder /dray /

ENTRYPOINT ["/dray"]

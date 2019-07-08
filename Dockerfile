FROM alpine
MAINTAINER CenturyLink Labs <clt-labs-futuretech@centurylink.com>
EXPOSE 3000

COPY dray /
ADD alive.sh /alive.sh
RUN mkdir -p /tmp/docker && cd /tmp/docker \
    && wget https://download.docker.com/linux/static/stable/x86_64/docker-18.06.3-ce.tgz -O docker-18.06.3-ce.tgz \
    && tar xzf docker-18.06.3-ce.tgz \
    && cp /tmp/docker/docker/docker /usr/bin

ENTRYPOINT ["/dray"]

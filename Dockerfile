FROM debian:8

RUN apt-get -qq update && \
    apt-get -qq install -y --no-install-recommends wget ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists

RUN mkdir /arachni && \
    wget -qO- https://downloads.arachni-scanner.com/nightlies/arachni-2.0dev-1.0dev-linux-x86_64.tar.gz | tar xvz -C /arachni --strip-components=1

WORKDIR /arachni/bin
RUN ./arachni_rpcd
EXPOSE 7331

FROM ubuntu:22.04
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

USER root

ENV GO_VERSION=1.20

RUN curl -L -O "https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz" 
RUN tar -C /usr/local -xzf go1.20.linux-amd64.tar.gz
RUN apt install vim

RUN export PATH=$PATH:/usr/local/go/bin

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["bash", "/entrypoint.sh"]
FROM golang:1.20
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

USER root

WORKDIR /var/www

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["bash", "/entrypoint.sh"]

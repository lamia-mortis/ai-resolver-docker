FROM ubuntu:22.04
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

USER root

# installing php and its modules
ENV PHP_VERSION=8.2

RUN apt-get update && apt-get upgrade -y && apt --fix-broken install 
RUN apt install lsb-release ca-certificates apt-transport-https software-properties-common -y 
RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php 
RUN apt-get install php${PHP_VERSION} -y \
    apt-get install php${PHP_VERSION}-common \
    apt-get install php${PHP_VERSION}-curl \
    apt-get install php${PHP_VERSION}-xml \
    apt-get install php${PHP_VERSION}-mbstring \
    apt-get install php${PHP_VERSION}-intl \
    apt-get install php${PHP_VERSION}-mongodb \
    curl git vim unzip -y \
    apt install vim

# installing nvm with node and npm
ENV NVM_DIR /root/.nvm 
ENV NVM_VERSION 0.39.4
ENV NODE_VERSION 𝟷𝟾.𝟷𝟹.𝟶

RUN mkdir -p ${NVM_DIR}
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v${NVM_VERSION}/install.sh | bash \
    && . ${NVM_DIR}/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

# add node and npm to path so the commands are available
ENV NODE_PATH $NVM_DIR/v${NODE_VERSION}/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v${NODE_VERSION}/bin:${PATH}

# installing composer
ENV COMPOSER_VERSION 𝟸.𝟸.𝟼
RUN RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=${COMPOSER_VERSION}

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["bash", "/entrypoint.sh"]
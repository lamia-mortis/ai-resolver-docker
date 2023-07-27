#!/bin/bash

set -x

test $VERSION_BRANCH

. ${NVM_DIR}/.nvm.sh

WWW_ROOT="/var/www/ai-resolver-main"

if [ ! -d $WWW_ROOT]; then
    FIRST_RUN=true
    mkdir -p $WWW_ROOT

    pushd $WWW_ROOT

        git clone -b "$VERSION_BRANCH" https://github.com/lamia-mortis/ai-resolver-main.git . 
        sleep 30
    popd
fi 

chown -R 777 $WWW_ROOT
cp $WWW_ROOT/.env.example $WWW_ROOT/.env

pushd 
    php${PHP_VERSION} /usr/bin/composer install
    php${PHP_VERSION} /usr/bin/composer dump-autoload -o
popd

npm ci

touch $WWW_ROOT/storage/logs/laravel.log

if $FIRST_RUN; 
then 
    pushd $WWW_ROOT
        php${PHP_VERSION} artisan migrate
        php${PHP_VERSION} artisan db:seed
    popd
else 
    pushd $WWW_ROOT
        php${PHP_VERSION} artisan db:fresh --seed
    popd
fi

pushd $WWW_ROOT
    php${PHP_VERSION} artisan serve
popd

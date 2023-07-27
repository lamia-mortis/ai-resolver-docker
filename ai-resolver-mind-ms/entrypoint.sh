#!/bin/bash

set -x

test $VERSION_BRANCH

WWW_ROOT="/var/www/ai-resolver-mind-ms"

if [ ! -d $WWW_ROOT]; then
    FIRST_RUN=true
    mkdir -p $WWW_ROOT

    pushd $WWW_ROOT

        git clone -b "$VERSION_BRANCH" https://github.com/lamia-mortis/ai-resolver-mind-ms.git . 
        sleep 30
    popd
fi 

chown -R 777 $WWW_ROOT

export GOPATH=$WWW_ROOT

pushd $WWW_ROOT
    go mod download
popd

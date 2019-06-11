#!/usr/bin/env sh
VER=13.8.2
DIR=~/Downloads
MIRROR=https://github.com/thought-machine/please/releases/download/v${VER}

dl()
{
    LABEL=$1
    APP=$2
    OS=$3
    PLATFORM=$4
    FILE=${APP}_${VER}_${OS}_${PLATFORM}.tar.gz
    URL=$MIRROR/$FILE
    wget --quiet -O $DIR/$FILE $URL
    printf "# %s\n%s: sha256:%s\n" $URL $LABEL `sha256sum $DIR/$FILE | awk '{print $1}'`
}

dl cli please linux amd64
dl servers please_servers linux amd64



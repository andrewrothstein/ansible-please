#!/usr/bin/env sh
VER=${1:-14.1.3}
DIR=~/Downloads
MIRROR=https://github.com/thought-machine/please/releases/download/v${VER}

dl()
{
    local os=$1
    local arch=$2
    local platform=${os}_${arch}
    local file=please_${VER}_${platform}.tar.gz
    local shafile=$file.sha256
    local url=$MIRROR/$shafile
    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform `curl -sSL $url | awk '{print $1}'`
}

printf "  '%s':\n" $VER
dl darwin amd64
dl linux amd64




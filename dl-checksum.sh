#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://github.com/thought-machine/please/releases/download

dl()
{
    local ver=$1
    local os=$2
    local arch=$3
    local platform="${os}_${arch}"
    local file=please_${ver}_${platform}.tar.gz
    local shafile="${file}.sha256"
    local url=$MIRROR/v$ver/$shafile
    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(curl -sSL $url | awk '{print $1}')
}

dl_ver() {
    local ver=$1
    printf "  '%s':\n" $ver
    dl $ver darwin amd64
    dl $ver linux amd64
}

dl_ver ${1:-14.6.0}

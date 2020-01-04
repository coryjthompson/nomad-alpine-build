#!/bin/sh
set -e 
NOMAD_VERSION="v0.10.2"

mkdir -p build

docker run --rm -it -e NOMAD_VERSION="$NOMAD_VERSION" -v $PWD/scripts:/root/scripts -v $PWD/build:/root/build golang:1.12-alpine /root/scripts/build.sh

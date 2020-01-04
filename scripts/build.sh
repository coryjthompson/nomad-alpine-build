#!/bin/sh

set -e 

apk add \
    bash \
    g++ \
    git \
    linux-headers \
    musl-dev

# Hashicorp Build
mkdir -p src/github.com/hashicorp/nomad
cd src/github.com/hashicorp/nomad || return 1

# Get source and apply any patches.
git clone -b $NOMAD_VERSION https://github.com/hashicorp/nomad.git .

echo "Building..."
go build -x \
    -o bin/nomad \
    -tags "nonvidia release ui" \
    --ldflags '-linkmode external -extldflags "-static"' \

./bin/nomad version
mv ./bin/nomad /root/build/

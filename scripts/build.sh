#!/bin/sh

set -e 

apk add git bash linux-headers bash g++ make
git clone -b $NOMAD_VERSION https://github.com/hashicorp/nomad.git /usr/local/go/src/github.com/hashicorp/nomad/

cd /usr/local/go/src/github.com/hashicorp/nomad
make bootstrap
make pkg/linux_amd64/nomad GO_TAGS="nonvidia"

./pkg/linux_amd64/nomad version
mv ./pkg/linux_amd64/nomad /root/build/

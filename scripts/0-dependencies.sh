#! /bin/sh -eux
export DEBIAN_FRONTEND=noninteractive
export TZ=UTC

add-apt-repository -y ppa:longsleep/golang-backports
apt-get update

apt-get install -y \
  bison curl docker.io gawk genisoimage git golang-1.18-go \
  make parted pigz python-minimal qemu-utils rpm tar wget 

ln -vsf /usr/lib/go-1.18/bin/go /usr/bin/go

#! /bin/sh -eux

rm -rf SPECS/mariner-clang/SOURCES
mkdir SPECS/mariner-clang/SOURCES
cp main.c SPECS/mariner-clang/SOURCES

tar -xvzf toolkit.tar.gz
cd toolkit
make \
  PACKAGE_BUILD_LIST="mariner-clang" \
  USE_PREVIEW_REPO=n \
  CONFIG_FILE= \
  -j "$(nproc)" \
  build-packages

#! /bin/sh -eux

rm -rf SPECS/clang/SOURCES
mkdir SPECS/clang/SOURCES
(
    cd SPECS/clang/SOURCES;
    curl -LO "https://github.com/llvm/llvm-project/releases/download/llvmorg-8.0.1/cfe-8.0.1.src.tar.xz";
)

rm -rf SPECS/mariner-clang/SOURCES
mkdir SPECS/mariner-clang/SOURCES
cp main.c SPECS/mariner-clang/SOURCES

tar -xvzf toolkit.tar.gz
cd toolkit
make \
  PACKAGE_BUILD_LIST="clang mariner-clang" \
  USE_PREVIEW_REPO=n \
  CONFIG_FILE= \
  -j "$(nproc)" \
  build-packages

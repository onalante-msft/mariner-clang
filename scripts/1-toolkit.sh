#! /bin/sh -eux

MARINER_TMPDIR=$(mktemp -d)
trap 'rm -rf "${MARINER_TMPDIR}"' EXIT

git clone \
  --branch 1.0-stable \
  --depth 1 \
  https://github.com/microsoft/CBL-mariner.git \
  "${MARINER_TMPDIR}"

(
  cd "${MARINER_TMPDIR}"/toolkit;
  make REBUILD_TOOLS=y package-toolkit;
)
cp "${MARINER_TMPDIR}"/out/toolkit-*.tar.gz toolkit.tar.gz

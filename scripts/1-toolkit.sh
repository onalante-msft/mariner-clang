#! /bin/sh -eux

VERSION="${1:-1}"

MARINER_TMPDIR=$(mktemp -d)
trap 'rm -rf "${MARINER_TMPDIR}"' EXIT

git clone \
  --branch "${VERSION}.0-stable" \
  --depth 1 \
  https://github.com/microsoft/CBL-mariner.git \
  "${MARINER_TMPDIR}"

(
  cd "${MARINER_TMPDIR}"/toolkit;
  make REBUILD_TOOLS=y package-toolkit;
)
cp "${MARINER_TMPDIR}"/out/toolkit-*.tar.gz toolkit.tar.gz

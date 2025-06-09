#!/usr/bin/env bash

set -euxo pipefail

rm -f "${1:?}"
rm -rf ./build
rm -rf ./downloads
rm -f *.src.rpm
rm -f *.tar.gz

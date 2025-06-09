#!/usr/bin/env bash

set -euxo pipefail

copr build-package joshiverse --name "$(sed 's/\.spec//' <<< "${1:?}")"

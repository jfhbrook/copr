#!/usr/bin/env bash

set -euo pipefail

COLOR_RED='\e[0;31m'
COLOR_GREEN='\e[0;32m'
COLOR_RESET='\e[0m'

copr_home="$(realpath "${BASH_SOURCE[0]}/../..")"
spec="$(pwd)/${1:?}"
outdir="$(pwd)"
topdir="$(pwd)/build"
downloaddir="$(pwd)/downloads"

export copr_home
export spec
export outdir
export topdir
export downloaddir

function spec-name {
  basename "${spec}" | sed 's/\.spec//'
}

function rebuild {
  rpmbuild \
    --rebuild \
    "${outdir}/$(spec-name)-"*.src.rpm
}

set -x

if rebuild; then
  echo -e "${COLOR_GREEN}source rpm verified!${COLOR_RESET}"
else
  echo -e "${COLOR_RED}msource rpm invalid!${COLOR_RESET}"
fi

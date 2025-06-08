#!/usr/bin/env bash

set -euxo pipefail

COLOR_RED='\e[0;31m'
COLOR_GREEN='\e[0;32m'
COLOR_RESET='\e[0m'

outdir="${outdir:?}"
spec="${spec:?}"

function spec-name {
  basename "${spec}" | sed 's/\.spec//'
}

function rebuild {
  rpmbuild \
    --rebuild \
    "${outdir}/$(spec-name)-"*.src.rpm
}

if rebuild; then
  echo -e "${COLOR_GREEN}source rpm verified!${COLOR_RESET}"
else
  echo -e "${COLOR_RED}msource rpm invalid!${COLOR_RESET}"
fi

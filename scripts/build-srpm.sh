#!/usr/bin/env bash

set -euo pipefail

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

set -x

make -f "${COPR_HOME}/.copr/Makefile" srpm

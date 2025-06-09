#!/usr/bin/env bash

set -euo pipefail

COPR_HOME="$(realpath "${BASH_SOURCE[0]}/../..")"
SPEC_PATH="$(realpath "${1:?}")"
PACKAGE_PATH="$(dirname "${SPEC_PATH}" | sed "s#${COPR_HOME}#/workspace#")"

spec="$(echo "${SPEC_PATH}" | sed "s#${COPR_HOME}#/workspace#")"
outdir="${PACKAGE_PATH}"
topdir="${PACKAGE_PATH}/build"
downloaddir="${PACKAGE_PATH}/downloads"

just -f "${COPR_HOME}/justfile" build-docker

set -x

docker run \
  -v "${HOME}:/root" \
  -v "${COPR_HOME}:/workspace" \
  -e spec="${spec}" \
  -e outdir="${outdir}" \
  -e topdir="${topdir}" \
  -e downloaddir="${downloaddir}" \
  -it copr-dev bash -c '
cd '"${PACKAGE_PATH}"' || exit
make -f /workspace/.copr/Makefile srpm
'

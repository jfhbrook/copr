#!/usr/bin/env bash

copr_home="$(dirname "${BASH_SOURCE[0]}")"

function get-topdir {
  rpmbuild --eval '%{_topdir}'
}

function get-sourcedir {
  local topdir
  local args

  topdir="${1:-}"
  args=()

  if [ -n "${topdir}" ]; then
    args+=( --define "_topdir ${topdir}" )
  fi

  args+=( --eval '%{_sourcedir}' )

  rpmbuild "${args[@]}"
}

function get-downloaddir {
  echo "$(pwd)/downloads"
}

function setup-build-env {
  if [ -n "${topdir}" ]; then
    sourcedir="${sourcedir:-$(get-sourcedir "${topdir}")}"
  else
    topdir="$(get-topdir)"
    sourcedir="${sourcedir:-$(get-sourcedir)}"
  fi

  downloaddir="${downloaddir:-$(get-downloaddir)}"
  PATH="${copr_home}/bin:${PATH}"

  export topdir
  export sourcedir
  export downloaddir
  export PATH
}

function setup-build-dirs {
  mkdir -p "${topdir}"
  mkdir -p "${sourcedir}"
  mkdir -p "${downloaddir}"
}

# TODO: Shouldn't these be listed in the spec?
function install-buildrequires {
  if ! which jq; then
    dnf install -y jq
  fi
}

function prelude {
  setup-build-env
  setup-build-dirs
  install-buildrequires
}

prelude

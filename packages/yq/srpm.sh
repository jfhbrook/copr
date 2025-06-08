#!/usr/bin/env bash

source ../../prelude.sh

set-gh-release-version mikefarah/yq
download-sources
build-srpm -bb

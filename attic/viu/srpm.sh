#!/usr/bin/env bash

source ../../prelude.sh

set-gh-release-version atanunq/viu
download-sources
build-srpm -bb

#!/usr/bin/env bash

source ../../prelude.sh

set-gh-release-version starship/starship
download-sources
build-srpm -bb

#!/usr/bin/env bash

source ../../prelude.sh

set-gh-release-version {{cookiecutter.gh_repository}}
download-sources
build-srpm

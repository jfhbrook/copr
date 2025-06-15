#!/usr/bin/env bash

source ../../prelude.sh

cp guess_host_triple-fix-metadata-auto.diff "${sourcedir}/"
build-srpm

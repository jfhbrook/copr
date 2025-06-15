#!/usr/bin/env bash

source ../../prelude.sh

cp process_control-fix-metadata-auto.diff "${sourcedir}/"
build-srpm

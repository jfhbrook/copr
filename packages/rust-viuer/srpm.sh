#!/usr/bin/env bash

source ../../prelude.sh

cp viuer-fix-metadata-auto.diff "${sourcedir}/"
build-srpm

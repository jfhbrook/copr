#!/usr/bin/env bash

source ../../prelude.sh

cp starship-fix-metadata-auto.diff "${sourcedir}/"
build-srpm

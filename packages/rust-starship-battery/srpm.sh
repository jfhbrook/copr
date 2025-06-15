#!/usr/bin/env bash

source ../../prelude.sh

cp starship-battery-fix-metadata-auto.diff "${sourcedir}/"
build-srpm

#!/usr/bin/env bash

#
# Build all packages. Useful after a new chroot has been added.
#

COPR='jfhbrook/joshiverse'

for package in $(copr list-packages jfhbrook/joshiverse | jq -r 'map(.name)[]'); do
  copr build-package "${COPR}" --name "${package}" --nowait
done

kbopen "https://copr.fedorainfracloud.org/coprs/${COPR}/builds/"

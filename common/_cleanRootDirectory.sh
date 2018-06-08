#!/usr/bin/env bash

directoryToRemove=$1

. ./_fixPermissions.sh "${directoryToRemove}"

rm -rf ${directoryToRemove}/*
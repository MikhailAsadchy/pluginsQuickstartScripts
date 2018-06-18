#!/usr/bin/env bash

directoryToRemove=$1

sudo rm -rf ${directoryToRemove}
sudo mkdir -p ${directoryToRemove}
. ./_fixPermissions.sh "${directoryToRemove}"

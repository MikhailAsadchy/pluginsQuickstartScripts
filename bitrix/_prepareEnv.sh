#!/usr/bin/env bash
rootDir=$1

. ../common/_fixPermissions.sh $rootDir
. ../common/_apache.sh
. ../common/_fixPermissions.sh $rootDir

mysql -u "root" "-p113355" "" < "createBitrixSchema.sql"

chromium-browser "http://localhost"
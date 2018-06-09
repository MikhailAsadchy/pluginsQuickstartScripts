#!/usr/bin/env bash
rootDir=$1

. ../common/_fixPermissions.sh $rootDir
. ../common/_apache.sh
. ../common/_fixPermissions.sh $rootDir

. ../common/replacePhpIni.sh "${PWD}/php.ini"


mysql -u "root" "-p113355" "" < "createBitrixSchema.sql"

. ../common/_apache.sh

chromium-browser "http://localhost"
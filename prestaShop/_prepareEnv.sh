#!/usr/bin/env bash
rootDir=$1
phpVersion=$2

. ../common/_fixPermissions.sh ${rootDir}

. ../common/replacePhpIni.sh "${PWD}/php.ini" ${phpVersion}

mysql -u "root" "-p113355" "" < "createSchema.sql"

. ../common/_apache.sh
. ../common/_fixPermissions.sh ${rootDir}

chromium-browser "http://localhost/index.php"
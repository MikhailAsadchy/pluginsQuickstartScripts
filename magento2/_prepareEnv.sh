#!/usr/bin/env bash
rootDir=$1

platformScripts="/media/mikhail/30eaaffa-a22e-45b0-9345-8ac6247f9240/php/plugins/scripts"

cp -a ${platformScripts}/. ${rootDir}/

. ../common/replacePhpIni.sh "${PWD}/php.ini"

. ../common/_fixPermissions.sh $rootDir
. ../common/_apache.sh
. ../common/_fixPermissions.sh $rootDir

mysql -u "root" "-p113355" "" < "createMagento2Schema.sql"

chromium-browser "http://127.0.0.1/magento2"
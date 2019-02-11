#!/usr/bin/env bash
rootDir=$1
phpVersion=$2

CURRENT_DIR=${PWD}
cd ../common/php/
. ./reinstall.sh ${phpVersion}
cd ${CURRENT_DIR}

echo "prepareEnv: restarting apache server..."
. ../common/_fixPermissions.sh $rootDir
. ../common/_apache.sh
. ../common/_fixPermissions.sh $rootDir

echo "prepareEnv: replacing php.ini for apache..."
. ../common/replacePhpIni.sh "${PWD}/php.ini" $phpVersion

echo "prepareEnv: creating database in mysql for bitrix..."
mysql -u "root" "-p113355" "" < "createBitrixSchema.sql"

echo "prepareEnv: restarting apache server..."
. ../common/_apache.sh

chromium-browser "http://localhost"
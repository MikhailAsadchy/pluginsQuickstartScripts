#!/usr/bin/env bash
rootDir=$1
phpVersion=$2

CURRENT_DIR=${PWD}

. ../common/_fixPermissions.sh ${rootDir}

cd ../common/php/
. ./reinstall.sh ${phpVersion}
sudo a2enmod rewrite
systemctl restart apache2
sudo apt-get install php${phpVersion}-intl

cd ${CURRENT_DIR}
. ../common/replacePhpIni.sh "${PWD}/php.ini" ${phpVersion}

mysql -u "root" "-p113355" "" < "createSchema.sql"

. ../common/_apache.sh
. ../common/_fixPermissions.sh ${rootDir}

chromium-browser "http://localhost/index.php"
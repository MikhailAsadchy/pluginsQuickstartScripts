#!/usr/bin/env bash
rootDir=$1
phpVersion=$2

CURRENT_DIR=${PWD}

platformScripts="/home/mikhail_asadchy@epam.com/downloads/php/plugins/scripts"

cp -a ${platformScripts}/. ${rootDir}/

cd ../common/php/
. ./reinstall.sh ${phpVersion}
cd ${CURRENT_DIR}

sudo a2enmod rewrite
systemctl restart apache2

. ./installPHPDependencies.sh ${phpVersion}

. ../common/replacePhpIni.sh "${PWD}/php.ini" ${phpVersion}

. ../common/_fixPermissions.sh ${rootDir}
. ../common/_apache.sh
. ../common/_fixPermissions.sh ${rootDir}

mysql -u "root" "-p113355" "" < "createMagento2Schema.sql"

chromium-browser "http://127.0.0.1/magento2"
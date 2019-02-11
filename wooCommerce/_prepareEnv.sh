#!/usr/bin/env bash
rootDir=$1
phpVersion=$2

CURRENT_DIR=${PWD}

. ../common/_fixPermissions.sh ${rootDir}

cp wp-config.php ${rootDir}/wordpress/

cd ../common/php/
. ./reinstall.sh ${phpVersion}

cd ${CURRENT_DIR}
. ../common/replacePhpIni.sh "${PWD}/php.ini" ${phpVersion}

mysql -u "root" "-p113355" "" < "createWooCommerceSchema.sql"

. ../common/_apache.sh
. ../common/_fixPermissions.sh ${rootDir}

chromium-browser "http://localhost/wordpress/index.php"
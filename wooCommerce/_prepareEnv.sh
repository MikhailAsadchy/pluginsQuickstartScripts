#!/usr/bin/env bash
rootDir=$1
phpVersion=$2

. ../common/_fixPermissions.sh $rootDir

cp wp-config.php ${rootDir}/wordpress/

. ../common/replacePhpIni.sh "${PWD}/php.ini" ${phpVersion}

mysql -u "root" "-p113355" "" < "createWooCommerceSchema.sql"

. ../common/_apache.sh
. ../common/_fixPermissions.sh $rootDir

chromium-browser "http://localhost/wordpress/index.php"
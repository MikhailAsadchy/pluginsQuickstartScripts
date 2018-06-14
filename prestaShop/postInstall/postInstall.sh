#!/usr/bin/env bash
apache2Root="/var/www/html"

cd ../../common
. ./_fixPermissions.sh ${apache2Root}

cd ../prestaShop/postInstall
. ./removeInstallationFolder.sh ${apache2Root}



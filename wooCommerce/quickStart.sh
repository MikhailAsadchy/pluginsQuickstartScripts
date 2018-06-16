#!/usr/bin/env bash

CURRENT_FOLDER=${PWD}

tempFolder="/media/mikhail/30eaaffa-a22e-45b0-9345-8ac6247f9240/tempFolder"
apache2Root="/var/www/html"

gitProjectName="RobocallerWooCommerce"
gitRepositoryUrl="github.com/MikhailAsadchy/"${gitProjectName}

wordPressArchivePath="/media/mikhail/30eaaffa-a22e-45b0-9345-8ac6247f9240/installers/wooCommerce/wordpress-4.9.6.tar.gz"
wooCommerceArchivePath="/media/mikhail/30eaaffa-a22e-45b0-9345-8ac6247f9240/installers/wooCommerce/woocommerce.3.4.2.zip"

phpVersion=7.2

cd ../common/
. ./_cleanRootDirectory.sh ${apache2Root}

. ./_getSourcesFromGit.sh ${gitRepositoryUrl} ${tempFolder}

. ./_extractTar.sh ${apache2Root} ${wordPressArchivePath}

. ./_copySourcesToTargetDirectory.sh ${tempFolder}/${gitProjectName} ${apache2Root}

cd ../wooCommerce/
. ./_prepareEnv.sh ${apache2Root} ${phpVersion}

unzip -q  ${wooCommerceArchivePath} -d ${apache2Root}/wordpress/wp-content/plugins/

echo ------------------------------------------------
echo ------------------------------------------------
echo "some actions we need to do before start development:"
echo "1) Activate wooCommerce plugin"
echo "2) Run wooCommerce configure wizard and setup the site and payment options (cash will be enough)"
echo "3) Import products from /var/www/html/wordpress/wp-content/plugins/woocommerce/sample-data/sample_products.csv using product import"
echo "4) Activate rcaller plugin and make sure it works well"
echo ------------------------------------------------
echo ------------------------------------------------

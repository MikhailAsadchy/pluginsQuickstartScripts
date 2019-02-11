#!/usr/bin/env bash

CURRENT_FOLDER=${PWD}

tempFolder="/home/mikhail_asadchy@epam.com/downloads/tempFolder"
apache2Root="/var/www/html"

gitProjectName="RobocallerPrestaShop"
gitRepositoryUrl="github.com/MikhailAsadchy/"${gitProjectName}

prestaShopArchivePath="/home/mikhail_asadchy@epam.com/downloads/installers/prestaShop/prestashop_1.7.3.3.zip"

phpVersion=7.0

cd ../common/
. ./_cleanRootDirectory.sh ${apache2Root}

. ./_getSourcesFromGit.sh ${gitRepositoryUrl} ${tempFolder}

unzip -q ${prestaShopArchivePath} -d ${apache2Root}

. ./_copySourcesToTargetDirectory.sh ${tempFolder}/${gitProjectName} ${apache2Root}

echo "Perform prestaShop installation by entering any key"
read var
cd ../prestaShop/
. ./_prepareEnv.sh ${apache2Root} ${phpVersion}

echo "When prestaShop will be installed, press any key to proceed with post installation script"
read var

cd postInstall
. ./postInstall.sh

chromium-browser "localhost/admin/index.php"

echo ------------------------------------------------
echo ------------------------------------------------
echo "1) Navigate to backOffice (localhost/admin/index.php)"
echo "2) Configure carriers (allow all carriers for all regions)"
echo "3) Install RCaller module"
echo "4) Check rcaller module is working well"
echo ------------------------------------------------
echo ------------------------------------------------

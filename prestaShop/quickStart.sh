#!/usr/bin/env bash

CURRENT_FOLDER=${PWD}

tempFolder="/media/mikhail/30eaaffa-a22e-45b0-9345-8ac6247f9240/tempFolder"
apache2Root="/var/www/html"

gitProjectName="RobocallerPrestaShop"
gitRepositoryUrl="github.com/MikhailAsadchy/"${gitProjectName}

prestaShopArchivePath="/media/mikhail/30eaaffa-a22e-45b0-9345-8ac6247f9240/installers/prestaShop/prestashop_1.7.3.3.zip"

phpVersion=7.0

cd ../common/
. ./_cleanRootDirectory.sh ${apache2Root}

. ./_getSourcesFromGit.sh ${gitRepositoryUrl} ${tempFolder}

unzip -q ${prestaShopArchivePath} -d ${apache2Root}

. ./_copySourcesToTargetDirectory.sh ${tempFolder}/${gitProjectName} ${apache2Root}

echo "Perform prestaShop installation, then enter any key to continue..."
read var
cd ../prestaShop/
. ./_prepareEnv.sh ${apache2Root} ${phpVersion}

echo "When prestaShop will be installed, press any key to continue..."
read var

cd postInstall
. ./postInstall.sh

echo ------------------------------------------------
echo ------------------------------------------------
echo "1) Navigate to backOffice"
echo "2) Configure carriers (allow all carriers for all regions)"
echo "3) Install RCaller module"
echo "4) Check rcaller module is working well"
echo ------------------------------------------------
echo ------------------------------------------------

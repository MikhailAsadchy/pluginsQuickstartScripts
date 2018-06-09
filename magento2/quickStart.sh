#!/usr/bin/env bash

CURRENT_FOLDER=${PWD}

tempFolder="/media/mikhail/30eaaffa-a22e-45b0-9345-8ac6247f9240/tempFolder"
apacheRoot="/var/www/html"

gitRepositoryUrl="github.com/MikhailAsadchy/RobocallerMagento2"
gitProjectName="RobocallerMagento2"

magento2ArchievePath="/media/mikhail/30eaaffa-a22e-45b0-9345-8ac6247f9240/installers/magento2/Magento-CE-2.2.4_sample_data-2018-05-01-09-51-36.tar.gz"
magento2Path=${apacheRoot}/magento2

phpVersion=7.0

cd ../common/
. ./_cleanRootDirectory.sh ${apacheRoot}

. ./_getSourcesFromGit.sh $gitRepositoryUrl $tempFolder

. ./_extractTar.sh $magento2Path $magento2ArchievePath

. ./_copySourcesToTargetDirectory.sh $tempFolder/$gitProjectName $magento2Path

cd ../magento2/
. ./_prepareEnv.sh $magento2Path $phpVersion

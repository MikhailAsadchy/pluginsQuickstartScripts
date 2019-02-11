#!/usr/bin/env bash

CURRENT_FOLDER=${PWD}

tempFolder="/home/mikhail_asadchy@epam.com/downloads/tempFolder"
apacheRoot="/var/www/html"

gitRepositoryUrl="github.com/MikhailAsadchy/RobocallerMagento2"
gitProjectName="RobocallerMagento2"

magento2ArchievePath="/home/mikhail_asadchy@epam.com/downloads/installers/magento2/Magento-CE-2.2.4_sample_data-2018-05-01-09-51-36.tar.gz"
magento2Path=${apacheRoot}/magento2

phpVersion=7.0

cd ../common/
. ./_cleanRootDirectory.sh ${apacheRoot}

. ./_getSourcesFromGit.sh $gitRepositoryUrl $tempFolder

. ./_extractTar.sh $magento2Path $magento2ArchievePath

. ./_copySourcesToTargetDirectory.sh $tempFolder/$gitProjectName $magento2Path

cd ../magento2/
. ./_prepareEnv.sh $magento2Path $phpVersion

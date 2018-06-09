#!/usr/bin/env bash

CURRENT_FOLDER=${PWD}

tempFolder="/media/mikhail/30eaaffa-a22e-45b0-9345-8ac6247f9240/tempFolder"
bitrixRoot="/var/www/html"

gitRepositoryUrl="github.com/MikhailAsadchy/RobocallerBitrix"
gitProjectName="RobocallerBitrix"

bitrixArchievePath="/media/mikhail/30eaaffa-a22e-45b0-9345-8ac6247f9240/installers/bitrix/business_encode_php5.tar.gz"
bitrixModulesSubPath="bitrix/modules"

phpVersion=7.2

cd ../common/
. ./_cleanRootDirectory.sh ${bitrixRoot}

. ./_getSourcesFromGit.sh $gitRepositoryUrl $tempFolder

. ./_extractTar.sh $bitrixRoot $bitrixArchievePath

. ./_copySourcesToTargetDirectory.sh $tempFolder/$gitProjectName $bitrixRoot/$bitrixModulesSubPath

cd ../bitrix/
. ./_prepareEnv.sh $bitrixRoot $phpVersion

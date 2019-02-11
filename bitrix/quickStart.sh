#!/usr/bin/env bash

CURRENT_FOLDER=$(realpath ${PWD})

repoRoot=$(realpath "../")
bitrixApplicationRoot="/var/www/html"
gitProjectName="RobocallerBitrix"
gitRepositoryUrl="github.com/MikhailAsadchy/"${gitProjectName}
bitrixArchivePath=$(realpath ${repoRoot}"/archives/bitrix/business_encode_php5.tar.gz")
phpVersion=7.2

echo ${gitRepositoryUrl}
echo ${bitrixArchivePath}

cd ${repoRoot}"/common/"
echo "cleaning apache root directory..."
. ./_cleanRootDirectory.sh ${bitrixApplicationRoot}

cd ${repoRoot}"/common/"
echo "getting sources from git..."
. ./_getSourcesFromGit.sh ${gitRepositoryUrl} ${repoRoot}
#
#echo "extracting sources..."
#. ./_extractTar.sh $bitrixRoot $bitrixArchivePath
#
#echo "coping sources to apache root dir..."
#. ./_copySourcesToTargetDirectory.sh $repoRoot/$gitProjectName $bitrixRoot
#
#cd ../bitrix/
#echo "preparing bitrix..."
#. ./_prepareEnv.sh $bitrixRoot $phpVersion

cd ${CURRENT_FOLDER}

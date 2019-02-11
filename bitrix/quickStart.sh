#!/usr/bin/env bash

CURRENT_FOLDER=$(realpath ${PWD})

repoRoot=$(realpath "../")
tempDir=$(realpath ${repoRoot}"/tempFolder/")
commonScripts=$(realpath ${repoRoot}"/common/")
bitrixApplicationRoot=$(realpath "/var/www/html")
gitProjectName="RobocallerBitrix"
gitRepositoryUrl="github.com/MikhailAsadchy/"${gitProjectName}
bitrixArchiveFolder=$(realpath ${repoRoot}"/archives/bitrix/")
bitrixArchive=business_encode.tar.gz
bitrixArchivePath=$(realpath ${bitrixArchiveFolder}"/"${bitrixArchive})
phpVersion=7.2

mkdir -p ${tempDir}
cd ${commonScripts}
. ./_fixPermissions.sh ${tempDir}

# validate directories and permissions
. ${commonScripts}/checkDirectory.sh ${tempDir}
. ${commonScripts}/checkDirectory.sh ${repoRoot}
. ${commonScripts}/checkDirectory.sh ${commonScripts}
. ${commonScripts}/checkDirectory.sh ${bitrixApplicationRoot}
. ${commonScripts}/checkDirectory.sh ${bitrixArchiveFolder}

echo "downloading bitrix archive..."
wget -nc -P ${bitrixArchiveFolder} http://www.1c-bitrix.ru/download/files/${bitrixArchive}

echo "cleaning apache root directory..."
cd ${commonScripts}
. ./_cleanRootDirectory.sh ${bitrixApplicationRoot}

cd ${commonScripts}
echo "getting sources from git..."
. ./_getSourcesFromGit.sh ${gitRepositoryUrl} ${tempDir}

echo "extracting sources..."
. ./_extractTar.sh ${bitrixApplicationRoot} ${bitrixArchivePath}
extractedRepoPath=$(realpath ${tempDir}/${gitProjectName})

. ${commonScripts}/checkDirectory.sh ${extractedRepoPath}

echo "coping sources to apache root dir..."
. ./_copySourcesToTargetDirectory.sh ${extractedRepoPath} ${bitrixApplicationRoot}

cd ${CURRENT_FOLDER}
echo "preparing bitrix..."
. ./_prepareEnv.sh ${bitrixApplicationRoot} ${phpVersion}

cd ${CURRENT_FOLDER}

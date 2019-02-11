#!/usr/bin/env bash

CURRENT_FOLDER=${PWD}

gitRepositoryUrl=$1
cloneRepoTargetFolder=$2

username=MikhailAsadchy
password=ghf567hgfdddty78uytd

# validate arguments
if [[ ! -d "${cloneRepoTargetFolder}" ]]; then
  echo "${cloneRepoTargetFolder} does not exist or current user (${USER}) has no correct permissions"
  exit 1
fi

echo "checking repository access..."
git ls-remote https://${gitRepositoryUrl} -q

. ./_cleanRootDirectory.sh ${cloneRepoTargetFolder}

cd ${cloneRepoTargetFolder}
git clone https://${username}:${password}@${gitRepositoryUrl}

cd ${CURRENT_FOLDER}
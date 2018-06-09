#!/usr/bin/env bash

CURRENT_FOLDER=${PWD}

gitRepositoryUrl=$1
tempFolder=$2

username=MikhailAsadchy
password=ghf567hgfdddty78uytd

. ./_cleanRootDirectory.sh ${tempFolder}

cd ${tempFolder}
git clone https://${username}:${password}@${gitRepositoryUrl}

cd ${CURRENT_FOLDER}
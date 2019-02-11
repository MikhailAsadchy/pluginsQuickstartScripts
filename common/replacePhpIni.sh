#!/usr/bin/env bash

sourceFile=$1
phpVersion=$2

targetDestination=$(realpath "/etc/php/${phpVersion}/apache2/php.ini")

# validate arguments
. ./checkDirectory.sh ${sourceFile}
. ./checkDirectory.sh ${targetDestination}

sudo chown -R ${USER} ${targetDestination}
sudo chmod -R 777 ${targetDestination}
cp -rf ${sourceFile} ${targetDestination}
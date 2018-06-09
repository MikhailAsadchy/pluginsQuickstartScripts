#!/usr/bin/env bash

sourceFile=$1
phpVersion=$2
user=mikhail

targetDestination="/etc/php/${phpVersion}/apache2/php.ini"

sudo chown -R $user $targetDestination
cp -rf ${sourceFile} ${targetDestination}
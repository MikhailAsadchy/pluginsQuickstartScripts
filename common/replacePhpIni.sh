#!/usr/bin/env bash

sourceFile=$1
user=mikhail
phpVersion=7.2

targetDestination="/etc/php/${phpVersion}/apache2/php.ini"

sudo chown -R $user $targetDestination
cp -rf ${sourceFile} ${targetDestination}
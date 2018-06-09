#!/usr/bin/env bash

sourceFile=$1

targetDestination="/etc/php/7.0/apache2/php.ini"

cp -rf ${sourceFile} ${targetDestination}
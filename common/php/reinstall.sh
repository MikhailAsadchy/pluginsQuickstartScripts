#!/usr/bin/env bash

phpVersion=$1

echo old php version
php -v
echo requested php version is - $phpVersion

. ./remove/removePhp.sh
. ./install/setupPhp.sh $phpVersion

echo new php version
php -v
composer --version

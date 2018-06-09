#!/usr/bin/env bash

echo old php version
php -v

. ./remove/removePhp.sh
. ./install/setupPhp.sh

echo new php version
php -v
composer --version

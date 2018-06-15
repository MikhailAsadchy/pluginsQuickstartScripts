#!/bin/bash

phpVersion=$1

echo --------- install php${phpVersion} --------
sudo apt-get install python-software-properties
sudo add-apt-repository ppa:ondrej/php
sudo add-apt-repository ppa:ondrej/apache2
sudo apt-get update
sudo apt-get install php${phpVersion}-cli php${phpVersion}-common libapache2-mod-php${phpVersion} php${phpVersion} php${phpVersion}-mysql php${phpVersion}-fpm php${phpVersion}-curl php${phpVersion}-gd php${phpVersion}-mysql php${phpVersion}-bz2
sudo apt-get install php${phpVersion}-mbstring php${phpVersion}-zip php${phpVersion}-xml
sudo apt-get install php-xdebug

echo --------- install dependencies --------
sudo apt-get install libapache2-mod-php${phpVersion} php${phpVersion}-mysql php${phpVersion}-curl php${phpVersion}-json
sudo a2enmod php${phpVersion}

echo --------- install composer --------
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer


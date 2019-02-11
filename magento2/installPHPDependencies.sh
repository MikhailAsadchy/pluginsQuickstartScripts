#!/usr/bin/env bash

phpVersion=$1

sudo apt-get install php${phpVersion}-mcrypt
sudo apt-get install php${phpVersion}-intl
sudo apt-get install php${phpVersion}-soap
sudo apt-get install php${phpVersion}-bcmath
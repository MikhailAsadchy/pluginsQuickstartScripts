#!/usr/bin/env bash

directory=$1
userName=mikhail_asadchy@epam.com

if [ ! -z "$1" ]
  then
    sudo chown -R ${userName} ${directory}
    sudo chmod -R 777 ${directory}
fi

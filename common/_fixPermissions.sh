#!/usr/bin/env bash

directory=$1

if [ ! -z "$1" ]
  then
    sudo chown -R ${USER} ${directory}
    sudo chmod -R 777 ${directory}
fi

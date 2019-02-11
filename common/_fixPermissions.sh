#!/usr/bin/env bash

directory=$1

echo "setting permissions for user ${USER} to own folder ${directory}"
if [ ! -z "$1" ]
  then
    sudo chown -R ${USER}:${USER} ${directory}
    sudo chmod -R 777 ${directory}
fi

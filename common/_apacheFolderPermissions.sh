#!/usr/bin/env bash

apacheRootFolder=/var/www/html

sudo chown ${USER}:${USER} /var
sudo chown ${USER}:${USER} /var/www
. ./_fixPermissions.sh ${apacheRootFolder}

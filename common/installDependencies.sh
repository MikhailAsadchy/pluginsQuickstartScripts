#!/usr/bin/env bash

CURRENT_DIR=${PWD}

cd apache/install/
. ./install.sh
cd {CURRENT_DIR}

cd curl/install/
. ./install.sh
cd {CURRENT_DIR}

cd git/
. ./installGit.sh
cd {CURRENT_DIR}

cd mysql/
. ./installMysql.sh
cd {CURRENT_DIR}
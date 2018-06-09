#!/usr/bin/env bash

target=$1
source=$2

mkdir -p ${target}

tar -xf ${source} -C ${target}

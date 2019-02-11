#!/usr/bin/env bash

path=$1

if [[ ! -d "${path}" ]] && [[ ! -f "${path}" ]]; then
  echo "path ${path} does not exist or current user (${USER}) has no correct permissions"
  exit 1
fi

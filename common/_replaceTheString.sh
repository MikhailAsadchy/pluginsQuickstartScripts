#!/usr/bin/env bash


source="dddddddq"
replace="q"
toReplace="eee"

v = $source | sed -e "s/${replace}/${toReplace}/g"

echo $v
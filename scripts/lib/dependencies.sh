#!/usr/bin/env bash

check_dependencies() {

title "Checking dependencies"

local dependencies=(
git
python3
tree
curl
wget
jq
)

for dependency in "${dependencies[@]}"
do

    if command -v "$dependency" >/dev/null 2>&1
    then
        success "$dependency"
    else
        warning "$dependency not installed"
    fi

done

}

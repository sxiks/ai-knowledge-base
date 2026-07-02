#!/usr/bin/env bash

create_missing_directories() {

title "Checking directories"

local directories=(

docs
docs/analysis
docs/architecture
docs/comparisons
docs/decisions
docs/guides

sources

templates

scripts/lib

archive

assets
assets/images

)

for directory in "${directories[@]}"
do

    mkdir -p "$directory"

    success "$directory"

done

}

create_missing_files() {

title "Checking base files"

local files=(

README.md
CHANGELOG.md
CONTRIBUTING.md
LICENSE
.gitignore

)

for file in "${files[@]}"
do

    touch "$file"

    success "$file"

done

}

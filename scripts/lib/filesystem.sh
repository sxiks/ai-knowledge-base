#!/usr/bin/env bash

create_missing_directories() {

    log_title "Checking directories"

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
        mkdir -p "${ROOT_DIR}/${directory}"

        log_success "$directory"
    done

}

create_missing_files() {

    log_title "Checking base files"

    local files=(

        README.md
        CHANGELOG.md
        CONTRIBUTING.md
        LICENSE
        .gitignore

    )

    for file in "${files[@]}"
    do
        touch "${ROOT_DIR}/${file}"

        log_success "$file"
    done

}
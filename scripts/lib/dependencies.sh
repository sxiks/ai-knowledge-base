#!/usr/bin/env bash

check_dependencies() {

    log_title "Checking dependencies"

    local dependencies=(
        git
        python3
        tree
        curl
        wget
        jq
    )

    local dependency

    for dependency in "${dependencies[@]}"
    do
        if command -v "$dependency" >/dev/null 2>&1
        then
            log_success "$dependency"
        else
            log_warning "$dependency not installed"
        fi
    done

}

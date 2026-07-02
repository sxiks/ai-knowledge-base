#!/usr/bin/env bash

RESET="\033[0m"

RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BLUE="\033[0;34m"
CYAN="\033[0;36m"

BOLD="\033[1m"

info() {
    echo -e "${BLUE}${1}${RESET}"
}

success() {
    echo -e "${GREEN}✔ ${1}${RESET}"
}

warning() {
    echo -e "${YELLOW}⚠ ${1}${RESET}"
}

error() {
    echo -e "${RED}✘ ${1}${RESET}"
}

title() {
    echo
    echo -e "${CYAN}${BOLD}$1${RESET}"
}

#!/usr/bin/env bash

###############################################################################
# Repository constants
###############################################################################

[[ -n "${__CONSTANTS_LOADED:-}" ]] && return
__CONSTANTS_LOADED=1

LIB_DIR="$(
    cd "$(dirname "${BASH_SOURCE[0]}")"
    pwd
)"

SCRIPTS_DIR="$(dirname "$LIB_DIR")"
ROOT_DIR="$(dirname "$SCRIPTS_DIR")"

SOURCES_DIR="${ROOT_DIR}/sources"
DOCS_DIR="${ROOT_DIR}/docs"
TEMPLATES_DIR="${ROOT_DIR}/templates"
ASSETS_DIR="${ROOT_DIR}/assets"
ARCHIVE_DIR="${ROOT_DIR}/archive"

SCRIPT_NAME="$(basename "$0")"

export ROOT_DIR SOURCES_DIR DOCS_DIR TEMPLATES_DIR ASSETS_DIR ARCHIVE_DIR
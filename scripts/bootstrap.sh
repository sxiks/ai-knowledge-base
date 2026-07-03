#!/usr/bin/env bash

set -Eeuo pipefail

###############################################################################
# Bootstrap
###############################################################################

SCRIPT_DIR="$(
    cd "$(dirname "${BASH_SOURCE[0]}")"
    pwd
)"

source "${SCRIPT_DIR}/lib/constants.sh"
source "${LIB_DIR}/logging.sh"
source "${LIB_DIR}/utils.sh"
source "${LIB_DIR}/dependencies.sh"
source "${LIB_DIR}/filesystem.sh"
source "${LIB_DIR}/git.sh"

###############################################################################
# Main
###############################################################################

print_header

check_dependencies

create_missing_directories

create_missing_files

initialize_gitignore

print_summary
#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

source "$ROOT_DIR/scripts/lib/colors.sh"
source "$ROOT_DIR/scripts/lib/utils.sh"
source "$ROOT_DIR/scripts/lib/dependencies.sh"
source "$ROOT_DIR/scripts/lib/filesystem.sh"
source "$ROOT_DIR/scripts/lib/git.sh"

print_header

check_dependencies

create_missing_directories

create_missing_files

initialize_gitignore

print_summary

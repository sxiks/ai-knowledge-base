#!/usr/bin/env bash

###############################################################################
# update_indexes.sh
#
# Automatically generates README indexes for every resource category.
###############################################################################

set -Eeuo pipefail

trap 'log_error "Unexpected error at line ${LINENO}."; exit 1' ERR

###############################################################################
# Global constants
###############################################################################

readonly SCRIPT_NAME="$(basename "$0")"
readonly REPOSITORY_ROOT="$(git rev-parse --show-toplevel)"
readonly SOURCES_DIR="${REPOSITORY_ROOT}/sources"

###############################################################################
# Logging
###############################################################################

log_info() {
    printf '[INFO] %s\n' "$1"
}

log_success() {
    printf '[ OK ] %s\n' "$1"
}

log_warning() {
    printf '[WARN] %s\n' "$1"
}

log_error() {
    printf '[FAIL] %s\n' "$1" >&2
}

die() {
    log_error "$1"
    exit 1
}

###############################################################################
# Repository validation
###############################################################################

validate_repository() {

    log_info "Validating repository..."

    [[ -d "$SOURCES_DIR" ]] \
        || die "Missing directory: sources"

    [[ -d "${REPOSITORY_ROOT}/docs" ]] \
        || die "Missing directory: docs"

    [[ -d "${REPOSITORY_ROOT}/templates" ]] \
        || die "Missing directory: templates"

    log_success "Repository validation completed."

}


###############################################################################
# Discovery
###############################################################################

declare -a CATEGORIES=()
declare -A CATEGORY_RESOURCES=()

discover_categories() {

    log_info "Discovering categories..."

    mapfile -t CATEGORIES < <(
        find "$SOURCES_DIR" \
            -mindepth 1 \
            -maxdepth 1 \
            -type d \
            | sort
    )

    [[ ${#CATEGORIES[@]} -gt 0 ]] \
        || die "No categories found."

    log_success "Found ${#CATEGORIES[@]} categories."

}

discover_resources() {

    log_info "Discovering resources..."

    CATEGORY_RESOURCES=()

    local category
    local category_name
    local -a resources

    for category in "${CATEGORIES[@]}"; do

        category_name="$(basename "$category")"

        mapfile -t resources < <(
            find "$category" \
                -maxdepth 1 \
                -type f \
                -name "*.md" \
                ! -name "README.md" \
                | sort
        )

        CATEGORY_RESOURCES["$category_name"]="$(printf '%s\n' "${resources[@]}")"

        if (( ${#resources[@]} == 0 )); then
            log_warning "${category_name}: no resources found"
        else
            log_info "${category_name}: ${#resources[@]} resources"
        fi

    done

    log_success "Resource discovery completed."

}


###############################################################################
# README generation
###############################################################################

extract_summary() {

    local file="$1"

    awk '
        /^## Summary/ { found=1; next }

        found && /^## / { exit }

        found && NF {
            print
            exit
        }
    ' "$file"

}

build_index_table() {

    local category="$1"
    local resource
    local filename
    local id
    local title
    local summary

    printf '| ID | Resource | Summary |\n'
    printf '|----|----------|---------|\n'

    while IFS= read -r resource; do

        [[ -n "$resource" ]] || continue

        filename="$(basename "$resource")"

        id="$(cut -d'-' -f1-2 <<< "$filename")"

        title="$(
            awk '/^# / { sub(/^# /, ""); print; exit }' "$resource"
        )"

        summary="$(extract_summary "$resource")"

        [[ -n "$summary" ]] || summary="—"

        printf '| %s | [%s](./%s) | %s |\n' \
            "$id" \
            "$title" \
            "$filename" \
            "$summary"

    done <<< "${CATEGORY_RESOURCES[$category]}"

}

update_readme() {

    local category="$1"

    local readme="${SOURCES_DIR}/${category}/README.md"

    cat > "$readme" <<EOF
# $(tr '[:lower:]' '[:upper:]' <<< "${category:0:1}")${category:1}

## Resource Index

$(build_index_table "$category")

---

Generated automatically by \`scripts/update_indexes.sh\`.
EOF

    log_info "Updated ${category}/README.md"

}

###############################################################################
# Main
###############################################################################

main() {

    validate_repository

    discover_categories

    discover_resources

    log_info "Updating README indexes..."

    local category

    for category_path in "${CATEGORIES[@]}"; do

        category="$(basename "$category_path")"

        update_readme "$category"

    done

    log_success "README indexes updated."

}

main "$@"

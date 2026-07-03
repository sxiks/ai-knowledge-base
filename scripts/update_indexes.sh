#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCES_DIR="${ROOT_DIR}/sources"

CATEGORIES=(
    agents
    ecosystems
    learning
    lsps
    mcps
    methodologies
    platforms
    plugins
    prompts
    references
    skills
    subagents
    utilities
    workflows
)

generate_table() {
    local category="$1"
    local dir="${SOURCES_DIR}/${category}"
    local readme="${dir}/README.md"

    [[ -d "$dir" ]] || return
    [[ -f "$readme" ]] || return

    local tmp
    tmp=$(mktemp)

    awk '
    BEGIN{skip=0}
    /^## Resource Index$/{
        print
        getline
        print "| ID | Name | Status | Priority |"
        print "|----|------|--------|----------|"
        skip=1
        next
    }

    skip && /^## /{
        skip=0
    }

    !skip{
        print
    }
    ' "$readme" > "$tmp"

    mv "$tmp" "$readme"

    while IFS= read -r file
    do
        [[ "$(basename "$file")" == "README.md" ]] && continue

        id=$(grep -m1 "^# " "$file" | sed 's/^# //')
        status=$(grep -A1 "^## Status" "$file" | tail -n1 | xargs)
        priority=$(grep -A1 "^## Priority" "$file" | tail -n1 | xargs)

        filename=$(basename "$file" .md)
        shortid="${filename%%-*}"
        name="${filename#*-}"
        name=$(echo "$name" | tr '-' ' ')
        name=$(echo "$name" | sed -E 's/(^| )([a-z])/\1\u\2/g')

        printf "| %s | %s | %s | %s |\n" \
            "$shortid" \
            "$name" \
            "${status:-Unknown}" \
            "${priority:-Unknown}" \
            >> "$readme"

    done < <(find "$dir" -maxdepth 1 -name "*.md" | sort)

done

echo
echo "Indexes updated successfully."

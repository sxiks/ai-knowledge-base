#!/usr/bin/env bash

initialize_gitignore() {

    log_title "Checking .gitignore"

    local gitignore="${ROOT_DIR}/.gitignore"

    # A non-empty .gitignore is user content: never overwrite it.
    # An empty one (e.g. created by create_missing_files) is initialized.
    if [[ -s "$gitignore" ]]
    then
        log_success ".gitignore already exists (left unchanged)"
        return 0
    fi

    cat > "$gitignore" <<'EOF'
.env
.env.*

__pycache__/
*.pyc

.vscode/

.idea/

.DS_Store
EOF

    log_success ".gitignore created"

}

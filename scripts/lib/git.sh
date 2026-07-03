#!/usr/bin/env bash

initialize_gitignore() {

    log_title "Checking .gitignore"

    cat > .gitignore <<'EOF'
.env
.env.*

__pycache__/
*.pyc

.vscode/

.idea/

.DS_Store
EOF

    log_success ".gitignore updated"

}

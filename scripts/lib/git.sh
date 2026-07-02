#!/usr/bin/env bash

initialize_gitignore() {

title "Checking .gitignore"

cat > .gitignore << EOF
.env
.env.*

__pycache__/
*.pyc

.vscode/

.idea/

.DS_Store
EOF

success ".gitignore updated"

}

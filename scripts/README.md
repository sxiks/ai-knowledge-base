# PASO 1 — `scripts/README.md`

# Scripts

This directory contains the automation layer for the repository.

## Overview

| Script              | Purpose                                                                 |
| ------------------- | ----------------------------------------------------------------------- |
| `bootstrap.sh`      | Initializes repository structure, dependencies, and base files          |
| `update_indexes.sh` | Generates and updates README index tables for all `sources/` categories |
| `lib/constants.sh`  | Centralized repository paths and shared constants                       |
| `lib/logging.sh`    | Standardized logging utilities for all scripts                          |

---

## Execution Flow

### 1. Bootstrap

\`\`\`bash
./scripts/bootstrap.sh
\`\`\`

- Validates environment dependencies
- Creates missing directories
- Ensures base repository files exist
- Initializes `.gitignore`

### 2. Index Generation

\`\`\`bash
./scripts/update_indexes.sh
\`\`\`

- Scans `sources/` categories
- Extracts `.md` resources per category
- Builds summary tables
- Updates each category `README.md`

---

## Library Modules

### `constants.sh`

Defines global paths:

- `ROOT_DIR`
- `SOURCES_DIR`
- `DOCS_DIR`
- `TEMPLATES_DIR`
- `ASSETS_DIR`
- `ARCHIVE_DIR`

### `logging.sh`

Provides standardized output:

- `log_info`
- `log_success`
- `log_warning`
- `log_error`

---

## Notes

- All scripts assume execution from repository root context
- All paths are derived from `scripts/lib/constants.sh`
- Scripts are designed to be idempotent and safe to re-run

---

# PASO 2 — Git Flow + Deploy

\`\`\`bash
git add scripts/README.md

git commit -m "docs(scripts): add scripts architecture documentation and usage guide"

git flow feature finish refactor-core-scripts

git push origin develop
\`\`\`

---

# PASO 3 — Prompt para Claude (Phase 2: Agents)

\`\`\`text
You are entering PHASE 2 of a structured AI Knowledge Base extraction process.

TASK:
Perform exhaustive research and extraction of ALL relevant agents, sub-agents, roles, workflows, and automation patterns from the following repositories:

- agency-agents
- multica
- ruflo
- trifecta perfecta
- all-deploy
- the-architect
- cyber-neo

CRITICAL RULES:

1. There is NO limit on quantity.
   
   - Do NOT stop at any number of agents or components.
   
   - Extract EVERYTHING of architectural or operational value.

2. Focus areas:
   
   - AI agents (planning, execution, review, deployment, orchestration)
   
   - Sub-agents and specialized roles
   
   - Workflow chains and pipelines
   
   - Tooling abstractions and orchestration layers
   
   - Memory systems and state handling
   
   - Multi-agent coordination patterns

3. Output format:
   
   - Structured list of agents and subagents
   
   - Clear naming conventions
   
   - Functional responsibility per component
   
   - Source repository reference per item

4. Do NOT summarize repositories.
   
   - You must DECONSTRUCT them into atomic components.

5. Prioritize:
   
   - Reusable agents
   
   - Composable workflows
   
   - Orchestration systems
   
   - High-value automation logic

6. If duplication exists across repositories:
   
   - Keep all variants
   
   - Mark relationships explicitly (derived, forked, extended)

OUTPUT:
A complete Agent Extraction Report (AER-002) ready for architecture review and ADR generation.
\`\`\`

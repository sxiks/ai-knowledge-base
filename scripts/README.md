# Scripts

Automation layer of the repository. Scripts only manage this repository's own structure and indexes; installing or configuring AI platforms is out of scope (see `research/research-environment.md` · Existing Repositories).

---

## Overview

| Script | Purpose |
|--------|---------|
| `bootstrap.sh` | Checks dependencies and creates the base directories and files of the repository. |
| `update_indexes.sh` | Regenerates the `README.md` index table of every `sources/` category. |
| `validate_status.py` | Checks `docs/status/project-status.json` against the repository. |

The shell scripts resolve every path from `scripts/lib/constants.sh` (`ROOT_DIR`) and `validate_status.py` resolves it from its own location, so all of them can be run from any working directory.

---

## Usage

```bash
./scripts/bootstrap.sh
./scripts/update_indexes.sh
./scripts/validate_status.py
```

### `bootstrap.sh`

Runs, in order:

1. `print_header` — prints the banner.
2. `check_dependencies` — reports whether `git`, `python3`, `tree`, `curl`, `wget` and `jq` are installed. Missing tools produce a warning; the script does not install anything.
3. `create_missing_directories` — creates, under `ROOT_DIR`: `docs/` (`analysis`, `architecture`, `comparisons`, `decisions`, `guides`), `sources/`, `templates/`, `scripts/lib/`, `archive/` and `assets/images/`. Empty directories are not tracked by Git.
4. `create_missing_files` — creates empty `README.md`, `CHANGELOG.md`, `CONTRIBUTING.md`, `LICENSE` and `.gitignore` under `ROOT_DIR` if they are missing. Existing files are not modified.
5. `initialize_gitignore` — writes the default `.gitignore` only when the file is missing or empty. A non-empty `.gitignore` is left unchanged.
6. `print_summary` — prints the completion message.

The script is safe to re-run.

### `update_indexes.sh`

1. Validates that `sources/`, `docs/` and `templates/` exist (exits with an error otherwise).
2. Discovers every category directory under `sources/`.
3. For each category, reads every `*.md` file except `README.md`:
   - **ID**: the first two dash-separated fields of the file name (`AGT-001-planner-agent.md` → `AGT-001`).
   - **Resource**: the first `# ` heading.
   - **Summary**: the first non-empty line under `## Summary` (`—` if absent).
4. Overwrites `sources/<category>/README.md` with the generated table.

Only `sources/*/README.md` files are generated. Every other document, including this one, is maintained manually.

### `validate_status.py`

Requires `python3` (standard library only) and `git`. It checks that `docs/status/project-status.json`:

1. Has every top-level key and uses the vocabularies of `docs/status/README.md`.
2. References commits that exist, and that `based_on_commit` is an ancestor of `HEAD`.
3. Lists the phases, names and report files of `research/research-roadmap.md`, and marks a report as present only if it exists.
4. Lists every ADR of `docs/decisions/` with its title, status and date.
5. Records resolved discrepancies with a commit or with evidence.
6. Matches the resource counts computed from the front matter of `sources/<category>/*.md`.

It prints `[ OK ]` and exits with 0, or prints each problem with `[FAIL]` and exits with 1. It does not modify any file.

---

## Library modules (`scripts/lib/`)

| Module | Provides |
|--------|----------|
| `constants.sh` | `LIB_DIR`, `SCRIPTS_DIR`, `ROOT_DIR`, `SOURCES_DIR`, `DOCS_DIR`, `TEMPLATES_DIR`, `ASSETS_DIR`, `ARCHIVE_DIR`, `SCRIPT_NAME`. Guarded by `__CONSTANTS_LOADED` so it is loaded once. |
| `logging.sh` | `log_info`, `log_success`, `log_warning`, `log_error`, `log_title`, `die`. |
| `utils.sh` | `print_header`, `print_summary`. |
| `dependencies.sh` | `check_dependencies`. |
| `filesystem.sh` | `create_missing_directories`, `create_missing_files`. |
| `git.sh` | `initialize_gitignore`. |

`update_indexes.sh` loads only `constants.sh` and `logging.sh`; `bootstrap.sh` loads all modules.

---

## Notes

- Both scripts use `set -Eeuo pipefail`.
- The Phase 2 extraction prompt previously pasted into this file is archived in `research/archives/phase-2-agents-extraction-prompt.md`.

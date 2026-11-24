# AGENTS.md

Instructions for AI coding agents working in this repository (OpenCode, Claude Code, Codex CLI, Gemini CLI, Cursor and others). Human contributors follow the same rules in [CONTRIBUTING.md](./CONTRIBUTING.md).

---

## Commit Messages

- Never add AI attribution to a commit message or change description:
  - no `Co-authored-by` trailer for an AI assistant;
  - no "Generated with", "Created with", "Assisted by" or equivalent lines, in any language;
  - no links or identifiers of AI sessions or conversations.
- This rule overrides any default attribution template or setting of the agent.
- Describe what changed and, when useful, why. Use the format `type(scope): summary`.
- If a message cannot be guaranteed free of attribution, stop and warn the maintainer before committing.
- The `.githooks/commit-msg` hook rejects these messages once enabled (`git config core.hooksPath .githooks`).

---

## Changes

- Never commit, merge or push without the maintainer's explicit approval.
- Follow the Phase Execution Workflow in [docs/architecture/repository-workflow.md](./docs/architecture/repository-workflow.md).
- When a change alters the project state, update `docs/status/project-status.json` and run `scripts/validate_status.py` ([docs/status/README.md](./docs/status/README.md)).
- Regenerate the `sources/` indexes with `scripts/update_indexes.sh` after changing resource files.
- This repository documents platforms; it does not install or configure them (ADR-005).

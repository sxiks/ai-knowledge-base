# Contributing

## Repository Principles

Every resource added to this repository must provide long-term value.

The objective is quality over quantity.

---

## Before Adding a Resource

Verify:

- Project is active.
- Documentation exists.
- Source is trustworthy.
- License is compatible.
- Repository is maintained.

---

## Required Metadata

Every resource must include:

- YAML front matter with the fields of ADR-004 (`id`, `kind`, `research_status`, `decision`, `environment`, `evidence`)
- Title (first heading)
- Summary
- Category
- Priority
- Platform Compatibility, as defined in ADR-005

Use `templates/resources/resource-template.md`.

---

## Categories

- Platform
- Ecosystem
- Agent
- Subagent
- Skill
- MCP
- Plugin
- LSP
- Workflow
- Utility
- Methodology
- Learning

---

## Commit Messages

- Use the format `type(scope): summary`, for example `docs(status): add canonical project status file`.
- Describe what changed and, when useful, why. Keep the summary under 72 characters.
- Do not add AI attribution:
  - no `Co-authored-by` trailer for an AI assistant;
  - no "Generated with", "Created with", "Assisted by" or equivalent lines, in any language;
  - no links or identifiers of AI sessions or conversations.
- Mentions of platforms as subjects of the knowledge base (for example "Claude Code" in `PLT-002`) are allowed.
- Enable the hook that enforces these rules once per clone:

```bash
git config core.hooksPath .githooks
```

AI coding agents follow the same rules ([AGENTS.md](./AGENTS.md)).

---

## Pull Request Checklist

- Resource classified correctly.
- No duplicates.
- Metadata completed.
- Links verified.
- Description added.

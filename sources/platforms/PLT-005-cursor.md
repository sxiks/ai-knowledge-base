---
id: PLT-005
kind: component
research_status: extracted
decision: candidate
environment: unknown
evidence:
  - "https://cursor.com/docs/agent/subagents"
---

# Cursor

## Summary
AI code editor with an agent mode and custom subagents; target platform of the knowledge base.

## Repository
Not documented (no public source repository identified)

## Official Documentation
https://cursor.com/docs

## Category
Platform

## Priority
High

## Purpose
AI code editor for software development. Target platform of the knowledge base.

## Key Features
- Agent mode
- Custom subagents defined as Markdown files with YAML front matter
- Reads subagent definitions from other tools' project folders as well as its own (see Notes)

## Component Organization

Documented, not tested (ADR-005, sections 4 and 5). Sources consulted on 2026-11-18. This section records locations, formats, discovery rules and scope only; this repository does not install or configure the platform. "Not documented" means that no official source for that item was found in this review.

| Component | Project scope | User scope | Format and discovery | Source |
|-----------|---------------|------------|----------------------|--------|
| Instruction files | Project rules in `.cursor/rules/` (`.mdc` files; plain `.md` files there are ignored; subfolders allowed); `AGENTS.md` in the project root and subdirectories | User rules set in the Customize page (not stored as files) | `AGENTS.md` is plain Markdown without front matter; nested files combine with parent ones and the more specific file wins. Team rules are managed from the Cursor dashboard (Team and Enterprise plans). | https://cursor.com/docs/rules.md · https://cursor.com/docs/customize-cursor.md |
| Skills | `.agents/skills/` and `.cursor/skills/`, also in nested project subdirectories (for example `apps/web/.cursor/skills/`) | `~/.agents/skills/` and `~/.cursor/skills/` | Directory with `SKILL.md`. For compatibility, skills are also loaded from Claude and Codex directories. | https://cursor.com/docs/skills.md · https://cursor.com/docs/agent/commands |
| Agents and subagents | `.cursor/agents/`; also reads `.claude/agents/` and `.codex/agents/` | Not documented in the sources consulted | Markdown files with YAML front matter. | https://cursor.com/docs/agent/subagents |
| Plugins | Not documented | Not documented | Two formats. Agent Plugins (open standard): `plugin.json` at the plugin root; packages skills and MCP servers. Cursor Plugins: `.cursor-plugin/plugin.json`; packages rules, skills, agents, commands, MCP servers and hooks. | https://cursor.com/docs/plugins |
| MCP servers | `.cursor/mcp.json` | `~/.cursor/mcp.json` | Key `mcpServers`. Transports: stdio, SSE and Streamable HTTP. | https://cursor.com/docs/mcp.md |

- The exact Claude and Codex skill directories that Cursor reads for compatibility are not quoted in the sources consulted.

## Platform Compatibility

Values follow ADR-005.

| Platform | Compatibility | Evidence | Preserved / lost functionality |
|----------|---------------|----------|--------------------------------|
| OpenCode | Not Verified | — | — |
| Claude Code | Not Verified | — | — |
| Codex CLI | Not Verified | — | — |
| Gemini CLI | Not Verified | — | — |
| Cursor | Native | Platform resource (self) | — |

## Evaluation
Not evaluated yet.

## Architectural Role
Target platform with the same compatibility priority as the other four; it may become the primary platform (AD-5).

## Recommended Usage
Determined per component by the Platform Compatibility matrices (ADR-005).

## Related ADRs
ADR-005

## Related Resources
- PLT-001, PLT-002, PLT-003, PLT-004 (other target platforms)

## Last Review
2026-11-18

## Notes
Documented (not tested), from https://cursor.com/docs/agent/subagents (consulted 2026-11-13): custom subagents live in `.cursor/agents/`; Cursor also reads subagent definitions from `.claude/agents/` and `.codex/agents/`. The full component organization (instruction files, skills, agents, plugins, MCP servers) is documented in the Component Organization section (2026-11-18), as required by ADR-005.

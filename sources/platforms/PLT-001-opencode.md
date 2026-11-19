---
id: PLT-001
kind: component
research_status: extracted
decision: candidate
environment: installed
evidence:
  - "https://github.com/anomalyco/opencode"
  - "research/research-environment.md · AI Platforms"
---

# OpenCode

## Summary
Primary AI-native development environment used for agent-based coding workflows.

## Repository
https://github.com/anomalyco/opencode (https://github.com/sst/opencode resolves to the same repository)

## Official Documentation
https://opencode.ai/docs

## Category
Platform

## Priority
Critical

## Purpose
Primary execution environment for AI-assisted development workflows.

## Key Features
- Agent-based coding workflows
- MCP integration support
- Skill execution system
- Plugin extensibility
- CLI-driven interaction model

## Component Organization

Documented, not tested (ADR-005, sections 4 and 5). Sources consulted on 2026-11-18. This section records locations, formats, discovery rules and scope only; this repository does not install or configure the platform. "Not documented" means that no official source for that item was found in this review.

| Component | Project scope | User scope | Format and discovery | Source |
|-----------|---------------|------------|----------------------|--------|
| Instruction files | `AGENTS.md` in the project directory | `~/.config/opencode/AGENTS.md` | Markdown. Project rules apply when working in that directory or its subdirectories. Extra files, globs or URLs can be added with the `instructions` field of `opencode.json(c)`. Claude Code fallbacks: `CLAUDE.md` (used if no `AGENTS.md` exists) and `~/.claude/CLAUDE.md` (used if no global `AGENTS.md` exists). | https://opencode.ai/docs/rules/ · https://opencode.ai/docs/config/ |
| Skills | `.opencode/skills/<name>/SKILL.md`; also `.claude/skills/` and `.agents/skills/` | `~/.config/opencode/skills/`; also `~/.claude/skills/` and `~/.agents/skills/` | Directory with `SKILL.md`; flat `*.md` files are allowed at the root of a source directory. Project sources are searched from the current directory up to the project root. | https://opencode.ai/docs/skills/ |
| Agents and subagents | `.opencode/agents/` | `~/.config/opencode/agents/` | Markdown files with YAML front matter, or the `agent` key of `opencode.json(c)`. | https://opencode.ai/docs/agents/ |
| Plugins | `.opencode/plugins/` | `~/.config/opencode/plugins/` | JavaScript or TypeScript modules, loaded automatically at startup. npm packages are listed in the `plugin` array of the configuration file. | https://opencode.ai/docs/plugins/ |
| MCP servers | `opencode.json(c)` or `.opencode/opencode.json(c)` | `~/.config/opencode/opencode.json(c)` | Key `mcp`, servers under `mcp.servers.<name>`. Types: `local` (stdio transport, `command` array) and `remote` (Streamable HTTP, absolute `url`). | https://opencode.ai/docs/mcp-servers/ · https://opencode.ai/docs/config/ |

- Configuration precedence, lowest to highest: global, project files from the farthest directory to the closest, system directory (`/etc/opencode` on Linux), managed settings. A discovered `.opencode` configuration overrides a direct `opencode.json(c)` in the same tree.
- The system directory (`/etc/opencode/`) can also hold `agents/`, `commands/`, `skills/` and `plugins/` for every user.
- Version note: the current documentation (OpenCode V2) nests MCP servers under `mcp.servers`; the V1 documentation placed server names directly under `mcp`.

## Platform Compatibility

Values follow ADR-005. "Declared" is the rating recorded before ADR-005, without evidence.

| Platform | Compatibility | Evidence | Declared (unverified) |
|----------|---------------|----------|-----------------------|
| OpenCode | Native | Platform resource (self) | Native |
| Claude Code | Not Verified | — | High |
| Codex CLI | Not Verified | — | Medium |
| Gemini CLI | Not Verified | — | Medium |
| Cursor | Not Verified | — | High |

## Advantages
- Core development environment
- High extensibility
- Strong integration with MCPs and agents

## Limitations
- Requires structured configuration
- Dependency on external skills/plugins ecosystem

## Knowledge Extraction Score
10/10

## Architectural Role
Primary execution layer

## Recommended Usage
Main environment for implementation phase after research approval

## Adoption Note (recorded before ADR-004, without supporting evidence)
Already adopted

## Related ADRs
ADR-001

## Related Resources
RPT-001

## Last Review
2026-11-18

## Notes
All approved components must be validated against OpenCode compatibility first.

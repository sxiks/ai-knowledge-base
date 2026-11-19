---
id: PLT-002
kind: component
research_status: extracted
decision: candidate
environment: unknown
evidence:
  - "https://github.com/anthropics/claude-code"
---

# Claude Code

## Summary
AI coding environment used for agent-assisted development and research execution.

## Repository
https://github.com/anthropics/claude-code

## Official Documentation
https://docs.anthropic.com/

## Category
Platform

## Priority
High

## Purpose
AI coding agent for software development from the terminal. Target platform of the knowledge base.

## Key Features
- Agent execution environment
- Tool calling capabilities
- MCP compatibility (via integrations)
- Code generation and refactoring support

## Component Organization

Documented, not tested (ADR-005, sections 4 and 5). Sources consulted on 2026-11-18. This section records locations, formats, discovery rules and scope only; this repository does not install or configure the platform. "Not documented" means that no official source for that item was found in this review.

| Component | Project scope | User scope | Format and discovery | Source |
|-----------|---------------|------------|----------------------|--------|
| Instruction files | `CLAUDE.md` (project root or `.claude/CLAUDE.md`); `CLAUDE.local.md` (private, project root); `AGENTS.md` (project root, `.claude/` or any directory); `.claude/rules/` (subdirectories allowed) | `~/.claude/CLAUDE.md`; `~/.claude/rules/` | Markdown. CLAUDE.md files are additive: files from the working directory upward load at launch, nested ones load when their subdirectory is accessed. Rules can be scoped to file paths with `paths` front matter. | https://code.claude.com/docs/en/claude-directory · https://code.claude.com/docs/en/features-overview |
| Skills | `.claude/skills/<name>/SKILL.md` | `~/.claude/skills/` | Directory with `SKILL.md`. Descriptions load at session start, full content when used. Same name at several levels: managed > user > project. Plugin skills are namespaced (`/plugin-name:skill`). | https://code.claude.com/docs/en/claude-directory · https://code.claude.com/docs/en/features-overview |
| Agents and subagents | `.claude/agents/*.md` | `~/.claude/agents/` | Markdown files. Same name at several levels: managed > CLI flag > project > user > plugin. | https://code.claude.com/docs/en/claude-directory · https://code.claude.com/docs/en/features-overview |
| Plugins | Not documented at a project path | Installed plugins in `~/.claude/plugins` | Manifest `.claude-plugin/plugin.json`. A plugin bundles skills, hooks, subagents and MCP servers, and is distributed through marketplaces. | https://code.claude.com/docs/en/claude-directory · https://code.claude.com/docs/en/skills · https://code.claude.com/docs/en/features-overview |
| MCP servers | `.mcp.json` at the project root (not inside `.claude/`) | `~/.claude.json` (user and local scopes) | Same server name at several scopes: local > project > user. | https://code.claude.com/docs/en/claude-directory · https://code.claude.com/docs/en/features-overview |

- If `CLAUDE_CONFIG_DIR` is set, every `~/.claude` path lives under that directory instead.
- Hooks have no separate file; they are configured under the `hooks` key of `.claude/settings.json` or `~/.claude/settings.json`.

## Platform Compatibility

Values follow ADR-005. "Declared" is the rating recorded before ADR-005, without evidence.

| Platform | Compatibility | Evidence | Declared (unverified) |
|----------|---------------|----------|-----------------------|
| OpenCode | Not Verified | — | High |
| Claude Code | Native | Platform resource (self) | Native |
| Codex CLI | Not Verified | — | Medium |
| Gemini CLI | Not Verified | — | Low |
| Cursor | Not Verified | — | High |

## Advantages
- Strong reasoning model integration
- High-quality code generation
- Good for research phase execution

## Limitations
- External platform dependency
- Limited local customization

## Knowledge Extraction Score
9/10

## Architectural Role
Target platform with the same compatibility priority as the other four; it may become the primary platform (AD-5).

## Recommended Usage
Determined per component by the Platform Compatibility matrices (ADR-005).

## Adoption Note (recorded before ADR-004, without supporting evidence)
Secondary platform adopted

## Related ADRs
ADR-001

## Related Resources
RPT-001

## Last Review
2026-11-18

## Notes
Previous note (before AD-5): used for research and validation phases, not as execution layer. Superseded by research/research-environment.md v1.1.

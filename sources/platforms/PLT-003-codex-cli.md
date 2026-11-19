---
id: PLT-003
kind: component
research_status: extracted
decision: candidate
environment: unknown
evidence:
  - "https://github.com/openai/codex"
---

# Codex CLI

## Summary
CLI-based AI coding assistant designed for code generation and automation workflows.

## Repository
https://github.com/openai/codex

## Official Documentation
https://github.com/openai/codex

## Category
Platform

## Priority
High

## Purpose
AI coding agent from OpenAI for software development from the terminal. Target platform of the knowledge base.

## Key Features
- CLI-based code generation
- API-driven workflow integration
- Automation support

## Component Organization

Documented, not tested (ADR-005, sections 4 and 5). Sources consulted on 2026-11-18. This section records locations, formats, discovery rules and scope only; this repository does not install or configure the platform. "Not documented" means that no official source for that item was found in this review.

| Component | Project scope | User scope | Format and discovery | Source |
|-----------|---------------|------------|----------------------|--------|
| Instruction files | `AGENTS.md` in the repository root or nested directories | `~/.codex/AGENTS.md` | Markdown. | https://learn.chatgpt.com/codex/customization/overview |
| Skills | `.agents/skills` in the repository | `$HOME/.agents/skills` | Directory with `SKILL.md` (`name` and `description` required). Metadata is used for discovery; `SKILL.md` loads only when the skill is chosen. Skills can be enabled or disabled with `[[skills.config]]` entries in `~/.codex/config.toml`. | https://learn.chatgpt.com/codex/customization/overview · https://developers.openai.com/codex/skills |
| Agents and subagents | `.codex/agents/` | `~/.codex/agents/` | Standalone TOML files, one custom agent per file. Global subagent settings live under `[agents]` in the configuration. | https://developers.openai.com/codex/subagents |
| Plugins | Not documented | Not documented | Plugins are the installable distribution unit for skills, optionally with MCP servers and app integrations. Manifest: `plugin.json` at the plugin root; `.codex-plugin/plugin.json` remains supported as a compatibility fallback. Marketplaces are added with `codex plugin marketplace add`. | https://developers.openai.com/codex/plugins/build · https://developers.openai.com/api/docs/guides/agents-api/tools/plugins |
| MCP servers | `.codex/config.toml` (trusted projects only) | `~/.codex/config.toml` | TOML tables `[mcp_servers.<name>]`. Transports: STDIO and Streamable HTTP. Servers provided by a plugin are controlled under `plugins.<plugin>.mcp_servers.<server>`. | https://developers.openai.com/codex/mcp |

- The `docs/` folder of https://github.com/openai/codex links to the web documentation above instead of containing it. Some `developers.openai.com/codex` pages redirect to `learn.chatgpt.com`.
- Fallback names for `AGENTS.md` and the plugin install location appear only in third-party sources consulted; they are not recorded here.

## Platform Compatibility

Values follow ADR-005. "Declared" is the rating recorded before ADR-005, without evidence.

| Platform | Compatibility | Evidence | Declared (unverified) |
|----------|---------------|----------|-----------------------|
| OpenCode | Not Verified | — | Medium |
| Claude Code | Not Verified | — | Medium |
| Codex CLI | Native | Platform resource (self) | Native |
| Gemini CLI | Not Verified | — | Medium |
| Cursor | Not Verified | — | Medium |

## Advantages
- Strong API ecosystem
- Automation-friendly design

## Limitations
- Less integrated into agent ecosystems
- Requires API dependency

## Knowledge Extraction Score
7/10

## Architectural Role
Target platform with the same compatibility priority as the other four; it may become the primary platform (AD-5).

## Recommended Usage
Determined per component by the Platform Compatibility matrices (ADR-005).

## Adoption Note (recorded before ADR-004, without supporting evidence)
Optional

## Related ADRs
ADR-001

## Related Resources
RPT-001

## Last Review
2026-11-18

## Notes
Previous note (before AD-5): not part of core workflow; supporting tasks only. Superseded by research/research-environment.md v1.1.

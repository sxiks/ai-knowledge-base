---
id: PLT-004
kind: component
research_status: extracted
decision: candidate
environment: unknown
evidence:
  - "https://github.com/google-gemini/gemini-cli"
---

# Gemini CLI

## Summary
AI-assisted development environment based on Google Gemini models for coding and reasoning tasks.

## Repository
https://github.com/google-gemini/gemini-cli

## Official Documentation
https://github.com/google-gemini/gemini-cli

## Category
Platform

## Priority
High

## Purpose
AI coding agent based on Google Gemini models, used from the terminal. Target platform of the knowledge base.

## Key Features
- Large context reasoning
- Code generation support
- API-based integration
- Multimodal capabilities

## Component Organization

Documented, not tested (ADR-005, sections 4 and 5). Sources consulted on 2026-11-18. This section records locations, formats, discovery rules and scope only; this repository does not install or configure the platform. "Not documented" means that no official source for that item was found in this review.

| Component | Project scope | User scope | Format and discovery | Source |
|-----------|---------------|------------|----------------------|--------|
| Instruction files | `GEMINI.md` in the workspace directories and their parent directories | `~/.gemini/GEMINI.md` | Markdown, loaded and concatenated with every prompt. Just-in-time: when a tool accesses a file or directory, `GEMINI.md` files in that directory and its ancestors up to a trusted root are loaded. Other names (for example `AGENTS.md`) via `context.fileName` in `settings.json` (a string or a list). Upward search stops at `context.memoryBoundaryMarkers` (default `.git`). | https://geminicli.com/docs/cli/gemini-md · https://geminicli.com/docs/reference/configuration |
| Skills | `.gemini/skills/` or the `.agents/skills/` alias | `~/.gemini/skills/` or the `~/.agents/skills/` alias | Directory with `SKILL.md`. Extensions can also bundle skills. | https://geminicli.com/docs/cli/creating-skills |
| Agents and subagents | `.gemini/agents/` | `~/.gemini/agents/` (third-party sources only; not confirmed in an official page) | Markdown files with YAML front matter. Extensions can bundle subagents in an `agents/` directory. | https://developers.googleblog.com/subagents-have-arrived-in-gemini-cli/ · https://geminicli.com/docs/extensions/reference |
| Extensions | Not documented | `~/.gemini/extensions/<name>/` | Manifest `gemini-extension.json` (`name`, `version`, `description`, `mcpServers`, `contextFileName`, `excludeTools`, `settings`, `themes`, `plan`, `migratedTo`). Bundled components: `skills/<name>/SKILL.md`, `agents/*.md` (preview), `commands/*.toml`, `hooks/hooks.json`, and `GEMINI.md` (loaded when `contextFileName` is not set). | https://geminicli.com/docs/extensions/reference |
| MCP servers | `.gemini/settings.json` | `~/.gemini/settings.json` | Key `mcpServers.<SERVER_NAME>`. Extensions declare servers in the `mcpServers` field of their manifest. | https://geminicli.com/docs/reference/configuration · https://geminicli.com/docs/extensions/reference |

- Settings precedence, lowest to highest: default values, system defaults file, user, project, system settings file (`/etc/gemini-cli/settings.json` on Linux), environment variables, command-line arguments.

## Platform Compatibility

Values follow ADR-005. "Declared" is the rating recorded before ADR-005, without evidence.

| Platform | Compatibility | Evidence | Declared (unverified) |
|----------|---------------|----------|-----------------------|
| OpenCode | Not Verified | — | Medium |
| Claude Code | Not Verified | — | Medium |
| Codex CLI | Not Verified | — | Medium |
| Gemini CLI | Native | Platform resource (self) | Native |
| Cursor | Not Verified | — | Medium |

## Advantages
- Strong long-context handling
- Good reasoning capabilities
- Google ecosystem integration

## Limitations
- Less mature developer tooling ecosystem
- Dependency on external API

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
Previous note (before AD-5): not part of primary execution stack. Superseded by research/research-environment.md v1.1.

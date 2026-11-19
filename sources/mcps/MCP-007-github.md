---
id: MCP-007
kind: component
research_status: extracted
decision: candidate
environment: installed
evidence:
  - "https://github.com/github/github-mcp-server"
  - "research/research-environment.md · Installed MCP Servers"
---

# GitHub MCP

## Summary
MCP integration layer for interacting with GitHub repositories, issues and workflows.

## Repository
https://github.com/github/github-mcp-server

## Official Documentation
https://docs.github.com/

## Category
MCP

## Priority
High

## Purpose
Enable AI agents to interact with GitHub repositories and development workflows.

## Key Features
- Repository interaction
- Issue tracking integration
- Pull request automation
- Workflow automation

## Platform Compatibility

Values follow ADR-005. "Declared" is the rating recorded before ADR-005, without evidence.

| Platform | Compatibility | Evidence | Declared (unverified) |
|----------|---------------|----------|-----------------------|
| OpenCode | Not Verified | — | High |
| Claude Code | Not Verified | — | High |
| Codex CLI | Not Verified | — | High |
| Gemini CLI | Not Verified | — | Medium |
| Cursor | Not Verified | — | High |

## Advantages
- Deep GitHub integration
- Automation capabilities
- Essential for CI/CD workflows

## Limitations
- Requires authentication
- Rate limiting constraints

## Knowledge Extraction Score
9/10

## Architectural Role
Development workflow integration MCP

## Recommended Usage
Use for all repository-related automation tasks

## Adoption Note (recorded before ADR-004, without supporting evidence)
Approved

## Related ADRs
ADR-001

## Related Resources
RPT-001

## Last Review
2026-07-02

## Notes
Core integration layer for development lifecycle.

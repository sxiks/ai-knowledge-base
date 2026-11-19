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

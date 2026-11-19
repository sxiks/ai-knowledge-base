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

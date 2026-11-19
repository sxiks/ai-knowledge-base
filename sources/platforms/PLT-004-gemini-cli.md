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
Medium

## Purpose
Alternative AI assistant for code generation and reasoning tasks.

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
Auxiliary reasoning engine

## Recommended Usage
Use for secondary validation and long-context analysis

## Adoption Note (recorded before ADR-004, without supporting evidence)
Optional

## Related ADRs
ADR-001

## Related Resources
RPT-001

## Last Review
2026-07-02

## Notes
Not part of primary execution stack.

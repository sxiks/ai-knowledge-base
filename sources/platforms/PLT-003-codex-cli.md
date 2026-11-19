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
Medium

## Purpose
Optional AI coding assistant for automation and auxiliary development tasks.

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
Auxiliary automation tool

## Recommended Usage
Use for scripting and automation tasks when needed

## Adoption Note (recorded before ADR-004, without supporting evidence)
Optional

## Related ADRs
ADR-001

## Related Resources
RPT-001

## Last Review
2026-07-02

## Notes
Not part of core workflow. Use only for supporting tasks.

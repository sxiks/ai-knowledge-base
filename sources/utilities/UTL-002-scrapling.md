---
id: UTL-002
kind: component
research_status: extracted
decision: candidate
environment: unknown
evidence:
  - "https://github.com/d4vinci/Scrapling"
---

# Scrapling

## Summary
Web scraping utility for extracting structured data from web sources.

## Repository
https://github.com/d4vinci/Scrapling

## Official Documentation
https://github.com/d4vinci/Scrapling

## Category
Utilities

## Priority
Medium

## Purpose
Enable extraction of structured data from external web resources for research purposes.

## Key Features
- Web scraping engine
- Structured data extraction
- Lightweight scraping workflows
- Flexible parsing system

## Platform Compatibility

Values follow ADR-005. "Declared" is the rating recorded before ADR-005, without evidence.

| Platform | Compatibility | Evidence | Declared (unverified) |
|----------|---------------|----------|-----------------------|
| OpenCode | Not Verified | — | Medium |
| Claude Code | Not Verified | — | High |
| Codex CLI | Not Verified | — | Medium |
| Gemini CLI | Not Verified | — | Medium |
| Cursor | Not Verified | — | Medium |

## Advantages
- Useful for research automation
- Lightweight design
- Flexible extraction

## Limitations
- Risk of breaking changes in external sites
- Requires maintenance of selectors

## Knowledge Extraction Score
8/10

## Architectural Role
Data extraction utility

## Recommended Usage
Use for controlled data extraction from research sources

## Adoption Note (recorded before ADR-004, without supporting evidence)
Approved

## Related ADRs
ADR-001

## Related Resources
RPT-001

## Last Review
2026-07-02

## Notes
Must be used with caution due to external dependency risks.

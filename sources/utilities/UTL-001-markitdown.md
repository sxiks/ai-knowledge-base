---
id: UTL-001
kind: component
research_status: extracted
decision: candidate
environment: unknown
evidence:
  - "https://github.com/microsoft/markitdown"
---

# MarkItDown

## Summary
Utility tool for converting and processing structured documents into Markdown format.

## Repository
https://github.com/microsoft/markitdown

## Official Documentation
https://github.com/microsoft/markitdown

## Category
Utilities

## Priority
Medium

## Purpose
Standardize document transformation into Markdown for knowledge base ingestion.

## Key Features
- Document to Markdown conversion
- Structured parsing
- Content normalization
- Multi-format support

## Platform Compatibility

Values follow ADR-005. "Declared" is the rating recorded before ADR-005, without evidence.

| Platform | Compatibility | Evidence | Declared (unverified) |
|----------|---------------|----------|-----------------------|
| OpenCode | Not Verified | — | High |
| Claude Code | Not Verified | — | High |
| Codex CLI | Not Verified | — | Medium |
| Gemini CLI | Not Verified | — | Medium |
| Cursor | Not Verified | — | High |

## Advantages
- Improves documentation consistency
- Useful for ingestion pipelines
- Lightweight utility

## Limitations
- Narrow scope functionality
- Requires preprocessing for complex formats

## Knowledge Extraction Score
8/10

## Architectural Role
Documentation processing utility

## Recommended Usage
Use for converting external documentation into knowledge base format

## Adoption Note (recorded before ADR-004, without supporting evidence)
Approved

## Related ADRs
ADR-001

## Related Resources
RPT-001

## Last Review
2026-07-02

## Notes
Support tool for knowledge ingestion workflows.

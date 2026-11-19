# Changelog

All notable changes to this project will be documented in this file.

---

## [Unreleased]

### Added

- `research/reports/RPT-002-agents.md` — Phase 2 report, pending architecture review.
- `research/archives/phase-2-agents-extraction-prompt.md` — Phase 2 extraction prompt, archived verbatim from `scripts/README.md`.

### Changed

- `docs/architecture/repository-workflow.md` is now the canonical workflow (phase execution, project lifecycle and resource lifecycle). `README.md`, `research/README.md`, `sources/README.md`, `docs/decisions/README.md` and `docs/reviews/README.md` link to it.
- `scripts/README.md` rewritten to describe the actual scripts and the six `lib/` modules.
- `README.md` and `research/README.md` describe the current directory structure.
- `docs/reviews/README.md` lists both RPT-001 reviews and the supporting documents.
- `docs/architecture/conventions.md`: workflow prefix `WKF-` (was `WRK-`) and methodology prefix `MET-`.
- `docs/architecture/taxonomy.md`: added Workflows, Prompts and References.
- Verified repository URLs in MCP-004, MCP-005, MCP-006, MCP-007 and PLT-001 to PLT-004.

### Fixed

- `scripts/bootstrap.sh` no longer overwrites a non-empty `.gitignore`, and creates directories and files under the repository root regardless of the working directory.

### Previously unrecorded (2026-07-02 to 2026-07-03)

- ADR-001, ADR-002 and ADR-003 with the RPT-001 architecture reviews.
- `research/reports/RPT-001-ecosystems.md` and the extraction of resources into `sources/`.
- `research/research-goals.md` v2.0 (no quantitative limits).
- `scripts/update_indexes.sh` and the `scripts/lib/` refactor.

---

## [0.1.0] - Initial Foundation

### Added

- Repository structure.
- Bootstrap system.
- Initial documentation.
- Templates.
- Research architecture.

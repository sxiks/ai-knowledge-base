# Changelog

All notable changes to this project will be documented in this file.

---

## [Unreleased]

### Removed

- `sources/skills/SKL-008-placeholder.md` (empty placeholder; ADR-004).

### Added

- Component Organization section in `PLT-001` to `PLT-005` (`sources/platforms/`): locations, formats, discovery rules and scope of instruction files, skills, agents and subagents, plugins or extensions, and MCP servers, from official documentation; documented, not tested (ADR-005).
- `sources/platforms/PLT-005-cursor.md` — Cursor, the fifth target platform (ADR-005).
- ADR-004 — Resource Lifecycle and Status Vocabulary (`research_status`, `decision`, `environment`, `kind`).
- ADR-005 — Multi-Platform Component Model (shared components, platform-specific components, adapter requirements, compatibility matrix with evidence, component organization per platform).
- `research/research-sources.md`: MCP Servers section, starting from the installed MCP servers.
- `docs/architecture/evaluation-criteria.md`: definition of the Knowledge Extraction Score (KES).
- `research/reports/RPT-002-agents.md` — Phase 2 report, pending architecture review.
- `research/archives/phase-2-agents-extraction-prompt.md` — Phase 2 extraction prompt, archived verbatim from `scripts/README.md`.

### Changed

- PLT-001: Last Review updated to 2026-11-18. PLT-005: note updated to point to its Component Organization section.
- All 47 resource files migrated to ADR-004 and ADR-005: YAML front matter (`id`, `kind`, `research_status`, `decision`, `environment`, `evidence`), the `Status` section removed, and a Platform Compatibility matrix with every value `Not Verified` (the previous unverified ratings are kept in a "Declared" column). Adoption texts without supporting evidence are renamed "Adoption Note (recorded before ADR-004, without supporting evidence)".
- `templates/resources/resource-template.md`: front matter of ADR-004, compatibility matrix and adapter requirements of ADR-005, evaluation table aligned with the KES, and the same section structure as the resource files (its first heading previously produced a wrong index title).
- PLT-002, PLT-003 and PLT-004 describe their platform as a target with the same compatibility priority (AD-5); priority set to High; previous notes kept as history.
- Overlapping resources linked in Related Resources (spec-driven development, browser automation, memory, review and validation).
- `docs/reviews/component-registry.md`: lists only decided resources and uses the ADR-004 vocabulary.
- `docs/architecture/conventions.md` and `CONTRIBUTING.md`: required metadata follows ADR-004 and ADR-005.
- `research/research-roadmap.md` v2.0: seven phases (Plugins and MCP Servers; Engineering Utilities, Methodologies, LSPs and Workflows; Additional References; Final Consolidation).
- `research/research-environment.md` v1.1: the five target platforms have the same compatibility priority; OpenCode is the current primary platform; `ai-workspace` is not created yet.
- `research/research-goals.md` v2.1: numerical limits in ADRs apply to adoption, not to research.
- `research/research-context.md` v1.1: the end state is materialized by `linux-dev-workstation` and `ai-workspace`; this repository does not set up AI platforms.
- `research/research-sources.md` v1.1: target platforms with equal priority.
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

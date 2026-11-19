# AI Knowledge Base

> A curated knowledge base for AI development ecosystems, tools, workflows, and engineering resources.

---

## Purpose

This repository is the research and documentation hub of my AI development environment.

Its purpose is to collect, classify, evaluate and document resources related to modern AI-assisted software development.

This repository **does not** store configurations, agents, prompts or plugins that are actively used.

Instead, it serves as the decision-making layer before any component is incorporated into my production AI workspace.

---

## Philosophy

Every resource should answer one question:

> **Is this worth adopting into my development ecosystem?**

Only resources that pass the evaluation process should eventually be implemented inside the `ai-workspace` repository.

---

## Repository Workflow

The workflow is defined in [docs/architecture/repository-workflow.md](./docs/architecture/repository-workflow.md). It has three levels:

1. **Phase Execution Workflow** — Investigation → Research Report → Architecture Review → ADR (when needed) → Knowledge Base Update → Index Regeneration → Validation → Git Commit.
2. **Project Lifecycle** — from research to environment adoption, as defined in `research/research-goals.md`.
3. **Resource Lifecycle** — Discover → Collect → Classify → Analyze → Compare → Decide → Implement.

---

## Repository Structure

```text
docs/        Architecture, decisions (ADRs), reviews and project status
research/    Research inputs, protocol, roadmap, reports and archives
sources/     Knowledge base resources, one file per resource
templates/   Reusable document templates
scripts/     Repository automation (bootstrap, index generation)
```

`scripts/bootstrap.sh` also creates `archive/` and `assets/` locally. They are not tracked by Git while empty.

---

## Main Sections

### Sources

Contains all collected resources.

Examples:

- GitHub repositories
- Official documentation
- Blogs
- Articles
- Guides
- Videos
- Community resources

---

### Analysis

Contains AI-generated evaluations.

---

### Comparisons

Technical comparisons between similar tools.

---

### Decisions

Records every important technical decision.

---

### Templates

Reusable templates used across the repository.

---

## Research Process

Research follows the Phase Execution Workflow and the order defined in `research/research-roadmap.md`.

---

## License

MIT

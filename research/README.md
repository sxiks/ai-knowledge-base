# Research

## Purpose

This directory contains the complete research workflow used to evaluate AI development tools before they become part of the knowledge base.

Unlike `sources/`, this directory is **not** the source of truth.

It is the workspace used during investigation.

---

## Workflow

Research inputs are processed with `research-protocol.md` (Prompt B). Each phase produces a report in `reports/`, which is then reviewed in `docs/reviews/` before updating `sources/`.

See [docs/architecture/repository-workflow.md](../docs/architecture/repository-workflow.md) for the canonical workflow.

---

## Directory Structure

```text
research/

README.md
research-context.md
research-environment.md
research-goals.md
research-protocol.md
research-roadmap.md
research-sources.md

reports/
archives/
```

---

## Responsibilities

### research-context.md

Permanent project context.

---

### research-environment.md

Current workstation state.

---

### research-goals.md

Mission, research philosophy and selection policy.

---

### research-sources.md

Repositories and documentation to investigate.

---

### research-protocol.md

Prompt B — protocol used to perform technical research. Replaces the former `prompt-a.md` and `prompt-b.md` (commit `67b8f7f`).

---

### research-roadmap.md

Order of the research phases and their expected reports.

---

### reports/

Generated reports.

---

### archives/

Historical research data.

# Repository Workflow

Canonical description of how work flows through this repository. Other documents link here instead of redefining the workflow.

The workflow has three levels. They do not compete: each one describes a different scope.

---

## 1. Phase Execution Workflow (canonical)

Applied to every research phase listed in `research/research-roadmap.md`.

```text
Investigation
      │
      ▼
Research Report
      │
      ▼
Architecture Review
      │
      ▼
ADR Generation (when needed)
      │
      ▼
Knowledge Base Update
      │
      ▼
Index Regeneration
      │
      ▼
Validation
      │
      ▼
Git Commit
      │
      ▼
Next Research Phase
```

| Step | Output | Location |
|------|--------|----------|
| Investigation | Evidence-based research following Prompt B and the Incremental Research Mode | `research/research-protocol.md` (inputs: `research-context.md`, `research-environment.md`, `research-goals.md`, `research-sources.md`) |
| Research Report | `RPT-NNN-<topic>.md`, named as in the roadmap | `research/reports/` |
| Architecture Review | Review of the report and its recommendations | `docs/reviews/` |
| ADR Generation (when needed) | Only when the review produces a permanent architectural decision | `docs/decisions/` |
| Knowledge Base Update | Resource files derived from the reviewed report | `sources/<category>/` |
| Index Regeneration | Updated category indexes | `scripts/update_indexes.sh` |
| Validation | Checks before committing: index output, internal references, recorded review status and project status | `scripts/validate_status.py` |
| Git Commit | Changes committed through the repository's Git Flow (feature branches merged into `develop`) | Git |
| Next Research Phase | Next phase in roadmap order | `research/research-roadmap.md` |

Project status: a commit that changes the state of a phase, review, ADR, reconciliation step or open task also updates `docs/status/project-status.json` (AD-4; rules in `docs/status/README.md`).

The first step was historically called "Claude Investigation". It is provider-independent: any AI-assisted research that follows the protocol qualifies.

---

## 2. Project Lifecycle

Defined in `research/research-goals.md` · Official Workflow:

```text
Research → Architecture Review → ADRs → Knowledge Base Update → Implementation Planning → Environment Adoption → Continuous Review
```

The first four stages happen in this repository through the Phase Execution Workflow. Implementation Planning, Environment Adoption and Continuous Review apply to the environment repositories (`ai-workspace`, planned; see `research/research-environment.md`).

---

## 3. Resource Lifecycle

Path of a single resource:

```text
Discover → Collect → Classify → Analyze → Compare → Decide → Implement
```

This repository covers Discover to Decide. "Implement" happens outside this repository: it stores knowledge and decisions, not active configurations (see `README.md` · Purpose).

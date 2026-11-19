# Project Status

`project-status.json` is the canonical status of this project (AD-4, approved on 2026-11-13). Any summary or dashboard of the project, inside or outside this repository, is derived from it and must not contradict it. A local HTML dashboard is deferred (T-103).

---

## Update Rules

- The file is updated in the same commit as the change it describes: a phase, a review, an ADR, a reconciliation step or an open task.
- `based_on_commit` is the commit the status was verified against, that is, the parent of the commit that updates the file. A commit cannot contain its own hash, so the commit that adds or updates this file is recorded as `null` and filled in the next update.
- Only facts that can be checked in the repository or in an approved decision are recorded. Dates come from the repository (commits, ADRs, reports); no dates are estimated.
- Unknown values are `null`. No percentages or progress estimates are recorded.
- A task is listed in `open_tasks` until it is completed with evidence; completed tasks are recorded in the commit history and the CHANGELOG.
- `resources` is computed from the YAML front matter of the resource files (`sources/<category>/*.md`) and must be recomputed when they change.

---

## Vocabularies

| Field | Values |
|-------|--------|
| Phase `status` | `not-started`, `research-in-progress`, `review-pending`, `completed` |
| Stage, reconciliation and plan `status` | `not-started`, `in-progress`, `completed` |
| Discrepancy `status` | `open`, `in-progress`, `resolved` |
| Discrepancy `severity` | `Critical`, `High`, `Medium`, `Low`, `Informational` |
| Task `status` | `pending`, `in-progress`, `needs-review`, `needs-validation`, `blocked`, `deferred` |
| Task `priority` | `High`, `Medium`, `Low`, or `null` |
| ADR `status` | as written in the ADR (`accepted`, `superseded`, ...) |

Resource vocabularies (`research_status`, `decision`, `kind`, `environment`) are defined in ADR-004.

---

## Identifiers

- `D-NN`: discrepancies registered in the 2026-11-13 architectural reconciliation.
- `AD-N`: decisions approved in that reconciliation; the permanent ones are recorded as ADRs.
- `R0` to `R4`: steps of the reconciliation plan.
- `T-NNN`: project tasks.

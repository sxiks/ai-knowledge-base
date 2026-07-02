# RPT-001 — Ecosystems

**Phase 1 of 6 · AI Ecosystem Technical Research (Incremental Mode)**
**Scope:** GStack, Superpowers, ECC — architectural-foundation candidates only.
**Out of scope for this report:** Agents, Skills, Plugins, MCP Servers, Utilities, Workflows (Phases 2–5 and the Final Phase). No repository structures, installers, or knowledge-base files are produced here, per the protocol's output restrictions.

**Research date:** July 2, 2026
**Primary target environment:** Debian 13 / GNOME, OpenCode (primary), planned Claude Code / Codex CLI / Gemini CLI / Cursor
**Developer profile:** Programming student, backend-focused (Python/HTML/CSS/JS today), ~10–15 hrs/week

---

## 1. Executive Summary

Three candidate "ecosystems" were investigated: **GStack** (garrytan/gstack), **Superpowers** (obra/superpowers), and **ECC** (affaan-m/ECC, formerly "Everything Claude Code"). All three are open-source, MIT-licensed, and distributed primarily as Claude Code plugins with varying degrees of cross-harness support. All three have grown extremely quickly in 2026 and are the subject of active, sometimes polarized, public discussion.

At the ecosystem-architecture level:

- **Superpowers** is the strongest candidate for a **foundational methodology layer**. It is the smallest, most disciplined, most cross-harness-portable of the three, has the most rigorous release/testing hygiene observed, and is distributed through Anthropic's own official plugin marketplace. Its main weakness for this environment is that community reports describe its OpenCode support as functional but rougher than its native Claude Code experience.
- **ECC** is the strongest candidate for **selective, à-la-carte component sourcing** — particularly its dedicated OpenCode adapter (the most mature of the three), its language-specific rule packs (Python patterns/security/TDD directly match the current learning phase), and its standalone AgentShield security scanner. Its monolithic scope (261+ skills, 66+ agents spanning many irrelevant domains) makes full adoption a poor fit for "smallest set of high-quality tools," so it is recommended only via its manifest-driven selective installer, never as a full install.
- **GStack** is **not recommended as an architectural foundation** for this environment. It is a well-engineered but heavyweight, Claude-Code-centric, solo-founder/CEO-oriented workflow system with a large external-dependency footprint (Bun, Playwright browser daemon, Supabase-backed memory, optional GPT-Image/ngrok/Tailscale) that conflicts with the stated "simplicity" and "provider independence" principles. A handful of its individual skills may be worth revisiting in later phases, but not the ecosystem as a whole.

This report evaluates ecosystem architecture only. It does **not** yet select specific agents, skills, MCP servers, or plugins — those are the subject of Phases 2–5, per `research-roadmap.md`. The recommendations below are therefore a foundation-layer decision, not a final stack.

---

## 2. Inventory

| Ecosystem | Repo | Maintainer(s) | License | Distribution |
|---|---|---|---|---|
| GStack | `garrytan/gstack` | Garry Tan (solo; President/CEO, Y Combinator) | MIT | Git clone + `./setup` script; also ClawHub (OpenClaw native skills) |
| Superpowers | `obra/superpowers` | Jesse Vincent ("obra") + Prime Radiant (small team, hiring a community engineer) | MIT | Anthropic official Claude plugin marketplace, `obra/superpowers-marketplace`, npm-style installers per harness |
| ECC | `affaan-m/ECC` | Affaan (solo core maintainer) + 230+ contributors | MIT (core OSS); paid "ECC Pro" GitHub App tier exists alongside it | Self-hosted Claude plugin marketplace, npm (`ecc-universal`, `ecc-agentshield`), GitHub App, `install.sh`/`install.ps1`/`npx ecc-install` |

| Metric (as scraped, directional — all three are growing rapidly and different cache snapshots disagreed by tens of thousands of stars within the same week) | GStack | Superpowers | ECC |
|---|---|---|---|
| Stars (approx., July 2026) | ~119K | ~227K–243K | ~212K–225K |
| Forks | ~17.7K | ~20–21.6K | ~32.5–34.4K |
| Commits | 325 | 618 | **2,188** |
| Tagged releases | **None** (rolling `CHANGELOG.md` only, 7,834 lines) | 9 tagged releases (v5.0.4 → v6.x line); semantic versioning | Multiple tagged minor/major releases; latest major v2.0.0 (June 2026) |
| First public traction | ~March 2026 (viral X/Product Hunt launch) | October 2025 (organic growth, later accelerated) | ~January 2026 (as "Everything Claude Code") |
| Contributors shown | Effectively solo | Small core team + community PRs (contribution process documented, high AI-slop PR rejection rate: ~94% of last 100 closed PRs) | 230+ listed contributors |
| Companion products | GBrain (separate persistent-memory repo, Supabase-backed) | Commercial support offering via Prime Radiant | AgentShield (security scanner, separate repo + npm package), ECC Tools GitHub App, ECC Pro ($19/seat/mo) |

---

## 3. Technical Evaluation

### 3.1 GStack

**Problem solved / primary use case.** A large, opinionated collection of ~23 "specialist" skills plus power tools that turn Claude Code into a simulated engineering organization (CEO review, eng-manager review, design review, QA, security officer, release engineer) following a fixed sprint loop: *Think → Plan → Build → Review → Test → Ship → Reflect*.

**Technical strengths.**
- Genuinely deep engineering in specific subsystems: a real Chromium browser-automation layer (`/browse`, GStack Browser) with a documented, layered prompt-injection defense (local ML classifier, transcript-based LLM check, canary tokens, two-classifier consensus) — this is unusually rigorous for an open-source skill pack.
- Broad host support: setup auto-detects and targets 10 agent hosts including OpenCode (`--host opencode`, installs to `~/.config/opencode/skills/gstack-*/`), Codex CLI, Cursor, and others.
- Transparent, opt-in-only telemetry with a documented, RLS-protected schema.
- `/document-release` and `/document-generate` implement the Diataxis documentation framework, which is a genuinely useful, citable methodology if later reused independently.

**Weaknesses / risks.**
- **No tagged releases.** Versioning is tracked only through a single enormous `CHANGELOG.md` (862 KB / 7,834 lines) and a `VERSION` file — there is no way to pin or audit a specific release the way Superpowers' and ECC's tagged releases allow. This is a reproducibility concern given the "Reproducibility" and "Long-term maintainability" principles in `research-environment.md`.
- **Heavy external-dependency footprint**: requires Bun (and Node.js on Windows for a Playwright fallback), a persistent local browser-automation daemon, and — for several flagship features (`/design-shotgun`, `/setup-gbrain`) — third-party paid services (GPT Image API, Supabase, optionally ngrok/Tailscale). This works against "Simplicity" and "Provider independence."
- **Design center mismatch.** The skill set is heavily weighted toward solo-founder/CEO product strategy, investor-style scrutiny, and design-mockup generation — not toward the fundamentals-first, backend/Python learning path this research is being conducted for. Many of its 30+ skills (CEO review, design-shotgun, iOS QA suite) are simply irrelevant to a junior-developer curriculum.
- **Public reception is genuinely split.** Coverage from TechCrunch (March 2026) describes the project as generating "so much love, and hate," with the most common developer criticism being that experienced Claude Code users already have equivalent personal setups, and secondary criticism of the productivity claims (~810× LOC-normalized productivity vs. 2013) as a marketing framing rather than a rigorous benchmark — the maintainer's own `ON_THE_LOC_CONTROVERSY.md` acknowledges the raw-LOC critique is valid, while defending the normalized claim. This does not invalidate the engineering, but it does mean the project's popularity is not a clean adoption signal on its own.

**Compatibility.** OpenCode: supported via `--host opencode` flag (skills only, no GBrain/browser daemon guarantees documented for OpenCode specifically). Claude Code: native/primary target. Codex CLI: supported. Cursor: supported. Gemini CLI: not listed among the 10 supported hosts.

**Complexity / learning curve.** High. 23+ skills, multiple sub-daemons (browse server, iOS QA daemon), a memory backend (GBrain) with four possible provisioning paths, and its own upgrade/telemetry/uninstall tooling.

**Verdict: Not Recommended** as an ecosystem foundation for this environment. Optional, case-by-case, for isolated skills only (documentation generation via Diataxis, or the browser prompt-injection-defense pattern as a reference) — to be revisited in later phases, not adopted wholesale here.

---

### 3.2 Superpowers

**Problem solved / primary use case.** A minimal, composable **skills framework and methodology enforcer**: brainstorming → git worktrees → planning → subagent-driven TDD implementation → code review → branch finishing. It does not try to be an agent library, a security scanner, or a language-rules pack — it is deliberately scoped to *process*.

**Technical strengths.**
- **Smallest, most disciplined surface area** of the three: ~13–14 skills organized into Testing, Debugging, Collaboration, and Meta categories. This is the best match for the stated design principle of preferring "the smallest set of high-quality tools" over the largest collection.
- **Genuine enforcement, not just suggestion.** The TDD skill is described (and independently verified by third-party write-ups) as deleting code written before a corresponding failing test exists, rather than merely recommending test-first development — a meaningfully different mechanism than a CLAUDE.md instruction, which one third-party review characterized as being followed only "when convenient."
- **Best-in-class release hygiene observed across the three ecosystems.** Recent release notes show TDD-validated, cross-platform-checked changes (five harnesses), regression test suites for worktree behavior, and a documented contributor pre-submission checklist introduced specifically because an audit of the last 100 closed PRs found a 94% AI-slop rejection rate. A behavioral test suite plants real vulnerabilities (SQL injection, plaintext password handling, credential logging) into a scratch project and asserts the code-review skill catches them — this is unusually rigorous verification for a prompt/skill library.
- **Official first-party distribution.** Listed in Anthropic's own Claude plugin marketplace (`superpowers@claude-plugins-official`), which is a stronger trust/maintenance signal than a purely community-hosted marketplace.
- **Broadest harness list** of the three by name: Claude Code, Antigravity, Codex App, Codex CLI, Cursor, Factory Droid, GitHub Copilot CLI, Kimi Code, OpenCode, and Pi — directly covering every platform in this environment's "planned platforms" list plus more.
- Transparent, minimal, opt-out telemetry (a single non-identifying logo-load ping, honors Claude Code's own telemetry opt-outs).

**Weaknesses / risks.**
- **OpenCode is a secondary target.** Independent third-party reviews consistently note that "OpenCode users report skill clashes" and that the experience is "best on Claude Code," which has deeper native support (subagents, `allowed-tools` sandboxing) that some skills (particularly `subagent-driven-development`) rely on for full effect. Since this environment's *primary* platform is OpenCode, this is the single most important caveat against treating Superpowers as a drop-in foundation without hands-on validation.
- **No built-in language-specific rules.** Superpowers is deliberately language-agnostic — it will not, by itself, provide Python/Go/TypeScript idiom or security guidance. That is intentionally out of scope for it and would need to come from a separate skills source (Phase 3).
- **Process overhead on trivial tasks.** An independent 12-session before/after test found roughly 9% cost and 14% token *reduction* on medium/complex tasks, but noted simple tasks can use *more* tokens due to planning overhead — consistent with a "speed bump, not a speed limit sign" design that is a poor fit for very small, one-off changes.
- Small maintaining team relative to its popularity (governance risk if the core maintainer's bandwidth changes), though the "Superpowers Community Engineer" hire in progress and Prime Radiant's commercial backing partially mitigate this.

**Compatibility.** OpenCode: supported, but with documented rough edges. Claude Code: native/deepest integration. Codex CLI/App: supported. Cursor: supported. Gemini CLI: not in the primary install list (third-party coverage mentions Gemini CLI informally; treat as unconfirmed/experimental until verified hands-on).

**Complexity / learning curve.** Low–moderate. Single install command per harness; the workflow itself intentionally slows down the *first* interaction (clarifying questions before code) but the skill set itself is small enough to read in full.

**Verdict: Recommended** as the foundational methodology layer, with an explicit validation step before committing: confirm the OpenCode integration behaves acceptably in this environment (no skill clashes with the existing `OpenCode Agent Skills` plugin already installed) before treating it as load-bearing.

---

### 3.3 ECC

**Problem solved / primary use case.** Originally "Everything Claude Code" — a very large, cross-harness catalog of agents, skills, rules, hooks, and commands accumulated from "10+ months of intensive daily use building real products," now explicitly reframed (v1.8.0 onward) as an "agent harness performance optimization system" covering skills, instincts/continuous learning, memory persistence, and security scanning.

**Technical strengths.**
- **Deepest, most explicit OpenCode integration of the three.** ECC ships a dedicated `.opencode/` plugin (originally 12 agents, 24 commands, native hook support across 20+ OpenCode event types) with its own `opencode.json` schema entry, and documents an explicit memory-isolation mechanism (`ECC_AGENT_DATA_HOME`) so that running ECC in both OpenCode and Claude Code on the same machine does not let the two harnesses overwrite each other's session state. This is materially more mature than GStack's single `--host opencode` flag or Superpowers' generic `.opencode/INSTALL.md` bootstrap.
- **Selective/manifest-driven install architecture** (introduced v1.9.0): `install-plan.js`/`install-apply.js`, a `--profile minimal|core|full` system, and an advisor (`npx ecc consult "<need>"`) that recommends only the matching components. This directly mitigates the otherwise-serious bloat risk of a 261-skill, 66-agent catalog, and is the mechanism by which ECC could be adopted safely.
- **Directly relevant language rule packs.** `rules/python/`, `skills/python-patterns`, `skills/python-testing` (pytest-based) map precisely onto the current Phase 1 (Python functions/scope) and near-term backend curriculum; the Django-specific pack (patterns/security/TDD/verification) is directly relevant to the stated Backend-development track.
- **AgentShield**, a standalone security auditor for agent configuration (CLAUDE.md, settings.json, MCP configs, hooks, agent/skill definitions) with 1,282 tests, 102 static-analysis rules across 5 risk categories, and an optional three-agent adversarial (red team / blue team / auditor) deep-scan mode. This is a genuinely distinct, independently useful capability not offered by GStack or Superpowers, and is packaged separately enough (`npx ecc-agentshield scan`, own GitHub repo/npm package) to adopt without pulling in the rest of ECC.
- Very high development velocity (2,188 commits, by far the most of the three) and a documented test suite (997+ internal tests referenced in release notes) exercised across hook/runtime refactors.

**Weaknesses / risks.**
- **Scope is a poor match for "avoid over-engineering" if installed in full.** The catalog includes large amounts of content irrelevant to this environment's goals: Swift/iOS (actor persistence, Liquid Glass design, on-device FoundationModels), HarmonyOS/ArkTS, prediction-market/trading skills (Itô integration), and investor-relations/pitch-deck skills. None of this belongs in a backend-Python-focused, junior-developer learning stack. **This is a strong argument for selective installation only, never the `--profile full` path.**
- **Documented internal friction from that same complexity.** The README itself calls out a recurring "Duplicate hooks file detected" failure mode across three separate historical GitHub issues (#29, #52, #103), caused by the interaction between Claude Code's automatic plugin-hook loading and ECC's own manual-install hook path — serious enough that the project added a regression test specifically to stop it from recurring. Third-party coverage (a Medium deep-dive) independently frames ECC as "dividing the developer community," citing hook-conflict complaints that predate the `ECC_HOOK_PROFILE`/`ECC_DISABLED_HOOKS` fix shipped in v1.8.0.
- **Partial commercial dependency.** While the OSS core is MIT-licensed "forever," the project's sustainability model leans on a paid "ECC Pro" GitHub App ($19/seat/month) and named business sponsors (CodeRabbit, Greptile, Atlas Cloud). This is not vendor lock-in for the OSS layer itself, but it is a soft pull toward a hosted product that should be treated as strictly optional and avoided unless a specific paid capability (private-repo GitHub App automation) is explicitly needed later.
- **"Do not stack install methods" is a real operational hazard.** The README dedicates significant space to warning against combining the plugin install with the manual installer, because doing so silently duplicates skills and hook execution — a sign that the install surface, while flexible, is also failure-prone if not followed precisely.
- Solo core maintainer despite the very large scope is a bus-factor risk, partially offset by the 230+ contributor community and sponsor funding.

**Compatibility.** OpenCode: **native, dedicated adapter** (strongest of the three). Claude Code: native/primary. Cursor: dedicated `.cursor/` adapter (hooks, rules, agents, skills, commands, MCP config all translated). Codex CLI/App: first-class support (`AGENTS.md`, `.codex/config.toml`, agent-role files). Gemini CLI: experimental, project-local only. Also uniquely offers adapters for GitHub Copilot, Antigravity, JoyCode/CodeBuddy, Qwen CLI, and Zed — broader raw harness coverage than either GStack or Superpowers, at the cost of proportionally more integration-surface complexity to maintain.

**Complexity / learning curve.** High if adopted in full; low–moderate if adopted via the selective installer / `ecc consult` advisor against a specific, named need.

**Verdict: Optional**, adopted selectively (never `--profile full`) — specifically as a future source for OpenCode-native rule packs, Python/backend skills, and the standalone AgentShield scanner. Not a candidate for "architectural foundation" status because its scope and governance profile do not match "smallest set of high-quality tools" or "avoid unnecessary complexity."

---

## 4. Direct Comparisons

| Criterion | GStack | Superpowers | ECC |
|---|---|---|---|
| Design center | Solo-founder/CEO product workflow, Claude-Code-first | Cross-agent software-engineering methodology | Cross-agent "everything" catalog + harness performance system |
| Surface area | ~23 skills + 8 power tools + standalone CLIs | ~13–14 skills | 261–271 skills, 66–67 agents, 84–92 legacy commands |
| Fits "smallest set of high-quality tools"? | No | **Yes** | Only if installed selectively |
| OpenCode maturity | Basic (`--host opencode` flag) | Supported, but reported rough edges vs. Claude Code | **Deepest** (dedicated adapter, hook-translation layer, memory isolation) |
| Release discipline | No tagged releases; single rolling changelog | **Tagged semantic releases; documented regression + behavioral tests** | Tagged releases; large internal test suite; high commit velocity |
| First-party trust signal | None found | **Listed in Anthropic's official plugin marketplace** | Self-hosted marketplace + GitHub App listing |
| External paid/SaaS dependencies | Yes (GPT Image, Supabase/GBrain, optional ngrok/Tailscale) | None required | Optional ("ECC Pro" $19/seat/mo; core OSS is free) |
| Standout unique capability | Browser automation + layered prompt-injection defense | Enforced TDD via subagent-driven development | AgentShield security scanner; broadest raw harness adapter count |
| Public reception | Split; "love and hate" (TechCrunch) | Generally positive; some "over-engineered for simple tasks" feedback | Split; "dividing the developer community" (Medium), driven by hook-conflict complaints prior to v1.8.0 |

**Head-to-head calls (per the protocol's "recommend only the strongest option unless both clearly complement one another"):**

- **Superpowers vs. GStack:** Superpowers wins outright for this environment. It solves a strict subset of what GStack attempts (the "process" layer) but does it with less complexity, no paid-service dependencies, and stronger release/testing rigor. GStack's genuinely superior pieces (browser automation, prompt-injection defense) address a need — reliable AI-driven browser QA — that is not currently a stated goal in `research-context.md`/`research-environment.md`, so there is no present justification to accept GStack's larger footprint for that.
- **Superpowers vs. ECC:** These **complement rather than compete**. Superpowers governs *process* (how work moves through a sprint); ECC's selectively-installed rule packs govern *domain knowledge* (Python idioms, security checklists, TDD specifics for a given language/framework). Running Superpowers as the process layer with a handful of hand-picked ECC rule/skill directories layered on top is architecturally coherent and does not create redundant methodology enforcement, since ECC's own `tdd-workflow` skill can be left uninstalled in favor of Superpowers' `test-driven-development` skill to avoid duplicate, possibly conflicting, TDD enforcement.
- **GStack vs. ECC:** ECC is the stronger of the two heavyweight options for this environment specifically because of its selective-install architecture and its markedly better OpenCode adapter; GStack has no comparable "install only what you need" mechanism and is more tightly coupled to Claude Code + its own browser/memory daemons.

---

## 5. Compatibility Matrix

| | OpenCode (primary) | Claude Code (planned) | Codex CLI (planned) | Gemini CLI (planned) | Cursor (deprioritized) |
|---|---|---|---|---|---|
| **GStack** | Supported (skills only, `--host opencode`) | Native / primary | Supported | Not listed | Supported |
| **Superpowers** | Supported (reported rough edges) | Native / deepest integration | Supported (App + CLI) | Not in primary list; informal mentions only | Supported |
| **ECC** | **Native, dedicated adapter** | Native / primary | Native (App + CLI) | Experimental, project-local | Native, dedicated adapter |

Provider independence note: all three are architecturally "just markdown + config," i.e., none requires a specific model provider once the underlying CLI/agent is configured — this matches the "Provider independence" design principle at the ecosystem level. The dependency risk in this environment is not model lock-in but **tooling lock-in** (GStack's Bun/Playwright/Supabase stack; ECC's optional hosted Pro tier), which is why those specific pieces are flagged above rather than the ecosystems as a whole.

---

## 6. Missing Capabilities (Ecosystem-Level)

These are gaps observed while investigating all three ecosystems together, relevant to `research-context.md`'s "Expected Deliverables" and `research-environment.md`'s "Current Gaps," and are carried forward as open questions for later phases rather than resolved here:

1. **No single ecosystem provides a clean, unattended `git clone → bootstrap.sh → ready-to-use workstation` path.** Each uses its own install mechanism (GStack: shell script + host flags; Superpowers: per-harness plugin-marketplace commands; ECC: npm/installer scripts + manifest profiles). Wrapping one or more of these into the user's own `bootstrap.sh` remains open work for later, outside this report's scope (the protocol prohibits designing that structure here).
2. **None of the three is primarily an MCP-server ecosystem.** GStack registers gbrain as an MCP server as a side effect of its memory feature; ECC ships MCP server *configs* (GitHub, Context7, Exa, Memory, Playwright, Sequential Thinking) but treats MCP as a thin, mostly-optional layer (explicitly limiting itself to one default connector, `chrome-devtools`, after a documented June 2026 audit). MCP server selection is correctly deferred to Phase 5 of the roadmap.
3. **Data Analytics / ML-specific tooling is thin across all three.** Only ECC has any dedicated ML content (`mle-workflow` skill, `mle-reviewer` agent, `pytorch-patterns`), and it is recent (added ~v1.9.0/v2.0.0-rc.1) and not yet battle-tested at the scale of its TDD/security content. This is a gap to watch when the user's learning plan reaches its Data Analytics/ML phases.
4. **No ecosystem here directly addresses LSP tooling** — correctly out of scope for "Ecosystems" and already deferred by `research-environment.md` itself ("No AI-specific LSP ecosystem has been defined yet").

---

## 7. Recommended Stack (Ecosystem Layer Only)

| Resource | Decision | Justification (condensed) |
|---|---|---|
| **Superpowers** | **Recommended** | Smallest surface area, strongest release/testing discipline observed, official Anthropic marketplace listing, broadest confirmed harness list, zero required paid dependencies. Adopt as the foundational process/methodology layer. Validate OpenCode behavior hands-on first. |
| **ECC** | **Optional (selective install only)** | Best-in-class OpenCode adapter and directly relevant Python/backend rule packs and AgentShield scanner. Do not install `--profile full`; use the manifest-driven selective installer or `npx ecc consult` against named needs only, to avoid the documented hook-conflict and scope-bloat failure modes. |
| **GStack** | **Not Recommended** (foundation); individual skills optional, case-by-case, in later phases | Solo-founder/CEO-oriented design center, heavy external-service dependencies (Supabase/GBrain, GPT Image, browser daemon), no tagged releases, and public reception concerns that warrant discounting its popularity as an adoption signal on its own. Its browser-automation and prompt-injection-defense engineering are high quality and may merit isolated reconsideration once/if browser-driven QA becomes an explicit goal. |

This is a **foundation-layer** recommendation only. It does not yet commit to specific agents, skills, MCP servers, or plugins from any of the three (or from Phase 2–5 sources) — that selection happens once all categories have been researched, consistent with the roadmap's Incremental Research Mode instruction not to make final decisions on partial information.

---

## 8. Rejected Resources

| Resource | Status | Reason |
|---|---|---|
| GStack (as architectural foundation) | **Rejected** | Scope/dependency/design-center mismatch detailed in §3.1 and §7. Not a "duplicate functionality" rejection — GStack's browser-automation capability is genuinely differentiated — but it is rejected as a *foundation* given this environment's current stated goals and constraints. |
| ECC `--profile full` / full-catalog install | **Rejected as a mode of adoption** (the project itself, selectively installed, is not rejected) | Directly conflicts with "avoid over-engineering" and "avoid unnecessary complexity" given the large share of the catalog (iOS, HarmonyOS, prediction-market, investor-relations content) irrelevant to this environment. |
| ECC Pro (paid GitHub App tier) | **Rejected for now** | No stated need for private-repo hosted automation; introduces a recurring cost and a soft vendor dependency with no corresponding requirement in `research-goals.md` or `research-context.md`. Revisit only if a specific capability gap requires it. |

---

## 9. Preliminary Adoption Notes (Not a Final Roadmap)

Per the Incremental Research Mode instructions, a full Adoption Roadmap is deferred to the Final Phase (`RPT-999-final-recommendation.md`), after Agents, Skills, Plugins, and MCP Servers have also been investigated. The following are foundation-layer notes only, to inform how those later phases should be scoped:

- Phase 2 (Agents) research should evaluate candidate agent packs (`agency-agents`, `multica`, `ruflo`, `trifecta-perfecta`, `all-deploy`, `the-architect`, `cyber-neo`) for **methodology conflicts** against a Superpowers-based process layer — in particular, whether any of them duplicate or fight Superpowers' TDD/code-review/subagent-dispatch mechanics.
- Phase 3 (Skills) research should treat ECC's `rules/python/`, `skills/python-patterns`, `skills/python-testing`, and (once the curriculum reaches it) `skills/django-*` as known, pre-vetted candidates worth direct comparison against `karpathy-skills`, `caveman`, `prompt-master`, and `skills.sh`, rather than re-deriving Python-specific skill guidance from scratch.
- Phase 4 (Plugins) research should confirm whether `claude-plugins-official` and `claude-mem` interact cleanly with a Superpowers install (Superpowers is itself distributed as a plugin through the official marketplace).
- Phase 5 (MCP Servers) research should note that both GStack (via GBrain) and ECC (via its MCP-config catalog) propose their own MCP-server opinions; these should be weighed against the environment's already-installed Context7, Engran, GitHub, Playwright, and Sequential Thinking MCP servers to avoid duplicate functionality, per the "Existing Environment" constraint in `research-sources.md`.

---

## 10. Final Conclusions

No single "ecosystem" in this batch is a complete, drop-in answer to `research-goals.md`'s objective of designing the best AI ecosystem for OpenCode. The evidence supports a **layered** approach rather than picking one monolithic system:

1. **Superpowers as the process/methodology foundation** — it is the only one of the three whose scope, dependency footprint, and governance quality are consistent with the stated design principles (simplicity, reproducibility, provider independence, avoiding over-engineering), and it carries the strongest first-party trust signal (Anthropic's own marketplace).
2. **ECC as a selective component source, not a foundation** — its OpenCode integration is genuinely best-in-class and its Python/backend rule packs and AgentShield scanner are directly useful, but its full catalog must be treated as a menu, never a default install.
3. **GStack set aside** as a foundation candidate, with a small number of its individual capabilities (documentation-generation methodology, browser prompt-injection defense pattern) noted as possible narrow, later reconsiderations rather than adopted now.

This conclusion is provisional at the ecosystem layer and should be re-examined once Phases 2–5 are complete, in case agent, skill, MCP, or plugin findings surface a reason to revisit any of the three calls above.

---

## Sources Consulted

- https://github.com/garrytan/gstack (README, CHANGELOG.md metadata)
- https://github.com/obra/superpowers (README, Releases)
- https://github.com/affaan-m/ECC (README)
- https://techcrunch.com/2026/03/17/why-garry-tans-claude-code-setup-has-gotten-so-much-love-and-hate/
- https://www.termdock.com/en/blog/superpowers-framework-agent-skills
- https://agentconn.com/blog/obra-superpowers-agentic-skills-framework-guide/
- https://andrew.ooo/posts/superpowers-agentic-skills-framework-claude-code/
- https://www.mejba.me/blog/superpowers-plugin-claude-code-review
- https://blog.marcnuri.com/superpowers-claude-code-skills-framework
- https://medium.com/@tentenco/everything-claude-code-inside-the-82k-star-agent-harness-thats-dividing-the-developer-community-4fe54feccbc1
- https://ecc.tools/

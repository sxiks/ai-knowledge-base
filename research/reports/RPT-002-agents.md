# RPT-002 — Agents (AER-002 Extraction Format)

**Phase 2 of 6 · AI Ecosystem Technical Research (Incremental Mode)**
**Scope:** agency-agents, multica, ruflo, trifecta perfecta, all-deploy, the-architect, cyber-neo — atomic component extraction (agents, sub-agents, workflows, orchestration).
**Out of scope for this report:** Skills, Plugins, MCP Servers, Utilities, LSPs, standalone Workflow research (Phases 3–5). No repository structures, installers, or final knowledge-base files are produced here.

**Research date:** July 3, 2026
**Extraction philosophy applied:** Per `research-goals.md` v2.0, no numerical ceiling was imposed on how many agents/workflows/orchestration patterns get catalogued. Depth was scaled to what genuine source material supports — see the Scope & Depth Note below before using this report as a paste-in source.

---

## 0. Scope & Depth Note (read before reuse)

Two of the seven sources (`agency-agents`, `ruflo`) ship far more individual agent-definition files than could be individually fetched and read in one pass (150+ and 100+ respectively). To stay evidence-based rather than inventing prompt text I never read, this report uses two depth levels, marked explicitly on every entry:

- **[L2 — Verified prompt logic]**: the actual agent/orchestrator file was fetched and read. Behavior, rules, and workflow steps below are drawn directly from that file.
- **[L1 — Catalog only]**: name, division/category, one-line specialty, and "when to use" are drawn directly from the source repository's own README roster table (real data, not invented) — but the individual agent's full prompt file was **not** fetched, so no behavioral/personality detail is claimed for these beyond what the roster line states.

Where a source's full roster was catalogable (agency-agents' 150+ agents came with a complete README table), it is reproduced in full below per the "cero límites" instruction. Where a source only exposes categories without individual names (ruflo's agent roster is not enumerated anywhere in its README), that gap is stated rather than filled with invented names.

---

## 1. Executive Summary

Seven sources were investigated. They fall into four architecturally distinct buckets, which matters more than their individual feature counts:

1. **Persona libraries** (`agency-agents`): a very large, static catalog of specialized agent *prompts* — no runtime, no orchestration engine of its own beyond one optional orchestrator agent. Portable to any harness that reads markdown agent files, including OpenCode.
2. **Managed-agent / orchestration platforms** (`multica`, `ruflo`): full runtime systems (Go backend + web dashboard for Multica; Rust/TypeScript daemon + MCP server + optional web UI for Ruflo) that wrap and coordinate *your* underlying CLI agents (Claude Code, OpenCode, Codex, etc.). These are infrastructure, not prompt content, and carry real operational weight (databases, daemons, in one case a very recent critical security patch).
3. **Single-purpose meta-agents/skills** (`the-architect`, `cyber-neo`, `all-deploy`): each does exactly one job in a software lifecycle (plan → audit → deploy) with a small, readable, low-dependency footprint.
4. **A documented meta-workflow** (`trifecta perfecta`): not a repository at all, but a community guide chaining the three single-purpose tools above into a 5-step design→build→audit→fix→ship pipeline, with an unusually honest "when NOT to use this" section.

At the architecture level, the two big platforms (Multica, Ruflo) are the ones most in tension with `research-context.md`'s design principles (simplicity, avoid over-engineering, avoid unnecessary complexity) — Multica because it solves a multi-human-team coordination problem the user does not yet have, and Ruflo because of its sheer surface area plus a **just-patched critical RCE vulnerability in its MCP bridge** (GHSA-c4hm-4h84-2cf3, fixed in v3.16.3, July 1 2026), which is a hard fact to weigh, not a style preference. The three small Hainrixz tools and the agency-agents persona library are lower-risk, more scoped, and easier to selectively adopt.

---

## 2. Inventory

| Source | Type | Repo / URL | License | Maintainer | Scale signal |
|---|---|---|---|---|---|
| agency-agents | Persona library (agent .md files) | `msitarzewski/agency-agents` | MIT | msitarzewski (solo) + community PRs | ~126K★, 20.5K forks, 357 commits, 150+ individual agent files across 16 divisions |
| multica | Managed-agents platform (Go + web) | `multica-ai/multica` | Apache 2.0 | multica-ai org, small team | ~5.5K★ (per third-party review), active weekly releases, Go 38.8K LOC repo activity |
| ruflo | Agent meta-harness (Rust/TS daemon + MCP) | `ruvnet/ruflo` | MIT | ruvnet (rUv) / Cognitum.One | 62.8K★, 7.4K forks, **7,096 commits**, 1,553 releases, 100+ agents, 35 plugins |
| the-architect | Single meta-agent (Claude Code project) | `Hainrixz/the-architect` | MIT | Hainrixz (@soyenriquerocha) / tododeia | Small, single-maintainer, bilingual EN/ES |
| cyber-neo | Security-audit skill + subagents | `Hainrixz/cyber-neo` | MIT | Hainrixz / tododeia | ~97★ (per tododeia guide), 563-line SKILL.md, Python |
| all-deploy | Deployment skill | `Hainrixz/all-deploy` | MIT | Hainrixz / tododeia | **2★, 1 fork, 7 commits, single v0.1.0 release (Apr 19 2026)** — earliest-stage source in this batch |
| trifecta perfecta | Documented meta-workflow (not a repo) | `tododeia.com/community/trifecta-perfecta` | N/A (guide) | tododeia community | Chains the-architect + cyber-neo + all-deploy |

---

## 3. AER-002 Extraction by Source

### 3.1 agency-agents

**Nature:** A static library of ~150+ individually authored Claude-Code-style agent persona files (`.md`), organized into 16 divisions, plus one meta-agent (`agents-orchestrator`) that coordinates the others. Distributed via `./scripts/install.sh` (targets Claude Code, Cursor, Codex, Gemini CLI, **OpenCode**, Copilot, OpenClaw, Aider, Windsurf, Kimi, Osaurus, Hermes) or a native desktop app (`agencyagents.app`).

**⚠️ OpenCode-specific integration note [L2, verified from README]:** OpenCode's own runtime currently registers only ~119 agents and silently drops the rest (documented upstream bug, `anomalyco/opencode#27988`). The installer supports `--division`/`--agent` selective install specifically to stay under that ceiling and warns when a selection would exceed it. **This is directly relevant** to the user's OpenCode-primary environment and is a hard constraint, not a style choice — a full 150-agent install would silently lose ~25%+ of agents on OpenCode today.

#### Orchestration [L2 — verified, full file read: `specialized/agents-orchestrator.md`]

- **Name:** AgentsOrchestrator
- **Responsibility:** Autonomous pipeline manager. Runs a fixed workflow — `PM (project-manager-senior) → ArchitectUX → [Developer ↔ EvidenceQA loop, task-by-task] → testing-reality-checker` — from a single natural-language command.
- **Orchestration mechanics (verified from source):**
  - **State tracking:** maintains current phase, task count, completed/remaining tasks, retry counters.
  - **Quality gate enforcement:** every implementation task must pass an EvidenceQA (screenshot-evidence-based) validation before the pipeline advances. No shortcuts permitted per the file's own "Critical Rules."
  - **Retry logic:** max 3 attempts per task; on failure, loops back to the developer agent with specific QA feedback; after 3 failures, the task is marked blocked and the pipeline continues (final integration testing catches remainders).
  - **Agent spawn failure handling:** retry spawn up to 2 times, then document and escalate with manual fallback.
  - **Reporting templates:** the file defines two verbatim status-report templates (a running "Pipeline Progress" report and a "Completion Summary" report) that the orchestrator is instructed to fill in and emit.
  - **Default-to-fail-safe rule:** if QA evidence is inconclusive, the orchestrator is instructed to default to FAIL rather than pass unclear work.
- **Available specialist agents referenced by the orchestrator** (a curated subset of the full roster, listed inside the orchestrator file itself, by category): Design & UX (ArchitectUX, UI Designer, UX Researcher, Brand Guardian, design-visual-storyteller, Whimsy Injector, XR Interface Architect), Engineering (Frontend Developer, Backend Architect, engineering-senior-developer, engineering-ai-engineer, Mobile App Builder, DevOps Automator, Rapid Prototyper, XR Immersive Developer, LSP/Index Engineer, macOS Spatial/Metal Engineer), Marketing (8 named agents), Product & Project Management (8 named agents), Support & Operations (6 named agents), Testing & Quality (6 named agents), Specialized (XR Cockpit Interaction Specialist, data-analytics-reporter).

#### Agents & Sub-agents — full roster [L1 — catalog from README, real data]

*(Name — Specialty — Division)*

**Engineering Division (32 agents):** Frontend Developer (React/Vue/Angular, UI), Backend Architect (API/DB design, scalability), Mobile App Builder (iOS/Android, RN/Flutter), AI Engineer (ML models, deployment), DevOps Automator (CI/CD), Network Engineer (Cisco/Juniper/PAN-OS), Rapid Prototyper (POC/MVP), Senior Developer (Laravel/Livewire), Filament Optimization Specialist, Autonomous Optimization Architect (LLM routing/cost), Embedded Firmware Engineer (RTOS/ESP32/STM32), Incident Response Commander, Solidity Smart Contract Engineer, Codebase Onboarding Engineer, Technical Writer, WeChat Mini Program Developer, Code Reviewer, Database Optimizer, Git Workflow Master, Software Architect (DDD, architecture trade-offs), SRE (SLOs/error budgets), AI Data Remediation Engineer, Data Engineer (pipelines/lakehouse), Feishu Integration Developer, CMS Developer (WordPress/Drupal), Email Intelligence Engineer, Voice AI Integration Engineer, IT Service Manager (ITIL 4), Minimal Change Engineer, OrgScript Engineer, Prompt Engineer, Multi-Agent Systems Architect, Drupal/WordPress Shopping Cart Engineers.

**Design Division (9):** UI Designer, UX Researcher, UX Architect, Brand Guardian, Visual Storyteller, Whimsy Injector, Image Prompt Engineer, Inclusive Visuals Specialist, Persona Walkthrough Specialist.

**Paid Media Division (7):** PPC Campaign Strategist, Search Query Analyst, Paid Media Auditor, Tracking & Measurement Specialist, Ad Creative Strategist, Programmatic & Display Buyer, Paid Social Strategist.

**Sales Division (10):** Outbound Strategist, Discovery Coach, Deal Strategist, Sales Engineer, Proposal Strategist, Pipeline Analyst, Account Strategist, Sales Coach, Sales Outreach, Offer & Lead Gen Strategist.

**Marketing Division (36):** Growth Hacker, Content Creator, Twitter Engager, X/Twitter Intelligence Analyst, TikTok Strategist, Instagram Curator, Reddit Community Builder, App Store Optimizer, Social Media Strategist, Xiaohongshu Specialist, WeChat Official Account Manager, Zhihu Strategist, Baidu SEO Specialist, Bilibili Content Strategist, Carousel Growth Engine, LinkedIn Content Creator, China E-Commerce Operator, Kuaishou Strategist, SEO Specialist, Book Co-Author, Cross-Border E-Commerce Specialist, Douyin Strategist, Livestream Commerce Coach, Podcast Strategist, Private Domain Operator, Short-Video Editing Coach, Weibo Strategist, Global Podcast Strategist, AI Citation Strategist, China Market Localization Strategist, Video Optimization Specialist, AEO Foundations Architect, Agentic Search Optimizer, Email Marketing Strategist, Multi-Platform Publisher, PR & Communications Manager.

**Product Division (5):** Sprint Prioritizer, Trend Researcher, Feedback Synthesizer, Behavioral Nudge Engine, Product Manager.

**Project Management Division (7):** Studio Producer, Project Shepherd, Studio Operations, Experiment Tracker, Senior Project Manager, Jira Workflow Steward, Meeting Notes Specialist.

**Testing Division (8):** Evidence Collector, Reality Checker, Test Results Analyzer, Performance Benchmarker, API Tester, Tool Evaluator, Workflow Optimizer, Accessibility Auditor.

**Security Division (10):** Security Architect, Application Security Engineer, Penetration Tester, Cloud Security Architect, Incident Responder, Threat Intelligence Analyst, Threat Detection Engineer, Senior SecOps Engineer, Compliance Auditor, Blockchain Security Auditor.

**Support Division (6):** Support Responder, Analytics Reporter, Finance Tracker, Infrastructure Maintainer, Legal Compliance Checker, Executive Summary Generator.

**Spatial Computing Division (6):** XR Interface Architect, macOS Spatial/Metal Engineer, XR Immersive Developer, XR Cockpit Interaction Specialist, visionOS Spatial Engineer, Terminal Integration Specialist.

**Specialized Division (~50):** Agents Orchestrator, LSP/Index Engineer, Sales Data Extraction Agent, Data Consolidation Agent, Report Distribution Agent, Agentic Identity & Trust Architect, Identity Graph Operator, Accounts Payable Agent, Cultural Intelligence Strategist, Developer Advocate, Model QA Specialist, ZK Steward, MCP Builder, Document Generator, Automation Governance Architect, Corporate Training Designer, Personal Growth Mentor, Government Digital Presales Consultant, Healthcare Marketing Compliance, Recruitment Specialist, Study Abroad Advisor, Supply Chain Strategist, Workflow Architect, Salesforce Architect, French Consulting Market Navigator, Korean Business Navigator, Civil Engineer, Customer Service, Healthcare Customer Service, Hospitality Guest Services, HR Onboarding, Language Translator, Legal Billing & Time Tracking, Legal Client Intake, Legal Document Review, Loan Officer Assistant, Real Estate Buyer & Seller, Retail Customer Returns, Business Strategist, Change Management Consultant, Chief of Staff, Customer Success Manager, Grant Writer, Medical Billing & Coding Specialist, Pricing Analyst, Chief Financial Officer, ESG & Sustainability Officer, Data Privacy Officer, Operations Manager, M&A Integration Manager, Organizational Psychologist, Strategy Duel Agent.

**Finance Division (5):** Bookkeeper & Controller, Financial Analyst, FP&A Analyst, Investment Researcher, Tax Strategist.

**Game Development Division (~24, incl. engine-specific subgroups):** cross-engine (Game Designer, Level Designer, Technical Artist, Game Audio Engineer, Narrative Designer); Unity (Architect, Shader Graph Artist, Multiplayer Engineer, Editor Tool Developer); Unreal (Systems Engineer, Technical Artist, Multiplayer Architect, World Builder); Godot (Gameplay Scripter, Multiplayer Engineer, Shader Developer); Blender (Addon Engineer); Roblox Studio (Systems Scripter, Experience Designer, Avatar Creator).

**Academic Division (5):** Anthropologist, Geographer, Historian, Narratologist, Psychologist.

**GIS Division (12):** Technical Consultant, Solution Engineer, GIS Analyst, Spatial Data Engineer, Geoprocessing Specialist, GIS QA Engineer, GeoAI/ML Engineer, BIM/GIS Specialist, 3D & Scene Developer, Spatial Data Scientist, Drone/Reality Mapping, Web GIS Developer, Cartography Designer.

**Relevance filter for this environment:** of the ~150+ agents above, the ones with direct bearing on a backend-Python-first, junior-developer, Debian/OpenCode learning path are concentrated almost entirely in **Engineering** (Backend Architect, Database Optimizer, Code Reviewer, Software Architect, Data Engineer, AI Engineer, DevOps Automator, Git Workflow Master, Codebase Onboarding Engineer), **Testing**, and **Security**. The other 13 divisions (Marketing, Sales, Paid Media, Finance, Game Development, GIS, Academic, most of Specialized) are out of scope for the stated goals and would be pure noise if installed wholesale.

#### Workflows [L1/L2 mixed — scenarios from README, orchestrator logic verified separately above]

Six named "real-world use case" pipelines are documented, each a fixed sequence of agent hand-offs (not code, but a documented human-readable process the orchestrator or a person can follow manually): Startup MVP build (Frontend Developer → Backend Architect → Growth Hacker → Rapid Prototyper → Reality Checker), Marketing Campaign Launch, Enterprise Feature Development, Paid Media Account Takeover, Full Agency Product Discovery (8 agents in parallel — a worked example exists in `examples/nexus-spatial-discovery.md`), Smart Campus Digital Twin (GIS+BIM chain).

---

### 3.2 multica

**Nature:** Not a persona library — Multica ships **no predefined specialist agent prompts**. It is a self-hosted (Docker Compose/Kubernetes/single binary) task-board and runtime-management platform that turns *your own* configured coding-agent CLIs (Claude Code, Codex, OpenCode, Cursor Agent, Gemini, and 8 others) into board-visible "teammates" with profiles, assigned issues, comments, and status. The atomic unit Multica adds is not an agent persona but a **coordination primitive**.

#### Orchestration [L2 — verified from official docs pages: Squads, Assigning Issues]

- **Squads** — a named group of agents (and optionally humans) with one designated **leader agent**. The squad itself is a first-class assignee.
  - **Flow:** issue assigned to squad → leader agent claims the task on its next runtime poll → leader posts **one** delegation comment that `@`-mentions the chosen member(s) using exact roster mention-markdown, which itself triggers a new task for each mentioned agent → leader logs its evaluation via `multica squad activity <issue-id> action --reason "..."` (written to the issue's activity timeline for human auditability) → **leader stops** — it does not implement anything itself → when the delegated member posts an update, the leader is re-triggered to read it and either delegate the next step, escalate, or stay silent.
  - **Hard-coded "Squad Operating Protocol"**: on every leader run, three instruction blocks are appended automatically to the leader's prompt (verified from source: a fixed protocol block, delegation-terseness rule — "don't restate the issue body, the assignee can read it" — and the evaluation-logging requirement).
  - **Backlog exception:** if an issue sits in the Backlog status, the leader is *not* triggered (same rule as direct agent assignment) — Backlog is explicitly a non-triggering parking lot.
- **Autopilots** — scheduled/triggered recurring work. Cron triggers, webhooks, or manual runs each auto-create an issue and route it to an agent (or squad) automatically. As of the most recent changelog entries, Autopilots have a permission layer (View/Write) and a "Manage Access" delegation dialog for granting specific workspace members write access.
- **Task lifecycle (state machine):** enqueue → claim → start → complete/fail, streamed in real time over WebSocket. "Auto retry" is scoped specifically to infrastructure failures (runtime offline, timeout) — not logic/quality retries the way agency-agents' orchestrator does them.
- **Trigger paths (4 total, per official docs):** direct agent assignment, squad assignment (routes to the leader), Chat (1:1 conversation outside any issue), Autopilot (scheduled).

#### Agents & Sub-agents

None shipped. The "agent" in Multica is always a wrapper around a user-supplied CLI runtime (auto-detected: Antigravity, Claude Code, Codex, Cursor, Copilot, Gemini, Hermes, Kimi, Kiro CLI, OpenCode, OpenClaw, Pi, Trae, Qoder CLI). Multica's own value-add is the **Skills** concept (reusable, importable `.skill`/`.zip` procedure bundles agents can invoke — compounding capability across runs) and the coordination layer above, not a persona catalog.

#### Workflows

- **Assign-an-issue flow** (documented, L2): pick an agent or squad from the assignee picker (lists all workspace members, all non-archived agents, all non-archived squads) → issue becomes the official assignee's responsibility → agent can read full issue context (description + all comments) and change status/post comments/edit fields.
- **Comment-routing cascade** (mentioned in changelog, not fully detailed in fetched material): a rewritten end-to-end system so that parent-chain `@`-mentions, agent-authored replies, and squad-leader fallback all flow through one tested cascade — flagged here as a real but only partially observed piece of orchestration logic (full source not fetched).

---

### 3.3 ruflo

**Nature:** The largest and most complex source in this phase — an "agent meta-harness" (formerly Claude Flow) wrapping Claude Code and Codex with 100+ agents, a swarm-coordination engine, self-learning memory, cross-machine agent federation, and a Goal-Oriented Action Planning (GOAP) front-end. Two install paths exist with materially different footprints (documented explicitly in the README, not inferred):

| | Claude Code Plugin path | Full CLI path (`npx ruflo init`) |
|---|---|---|
| Gives you | Slash commands + a few skills + agent defs per plugin | 98 agents, 60+ commands, 30 skills, MCP server, hooks, daemon |
| Workspace files | Zero | `.claude/`, `.claude-flow/`, `CLAUDE.md`, helpers |
| MCP server registered | No | Yes |

#### ⚠️ Security note [L2 — verified from GitHub release page]

The most recent release at research time, **v3.16.3 (July 1, 2026)**, is explicitly labeled a **security release** patching **GHSA-c4hm-4h84-2cf3**, described in the release title as an "ADR-166 MCP bridge RCE" (remote code execution in the MCP bridge component). This is a confirmed, recent, critical-class vulnerability in a core communication path of the tool — not a hypothetical concern. Any evaluation of Ruflo must treat this as a first-class fact: the fix is out, but the existence of an RCE in the MCP bridge (which is exactly the channel used for agent/tool coordination) is a strong signal about the attack surface that comes with this level of feature scope.

#### Orchestration [L2 — verified from README architecture diagrams and feature tables]

```
User → Claude Code / CLI
       ↓
  Orchestration Layer (MCP Server, Router, 27 Hooks)
       ↓
  Swarm Coordination (Queen, Topology, Consensus)
       ↓
  100+ Specialized Agents (coder, tester, reviewer, architect, security...)
       ↓
  Memory & Learning (AgentDB, HNSW, SONA, ReasoningBank)
       ↓
  LLM Providers (Claude, GPT, Gemini, Cohere, Ollama)
```

- **Swarm topologies:** hierarchical, mesh, and adaptive, with a "Queen-led hierarchy" using Raft, Byzantine, or Gossip consensus protocols (named explicitly in the "Claude Code Alone vs + Ruflo" comparison table).
- **Self-learning layer:** SONA neural patterns, ReasoningBank, trajectory learning; vector memory via AgentDB with HNSW indexing (benchmarked in-repo at ~1.9×–4.7× faster than brute-force search above a stated crossover N, with a published audit doc and benchmark script for reproduction).
- **Background workers:** 12 auto-triggered workers (audit, optimize, testgaps, etc. — only 3 named explicitly in the source fetched).
- **Agent Federation** ("Slack for agents") — the most architecturally distinct piece: agents on different machines/orgs discover, mutually authenticate (mTLS + ed25519 challenge-response), and exchange work across trust boundaries. A 14-type PII-detection pipeline scans every outbound message with per-trust-level policy (BLOCK/REDACT/HASH/PASS). Behavioral trust scoring is a documented formula: `0.4×success + 0.2×uptime + 0.2×threat + 0.2×integrity`, with instant downgrade on misbehavior and no human-in-the-loop required for that downgrade. 9 MCP tools + 10 CLI commands implement the full lifecycle (`federation_init`, `federation_send`, `federation_trust`, `federation_audit`, etc.).
- **MetaHarness** — a self-audit tool: grades a given agent setup 1–100, scans tool configs for security issues, snapshots a project to detect regressions between runs, and can `ruflo eject` a project into a standalone, independently-named agent toolkit.
- **Goal Planner (GOAP)** — hosted at `goal.ruv.io`: plain-English goal → decomposed preconditions/actions → A* search through state space → dispatch to live agents, with adaptive replanning on failure (re-runs A* rather than restarting) and a visual plan tree.

#### Agents & Sub-agents

**Not individually enumerable from the material fetched.** The README states "100+ Specialized Agents" and names only five illustrative categories inline: *coder, tester, reviewer, architect, security*. No roster file equivalent to agency-agents' README table was found in the fetched pages. **Flag for a targeted follow-up** if the user wants Ruflo's actual agent roster catalogued — this would require fetching the `.agents/` directory contents directly, which was not done in this pass.

#### Workflows

- **Plugin marketplace** — 35 native plugins across 9 categories: Core & Orchestration (`ruflo-core`, `ruflo-swarm`, `ruflo-autopilot`, `ruflo-loop-workers`, `ruflo-workflows`, `ruflo-federation`), Memory & Knowledge (5 plugins), Intelligence & Learning (5), Code Quality & Testing (4, incl. `ruflo-browser` for Playwright-driven browser testing and `ruflo-jujutsu` for git-diff risk scoring), Security & Compliance (`ruflo-security-audit`, `ruflo-aidefence` — prompt-injection blocking/PII detection), Architecture & Methodology (`ruflo-adr`, `ruflo-ddd`, `ruflo-sparc` — a guided 5-phase methodology with quality gates, `ruflo-metaharness`, `ruflo-arena` — competitive agent-strategy tournaments), DevOps & Observability (3), Extensibility (2), Domain-Specific (3, including a neural-trader plugin with 112+ tools).
- **Hooks system:** 27 hooks route tasks and coordinate agents automatically in the background after `init`, without the user needing to learn the full 314-MCP-tool / 26-CLI-command surface directly.

---

### 3.4 the-architect

**Nature:** A single meta-agent, distributed as a Claude-Code project folder (not a plugin/skill) — you `git clone` it, `cd` in, and run `claude`; the project's own `CLAUDE.md` loads and Claude *becomes* The Architect for that session. No slash command exists; invocation is natural language.

#### Agents & Sub-agents [L2 — verified from README + tododeia guide, cross-confirmed by two independent sources]

- **Name:** The Architect
- **Responsibility:** Turns a one-line project idea into a complete, Claude-Code-buildable software blueprint.
- **Behavior/prompt logic (confirmed structure):**
  1. Asks 2–3 initial questions to classify the idea into one of **6 project archetypes** (SaaS, marketing site, mobile app, API, internal tool, content platform).
  2. Runs a **4-phase interview**: Discovery → Deep Dive → Architecture → Generate, asking archetype-specific questions in the Deep Dive phase (e.g., "Do you need user accounts? Payments? Real-time features?").
  3. Uses auxiliary Claude Code skills mid-design: `/deep-research` for best-practice research, `/ui-ux-pro-max` for a full visual system (colors, fonts, spacing) on frontend-having projects.
  4. Presents a complete tech-stack recommendation with reasoning per decision, for user confirmation/adjustment.
  5. Produces a single output file, `BLUEPRINT.md`, with **16 sections** (tech stack, DB schema, API routes, component hierarchy, build order, visual system, deploy target, etc.) — Section 9 (Build Order) is called out as the most important, since it's what lets a second, fresh Claude Code instance build the whole project without asking further questions.
  - **Shortcut mode:** the literal phrase `Just build it.` skips the interview and goes straight to a blueprint using reasonable defaults.
- **Source repo:** `Hainrixz/the-architect`

#### Workflows

Single linear workflow: `idea → 4-phase interview (or shortcut) → BLUEPRINT.md → (separate session) Claude Code reads BLUEPRINT.md and builds`. No orchestration engine, no persistent state beyond the one output file.

---

### 3.5 cyber-neo

**Nature:** A Claude Code **skill** (has a formal `.claude-plugin/` manifest) that performs a one-shot, point-in-time security audit of a target project directory — not a running service.

#### Agents & Sub-agents [L2 — verified, cross-confirmed by GitHub README + tododeia guide, with one figure discrepancy noted below]

- **Name:** Cyber Neo (top-level skill/agent)
- **Responsibility:** Comprehensive security audit — SAST, SCA (dependency CVEs), secrets detection, auth/authz flaw detection, crypto weakness detection, IaC/CI-CD misconfiguration, supply-chain risk.
- **Behavior (confirmed structure):**
  - GitHub README describes an internal **7-phase analysis pipeline** covering **11 security domains**, mapped to CVSS severities (Critical 9.0–10.0 → Info 0.0–0.9), all 10 OWASP 2025 Top 10 categories (including the two new 2025 entries: A03 Software Supply Chain Failures, A10 Mishandling of Exceptional Conditions), and 15+ CWE Top 25 (2025) items.
  - The independent tododeia community guide describes the same tool's *practical execution* as **5 subagents launched in parallel**, each covering one broader layer: exposed secrets, vulnerable dependencies, infrastructure issues, supply chain, and configuration. *(Both figures are reported here as found — 11 fine-grained "domains" analyzed, operationalized through 5 parallel subagent processes; this is not a contradiction, just two levels of granularity from two sources.)*
  - Optionally shells out to external tools if present (Semgrep, Trivy, Gitleaks, pip-audit, cargo-audit) but works standalone via Claude-native pattern analysis if none are installed.
  - Adapts scan depth to project size (full scan vs. a "critical-path scan" focused on entry points/auth/config/deps, always reporting a coverage percentage of files scanned vs. skipped).
  - Output: a static, prioritized Markdown report written to `~/Desktop/cyber-neo-report-{project}-{date}.md`. Constraints on findings (severity thresholds, no speculative flags) are enforced "at the top level AND in every subagent prompt" per the README — i.e., the anti-noise rules are duplicated into each subagent's own prompt, not just a top-level filter.
- **Source repo:** `Hainrixz/cyber-neo`

#### Workflows

`/cyber-neo <path>` (or natural-language equivalent) → 5 parallel subagent scans → consolidated, severity-ranked report on Desktop → (manual or Claude-assisted) fix pass, re-run to confirm resolution. No persistent daemon; each run is independent.

---

### 3.6 all-deploy

**Nature:** A flat Claude Code skill (`SKILL.md` at repo root, no `.claude-plugin/` folder) that deploys a local project to a live host. **This is the least mature source in this phase** (2 stars, 1 fork, 7 commits, single v0.1.0 release dated April 19, 2026, two contributors listed — the human author and a "claude" co-author account) — flagged prominently per the protocol's maturity-evaluation requirement.

#### Agents & Sub-agents [L2 — verified from GitHub README, bilingual EN/ES]

- **Name:** `/all-deploy` (single skill, no internal subagent decomposition documented)
- **Responsibility:** Take a project from "runs on my laptop" to "live on the internet," safely.
- **Behavior — 6-phase pipeline (confirmed):**
  1. **Detect** — identifies framework (Next.js, FastAPI, Docker, static site, etc.).
  2. **Audit** — checks for leaked secrets, missing config, vulnerable dependencies, other deploy blockers.
  3. **Select host** — Vercel (Next/Vite/Astro/Remix/Nuxt/SvelteKit/static), Railway (FastAPI/Flask/Express/Python workers/MCP HTTP servers), Docker+SSH VPS (self-hosted/stateful/multi-service compose stacks), or a `cloudflared` tunnel (local exposure/demos).
  4. **Deploy preview** — deploys a preview build and `curl`s the URL to confirm the app actually responds before doing anything further.
  5. **Promote** — promotes to production only after a green preview, with a 5-second ESC-to-cancel window (full-auto mode) or an explicit "yes" (step-by-step mode).
  6. **Hand off rollback/log commands** — gives the user the exact commands needed if something breaks later, rather than hiding them in a wrapper.
- **8 hard, non-negotiable safety rules (verbatim structure, paraphrased):** never bypass the audit; never promote to prod before a green preview; never print/log/commit secrets; never auto-install or auto-login CLIs (always hands the user the exact command instead); never hide deploy commands inside wrapper scripts; never modify code without showing the diff first; never deploy from a dirty git tree without explicit permission; "wait" always wins — any hesitation aborts the run.
- **Run-locally mode:** runs the same audit, then starts the app locally, optionally exposed via a `cloudflared` tunnel.
- **Source repo:** `Hainrixz/all-deploy`

#### Workflows

`/all-deploy [auto|step|local]` or natural-language triggers ("deploy this", "ship this") → the 6-phase pipeline above. No orchestration engine; single linear skill invocation per run.

---

### 3.7 trifecta perfecta (documented meta-workflow, not a repository)

**Nature:** A community guide (tododeia.com, May 2026) documenting how to chain the three Hainrixz tools above into one coherent lifecycle. It is not installable as a unit — installing it means installing the three underlying tools and following the documented order.

#### Workflow [L2 — verified, full guide read]

**5-step chained flow:**
1. **Design** with The Architect → produces `BLUEPRINT.md`.
2. **Build** — start a *separate* fresh Claude Code session in a new project folder, feed it `BLUEPRINT.md`, and have it build step by step, validating each milestone.
3. **Audit** with Cyber Neo (`/cyber-neo .`) once a major milestone is reached — explicitly *before* touching deploy.
4. **Fix** — hand Claude the audit report path and have it resolve Critical/High findings first, explaining changes before touching code.
5. **Publish** with All Deploy (`/all-deploy` interactive first run, `/all-deploy auto` afterward).

**Orchestration note:** there is no software orchestrator here — the "orchestration" is entirely procedural/human-mediated documentation, explicitly justified as "each tool does one thing well, and they run in order without stepping on each other."

**Explicit anti-patterns (4, verbatim structure, paraphrased) — notably rigorous for a promotional community guide:**
1. Skip The Architect if the team already has detailed specs — its interview phases become redundant overhead.
2. Skip the whole trifecta for disposable one-off scripts — three lifecycle phases are overkill for something you'll run once and delete.
3. Skip All Deploy if the team already has CI/CD on managed infrastructure (e.g., Kubernetes) — it may fight the existing pipeline; use Cyber Neo alone at the pre-merge review stage instead.
4. The whole pattern only applies inside Claude Code — if the actual daily driver is Cursor/Copilot/other, only the *conceptual* pattern (design → security → deploy) transfers, not the tools themselves.

---

## 4. Comparisons

**agency-agents vs. Ruflo vs. Multica — as "agent sources," these are not substitutable for each other and should not be compared head-to-head as if solving the same problem:** agency-agents supplies static *prompt content* (personas) with zero runtime; Ruflo supplies a runtime *and* its own large agent set; Multica supplies a runtime with **no** agent set of its own, wrapping whatever the user already has. A coherent stack could plausibly use agency-agents' Engineering-division personas *as the agent definitions* loaded into a harness, while treating Multica/Ruflo as separate, mutually exclusive choices for *how work gets assigned and coordinated* — adopting both Multica and Ruflo together would be genuine redundancy (both solve "coordinate agents across a team/machines") and should not happen per the protocol's "avoid unnecessary redundancy" rule.

**Multica vs. Ruflo head-to-head (both solve agent-coordination-at-scale):** Multica is scoped to human+agent *team* coordination (task board, assignees, Squads) and is comparatively lighter (Go binary + Docker Compose, Apache 2.0, no federation/swarm/consensus machinery). Ruflo is scoped to *agent-swarm* coordination with far more machinery (consensus protocols, cross-machine federation, self-learning memory, a goal planner) and correspondingly more attack surface — concretely evidenced by the recent MCP-bridge RCE. For a solo student environment with no team and no multi-machine federation need, **neither is currently justified**, but if forced to pick one for future team-scale use, Multica's smaller, more legible footprint is the safer starting point; Ruflo's swarm/GOAP capabilities are genuinely more advanced but arrive with genuinely more risk and complexity than the stated design principles want.

**the-architect vs. Superpowers' `brainstorming` skill (from RPT-001) — same problem, different tools:** both exist to turn a vague idea into a validated, structured plan before code is written. The Architect is Claude-Code-only, produces a single static blueprint file, and is not enforcement-based (nothing stops you from ignoring the blueprint). Superpowers' brainstorming skill is one stage of a *continuously enforced* pipeline (worktree → plan → TDD → review) across more harnesses including OpenCode. Per the protocol's redundancy rule, these should not both be adopted as the project's "planning phase" tool — pick one. Given OpenCode is the primary platform and Superpowers is already the Phase-1 foundation-layer recommendation, The Architect is the weaker fit unless its concrete `BLUEPRINT.md` artifact format is specifically wanted for its own sake.

**cyber-neo vs. `claude-code-security-review`** (the latter is queued for Phase 5/Utilities in `research-roadmap.md`) **— flagged, not resolved:** both are security-scanning tools for Claude Code; a direct comparison is deferred to when `claude-code-security-review` is actually researched, per the protocol's "compare directly, recommend only the strongest unless they complement" rule. Do not treat this report's Optional/Recommended calls on cyber-neo below as final.

---

## 5. Compatibility Matrix

| | OpenCode (primary) | Claude Code | Codex CLI/App | Gemini CLI | Cursor |
|---|---|---|---|---|---|
| **agency-agents** | Supported via installer (`--tool opencode`); **capped by an upstream OpenCode bug at ~119 registered agents** — selective `--division` install required | Native/primary | Supported | Supported | Supported |
| **multica** | Auto-detected runtime (12 supported tools incl. OpenCode) | Auto-detected | Auto-detected | Supported | Auto-detected |
| **ruflo** | Not listed among Ruflo's own named harnesses in the fetched material (Claude Code and Codex are the two explicitly designed-for targets; other integrations exist via generic MCP) | Native/primary, deepest integration | Native (App + CLI) | Multi-provider routing supported at the LLM layer, not confirmed as a first-class CLI harness target | Not confirmed in fetched material |
| **the-architect** | Not applicable — Claude-Code-only project folder | Native/only target | No | No | No |
| **cyber-neo** | Not applicable — Claude Code skill only | Native/only target | No | No | No |
| **all-deploy** | Not applicable — Claude Code skill only | Native/only target | No | No | No |
| **trifecta perfecta** | Not applicable (inherits the-architect/cyber-neo/all-deploy's Claude-Code-only scope) | Native/only target | No | No | No |

**Provider independence note:** the three Hainrixz tools and trifecta perfecta are **not** provider-independent — they are Claude-Code-exclusive by design, which is a direct tension with `research-environment.md`'s "provider independence" and "cross-platform compatibility" preferences (ranked #1–2 in Research Preferences). This does not disqualify them, but it does mean their value is scoped to whichever sessions happen to run in Claude Code specifically, not the OpenCode-primary daily driver.

---

## 6. Missing Capabilities (Agent-Layer)

1. **No source in this phase ships a ready-made, small, backend/Python-focused agent set matched to the actual current curriculum stage** (functions, scope, dictionaries). agency-agents' Engineering division is the closest fit but is bundled inside 150+ mostly-irrelevant peers; none of the seven sources offer a pre-scoped "junior backend Python" agent subset.
2. **No agent-layer source addresses "Automatic Agent installation" as a validated, idempotent bootstrap step** the way `research-environment.md`'s "Planned Automation" section wants — agency-agents' installer is the closest (has `--dry-run`, division filters) but is still a manual invocation, not part of a `bootstrap.sh` chain.
3. **Ruflo's agent roster itself remains an open research gap** (see 3.3) — if Ruflo is ever reconsidered, the `.agents/` directory needs a dedicated follow-up pass before any per-agent adoption decision can be made.
4. **No source in this phase, including agency-agents, ships subagents oriented toward Data Analytics/ML** beyond the single generic `engineering-ai-engineer` agent — consistent with the same gap already flagged in RPT-001 §6.3.

---

## 7. Recommended Stack (Agent Layer Only)

| Resource | Decision | Justification (condensed) |
|---|---|---|
| **agency-agents** | **Optional — selective install only** (Engineering + Testing + Security divisions) | Real, high-quality persona content directly relevant to the backend/junior-dev track; but 13 of 16 divisions are noise for this environment, and a full install would silently exceed OpenCode's ~119-agent runtime cap. Never install `--tool opencode` without a `--division` filter. |
| **multica** | **Not Recommended** (for current solo-developer scale) | Solves multi-human+agent team coordination the user does not have. Self-hosted multi-service footprint (Go backend, DB, web dashboard) is disproportionate to a 10–15 hr/week solo learner. The Squads leader-delegation *pattern* is worth preserving as a documented design reference (per `research-goals.md`'s "preserve reusable workflows"), even though the platform is not adopted. |
| **ruflo** | **Not Recommended** (at this time) | Extreme scope (100+ agents, swarm consensus, cross-machine federation, GOAP planner) directly conflicts with "avoid over-engineering"/"avoid unnecessary complexity," compounded by a just-patched critical RCE in its MCP bridge (GHSA-c4hm-4h84-2cf3). If ever reconsidered, only the minimal `ruflo-core` plugin path (zero workspace files, no MCP server registered) should be evaluated first, and only after the security track record since v3.16.3 is longer. |
| **the-architect** | **Optional** | Small, low-dependency, MIT, directly matches the "Specification Driven Development" long-term goal. Genuinely redundant with Superpowers' `brainstorming` skill (already Phase-1-recommended) — pick one, don't run both as the default planning step. |
| **cyber-neo** | **Optional, pending Phase 5 comparison** | Small, focused, no daemon, real OWASP/CWE mapping, directly matches the "Code review" long-term goal and the "Additional MCP/Skill" security gap. Final call deferred until compared against `claude-code-security-review` in the Utilities phase, per the protocol's direct-comparison rule. |
| **all-deploy** | **Optional, low priority** | Functionally sound (explicit 8-rule safety model, preview-before-prod, auto-rollback) but the least mature source in this entire report (2 stars, 7 commits, one release) — revisit once it accumulates a track record. The safety-rule *pattern* (never bypass audit, dirty-tree guard, hesitation-aborts) is worth preserving regardless of the tool's own adoption status. |
| **trifecta perfecta** | **Recommended as a documentation/methodology reference**, contingent on its components | Not an installable resource — its value is the explicit, honest anti-pattern section, which models exactly the kind of "when NOT to use this" rigor `research-goals.md` wants preserved. Its practical adoption is bounded by whatever happens to the-architect/cyber-neo/all-deploy above. |

---

## 8. Rejected Resources

| Resource | Status | Reason |
|---|---|---|
| ruflo — full CLI install path (`npx ruflo init`, 98 agents, MCP server, daemon) | **Rejected as a mode of adoption** (the project is not permanently rejected, see §7) | Scope and just-patched RCE history are incompatible with current risk tolerance and stated simplicity principles. |
| multica — self-hosted platform adoption | **Rejected for now** | Solves a team-coordination problem that does not exist yet in this environment; revisit if/when the project moves from solo to team context. |
| agency-agents — non-Engineering/Testing/Security divisions (13 of 16) | **Rejected from any install** | Irrelevant to stated learning goals (Marketing, Sales, Finance, Game Dev, GIS, Academic, most of Specialized); installing them would also risk hitting OpenCode's agent-count cap for no benefit. |

---

## 9. Preliminary Adoption Notes (Not a Final Roadmap)

Per Incremental Research Mode, final adoption decisions are deferred to `RPT-999-final-recommendation.md` after Skills, Plugins, MCP Servers, and Utilities are researched. Forward notes for those phases:

- Phase 3 (Skills) should treat **cyber-neo** and **all-deploy** as skill-shaped resources even though they were researched here as "agents" per the roadmap's source list — both are literally distributed as Claude Code skills, and Phase 3's `skills.sh` catalog research should check for overlapping/competing entries before any final skill-layer recommendation.
- Phase 4 (Plugins) should check whether any of Ruflo's 35 plugins (particularly `ruflo-security-audit` or `ruflo-aidefence`) could be adopted **individually** via the lite Claude-Code-Plugin install path without pulling in the full daemon/federation stack — this would meaningfully change the §7 "Not Recommended" call on Ruflo if a genuinely minimal, security-vetted subset turns out to be installable in isolation.
- Phase 5 (Utilities) must directly compare cyber-neo against `claude-code-security-review` before either gets a final recommendation, per §4.
- The Final Phase should reconcile agency-agents' Engineering-division picks against whatever Skills-phase sources (`karpathy-skills`, `caveman`, `prompt-master`) turn out to overlap with — persona-level agent behavior and skill-level procedural guidance can duplicate each other if not checked.

---

## 10. Final Conclusions

This phase surfaced a much wider spread of architectural maturity than Phase 1's ecosystems did. At one end, a single-maintainer, 2-star, 7-commit skill (all-deploy) sits honestly alongside a 62.8K-star, 7,096-commit meta-harness (ruflo) that just patched a remote-code-execution vulnerability in its coordination layer — both were investigated with the same rigor, and both get a measured, evidence-based call rather than a popularity-driven one.

The clearest, lowest-risk value in this batch is **not** the biggest projects: it's (a) a carefully filtered slice of agency-agents' Engineering-division personas, (b) cyber-neo as a candidate security-audit skill pending one more direct comparison, and (c) the trifecta-perfecta guide's documented discipline of naming its own anti-patterns — a habit worth carrying into this project's own knowledge base regardless of which specific tools are ultimately adopted. Multica and Ruflo, despite being the most technically impressive engineering in this batch, are both currently oversized for a solo, 10–15 hr/week, OpenCode-primary learning environment, and Ruflo carries a concrete, recent security fact that should weigh into any future reconsideration.

This conclusion is provisional at the agent layer and will be revisited once Skills, Plugins, and MCP Servers are researched, per the roadmap.

---

## Sources Consulted

- https://github.com/msitarzewski/agency-agents (README, full roster tables)
- https://github.com/msitarzewski/agency-agents/blob/main/specialized/agents-orchestrator.md (full file)
- https://github.com/multica-ai/multica (README)
- https://github.com/multica-ai/multica/releases
- https://multica.ai/ , https://multica.ai/docs/squads , https://multica.ai/docs/assigning-issues , https://multica.ai/changelog
- https://www.arunbaby.com/ai-agents/0089-multica-agents-as-teammates/
- https://codepick.dev/en/guides/multica-ai-intro/
- https://github.com/ruvnet/ruflo (README, releases page)
- https://github.com/Hainrixz/the-architect (README)
- https://github.com/Hainrixz/cyber-neo (README)
- https://github.com/Hainrixz/all-deploy (README)
- https://www.tododeia.com/community/trifecta-perfecta (full guide)

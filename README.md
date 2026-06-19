# Idea Lab

A structured workspace for generating, validating, and graduating ideas — before a single line of production code is written.

This repo is **pre-product**. Nothing here ships. What lives here are documents, analyses, models, and decisions. When an idea survives this process and is ready to build, it graduates to its own dedicated repository with a complete handoff package.

---

## Why this repo exists

Most ideas die in the wrong place — either killed too early in a chat thread with no record kept, or killed too late after weeks of building the wrong thing. This repo sits in the middle: a shared space where you and your collaborator can take an idea seriously without committing to it prematurely.

The workflow is opinionated on purpose. Every idea goes through the same pipeline. Nothing skips stages. The agent enforces this.

---

## How to use it

### The agent does the heavy lifting

This repo is wired for [Antigravity CLI](https://antigravity.google) (`agy`). Open the repo in your terminal and just talk to it:

```
"I have a new idea — [describe it]"
"Run feasibility on the pickpic idea"
"Do these two ideas work together?"
"What should we work on today?"
"Is the blast-radius idea ready to graduate?"
```

The agent reads `AGENTS.md` and the skills in `.agents/skills/` and knows exactly what to do. You don't invoke skills by name — just describe what you want and it picks the right one. For multi-step work (e.g. "run the full pipeline on this idea"), it spawns parallel subagents automatically via the `orchestrator` skill.

### The one rule to remember

After every session, glance at the `status.md` in the idea folder you worked on. That's the single source of truth for where each idea stands. If it's stale, ask the agent to update it.

---

## Repo structure

```
/
├── README.md               ← you are here
├── AGENTS.md               ← agent instructions (don't edit unless you know what you're doing)
├── .agents/
│   └── skills/             ← all 13 skills loaded by the agent
├── ideas/                  ← one folder per idea
│   └── [idea-name]/
│       ├── README.md       ← idea brief: what it is, who it's for, key assumptions
│       ├── feasibility.md  ← technical + market + operational verdict
│       ├── profitability.md← unit economics, pricing model, break-even
│       ├── synthesis.md    ← how this idea relates to others (if applicable)
│       ├── roadmap.md      ← feature list, dependency map, critical path, phases
│       └── status.md       ← current stage + decision log
├── combined/               ← cross-idea synthesis documents
├── templates/              ← blank versions of each doc type
└── archive/
    ├── killed/             ← ideas that were explicitly ruled out (with reasons)
    └── graduated/          ← ideas that moved to their own repo
```

---

## The idea lifecycle

Every idea moves through six stages. The agent tracks stage in `status.md` and will tell you what's missing before letting an idea move forward.

```
Seed → Analysis → Synthesis → Roadmap → Graduated
                                       ↘ Archived
```

### 🌱 Stage 1 — Seed
**What happens:** The idea gets captured into a structured brief.

**Inputs:** Anything — a voice note transcription, a bullet dump, one sentence, a paragraph.

**Output:** `ideas/[name]/README.md` containing:
- One-liner (≤ 20 words)
- Problem being solved
- Proposed solution
- Target user (primary + secondary)
- Key assumptions that would kill the idea if wrong
- MVP scope
- What's explicitly out of scope for v1
- Open questions

**How to trigger:** Just describe the idea. "I have an idea for X" is enough.

---

### 🔬 Stage 2 — Analysis
**What happens:** The idea gets stress-tested from three angles simultaneously.

**Skills activated (in parallel subagents):**
- `feasibility-analysis` — Can this actually be built? Does a market exist? What are the blockers?
- `market-researcher` — Real competitor data, TAM estimates, pricing benchmarks pulled from the web
- `assumption-challenger` — Adversarial review: what are the 5 most dangerous assumptions and how do you validate them cheaply?
- `profitability-modeling` — Unit economics: pricing model, CAC, LTV, margins, break-even timeline

**Output:** Three files — `feasibility.md`, `profitability.md`, and an assumption stress-test appended to `feasibility.md`. Each has a direct verdict (🟢 / 🟡 / 🔴) with reasoning.

**Gate:** A 🔴 feasibility verdict means the idea is paused until the blocking issue is resolved or the idea is archived. The agent will tell you what needs to change.

**How to trigger:** "Run analysis on [idea name]" or "Is [idea] feasible?" after the README exists.

---

### 🔗 Stage 3 — Synthesis
**What happens:** The idea is checked against everything else in the repo.

**Skills activated:**
- `idea-connector` — Scans all existing `ideas/*/README.md` files to find shared users, shared infrastructure, flywheels, overlaps, or conflicts
- `idea-synthesis` — If a strong connection is found, produces a full compatibility analysis: can they share infrastructure? Should one come first? Should they merge?

**Output:** Either a note in `synthesis.md` ("no significant connections found") or a full cross-idea document in `/combined/[idea-a]--[idea-b]-synthesis.md` covering integration architecture, rollout sequencing, and a merge/separate decision.

**This stage is optional for your first idea** — it only matters once you have two or more ideas in the repo. It becomes critical before committing to a roadmap, because it can save you from building the same thing twice or missing a flywheel.

**How to trigger:** "Do these ideas work together?" or "Check [idea] against everything else we have."

---

### 🗺️ Stage 4 — Roadmap
**What happens:** The idea gets broken into buildable pieces in the right order.

**Output:** `roadmap.md` containing:
- Complete feature inventory (every feature the full product would ever have)
- MVP classification (what's must-have vs nice-to-have vs future vs killed)
- Dependency map as an ASCII tree (what blocks what)
- Critical path (shortest route to a shippable MVP with time estimates)
- Phased rollout plan (Phase 0: foundation → Phase 1: MVP → Phase 2: v1.0)
- Algorithm/technical sketches for any non-obvious logic
- Open questions that must be answered before building starts

**How to trigger:** "Build the roadmap for [idea]" or "What do we build first for [idea]?"

---

### 🚀 Stage 5 — Graduation
**What happens:** The idea moves to its own dedicated build repository. Graduation is a four-step pipeline run by the `repo-graduation` skill — it won't let you rush through.

**Step 1 — Checklist:** Every item below must pass. One ❌ stops the process.
- README with clear one-liner and target user ✓
- Feasibility verdict 🟢 or 🟡 with mitigations for all 🔴 risks ✓
- Profitability model with LTV:CAC > 3:1 or path to it ✓
- Feature inventory complete, MVP scope locked ✓
- Dependency map and critical path drawn ✓
- Phase 0 tasks specific enough to assign tomorrow ✓
- Both collaborators explicitly agree to build ✓

**Step 2 — Vision doc:** The `graduation-vision` skill reads all idea files and synthesizes them into `vision.md` — the canonical document defining the product's features, design principles, success metrics, competitive positioning, and what it explicitly is not. **Human-validated before proceeding.**

**Step 3 — Blueprint + Bootstrap:** The `graduation-blueprint` skill generates two things:
- `agents-blueprint.md` — every agent and skill the build repo needs, with rationale and spec for each, derived from the roadmap's feature areas and tech stack
- `bootstrap.sh` — a fully populated shell script. Run it once and the new repo exists: correct folder structure for the tech stack, `AGENTS.md` written, all skills scaffolded with real content, graduation docs copied to `docs/`, ADR files for every key decision, `.env.example` with every external dependency, initial git commit done.

**Step 4 — Archive:** Idea folder moves to `/archive/graduated/[name]/`. `status.md` updated. Done.

**How to trigger:** "Is [idea] ready to graduate?" or "Graduate [idea]."

**To bootstrap the new repo after graduation:**
```bash
bash archive/graduated/[idea-name]/bootstrap.sh
# or to a custom path:
bash archive/graduated/[idea-name]/bootstrap.sh ~/projects/my-product
```

---

### 📦 Stage 6 — Archived
**What happens:** An idea is parked or killed — with the reason documented.

Ideas go here when:
- Feasibility is 🔴 and the blocking issue can't be fixed without a major pivot
- The profitability model doesn't close and no pricing adjustment fixes it
- A better idea cannibalizes this one
- The team loses conviction
- The idea merges into another idea

The idea folder moves to `/archive/killed/[name]/` with a final `status.md` entry explaining the decision. It's never deleted — "killed" ideas are valuable reference for what not to revisit.

---

## What the skills do

| Skill | What it does | Runs as |
|---|---|---|
| `orchestrator` | Detects multi-step work and fans it out into parallel subagents automatically | Main context |
| `idea-capture` | Turns any raw input into a structured idea brief | Inline |
| `feasibility-analysis` | Technical + market + operational verdict with 🟢/🟡/🔴 rating | Subagent |
| `market-researcher` | Pulls real competitor data, TAM estimates, and pricing from the web | Subagent |
| `assumption-challenger` | Finds the 5 most dangerous hidden assumptions and how to validate them cheaply | Subagent |
| `profitability-modeling` | Unit economics: pricing, CAC, LTV, margins, break-even | Inline |
| `idea-connector` | Scans all ideas in the repo for connections to a target idea | Subagent |
| `idea-synthesis` | Compatibility analysis and integration/merge decision for two or more ideas | Inline |
| `feature-roadmapping` | Feature inventory, dependency map, critical path, phased rollout | Inline |
| `status-reporter` | Dashboard of all ideas: stage, blockers, suggested focus | Subagent |
| `repo-graduation` | Runs the full 4-step graduation pipeline — orchestrates the two skills below | Inline |
| `graduation-vision` | Synthesizes all idea docs into a canonical product vision document | Subagent (spawned by graduation) |
| `graduation-blueprint` | Generates the agents/skills spec + a runnable `bootstrap.sh` for the new repo | Subagent (spawned by graduation) |

---

## Example sessions

**Starting a new idea from scratch:**
> "I've been thinking about a marketplace where people can buy and sell handmade electronics components. The main problem is that existing platforms like Etsy aren't technical enough and AliExpress isn't curated."

The agent captures this into `ideas/electronics-components-marketplace/README.md`, fills in what it can infer, marks the rest as TBD, and tells you what to answer next.

---

**Running a full analysis:**
> "Run the full pipeline on the electronics-components-marketplace idea."

The `orchestrator` skill kicks in. It spawns three subagents in parallel: one does market research (real competitor data, TAM), one challenges the assumptions, one checks for connections to other ideas in the repo. While they run, the agent starts feasibility analysis in the main context using what it already knows. When all subagents report back, it integrates everything and writes `feasibility.md` and `profitability.md`.

---

**Checking what to work on:**
> "What's the status of everything? What should we work on today?"

The `status-reporter` skill runs in a subagent, reads every `ideas/*/status.md`, and returns a dashboard showing every idea's stage, blockers, and the top 3 suggested actions for the session.

---

**Exploring idea combinations:**
> "Could the electronics marketplace and the blast-radius tool work together somehow?"

The `idea-synthesis` skill reads both ideas, maps shared users and infrastructure, draws an integration architecture, and gives you a direct recommendation: merge, integrate, sequence, or keep separate.

---

## What you'll have when an idea is ready to build

By the time an idea reaches graduation, you have:

1. **A clear problem statement** with a named target user and validated assumptions
2. **A market reality check** — real competitors, real TAM data, real pricing benchmarks
3. **A financial model** — unit economics with explicit assumptions you've stress-tested
4. **A stress-tested risk register** — the 5 most dangerous assumptions and how to validate them cheaply
5. **A locked MVP scope** — what's in, what's out, and why
6. **A dependency map** — what blocks what, no surprises on day one
7. **A critical path** — the exact sequence to get to something shippable
8. **A phased rollout plan** — Phase 0 tasks specific enough to start tomorrow
9. **`vision.md`** — the canonical product document: features, design principles, success metrics, positioning, and what the product explicitly is not. Human-validated before graduation completes.
10. **`agents-blueprint.md`** — every agent and skill the build repo needs, specs derived from your actual feature areas and tech stack
11. **`bootstrap.sh`** — run once and the build repo exists: correct folder structure, AGENTS.md written, skills scaffolded with real content, all docs migrated, ADR files for every key decision, `.env.example` populated, first git commit done
12. **A record of what was ruled out** — so you don't relitigate decisions that were already made

---

## After graduation — what happens next

When an idea graduates, a new repository is created with its own `AGENTS.md` tuned for a build repo (different conventions — it's about shipping, not exploring). That repo gets:

- `docs/` folder with the feasibility, profitability, and roadmap documents migrated from here
- A GitHub Project board with Phase 0 tasks as issues
- A dev environment setup documented in `README.md`
- Skills appropriate for a build context (code review, testing, deployment)

This idea repo keeps a record in `/archive/graduated/[name]/` with a pointer to the new repo. The two repos are independent from that point.

**The first week in the new repo has one job:** spike on the highest-risk technical dependency identified in the roadmap. Not Phase 0 tasks — the one thing most likely to make or break the architecture. Everything else can be revised. That thing can't.

---

## Commit conventions

```
[stage] idea-name: short description

Examples:
[seed] pickpic: initial capture
[analysis] pickpic: feasibility complete — green verdict
[roadmap] pickpic: MVP scope locked, phase 0 ready
[synthesis] pickpic--blast-radius: integration analysis complete
[graduated] pickpic: moved to github.com/vedang/pickpic
[archived] stealth-marketplace: killed — LTV:CAC < 1 with no pricing fix
```

One idea per commit. Don't batch unrelated ideas in the same commit.

---

## Collaborating

Both collaborators work in the same repo. There's no branch strategy for ideas — just commit directly to main and pull before starting a session. Ideas are documents, not code; merge conflicts are rare and easy to resolve.

If you disagree on a verdict (feasibility, profitability, graduation), document both positions in `status.md` with reasoning and revisit after getting more data. The repo is a thinking tool, not an authority.
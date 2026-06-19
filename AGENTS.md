# AGENTS.md — Idea Lab

## Purpose
This repository is a structured workspace for generating, stress-testing, and evolving ideas. It covers:
- Raw idea capture and initial scoping
- Feasibility analysis (technical, operational, market)
- Profitability and unit-economics modeling
- Idea synthesis — combining or integrating multiple ideas
- Feature roadmapping, dependency mapping, and rollout sequencing
- Graduation decisions — when an idea is ready for its own repository

This repo is **pre-product**. No production code lives here. The outputs are documents, models, diagrams, and structured notes.

## Repo Layout
```
/ideas/                   # One folder per idea, named kebab-case
  /[idea-name]/
    README.md             # Idea brief (auto-generated from idea-capture skill)
    feasibility.md        # Feasibility analysis
    profitability.md      # Unit economics model
    synthesis.md          # Cross-idea linkage notes (if applicable)
    roadmap.md            # Feature plan, dependency map, critical path
    status.md             # Current stage + decision log
    vision.md             # Generated at graduation — canonical product doc
    agents-blueprint.md   # Generated at graduation — agent/skill spec for build repo
    bootstrap.sh          # Generated at graduation — run to create the build repo
    graduation-handoff.md # Generated at graduation — decisions, ruled-out, open questions
/combined/                # Multi-idea synthesis documents
/templates/               # Blank versions of each doc type
/archive/
  /killed/                # Ideas explicitly ruled out (with documented reasons)
  /graduated/             # Ideas that moved to their own build repo
```

## Idea Lifecycle Stages
1. **Seed** — Raw idea captured, brief written
2. **Analysis** — Feasibility + profitability assessed
3. **Synthesis** — Cross-idea compatibility checked
4. **Roadmap** — Features, dependencies, rollout sequenced
5. **Graduated** — Full pipeline complete; vision, blueprint, and bootstrap generated; moved to `/archive/graduated/`
6. **Archived (killed)** — Parked or killed with reason documented; moved to `/archive/killed/`

The distinction matters for agents: `archive/graduated/` folders still have a runnable `bootstrap.sh`. `archive/killed/` folders are read-only reference — never modify them.

## Agent Behavior Guidelines

### Writing style
- Be direct and opinionated. Say "this won't work because X" not "there may be challenges."
- Use structured Markdown: headers, tables, bullet lists with sub-items.
- Quantify wherever possible: TAM, margins, timelines, complexity scores.
- When uncertain, state the assumption explicitly — don't hedge silently.

### Document ownership
- Each idea folder owns its own files. Never modify another idea's files during analysis of a different idea.
- `status.md` is the single source of truth for an idea's stage. Always update it after any action.

### Cross-idea work
- Use the `idea-synthesis` skill when comparing or combining two or more ideas.
- Document integration points in `/combined/` — never inside a single idea's folder.

### Committing
- Commit message format: `[stage] idea-name: short description`
  - Examples: `[seed] pickpic: initial capture`, `[analysis] blast-radius: feasibility complete`
- One idea, one commit. Don't batch unrelated ideas.

### What agents must NOT do
- Do not generate code or implementation files in this repo (unless explicitly asked for pseudocode or algorithm sketches).
- Do not delete files from `/archive/` — only add to it.
- Do not rename idea folders without updating all cross-references.

## Available Skills
Skills live in `.agents/skills/`. The agent loads name + description at startup and activates the full skill body when relevant.

| Skill | Triggers |
|---|---|
| `idea-capture` | Capturing a new idea, writing a brief, initial scoping |
| `feasibility-analysis` | Assessing technical/market/operational feasibility |
| `market-researcher` | Competitor research, TAM, pricing benchmarks (runs in subagent) |
| `assumption-challenger` | Adversarial stress-test of hidden assumptions (runs in subagent) |
| `profitability-modeling` | Unit economics, margins, revenue models, break-even |
| `idea-connector` | Scanning all ideas for connections to a target idea (runs in subagent) |
| `idea-synthesis` | Combining ideas, cross-idea integration, compatibility checks |
| `feature-roadmapping` | Feature lists, dependency graphs, rollout sequencing |
| `status-reporter` | Dashboard of all ideas — stage, blockers, next actions (runs in subagent) |
| `orchestrator` | Multi-step or parallel tasks — fans out into subagents automatically |
| `repo-graduation` | Full graduation pipeline — checklist, vision, blueprint, bootstrap, archive |
| `graduation-vision` | Generates vision.md at graduation (spawned by repo-graduation) |
| `graduation-blueprint` | Generates agents-blueprint.md + bootstrap.sh at graduation (spawned by repo-graduation) |
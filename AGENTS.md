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
/ideas/             # One folder per idea, named kebab-case
  /[idea-name]/
    README.md       # Idea brief (auto-generated from idea-capture skill)
    feasibility.md  # Feasibility analysis
    profitability.md
    synthesis.md    # Cross-idea linkage notes
    roadmap.md
    status.md       # Current stage + decision log
/combined/          # Multi-idea synthesis documents
/templates/         # Blank templates for each doc type
/archive/           # Killed or paused ideas
```

## Idea Lifecycle Stages
1. **Seed** — Raw idea captured, brief written
2. **Analysis** — Feasibility + profitability assessed
3. **Synthesis** — Cross-idea compatibility checked
4. **Roadmap** — Features, dependencies, rollout sequenced
5. **Graduated** — Moved to its own repo (see repo-graduation skill)
6. **Archived** — Parked or killed with reason documented

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
| `profitability-modeling` | Unit economics, margins, revenue models, break-even |
| `idea-synthesis` | Combining ideas, cross-idea integration, compatibility checks |
| `feature-roadmapping` | Feature lists, dependency graphs, rollout sequencing |
| `repo-graduation` | Deciding if an idea is ready for its own repo, graduation checklist |
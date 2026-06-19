---
name: graduation-blueprint
description: >
  Generates two outputs for a graduating idea: (1) an agents-and-skills blueprint
  that defines every agent and skill the new build repo needs, with rationale and
  spec for each, and (2) a bootstrap.sh script that when run creates the full
  project folder structure, writes AGENTS.md, scaffolds all skill files, and
  copies the graduation documents into place — so the new repo is one shell
  command away from being ready. Triggers as part of the repo-graduation workflow
  or when the user says "generate the bootstrap", "scaffold the new repo",
  "create the project structure", "write the agents blueprint".
  Do NOT use for ideas still in Analysis or Roadmap stage.
---

# Graduation Blueprint

## When To Use
Activate as part of the graduation pipeline, after `graduation-vision` has run
and the vision doc has been human-validated.

## Outputs
1. `/ideas/[name]/agents-blueprint.md` — the full agent + skill specification
2. `/ideas/[name]/bootstrap.sh` — executable script that builds the new repo

---

## Part 1: Agents Blueprint Template

```markdown
# Agents & Skills Blueprint — [Product Name]

**For repo:** `[suggested-repo-name]`
**Generated:** YYYY-MM-DD
**Based on:** vision.md + roadmap.md

> This document defines the agent infrastructure for the build repo.
> It is the input used to generate `bootstrap.sh`. If you change this
> document, regenerate the bootstrap script.

---

## AGENTS.md for the Build Repo

The build repo's AGENTS.md is tuned for shipping, not exploring.
Key differences from the idea repo:
- Agents write code, not documents
- Skills are scoped to specific parts of the codebase
- Subagents are used for parallelising build tasks, not analysis tasks

```markdown
# AGENTS.md — [Product Name]

## What this repo is
[One paragraph — what the product does, who it's for, current stage]

## Codebase layout
[Repo structure with one-line explanation per folder]

## How to run locally
[Commands to install, seed, and start the dev server]

## Agent behaviour
- Write tests alongside code, not after
- Never modify files outside the task scope
- Commit format: `[scope] short description` e.g. `[auth] add JWT refresh`
- Always update the relevant doc in /docs when changing architecture

## Code conventions
[Language, formatting tool, import conventions, naming rules — be specific]

## What agents must NOT do
- [list — e.g. no direct DB migrations without a migration file]
```

---

## Skills for the Build Repo

For each skill below, the agent should create the file at
`.agents/skills/[name]/[name].md` in the new repo.

### Core Skills (always scaffold these)

#### `dev-setup`
**Purpose:** Gets any contributor — human or agent — from zero to running
in one pass. Documents env vars, dependencies, seed data, and common errors.
**Triggers:** "set up dev environment", "onboard", "getting started",
new contributor joining the repo.
**Scope:** README.md, .env.example, package.json / requirements.txt

#### `code-review`
**Purpose:** Reviews code for correctness, consistency with conventions,
missing tests, and scope creep. Does not rewrite — annotates and explains.
**Triggers:** "review this", "check my code", "PR review", "does this look right"
**Scope:** Any changed file

#### `debug`
**Purpose:** Systematic diagnosis of errors — reads logs, traces the call
stack, identifies root cause, proposes fix with explanation.
**Triggers:** "this is broken", "getting an error", paste of error output,
"why is X not working"
**Scope:** Error logs, relevant source files

#### `write-tests`
**Purpose:** Writes unit and integration tests for a given module or function.
Covers happy path, edge cases, and error states. Uses the project's test framework.
**Triggers:** "write tests for", "test coverage", "add tests", "test this function"
**Scope:** Source files + test directory

---

### Product-Specific Skills
[These are derived from the roadmap and vision. The agent generates one skill
entry per major feature area or technical domain identified in the roadmap.]

#### `[feature-area-name]`
**Purpose:** [What this skill knows about — the domain, the data model, the
business rules, the gotchas]
**Triggers:** [Phrases a developer would use when working on this area]
**Scope:** [Which folders/files this skill operates on]
**Key context:** [The most important things an agent needs to know to work
on this area without breaking things]

[repeat for each major feature area from the roadmap]

---

## Subagents for the Build Repo

### `parallel-builder`
**Purpose:** When multiple independent features need to be built simultaneously,
this orchestrator fans them out into subagents with isolated contexts.
**When to spawn:** Tasks affecting different parts of the codebase with no
shared file dependencies.
**When NOT to spawn:** Any task touching shared files (schema, auth, config).

### `[domain]-specialist`
**Purpose:** [Generated per major technical domain — e.g. if the product has
an ML component, a `ml-specialist` subagent; if it has a payments component,
a `payments-specialist` subagent]
**Context it carries:** [The domain knowledge it needs pre-loaded]
**Triggers:** [Phrases that indicate the relevant domain]

---

## Architecture Decisions to Document

Before the first line of code, the agent should create these files in `docs/`:

| File | Contents | Source |
|---|---|---|
| `docs/architecture.md` | System design, component diagram, key trade-offs | roadmap.md algorithms section |
| `docs/data-model.md` | Schema, entity relationships, indexing decisions | roadmap.md + feasibility.md |
| `docs/api.md` | Endpoint spec (even if internal) | roadmap.md feature inventory |
| `docs/vision.md` | Migrated from idea repo | vision.md |
| `docs/roadmap.md` | Migrated from idea repo | roadmap.md |
| `docs/decisions/` | One file per major architectural decision (ADR format) | key decisions from handoff |
```

---

## Part 2: bootstrap.sh

The agent generates this script fresh for each idea, populated with the actual
folder structure, repo name, tech stack, and skill content derived from the
roadmap and vision documents.

### What the script must do

1. Accept the target directory as `$1` (default: `../[repo-name]`)
2. Create the full folder structure
3. Write `AGENTS.md` with the build-repo content from the blueprint
4. Write each `.agents/skills/[name]/[name].md` with correct content
5. Copy all graduation documents into `docs/`
6. Write an initial `README.md` for the new repo
7. Write `.env.example` with all required env vars (derived from feasibility + roadmap)
8. Write `docs/decisions/` with one ADR file per key decision from handoff
9. Initialize git and make the first commit
10. Print a clear summary of what was created

### Script template

```bash
#!/usr/bin/env bash
set -euo pipefail

# ============================================================
# bootstrap.sh — [Product Name]
# Generated by graduation-blueprint on YYYY-MM-DD
# Run: bash bootstrap.sh [target-directory]
# ============================================================

REPO_NAME="[kebab-case-repo-name]"
TARGET="${1:-../$REPO_NAME}"
IDEA_DIR="$(cd "$(dirname "$0")" && pwd)"  # the graduated idea folder

echo ""
echo "🚀 Bootstrapping $REPO_NAME into $TARGET"
echo ""

# ── 1. Create folder structure ───────────────────────────────
mkdir -p "$TARGET"/{src,tests,docs/decisions,.agents/skills,.github}

# [Tech-stack-specific folders — generated from roadmap]
# e.g. for a Next.js app:
# mkdir -p "$TARGET"/src/{app,components,lib,hooks,types}
# mkdir -p "$TARGET"/src/app/{api,\(auth\),\(dashboard\)}

echo "✓ Folder structure created"

# ── 2. Write AGENTS.md ───────────────────────────────────────
cat > "$TARGET/AGENTS.md" << 'AGENTS_EOF'
[Full AGENTS.md content from blueprint — generated inline, not a placeholder]
AGENTS_EOF
echo "✓ AGENTS.md written"

# ── 3. Scaffold skills ───────────────────────────────────────
# [One block per skill — generated from the blueprint]

mkdir -p "$TARGET/.agents/skills/dev-setup"
cat > "$TARGET/.agents/skills/dev-setup/dev-setup.md" << 'SKILL_EOF'
---
name: dev-setup
description: >
  Gets any contributor from zero to running. Documents env vars,
  dependencies, seed data, and common setup errors.
---
# Dev Setup
[Generated content specific to this product's stack]
SKILL_EOF

# [Repeat for each skill in the blueprint]

echo "✓ Skills scaffolded"

# ── 4. Copy graduation documents ─────────────────────────────
cp "$IDEA_DIR/vision.md"            "$TARGET/docs/vision.md"
cp "$IDEA_DIR/roadmap.md"           "$TARGET/docs/roadmap.md"
cp "$IDEA_DIR/feasibility.md"       "$TARGET/docs/feasibility.md"
cp "$IDEA_DIR/profitability.md"     "$TARGET/docs/profitability.md"
cp "$IDEA_DIR/agents-blueprint.md"  "$TARGET/docs/agents-blueprint.md"
[ -f "$IDEA_DIR/synthesis.md" ] && cp "$IDEA_DIR/synthesis.md" "$TARGET/docs/synthesis.md"
echo "✓ Graduation documents copied to docs/"

# ── 5. Write ADR files ───────────────────────────────────────
# [One file per key decision from graduation-handoff.md]

cat > "$TARGET/docs/decisions/001-[decision-name].md" << 'ADR_EOF'
# ADR 001 — [Decision Title]

**Date:** YYYY-MM-DD
**Status:** Accepted

## Context
[Why this decision was needed]

## Decision
[What was decided]

## Rationale
[Why this option over alternatives]

## Consequences
[What this rules out, what it enables]
ADR_EOF

echo "✓ Architecture decision records written"

# ── 6. Write README.md ───────────────────────────────────────
cat > "$TARGET/README.md" << 'README_EOF'
# [Product Name]

[One-liner from vision.md]

## What this is
[Problem + solution paragraph from vision.md]

## Getting started
\`\`\`bash
# [Install commands]
# [Env setup]
# [Seed + run]
\`\`\`

## Docs
- [Vision](docs/vision.md) — what we're building and why
- [Roadmap](docs/roadmap.md) — feature plan and phases
- [Architecture](docs/architecture.md) — system design (fill in during Phase 0)

## Contributing
Open the repo in Antigravity CLI and describe what you want to do.
The agent will load the right skill automatically.
README_EOF
echo "✓ README.md written"

# ── 7. Write .env.example ────────────────────────────────────
cat > "$TARGET/.env.example" << 'ENV_EOF'
# [Product Name] — Environment Variables
# Copy to .env and fill in values. Never commit .env.

# [Generated from feasibility.md and roadmap — one var per external dependency]
# DATABASE_URL=
# [API_KEY]=
# [SERVICE_URL]=
ENV_EOF
echo "✓ .env.example written"

# ── 8. Git init ──────────────────────────────────────────────
cd "$TARGET"
git init -q
git add .
git commit -q -m "init: bootstrap from idea-lab graduation"
echo "✓ Git initialized — initial commit made"

# ── Summary ──────────────────────────────────────────────────
echo ""
echo "════════════════════════════════════════"
echo "  $REPO_NAME is ready at $TARGET"
echo "════════════════════════════════════════"
echo ""
echo "Next steps:"
echo "  1. cd $TARGET"
echo "  2. Create the GitHub repo and push: gh repo create $REPO_NAME --private && git push -u origin main"
echo "  3. Fill in .env from .env.example"
echo "  4. Spike on the highest-risk dependency (see docs/roadmap.md — Phase 0)"
echo "  5. Open in Antigravity and say: 'set up the dev environment'"
echo ""
```

---

## Agent Instructions

### For the blueprint (agents-blueprint.md)

1. Read `vision.md` and `roadmap.md` fully.
2. Derive the product-specific skills from the **feature inventory** in roadmap.md.
   Each major feature area or technical domain in the roadmap gets its own skill.
   A product with auth, search, payments, and a dashboard should have skills for
   each: `auth`, `search`, `payments`, `dashboard`.
3. Derive the subagents from the **technical architecture** — ML model? `ml-specialist`.
   External API integrations? `integrations-specialist`. Heavy background jobs? `worker-specialist`.
4. Derive the env vars for `.env.example` from every external service mentioned
   in feasibility.md and roadmap.md (databases, APIs, queues, storage, auth providers).
5. Derive the ADR files from the "Key Decisions Made in This Repo" section of
   `graduation-handoff.md`. One ADR per decision.
6. Make the build AGENTS.md concrete — list actual folder names, actual commands,
   actual file naming conventions from the roadmap's tech stack.

### For the bootstrap script (bootstrap.sh)

1. **Generate the full script** — not a template with placeholders. Every `[...]`
   in the template above must be filled in from the idea's documents.
2. The folder structure must match the tech stack from the roadmap exactly.
   A Next.js app has `src/app/`. A FastAPI backend has `src/routers/`. Derive it.
3. Each skill's content in the here-doc must be real content, not placeholder.
   Pull from the blueprint you just generated.
4. The ADR files must contain the actual decisions, not blanks.
5. After generating, make the script executable: note `chmod +x bootstrap.sh`
   in the output so the user knows.
6. Tell the user: "Run `bash ideas/[name]/bootstrap.sh` from this repo's root
   to create the new project. It will land at `../[repo-name]/` by default,
   or pass a path: `bash ideas/[name]/bootstrap.sh ~/projects/[repo-name]`"
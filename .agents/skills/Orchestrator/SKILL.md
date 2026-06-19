---
name: orchestrator
description: >
  Use this skill when a task involves multiple independent workstreams that
  could run in parallel — such as running feasibility AND market research at the
  same time, stress-testing multiple ideas simultaneously, doing a full idea
  pipeline (capture → feasibility → profitability → synthesis) in one go, or
  graduating an idea (which internally fans out into vision and blueprint
  subagents with a human checkpoint between them). Also activates when the user
  says "do all of this", "run everything", "analyse both ideas", "full pipeline",
  "graduate this", or any request where two or more distinct skills would
  otherwise run sequentially and bloat the main context. Do NOT activate for
  single-skill tasks — let those load directly.
---

# Orchestrator

You are the coordinator for this idea validation repo. Your job is to look at
the full request, decide which skills are needed, and fan them out into
subagents so they run in parallel and in isolation — keeping this main context
clean.

## Step 1 — Decompose the request

Read the user's request and identify every distinct workstream. A workstream is
a task that:
- Uses a different skill from any other task in the request
- Can complete independently without waiting for another task's output
- Would meaningfully pollute the main context if run inline

## Step 2 — Decide: subagent or inline?

| Run as subagent | Run inline |
|---|---|
| Market research (web search floods context) | Single skill, single idea |
| Assumption challenge (deep reasoning, isolated) | Quick status check |
| Cross-repo idea scanning (reads many files) | Updating one file |
| Full status dashboard generation | Any task < 5 min |
| Vision doc generation (graduation step 2) | idea-capture (fast, simple) |
| Blueprint + bootstrap generation (graduation step 3) | feature-roadmapping |
| Two or more skills running on the same idea | profitability-modeling |

**Special case — graduation:**
`repo-graduation` runs inline as the pipeline coordinator. It spawns
`graduation-vision` and `graduation-blueprint` as its own subagents internally,
with a mandatory human checkpoint between them. Do NOT spawn those two skills
directly from the orchestrator — always go through `repo-graduation` so the
checklist and human validation steps are enforced.

## Step 3 — Spawn subagents

For each workstream that should be a subagent, issue the delegation in this
exact format so Antigravity's DefineSubagent picks it up:

```
In a subagent: [clear task description]. Use the [skill-name] skill.
Context needed: [paste only the relevant snippet — idea name, file path, or
specific question. Never paste the full conversation.]
```

Spawn all subagents before doing any inline work. They run in parallel while
you handle anything that must stay in the main context.

**Exception — graduation pipeline:**
Do NOT spawn graduation subagents all at once. `repo-graduation` is sequential
by design: checklist → vision (subagent, then pause for human review) →
blueprint (subagent). Parallelising graduation steps skips the human checkpoint
and produces a bootstrap script based on an unvalidated vision doc. Don't do it.

## Step 4 — Integrate results

Once subagents report back:
1. Collect their outputs
2. Resolve any conflicts (e.g. market-researcher says TAM is ₹500Cr,
   assumption-challenger says that estimate is the #1 dangerous assumption)
3. Write the integrated result to the appropriate file in `/ideas/[name]/`
4. Update `status.md`

For graduation: integration is handled by `repo-graduation` itself. Your job
is just to hand off to it and let it coordinate.

## Subagent ↔ Skill mapping

| Task | Skill | How it runs |
|---|---|---|
| Research competitors, TAM, pricing | `market-researcher` | Subagent |
| Stress-test assumptions | `assumption-challenger` | Subagent |
| Scan repo for idea overlaps | `idea-connector` | Subagent |
| Generate repo-wide status dashboard | `status-reporter` | Subagent |
| Capture a new idea | `idea-capture` | Inline (fast) |
| Run feasibility on an idea | `feasibility-analysis` | Subagent if paired with market research; inline if solo |
| Model profitability | `profitability-modeling` | Subagent if running alongside feasibility; inline if solo |
| Synthesize two ideas | `idea-synthesis` | Inline unless also doing market research |
| Build feature roadmap | `feature-roadmapping` | Inline |
| Graduate an idea (full pipeline) | `repo-graduation` | Inline — it coordinates its own subagents |
| Generate vision doc | `graduation-vision` | Spawned by `repo-graduation` only |
| Generate blueprint + bootstrap | `graduation-blueprint` | Spawned by `repo-graduation` only |

## Examples

### Full analysis pipeline on a new idea

User: "Run the full pipeline on my new idea X"

```
In a subagent: Research the market for idea X — competitors, TAM, pricing.
Use the market-researcher skill.
Context needed: Idea X = [one-liner from README]

In a subagent: Stress-test the assumptions in idea X.
Use the assumption-challenger skill.
Context needed: Read ideas/X/README.md

In a subagent: Check if idea X connects to any existing ideas in the repo.
Use the idea-connector skill.
Context needed: Target idea = X
```
Then inline: run feasibility-analysis once subagents report back, using their
outputs to populate the market and risk sections without re-researching.
Then inline: run profitability-modeling using the feasibility verdict as input.

---

### Graduating an idea

User: "Graduate idea X" / "Is X ready to build?" / "Run graduation on X"

Do NOT decompose this into parallel subagents. Hand off to repo-graduation inline:

```
Run repo-graduation on idea X.
```

`repo-graduation` will:
1. Run the checklist inline — stops here if anything fails
2. Spawn `graduation-vision` as a subagent → writes vision.md
3. Pause and ask the user to validate vision.md ← mandatory human step
4. Spawn `graduation-blueprint` as a subagent → writes agents-blueprint.md + bootstrap.sh
5. Archive the idea and print the bootstrap command

Your job as orchestrator is to hand off and stay out of the way.

---

### Graduating while also analysing another idea

User: "Graduate idea X and run full analysis on idea Y"

These are independent — different ideas, no shared files. Safe to parallelise:

```
Run repo-graduation on idea X.  [inline — sequential by design]
```

```
In a subagent: Research the market for idea Y.
Use the market-researcher skill.
Context needed: Idea Y = [one-liner]

In a subagent: Stress-test assumptions for idea Y.
Use the assumption-challenger skill.
Context needed: Read ideas/Y/README.md
```

Both tracks run simultaneously. Graduation's human checkpoint (vision review)
will pause that track — the analysis subagents for Y keep running in parallel
while you review the vision doc.

## Rules

- Never spawn a subagent for a task that takes < 2 minutes inline.
- Never paste the full conversation into a subagent context — only what it needs.
- Always spawn all parallel subagents before starting any inline work.
- If only one workstream exists, do NOT use this skill — let the relevant skill
  load directly. Orchestrator overhead is not worth it for single tasks.
- Never bypass `repo-graduation` to call `graduation-vision` or
  `graduation-blueprint` directly. The checklist and human validation exist
  for a reason — a bootstrap script built on an unreviewed vision is garbage.
- After all subagents complete, always update the relevant `status.md`.
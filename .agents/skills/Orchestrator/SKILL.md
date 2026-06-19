---
name: orchestrator
description: >
  Use this skill when a task involves multiple independent workstreams that
  could run in parallel — such as running feasibility AND market research at the
  same time, stress-testing multiple ideas simultaneously, or doing a full idea
  pipeline (capture → feasibility → profitability → synthesis) in one go.
  Also activates when the user says "do all of this", "run everything", "analyse
  both ideas", "full pipeline", or any request where two or more distinct skills
  would otherwise run sequentially and bloat the main context. Do NOT activate
  for single-skill tasks — let those load directly.
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
| Assumption challenge (deep Opus reasoning) | Quick status check |
| Cross-repo idea scanning (reads many files) | Updating one file |
| Full status dashboard generation | Any task < 5 min |
| Two or more skills running on the same idea |  |

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

## Step 4 — Integrate results

Once subagents report back:
1. Collect their outputs
2. Resolve any conflicts (e.g. market-researcher says TAM is ₹500Cr,
   assumption-challenger says that estimate is the #1 dangerous assumption)
3. Write the integrated result to the appropriate file in `/ideas/[name]/`
4. Update `status.md`

## Subagent ↔ Skill mapping

| Task | Skill to load in subagent |
|---|---|
| Research competitors, TAM, pricing | `market-researcher` |
| Stress-test assumptions | `assumption-challenger` |
| Scan repo for idea overlaps | `idea-connector` |
| Generate repo-wide status dashboard | `status-reporter` |
| Capture a new idea | `idea-capture` (inline — fast) |
| Run feasibility on an idea | `feasibility-analysis` (subagent if paired with market research) |
| Model profitability | `profitability-modeling` (subagent if running alongside feasibility) |
| Synthesize two ideas | `idea-synthesis` (inline unless also doing market research) |
| Build feature roadmap | `feature-roadmapping` (inline) |
| Graduate an idea | `repo-graduation` (inline) |

## Example: Full pipeline on a new idea

User says: "Run the full pipeline on my new idea X"

Correct decomposition:
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

## Rules

- Never spawn a subagent for a task that takes < 2 minutes inline.
- Never paste the full conversation into a subagent context — only what it needs.
- Always spawn all subagents before starting any inline work.
- If only one workstream exists, do NOT use this skill — let the relevant skill
  load directly. Orchestrator overhead is not worth it for single tasks.
- After all subagents complete, always update the idea's `status.md`.
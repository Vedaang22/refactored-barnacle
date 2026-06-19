---
name: status-reporter
description: >
  Use this skill to generate a snapshot dashboard of all ideas in the repo —
  what stage each is at, what's blocked, and what to work on next. Designed to
  run inside a subagent since it reads every status file. Triggers on "what's
  the status of everything", "repo summary", "what should we work on next",
  "show me all ideas", "weekly review", or at the start of any session where
  the user hasn't specified a task yet.
---

# Status Reporter

Scan all idea folders and produce a single clean dashboard. Do not add
commentary — just the dashboard.

## Process

1. Glob `ideas/*/status.md` to find all ideas
2. For each, read `status.md` and the idea's `README.md` for the one-liner
3. Bucket each idea by stage
4. Identify blockers and suggest the highest-priority next actions

## Output format

```markdown
## Idea Lab — Status Dashboard
**Generated:** YYYY-MM-DD | **Total ideas:** N

---

### 🌱 Seed
| Idea | One-liner | Created | Next action |
|---|---|---|---|

### 🔬 Analysis
| Idea | Verdict so far | Blocker | Next action |
|---|---|---|---|

### 🔗 Synthesis
| Ideas involved | Type | Status |
|---|---|---|

### 🗺️ Roadmap
| Idea | MVP scope locked? | Phase 0 ready? |
|---|---|---|

### 🚀 Ready to Graduate
| Idea | Checklist status | Suggested repo name |
|---|---|---|

### 📦 Archived
| Idea | Reason | Date |
|---|---|---|

---

### Suggested Focus for Next Session
1. [most urgent — name the idea and exact action]
2. [second]
3. [third]

### Blockers Across the Repo
- [idea name]: [what it's waiting on]
```

## Rules

- If `status.md` is missing for a folder, flag it as "No status file — needs triage"
- Do not infer stage from the folder name — read the file content
- Suggested focus must be actionable: "Run feasibility on X" not "Continue working"
- Keep table rows to one line — this is a dashboard, not a report
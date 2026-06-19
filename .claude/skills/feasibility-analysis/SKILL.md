---
name: feasibility-analysis
description: >
  Conducts a structured feasibility analysis on an idea — covering technical,
  market, operational, and regulatory dimensions. Use when an idea has a README
  and the user wants to stress-test whether it can actually be built and whether
  a market exists. Triggers on "is this feasible", "can this work", "assess
  this idea", "what are the risks", or when moving from Seed → Analysis stage.
  Do NOT use for profitability/unit economics — use profitability-modeling for that.
---

# Feasibility Analysis

## When To Use
Activate after an idea has been captured (README.md exists) and the user wants a rigorous feasibility check.

## Output
Create or update `/ideas/[name]/feasibility.md`.

---

## Feasibility Report Template

```markdown
# Feasibility Analysis — [Idea Name]

**Analyst:** [agent/human]  
**Date:** YYYY-MM-DD  
**Overall Verdict:** 🟢 Feasible / 🟡 Conditionally Feasible / 🔴 Not Feasible

---

## 1. Technical Feasibility

| Dimension | Assessment | Confidence |
|---|---|---|
| Core tech exists? | Yes / No / Partial | High / Med / Low |
| Build complexity | Low / Med / High / Very High | |
| Key technical risks | [list] | |
| Existing solutions to learn from | [list] | |

**Technical verdict:** [1–2 sentences. Direct opinion.]

---

## 2. Market Feasibility

| Dimension | Assessment |
|---|---|
| Problem validated (evidence)? | [Yes + source / Assumed / No] |
| Estimated TAM | [₹/$ + basis] |
| Existing competitors | [list with 1-line positioning] |
| Differentiation | [what makes this different] |
| Market timing | Too early / Right / Late / Saturated |

**Market verdict:** [1–2 sentences. Direct opinion.]

---

## 3. Operational Feasibility

| Dimension | Assessment |
|---|---|
| Team skills gap | [what's missing] |
| Key dependencies | [APIs, partners, hardware, regulations] |
| Time to MVP | [weeks/months] |
| Blockers | [list — not risks, actual blockers] |

**Operational verdict:** [1–2 sentences.]

---

## 4. Regulatory / Legal
[Any compliance, licensing, or legal surface area? If none, state that explicitly.]

---

## 5. Key Risks
Rank by severity × probability:

| Risk | Severity | Probability | Mitigation |
|---|---|---|---|
| [risk] | H/M/L | H/M/L | [how to reduce] |

---

## 6. Critical Assumptions to Validate First
[Top 3 things to de-risk before investing significant time]
1. [assumption + how to validate it]
2.
3.

---

## Verdict & Recommendation
**Verdict:** 🟢 / 🟡 / 🔴  
**Reasoning:** [3–5 sentences. Be direct. If it's 🔴, say why clearly.]  
**Recommended next step:** [Archive / Iterate on X / Proceed to profitability-modeling / Prototype]
```

---

## Agent Instructions

1. Read the idea's `README.md` fully before starting.
2. Research the space if web search is available — look for competitors, market size data, technical precedents. Cite sources inline.
3. Be opinionated. A wishy-washy feasibility report is useless. State a verdict.
4. If the idea is 🔴, explain exactly what would need to change to make it 🟡.
5. After writing, update `status.md` to stage: Analysis. Append a one-line summary of the verdict.
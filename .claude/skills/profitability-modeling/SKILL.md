---
name: profitability-modeling
description: >
  Models the unit economics, revenue potential, and profitability of an idea.
  Use when an idea has passed feasibility and the user wants to understand if
  it can make money — covering pricing, CAC, LTV, margins, break-even, and
  revenue model options. Triggers on "can this make money", "is this profitable",
  "unit economics", "pricing model", "revenue model", "break-even", "margins",
  or when moving from Analysis → Roadmap stage. Do NOT use for technical or
  market feasibility — use feasibility-analysis for that.
---

# Profitability Modeling

## When To Use
Activate after feasibility-analysis is complete. Requires a README.md and feasibility.md in the idea folder.

## Output
Create or update `/ideas/[name]/profitability.md`.

---

## Profitability Model Template

```markdown
# Profitability Model — [Idea Name]

**Modeler:** [agent/human]  
**Date:** YYYY-MM-DD  
**Revenue Model:** [SaaS / Marketplace / Transactional / Ad-supported / Freemium / Services / Hybrid]

> ⚠️ All numbers are estimates. State your assumptions explicitly.

---

## 1. Revenue Model Options

| Model | Pros | Cons | Fit for this idea |
|---|---|---|---|
| [Option 1] | | | High / Med / Low |
| [Option 2] | | | |

**Recommended model:** [choice + 1-line rationale]

---

## 2. Pricing

| Tier | Price | What's included | Target segment |
|---|---|---|---|
| Free / Basic | ₹0 | | |
| [Tier 2] | ₹X/mo | | |
| [Tier 3] | ₹X/mo | | |

**Pricing rationale:** [Why this price? Reference comparable tools or willingness-to-pay signals.]

---

## 3. Unit Economics

| Metric | Estimate | Basis |
|---|---|---|
| CAC (Customer Acquisition Cost) | ₹X | [organic / paid / referral assumption] |
| ACV (Annual Contract Value) | ₹X | |
| Gross Margin | X% | [what's in COGS] |
| LTV (Lifetime Value) | ₹X | [churn assumption: X%/month] |
| LTV:CAC Ratio | X:1 | [target: >3:1] |
| Payback Period | X months | [target: <12 months] |

---

## 4. Break-Even Analysis

| Item | Monthly |
|---|---|
| Fixed costs | ₹X (hosting, tools, salaries) |
| Variable cost per user | ₹X |
| Revenue per paying user | ₹X |
| Break-even users needed | X users |
| Realistic timeline to break-even | X months |

---

## 5. Revenue Projection (Base Case)

| Month | Users | Paying (%) | MRR | Cumulative Revenue |
|---|---|---|---|---|
| 1 | | | | |
| 3 | | | | |
| 6 | | | | |
| 12 | | | | |

**Growth assumption:** [X% MoM — basis?]

---

## 6. Risks to the Model

| Risk | Impact | Mitigation |
|---|---|---|
| High CAC | Kills LTV:CAC | [organic growth, referral loops] |
| [risk 2] | | |

---

## Verdict

**Profitable?** Yes / No / Depends on X  
**Key lever:** [The single most important variable — if you get this right, the model works]  
**Recommended next step:** [Proceed to roadmapping / Pivot pricing / Kill idea / Validate CAC assumption first]
```

---

## Agent Instructions

1. Read `README.md` and `feasibility.md` before starting.
2. Use Indian Rupee (₹) by default unless the idea is explicitly global.
3. Never present a model without stating the assumptions behind every number.
4. Build the base case conservatively. Mention upside case in one sentence only.
5. Highlight the single most important lever — the number that, if wrong, breaks the whole model.
6. After writing, update `status.md`. If verdict is positive, recommend moving to feature-roadmapping.
# Profitability Model — VibeWidget

**Modeler:** Antigravity  
**Date:** 2026-06-19  
**Revenue Model:** Freemium (Ad-supported Free Tier + Premium Features/Cosmetics)

> ⚠️ All numbers are estimates. State your assumptions explicitly.

---

## 1. Revenue Model Options

| Model | Pros | Cons | Fit for this idea |
|---|---|---|---|
| **Freemium (Subscription)** | High predictability, standard on iOS App Store. | Low conversion rates (~2–5% typical for social apps). | High (Locket Gold and noteit use this model successfully). |
| **In-App Purchases (Cosmetics)** | One-time purchases are attractive to Gen Z users without credit cards (use App Store balance). | Lower lifetime value (LTV) than subscriptions. | High (buying custom avatars/bitmoji clothing, premium brush packs). |
| **Ad-supported (Main App)** | Monetizes 100% of active users immediately. | High volume needed; cannot put ads on the actual home screen widget. | Medium (can monetize the canvas view inside the main app). |

**Recommended model:**
Hybrid Freemium + In-App Purchases (IAP). Free users receive a standard canvas and base avatars with ad-supported in-app menus. A premium **"Vibe Plus"** subscription (₹299/mo) unlocks unlimited canvases, unlimited group members, custom drawings/brushes, and exclusive avatar items.

---

## 2. Pricing

| Tier | Price | What's included | Target segment |
|---|---|---|---|
| **Free / Basic** | ₹0 | 1 active widget canvas, up to 5 friends, standard brushes, ad-supported app interface. | Casual/new users |
| **Vibe Plus (Monthly)** | ₹299/mo | Unlimited friend canvases, premium neon/watercolor brushes, unlimited canvas history archive. | Power users, close friend groups |
| **Cosmetics packs (IAP)** | ₹99 one-time | Exclusive avatar skins, seasonal themed doodle stickers, special emoji reactions. | Aesthetic-driven users |

**Pricing rationale:**
Pricing is benchmarked against **Locket Gold** ($3.99/mo ~ ₹330/mo) and **noteit** ($0.99/week ~ ₹80/week), adjusting for Indian market pricing sensitivity while keeping international pricing scalable.

---

## 3. Unit Economics

| Metric | Estimate | Basis |
|---|---|---|
| **CAC (Customer Acquisition Cost)** | ₹10 | High viral coefficient (K-factor > 1) via SMS/social friend invitations reduces blended CAC. |
| **ACV (Annual Contract Value)** | ₹89.70 | Blended across all users (assuming 2.5% premium conversion + advertising ARPU of ₹2/MAU). |
| **Gross Margin** | 85% | Server hosting, database operations, APNs/FCM push costs, and 30% App Store commission. |
| **LTV (Lifetime Value)** | ₹82.50 | Assuming 10% monthly user churn (average user lifepan of 10 months) on the blended monthly ARPU of ₹8.25. |
| **LTV:CAC Ratio** | 8.25:1 | Target ratio is > 3:1. (Highly viable if viral loop stays active). |
| **Payback Period** | 1.2 months | Instant payback due to low acquisition costs of group invites. |

---

## 4. Break-Even Analysis

| Item | Monthly |
|---|---|
| **Fixed costs** | ₹1,50,000 (hosting, developer tools, basic operational admin) |
| **Variable cost per user** | ₹0.50 (image bandwidth/CDN storage, push notification runs) |
| **Revenue per active user** | ₹11.00 (ad revenue + premium conversion blended ARPU) |
| **Break-even users needed** | 14,286 monthly active users (MAU) |
| **Realistic timeline to break-even** | 4 months |

---

## 5. Revenue Projection (Base Case)

| Month | Active Users (MAU) | Paying (%) | MRR | Cumulative Revenue |
|---|---|---|---|---|
| 1 | 2,000 | 1.0% | ₹5,980 | ₹5,980 |
| 3 | 15,000 | 2.0% | ₹89,700 | ₹1,49,500 |
| 6 | 75,000 | 2.5% | ₹5,60,625 | ₹12,70,000 |
| 12 | 3,00,000 | 2.5% | ₹22,42,500 | ₹95,60,000 |

**Growth assumption:**
Viral growth curve starting slow in month 1, and accelerating as networks (friend groups of 3-5) invite each other to activate the widget. Assumes a K-factor of 1.15.

---

## 6. Risks to the Model

| Risk | Impact | Mitigation |
|---|---|---|
| **High Churn (Novelty Wear-off)** | Drastically cuts LTV | Introduce seasonal gamified prompts, streaks, and avatar item releases. |
| **Low Premium Conversion** | Extends break-even timeline | Focus on avatar customizability (which Gen Z has higher propensity to purchase via IAPs). |
| **High CDN Bandwidth Costs** | Lowers Gross Margin | Compress drawing files strictly to vector stroke paths rather than heavy bitmap files. |

---

## Verdict

**Profitable?** Yes  
**Key lever:** **Viral K-Factor (Invitations)**. If the app fails to organically prompt users to invite 3–5 friends during the onboarding flow, the CAC will rise, killing the unit economics.  
**Recommended next step:** Proceed to feature-roadmapping. Ensure the onboarding sequence prioritizes contact syncing and viral invitation triggers.

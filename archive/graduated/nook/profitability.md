# Profitability Model — Nook

**Modeler:** Antigravity  
**Date:** 2026-06-20  
**Revenue Model:** Freemium (Virtual Asset IAP + Premium Subscription + In-App Ads)

> ⚠️ All numbers are estimates. State your assumptions explicitly.

---

## 1. Revenue Model Options

| Model | Pros | Cons | Fit for this idea |
|---|---|---|---|
| **Virtual Furniture Shop (IAP)** | Extremely high margins; Gen Z is highly accustomed to buying digital room aesthetics (Roblox, Habbo). | Requires regular artist output to keep catalog fresh. | High (purchasing animated posters, jukebox skins, custom flooring). |
| **Nook Premium (Sub)** | Predictable, recurring revenue. | Low initial conversion rate (~2%). | High (unlocking multiple custom rooms, ad-free Halls, and premium interactive items). |
| **Sponsorships & Ads** | Monetizes free-tier users who hang out in public Halls. | Intrusive ads ruin the "cozy" aesthetic. | Medium-High (non-intrusive brand posters/billboards inside public Community Halls). |

**Recommended model:**
Hybrid. Free tier users monetize via billboard ads in public Community Halls. The main revenue engine is cosmetic micro-transactions (furniture/decor packs priced at ₹29–₹199) and a **"Nook VIP"** subscription (₹249/mo) that removes ads and grants monthly cosmetic tokens.

---

## 2. Pricing

| Tier | Price | What's included | Target segment |
|---|---|---|---|
| **Free / Basic** | ₹0 | 1 Room profile, access to public Lobbies/Halls, guest whiteboards, standard furniture catalog. | General audience |
| **Nook VIP (Sub)** | ₹249/mo | Ad-free Halls, 2 additional Room profiles, 200 monthly furniture shop tokens, exclusive seasonal decorations. | Highly active users |
| **Theme & Furniture Packs (IAP)** | ₹29–₹199 | Themed item sets (e.g., "Cyberpunk Setup", "Cozy Plant Loft", "Kawaii Arcade"). | Customization enthusiasts |
| **Interactive Jukebox Upgrade (IAP)**| ₹99 one-time | Unlocks Spotify/Apple Music playback link widget inside your room. | Music-oriented users |

**Pricing rationale:**
Microtransactions are priced at low, impulse-buy thresholds (₹29 to ₹199) matching the spending patterns of Gen Z gamers. VIP subscriptions are priced under Netflix/Spotify standard rates to remain accessible.

---

## 3. Unit Economics

| Metric | Estimate | Basis |
|---|---|---|
| **CAC (Customer Acquisition Cost)** | ₹15 | High organic growth driven by sharing customized room links and deep invites. Blended with target influencer campaigns. |
| **ACV (Annual Contract Value)** | ₹132.00 | Blended across premium conversions (2%), furniture sales (₹5.00/user/yr average), and Hall ad impressions (₹6.00/user/yr average). |
| **Gross Margin** | 82% | Server operations, WebSocket connections for room synchronization, CDN asset storage, and App Store fees. |
| **LTV (Lifetime Value)** | ₹110.00 | Assuming 10% monthly user churn (average 10-month user lifetime) on a monthly blended ARPU of ₹11.00. |
| **LTV:CAC Ratio** | 7.3:1 | Target ratio is > 3:1. (Highly profitable if room customization triggers high retention). |
| **Payback Period** | 1.4 months | Fast payback due to instant friend invites and profile sharing loops. |

---

## 4. Break-Even Analysis

| Item | Monthly |
|---|---|
| **Fixed costs** | ₹3,50,000 (hosting real-time room sync, moderation systems, database server, team admin) |
| **Variable cost per user** | ₹0.90 (active real-time WebSocket traffic, CDN layout storage, push triggers) |
| **Revenue per active user** | ₹11.00 (blended ARPU from subscriptions, ads, and microtransactions) |
| **Break-even users needed** | 34,653 monthly active users (MAU) |
| **Realistic timeline to break-even** | 5 months |

---

## 5. Revenue Projection (Base Case)

| Month | Active Users (MAU) | Paying (%) | MRR | Cumulative Revenue |
|---|---|---|---|---|
| 1 | 8,000 | 1.2% | ₹23,900 | ₹23,900 |
| 3 | 50,000 | 1.5% | ₹2,20,000 | ₹3,50,000 |
| 6 | 3,00,000 | 2.0% | ₹16,50,000 | ₹36,000,000 |
| 12 | 15,00,000 | 2.5% | ₹99,00,000 | ₹4,20,00,000 |

**Growth assumption:**
Growth is driven by users sharing screenshots of their rooms on TikTok and Instagram, and inviting friends to hang out on their Room whiteboards. Assumes a K-factor of 1.30.

---

## 6. Risks to the Model

| Risk | Impact | Mitigation |
|---|---|---|
| **High CDN Hosting Costs for 2D Assets**| Lowers Gross Margin | Compress all pixel-art assets to high-efficiency WebP files and use aggressive client-side caching. |
| **Low Cosmetic Purchase Rates** | Extends break-even | Introduce collaborative room building (decorating a shared club room) to increase social value of assets. |
| **High User Churn** | Reduces LTV | Host weekly community events in Halls (e.g. "Room of the Week" layout competitions) with virtual token prizes. |

---

## Verdict

**Profitable?** Yes  
**Key lever:** **Profile Share Loop**. The system is highly profitable if users actively share their customized Room links externally on platforms like TikTok and Instagram, driving free organic acquisition.  
**Recommended next step:** Build the feature roadmap prioritizing the 2D layout engine and interactive widgets.

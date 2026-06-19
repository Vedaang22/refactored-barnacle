# Profitability Model — Scribble

**Modeler:** Antigravity  
**Date:** 2026-06-19  
**Revenue Model:** Freemium (Ad-supported Free Tier + Custom Assets/IAP + Premium Subscription)

> ⚠️ All numbers are estimates. State your assumptions explicitly.

---

## 1. Revenue Model Options

| Model | Pros | Cons | Fit for this idea |
|---|---|---|---|
| **Scribble Premium (Sub)** | Predictable revenue stream; captures power users who want deep customizability. | Low conversion (~1.5–3%). | High (paying for ad-free experience, unlimited custom rooms, and premium brush physics). |
| **Asset Store (IAP)** | Very low friction for Gen Z users; high impulse buy potential. | Non-recurring; requires continuous creation of new digital assets. | High (purchasing limited-edition avatar outfits, neon drawing filters, and community sticker packs). |
| **Targeted Ads (App-only)** | Monetizes 100% of MAU. Longer app session times due to community rooms drive more impressions. | Hard to monetize the widget directly without ruining user home screens. | High (ads placed within public canvas chat drawers and the discovery tab). |

**Recommended model:**
Hybrid model. Ad monetization inside public community canvases provides the baseline revenue (₹3.50 ARPU/user). Premium subscriptions (₹249/mo) and thematic avatar asset packs (₹49–₹199 IAPs) monetize high-engagement users.

---

## 2. Pricing

| Tier | Price | What's included | Target segment |
|---|---|---|---|
| **Free / Basic** | ₹0 | Access to 2 Vibe Rooms (friends), public Community Canvases (ad-supported), 5 daily "Doodle Matches," basic brush set. | General audience |
| **Scribble Premium** | ₹249/mo | Ad-free experience, unlimited friend rooms, 50 daily Doodle Matches, advanced vector brushes (glow, custom textures), priority rendering. | High-frequency drawers |
| **Asset & Sticker Packs (IAP)** | ₹49–₹199 | Limited-edition avatar clothes, animated canvas stickers, seasonal doodle brush styles (e.g., Halloween chalk). | Aesthetic-driven users |

**Pricing rationale:**
Subscriptions are priced competitively with regional entertainment products (e.g., Spotify/YouTube Premium student rates in India), while cosmetic IAPs match low-cost micro-transactions familiar to Roblox/mobile game players.

---

## 3. Unit Economics

| Metric | Estimate | Basis |
|---|---|---|
| **CAC (Customer Acquisition Cost)** | ₹12 | Organic growth driven by Doodle Match sharing and group invites. Blended with low-cost social media seed campaigns. |
| **ACV (Annual Contract Value)** | ₹113.76 | Blended average across premium conversion (2%), ad revenue (₹3.50/MAU), and micro-transactions (₹1.00/MAU). |
| **Gross Margin** | 80% | Deducting App Store 30%/15% cut, real-time WebSocket database writes, and automated content moderation API rates. |
| **LTV (Lifetime Value)** | ₹94.80 | Assuming a blended monthly user churn of 10% (10-month average user lifetime) on a monthly ARPU of ₹9.48. |
| **LTV:CAC Ratio** | 7.9:1 | Target ratio is > 3:1. (Highly profitable if community engagement maintains high density). |
| **Payback Period** | 1.3 months | Quick payback driven by instant viral group invites during registration. |

---

## 4. Break-Even Analysis

| Item | Monthly |
|---|---|
| **Fixed costs** | ₹3,50,000 (hosting WebSocket clusters, database management, automated moderation tools, basic team admin) |
| **Variable cost per user** | ₹0.75 (bandwidth for vector drawing packages, push notifications, real-time moderation filter sweeps) |
| **Revenue per active user** | ₹9.48 (ad impressions + premium conversions + cosmetic store sales) |
| **Break-even users needed** | 40,092 monthly active users (MAU) |
| **Realistic timeline to break-even** | 6 months |

---

## 5. Revenue Projection (Base Case)

| Month | Active Users (MAU) | Paying (%) | MRR | Cumulative Revenue |
|---|---|---|---|---|
| 1 | 5,000 | 1.0% | ₹12,450 | ₹12,450 |
| 3 | 45,000 | 1.5% | ₹1,68,075 | ₹2,80,000 |
| 6 | 2,50,000 | 2.0% | ₹12,45,000 | ₹27,50,000 |
| 12 | 12,00,000 | 2.0% | ₹59,76,000 | ₹2,45,00,000 |

**Growth assumption:**
Reflects rapid viral growth curves typical of network-based Gen Z social apps. Growth is driven by community sharing and cross-platform invites (TikTok/Snapchat integration). Assumes a viral K-factor of 1.25 post-launch.

---

## 6. Risks to the Model

| Risk | Impact | Mitigation |
|---|---|---|
| **Content Moderation API Overhead** | High variable cost | Move simple NSFW checks to on-device neural networks (CoreML/Android NN) to run filter models locally before cloud upload. |
| **Low Session Times (Ad Drop)** | Cuts Ad ARPU by 50% | Introduce gamified community events (e.g., live hourly sketch prompt battles) to keep users in the app. |
| **App Store Rejections** | Delays monetization | Strictly follow Apple's guidelines for subscription terms and user-to-user purchase definitions. |

---

## Verdict

**Profitable?** Yes  
**Key lever:** **UGC Retention & Content Moderation**. If moderation fails, user churn spikes and app store penalties kill the platform. If moderation succeeds, the highly engaging visual chat structure yields higher user session times and virality, driving organic growth.  
**Recommended next step:** Build the MVP roadmap. Prioritize on-device filters (Phase 0) to ensure low-cost moderation before building community systems.

# Profitability Model — CureIndia

**Modeler:** Antigravity AI  
**Date:** 2026-06-21  
**Revenue Model:** Hybrid (B2B SaaS/Listing + B2C Logistics Concierge Markup)  

> ⚠️ All numbers are estimates. State your assumptions explicitly.

---

## 1. Revenue Model Options

| Model | Pros | Cons | Fit for this idea |
|---|---|---|---|
| **Hospital referral commission (15-25%)** | High revenue potential per patient (₹50k-₹2L per surgery). | Violation of NMC 2023 guidelines; high legal risk; hospitals may refuse to list. | Low (Due to legal constraints) |
| **B2B Hospital Listing Subscription** | 100% legally compliant; predictable monthly recurring revenue (MRR). | Harder sales cycle; hospitals demand high lead-to-booking conversions. | High |
| **B2C Coordination & Care Fees** | Legally compliant; charges patients for value-added logistics coordination. | Limits conversions if patients feel nickel-and-dimed. | Medium |
| **Logistics Package Markup (Concierge)** | Legally compliant (selling accommodation/logistics, not medical referrals); high margin. | Operational burden to coordinate hotels, flights, and local transit. | High |

**Recommended model:** Hybrid: B2B Hospital Listing Subscription (flat-rate) + B2C Logistics Concierge Package Markup. This ensures 100% regulatory compliance with the NMC 2023 regulations while securing transaction margins through travel logistics rather than medical fee-splitting.

---

## 2. Pricing

| Tier / Service | Price | What's included | Target segment |
|---|---|---|---|
| **Basic Hospital Listing** | ₹0 | Free directory listing (name, address, standard specialties) | All NABH/JCI accredited hospitals |
| **Premium Hospital SaaS** | ₹30,000/mo | Priority directory listing, CRM portal, verified patient record pre-screening | Mid-to-large hospital groups |
| **Patient Coordination Fee** | ₹5,000 (flat) | Multi-hospital quote compilation, medical record storage, visa assistance | All international patients |
| **Premium Logistics Package** | ₹65,000 (approx. ₹15k margin) | Hotel booking (7 days), airport pick/drop, dedicated translator, local SIM | High-budget patients (e.g., US/UK/Middle East) |

**Pricing rationale:**
Hospitals are used to paying high fees for international patients. A flat ₹30,000/month is cheaper than a single commission booking, making it an attractive value proposition. The ₹5,000 patient coordination fee and logistics markup align with what local agencies charge but offer online transparency and safety guarantees.

---

## 3. Unit Economics
*Assuming an average patient opting for coordination + logistics concierge package*

| Metric | Estimate | Basis |
|---|---|---|
| **CAC (Customer Acquisition Cost)** | ₹8,000 | Targeted search ads (Google Ads: ₹100 CPC, 1.25% conversion rate) + content marketing. |
| **ACV (Annual Contract Value)** | ₹20,000 | Average revenue per patient (₹5k coord fee + ₹15k average logistics package markup). |
| **Gross Margin** | 65% | Cost of Goods Sold (COGS) includes translator payout, local transit cost, and cloud storage (approx. ₹7,000). |
| **LTV (Lifetime Value)** | ₹22,000 | Medical tourism is low-repeat; assuming a 1.1x repeat/referral multiplier. |
| **LTV:CAC Ratio** | 2.75:1 | Close to target 3:1. Improves as B2B hospital subscription revenue scales. |
| **Payback Period** | Immediate | Paid back on the first transaction (CAC is ₹8,000, margin is ₹13,000). |

---

## 4. Break-Even Analysis

| Item | Monthly Cost |
|---|---|
| **Fixed costs** | ₹2,50,000 (SaaS hosting: ₹20k, legal retainer: ₹50k, dev support: ₹1L, customer service: ₹80k) |
| **Variable cost per patient** | ₹2,000 (encrypted HIPAA storage, document translation APIs) |
| **Revenue per paying patient** | ₹20,000 |
| **Break-even scenario A (B2B only)** | 9 premium hospitals paying ₹30,000/mo covers fixed costs completely (₹2.7L MRR vs ₹2.5L fixed). |
| **Break-even scenario B (B2C only)** | 14 patients/month (assuming ₹18,000 net margin per patient covers ₹2.5L fixed). |
| **Realistic timeline to break-even** | 6 months (5 premium hospitals + 7 patients/month). |

---

## 5. Revenue Projection (Base Case)

| Month | Active Patients | Hospital SaaS Subs | MRR (B2B + B2C) | Cumulative Revenue |
|---|---|---|---|---|
| **1** | 2 | 2 | ₹52,000 | ₹52,000 |
| **3** | 6 | 5 | ₹2,70,000 | ₹3,82,000 |
| **6** | 15 | 8 | ₹5,40,000 | ₹14,92,000 |
| **12** | 40 | 15 | ₹12,50,000 | ₹68,42,000 |

**Growth assumption:**
- Patients grow 30% MoM starting from Month 2 as SEO rankings and agency partnerships establish.
- Hospital onboarding reaches 15 within a year through direct sales targeting international marketing managers.

---

## 6. Risks to the Model

| Risk | Impact | Mitigation |
|---|---|---|
| **High acquisition costs (CAC)** | Kills unit economics | Pivot from paid ads to content marketing (SEO blogs on treatment comparisons). |
| **Hospital churn on subscription** | Unpredictable MRR | Deliver highly qualified, pre-screened patient records so conversion rate is high. |
| **Offline payment bypass** | Loss of logistics markup | Tie the visa assistance and translator guarantee strictly to in-platform booking. |

---

## Verdict

**Profitable?** Yes  
**Key lever:** **B2B Hospital Subscription Conversion Rate** — We must ensure that the free-tier hospitals convert to premium tiers because their subscription fees form the baseline recurring revenue that covers fixed costs.  
**Recommended next step:** Proceed to feature-roadmapping. The MVP must prioritize the hospital listing directory, secure record upload, and a quote comparison dashboard.

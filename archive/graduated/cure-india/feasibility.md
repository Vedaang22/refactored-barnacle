# Feasibility Analysis — CureIndia

**Analyst:** Antigravity AI  
**Date:** 2026-06-21  
**Overall Verdict:** 🟡 Conditionally Feasible  

---

## 1. Technical Feasibility

| Dimension | Assessment | Confidence |
|---|---|---|
| Core tech exists? | Yes | High |
| Build complexity | Med | High |
| Key technical risks | - Secure HIPPA/DPDP-compliant sharing of medical records.<br>- Maintaining high security standards for international health documents. | High |
| Existing solutions to learn from | Vaidam, MediGence, Practo (for appointment scheduling). | High |

**Technical verdict:**
Technically, the directory, messaging, and document upload system are standard web infrastructure. The complexity lies in implementing HIPAA and India's Digital Personal Data Protection (DPDP) Act compliant security (e.g., end-to-end encryption for diagnostic files).

---

## 2. Market Feasibility

| Dimension | Assessment |
|---|---|
| Problem validated (evidence)? | Yes — High growth of patient inflows (post-COVID recovery) and government promotion. |
| Estimated TAM | Global: $76.1B (2025) | India: $8.7B (2025) |
| Existing competitors | - **Vaidam Health:** Large hospital directory; commission model (15-25%).<br>- **Hospals:** Localization concierge; markup/facilitation fee model.<br>- **Karetrip:** Patient concierge service fees; zero-broker commission model. |
| Differentiation | - NMC-compliant monetization (no hospital referral kickbacks).<br>- Rigorous rating and transparent pricing system for verified local concierge agencies. |
| Market timing | Right — Fueled by India's "Heal in India" campaign and e-medical visa streamlining. |

**Market verdict:**
The market is large ($8.7B in India) and growing fast. However, established competitors (Vaidam, Hospals) control strong channels, requiring CureIndia to differentiate on transparency, ethics, and concierge vetting rather than directory size.

---

## 3. Operational Feasibility

| Dimension | Assessment |
|---|---|
| Team skills gap | Healthcare compliance legal counsel; boots-on-the-ground agency auditor. |
| Key dependencies | JCI/NABH accredited hospitals; certified local logistics/lodging agencies. |
| Time to MVP | 8–12 weeks |
| Blockers | Strict National Medical Commission (NMC) regulations preventing fee-splitting (commissions). |

**Operational verdict:**
Vetting and signing SLAs with regional hospital international marketing desks is operationally intense. Ensuring local concierge agencies do not scam vulnerable patients requires constant quality control and a rigorous onboarding audit.

---

## 4. Regulatory / Legal
The legal surface area is high and critical:
- **NMC Registered Medical Practitioner Regulations (2023):** Strictly prohibits doctors/hospitals from paying commission or referral fees for patient procurement. Traditional commission-on-bill models (15-25% taken by early entrants like Vaidam) are under severe regulatory threat. CureIndia must design an alternative monetization model.
- **DPDP Act (India) / GDPR / HIPAA:** Cross-border transfer and storage of diagnostic reports (MRIs, biopsy files) require strict user consent, local data residency compliance, and secure encryption.

---

## 5. Key Risks
Rank by severity × probability:

| Risk | Severity | Probability | Mitigation |
|---|---|---|---|
| **NMC Commission Ban** | High | High | Avoid standard referral commissions. Monetize via hospital listing subscriptions or flat patient concierge fees. |
| **Offline Disintermediation** | High | High | Deliver value-added services on-platform (e.g., integrated translation, visa tracker, records vault). |
| **Medical Negligence / Liability** | High | Medium | Implement strict legal disclaimers. Do not recommend specific treatments; only display JCI/NABH accreditations. |
| **Data Breach of Medical Files** | High | Medium | End-to-end encryption; delete patient records from platform post-consultation completion. |

---

## 6. Critical Assumptions to Validate First
1. **Monetization Legality:** Validate that charging hospitals a flat SaaS/Listing fee (rather than a referral commission) is 100% compliant with the NMC regulations.
2. **Hospital Price Transparency:** Can we get major JCI/NABH hospitals to agree to publish standardized base package prices for top surgeries (e.g., CABG, Knee replacement)?
3. **Agency Vetting at Scale:** Can we establish a reliable, cheap verification checklist to onboard agencies without requiring expensive physical audits?

---

## Verdict & Recommendation
**Verdict:** 🟡 Conditionally Feasible  
**Reasoning:** The market TAM is huge, and the technical requirements are straightforward. However, the business model must be pivoted away from traditional medical tourism commission models (which violate the NMC 2023 guidelines) toward a compliance-first approach: either a flat-rate SaaS/subscription for hospital listing visibility, or a direct-to-consumer concierge package model (like Karetrip). Additionally, features to prevent offline bypass must be built into the core user flow.  
**Recommended next step:** Proceed to profitability-modeling to test the unit economics of a compliance-first revenue model (SaaS + Concierge fees) instead of the standard referral-commission model.

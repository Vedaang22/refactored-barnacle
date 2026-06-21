# Feature Roadmap — CureIndia

**Date:** 2026-06-21  
**Based on:** [feasibility.md](file:///C:/Ideas/refactored-barnacle/ideas/cure-india/feasibility.md) + [profitability.md](file:///C:/Ideas/refactored-barnacle/ideas/cure-india/profitability.md)  
**Horizon:** 5 weeks to MVP, 10 weeks to v1.0  

---

## Feature Inventory

| ID | Feature | Description | User story (as a ___ I want to ___ so that ___) |
|---|---|---|---|
| F-01 | Auth & Roles | Core user authentication and role management (Patient, Hospital, Agency, Admin). | As a user, I want to sign up with my role so that I access the appropriate dashboard features. |
| F-02 | Hospital Directory | Searchable database of accredited JCI/NABH hospitals with specialty and location filters. | As a patient, I want to search and filter hospitals so that I find the best facility for my treatment. |
| F-03 | Encrypted Medical Vault | Secure file upload and storage for medical records (MRIs, scans, histories). | As a patient, I want to upload medical files securely so that I can share them without privacy leaks. |
| F-04 | Quote Request Portal | Workflow to submit medical files to multiple hospitals and receive/compare package quotes. | As a patient, I want to request quotes from hospitals so that I can compare treatment costs and timelines. |
| F-05 | Concierge Directory | Listing of verified local agencies providing transit, lodging, and translation services. | As a patient, I want to find verified local coordinators so that I can arrange my medical visa and stay. |
| F-06 | Tele-Consult Scheduler | In-app video/audio meeting scheduling for pre-surgical consults. | As a patient, I want to schedule a video call with a doctor so that I can align on treatment before travel. |
| F-07 | Visa Assistant Tracker | Step-by-step checklist and digital tracker for obtaining an Indian e-medical visa. | As a patient, I want to track my visa application steps so that I ensure I can travel legally on time. |
| F-08 | Concierge Booking Engine | Platform booking for local lodging packages, airport pickups, and dedicated translators. | As a patient, I want to book local transport and lodging so that my arrival in India is seamless. |
| F-09 | Multi-Language Chat | Real-time chat with auto-translation (e.g., Arabic, Swahili, Russian to English/Hindi). | As a patient, I want to chat in my native language so that I can communicate with doctors and agencies. |
| F-10 | Billing Verification | Secure invoice reconciliation and post-treatment payment validation dashboard. | As a hospital, I want to log treated patients so that I can verify listing engagement and invoice accuracy. |

---

## Feature Classification

| ID | Feature | Must-have (MVP) | Nice-to-have | Future | Kill |
|---|---|---|---|---|---|
| F-01 | Auth & Roles | ✅ | | | |
| F-02 | Hospital Directory | ✅ | | | |
| F-03 | Encrypted Medical Vault | ✅ | | | |
| F-04 | Quote Request Portal | ✅ | | | |
| F-05 | Concierge Directory | ✅ | | | |
| F-06 | Tele-Consult Scheduler | | | ✅ | |
| F-07 | Visa Assistant Tracker | | ✅ | | |
| F-08 | Concierge Booking Engine | | ✅ | | |
| F-09 | Multi-Language Chat | | ✅ | | |
| F-10 | Billing Verification | | | ✅ | |

**MVP features:** F-01, F-02, F-03, F-04, F-05  
**MVP rationale:** These 5 features validate the core assumption: that foreign patients are willing to upload their medical records online in exchange for transparent quotes from accredited hospitals and contact with verified local support.

---

## Dependency Map

```
F-01 (Auth & Roles)
  ├── F-03 (Encrypted Medical Vault)
  │     └── F-04 (Quote Request Portal)  ← blocked by: F-03 + F-02
  └── F-02 (Hospital Directory)
        └── F-05 (Concierge Directory)
              └── F-08 (Concierge Booking Engine)  ← blocked by: F-05 + F-04
```

**Blocking dependencies:**
- **[F-01]** blocks **[F-03]** & **[F-02]** because patients must have account access before creating vaults, and hospital profiles require verified hospital accounts.
- **[F-03] & [F-02]** block **[F-04]** because a quote request cannot be generated without patient records and hospital destinations.
- **[F-04] & [F-05]** block **[F-08]** because patients can only book travel logistics once they have chosen a hospital and received their medical quote.

**External dependencies:**
- **AES-256 Client-Side Encryption API** → Core security risk if client-side encryption causes high latency or crashes on mobile browsers.
- **Govt Visa API/Portals** (for Visa Assistant) → Indian Visa rules can change dynamically, risking checklist accuracy.

---

## Critical Path

The shortest sequence of features that gets us to a shippable MVP:

```
[F-01] ──> [F-03] ──> [F-02] ──> [F-04] ──> [F-05] ──> MVP
  3d        5d         4d         4d         2d       = 18 days minimum
```

**Critical path length:** 18 development days (approx. 3.5 calendar weeks).  
**Float:** There is no float for the MVP features; any delay in F-01, F-02, F-03, or F-04 directly delays the MVP release.

---

## Rollout Phases

### Phase 0 — Foundation (Week 1–2)
Goal: Scaffold identity management and data storage structure.
- [ ] F-01: Auth & Roles setup
- [ ] F-02: Populate static JCI/NABH Hospital Directory database (15 hospitals)

### Phase 1 — MVP (Week 3–5)
Goal: Enable secure medical record sharing and direct quote comparisons.
- [ ] F-03: Deploy Encrypted Medical Vault for file uploads
- [ ] F-04: Launch Quote Request Portal (email/dashboard notification to hospital reps)
- [ ] F-05: Integrate Concierge Directory (static list of verified providers)

### Phase 2 — v1.0 (Week 6–10)
Goal: Automate concierge booking and reduce user onboarding friction.
- [ ] F-07: Indian Visa Assistant & Checklist Tracker
- [ ] F-08: Concierge Package Booking Engine (Hotels, Transport)
- [ ] F-09: Live Chat Auto-Translation (Arabic/Russian/English)

### Phase 3 — Growth features
- [ ] F-06: Integrated video telemedicine consultation portal
- [ ] F-10: Hospital billing verification dashboard

---

## Algorithm / Technical Sketches

### Secure Zero-Knowledge Record Sharing (F-03 & F-04)
```
+------------------+                   +----------------------+                   +-------------------+
|  Patient Browser |                   |   CureIndia Server   |                   |  Hospital Browser |
+------------------+                   +----------------------+                   +-------------------+
         |                                         |                                        |
         | 1. Request Hospital Public Key          |                                        |
         |---------------------------------------->|                                        |
         | 2. Return Hospital Public Key          |                                        |
         |<----------------------------------------|                                        |
         |                                         |                                        |
         | 3. Generate symmetric AES-256 key       |                                        |
         | 4. Encrypt Medical PDF with AES key     |                                        |
         | 5. Encrypt AES key with Hospital PubKey |                                        |
         |                                         |                                        |
         | 6. Upload Encrypted PDF & Encrypted Key |                                        |
         |---------------------------------------->|                                        |
         |                                         | 7. Store PDF in S3                     |
         |                                         | 8. Notify Hospital of quote request    |
         |                                         |--------------------------------------->|
         |                                         |                                        |
         |                                         | 9. Request Encrypted PDF & Encrypted Key|
         |                                         |<---------------------------------------|
         |                                         | 10. Deliver PDF & Encrypted Key        |
         |                                         |--------------------------------------->|
         |                                         |                                        |
         |                                         |                                        | 11. Decrypt AES Key with Private Key
         |                                         |                                        | 12. Decrypt PDF with AES Key
```

---

## Open Questions Before Building Starts
- [ ] Which third-party translation API (Google Translate vs. DeepL) is most cost-efficient and accurate for medical terminologies?
- [ ] How do we legally structure the concierge package bookings (F-08) to ensure we act as a broker/aggregator and do not absorb medical or lodging liability?

---

## Risk Register

| Risk | Affects | Mitigation | Owner |
|---|---|---|---|
| HIPAA/DPDP Regulatory Violations | F-03 | Third-party compliance audit of database security before Phase 1. | Lead Dev |
| Hospital Reps ignore quote requests | F-04 | Setup automated WhatsApp/SMS notifications for hospital coordinators. | Product Manager |
| Concierge service failure (scam) | F-05, F-08 | Implement strict legal disclaimers; hold deposit in escrow for agencies. | Legal & Operations |

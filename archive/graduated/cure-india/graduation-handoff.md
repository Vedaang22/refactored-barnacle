# Graduation Handoff — CureIndia

**Graduated on:** 2026-06-21  
**From:** ideas/cure-india/  
**To:** New repo — `cure-india-app`  
**Owner:** User  
**Co-owner:** Antigravity AI  

---

## Files Generated

| File | Purpose |
|---|---|
| `vision.md` | Full product vision — migrates to `docs/vision.md` |
| `agents-blueprint.md` | Agent + skill spec for the build repo |
| `bootstrap.sh` | Run this to create the new repo |
| `roadmap.md` | Feature plan — migrates to `docs/roadmap.md` |
| `feasibility.md` | Analysis — migrates to `docs/feasibility.md` |
| `profitability.md` | Economics — migrates to `docs/profitability.md` |

## How to Bootstrap

```bash
# From the root of this idea repo:
bash ideas/cure-india/bootstrap.sh

# Or to a custom path:
bash ideas/cure-india/bootstrap.sh ../cure-india-app
```

## Key Decisions Made Here
1. **Compliance-First Monetization:** Abandoned traditional pay-per-patient hospital referral commissions to strictly comply with the National Medical Commission (NMC) 2023 regulations banning medical fee-splitting. Monetized instead via flat-rate B2B SaaS listing subscriptions for premium hospitals (₹30,000/mo) and B2C logistics package markups (average ₹15,000 margin) for transport, translation, and lodging coordination.
2. **Zero-Knowledge Encrypted Medical Vault:** Structured a client-side encryption data flow. Patient records (MRIs, diagnostic files) are encrypted using AES-256 in the user's browser before being uploaded. The AES key is encrypted using the target hospital clinical desk's public key, ensuring that CureIndia servers never hold patient health records in an unencrypted state. This satisfies HIPAA, GDPR, and India's DPDP Act.
3. **Quality Directory over Mass Listings:** Confined the MVP directory strictly to JCI- and NABH-accredited hospitals in major hubs (Delhi, Mumbai, Bangalore) and verified concierge agencies to establish trust. Avoided unaccredited listings or paid placement tiers for unvetted providers.

## What Was Explicitly Ruled Out
- **Direct Visa Filing:** Processing and filing international medical visa applications with the government was ruled out due to high immigration/legal liability and operational overhead. The platform provides a visa tracker checklist (F-07) and hooks patients up with registered concierge agencies who handle visa filing directly.
- **Custom Video Call Infrastructure:** Excluded building from-scratch WebRTC video pipelines. The Tele-Consult Scheduler (F-06) will leverage Zoom/Jitsi API integrations or direct hospital telemedicine links to focus core resources on the directory and record vault.
- **In-Platform Medical Escrow & Insurance:** Integrations for cross-border medical insurance claims and holding large surgery fee deposits in escrow were ruled out due to complex cross-border financial regulations, capital requirements, and tax compliance issues. Patients pay hospitals directly.

## Remaining Open Questions
- [ ] **F-09 Translation API:** Which translation service API (Google Translate vs. DeepL) provides the highest accuracy for medical/clinical terms at scale?
- [ ] **F-08 Logistics liability:** What is the exact legal contract structure needed for B2C package bookings to ensure CureIndia is insulated from lodging service or transit issues?
- [ ] **F-05 Scalable Agency Vetting:** Can we implement an automated digital checklist to verify concierge agencies (business license check, physical office via Google Street View, reference audit) without requiring boots-on-the-ground inspections?

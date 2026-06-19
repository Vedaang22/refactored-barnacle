# Feasibility Analysis — Scribble

**Analyst:** Antigravity  
**Date:** 2026-06-19  
**Overall Verdict:** 🟡 Conditionally Feasible  

---

## 1. Technical Feasibility

| Dimension | Assessment | Confidence |
|---|---|---|
| Core tech exists? | Yes | High |
| Build complexity | Very High | High |
| Key technical risks | Real-time visual synchronization for public community canvases, low-latency drawing duets, automated real-time NSFW scribble moderation before widget delivery | High |
| Existing solutions to learn from | noteit (silent push widget updates), Reddit's r/place (massive collaborative canvas scaling), Tinder/Bumble (matchmaking architectures) | High |

**Technical verdict:**
Scaling a private widget sync to support massive public "Community Canvases" and AI-driven "Doodle Matchmaking" increases complexity from High to Very High. While private drawing widgets are feasible using standard silent APNs/FCM pushes, rendering real-time collaborative strokes for active "Doodle-Duets" requires high-performance WebSocket channels, and public canvases will require a tile-based rendering and partitioning system.

---

## 2. Market Feasibility

| Dimension | Assessment |
|---|---|
| Problem validated (evidence)? | Yes (Noplace reaching #1 on App Store in mid-2024 and Ten Ten's rapid adoption prove Gen Z's demand for raw, unfiltered, aesthetic-first connection spaces) |
| Estimated TAM | $61.8 Billion (Future Market Insights - 2025 global mobile social networking market) |
| Existing competitors | noteit (drawings), Locket Widget (photos), Noplace (Gen Z profile customization), BeReal (authenticity), Discord (community hubs) |
| Differentiation | Home screen widget-native interface. Rather than scrolling a list of posts, users interact with a live, co-edited visual canvas from their home screen. |
| Market timing | Right (Gen Z is actively migrating away from corporate feeds like Instagram/TikTok to niche, cozy visual environments) |

**Market verdict:**
Pivoting Scribble to a full social platform dramatically expands the target market size by capturing interest-based communities, not just existing friend circles. The visual-first "Doodle Match" is a unique differentiator in a crowded dating/friend-finding market.

---

## 3. Operational Feasibility

| Dimension | Assessment |
|---|---|
| Team skills gap | Requires experience in real-time WebSockets, Vector database clustering (for drawing matches), on-device CoreML/TensorFlow, and trust & safety infrastructure |
| Key dependencies | Apple/Google push gateways, scalable visual CDNs, automated NSFW image-filtering APIs |
| Time to MVP | 10–12 weeks |
| Blockers | Strict Apple/Google guidelines regarding user-generated content (UGC). A single unmoderated NSFW doodle delivered to a minor's widget will lead to app store ban. |

**Operational verdict:**
Operationally complex. Moving into the public social space requires an immediate and robust trust & safety engine (moderation filters, reporting systems) from day one.

---

## 4. Regulatory / Legal
Operating a public Gen Z social platform requires compliance with **COPPA** (strict parental consent loops for users under 13), **GDPR**, and the **Digital Services Act (DSA)**. Content moderation pipelines must be documented and auditable to prevent online harassment and platform abuse.

---

## 5. Key Risks
Rank by severity × probability:

| Risk | Severity | Probability | Mitigation |
|---|---|---|---|
| **UGC Moderation Failure** (NSFW sketches pushed to home screen widgets) | Critical | High | Run drawings through an on-device convolutional neural network (CNN) image classifier before upload, and apply a 3-report auto-hide protocol for public canvases. |
| **Widget Update Throttling** | High | High | Deliver local UI rendering feedback immediately, queueing the cloud sync and widget updates to trigger asynchronously. |
| **Empty Room Syndrome** (Public canvases lack active drawers) | High | Medium | Integrate automated daily prompt systems and AI collaborative brushes that draw with the user to keep the canvas alive. |
| **Matchmaking Churn** (Matched users stop drawing after a day) | Medium | High | Introduce streaks and evolving shared assets (digital pets) that grow based on collaborative doodle frequency. |

---

## 6. Critical Assumptions to Validate First
1. **Moderation Latency:** Validate if a lightweight, on-device CoreML image-filter can detect inappropriate sketches in <150ms without lagging the draw experience.
2. **Doodle Similarity Matching:** Build a prototype vector clustering algorithm that can match coordinate arrays of drawings of the same prompt (e.g., "draw a star").
3. **Public Canvas Bandwidth:** Test the performance of a WebSocket server synchronizing 1,000 active concurrent drawing pointers on a shared coordinate canvas.

---

## Verdict & Recommendation
**Verdict:** 🟡 Conditionally Feasible  
**Reasoning:** The platform is highly viable if we invest heavily in automatic moderation filters and use a stroke-coordinate system (vectors) instead of rasterized images to keep backend bandwidth costs low. The potential viral growth of "Doodle Match" makes this risk worth pursuing.  
**Recommended next step:** Refine the profitability model to account for higher hosting/moderation costs and draft the updated MVP roadmap.

---

## Assumption Stress-Test: Scribble

### The 5 Most Dangerous Assumptions

---

**Assumption 1: Automated moderation models can accurately block inappropriate visual content (NSFW/hate symbols) drawn by hand in real-time.**
- Why it might be wrong: Sketching allows for infinite creative variations, abstract symbols, and text written in doodles. Standard image moderation models are trained on photos, not rough line sketches, and will suffer from high false-negative rates, leading to offensive content leaking to users' widgets.
- Cheap validation: Collect a dataset of 500 hand-drawn sketches (appropriate and inappropriate) and benchmark existing open-source sketch moderation models to check accuracy.
- Kill probability if wrong: Critical

---

**Assumption 2: Users will feel comfortable allowing public community doodles or doodles from matched strangers to update directly on their personal home screens.**
- Why it might be wrong: The home screen is highly personal real estate. If a stranger draws something annoying, weird, or unappealing, users will instantly delete the widget to reclaim control over their home screen aesthetic.
- Cheap validation: Run a prototype study where 15 Gen Z users link their widgets to a semi-moderated stranger's stream for 3 days and survey their comfort levels and drop-off rates.
- Kill probability if wrong: High

---

**Assumption 3: Drawing coordinate/vector matching is an effective proxy for personal compatibility in matchmaking.**
- Why it might be wrong: Just because two people complete a drawing prompt in a similar style does not mean they will have conversational chemistry. Users may find matches superficial, leading to rapid drop-off in active chats.
- Cheap validation: Set up a manual matching game on a Discord server where 50 users are matched based on how they complete a visual prompt. Measure how many conversations last beyond 5 messages.
- Kill probability if wrong: Medium

---

**Assumption 4: Fandoms and online interest communities will actively draw together on public widgets instead of chatting on Discord or Reddit.**
- Why it might be wrong: Doodling is highly collaborative but lacks information density. Fandoms exist to share news, gossip, and detailed media, which cannot be expressed easily in doodles, meaning public canvases might remain gimmick tools.
- Cheap validation: Create a public collaborative whiteboard for a popular fandom (e.g., a specific K-pop band or anime) on a platform like Miro, post it on Reddit/Twitter, and track daily active drawing volume over a week.
- Kill probability if wrong: High

---

**Assumption 5: Server costs for scaling real-time WebSocket coordinate streaming for thousands of concurrent drawers can be offset by freemium/IAP models.**
- Why it might be wrong: Real-time WebSockets and database writes are expensive at scale. If 98% of the community remains free tier, server overhead may outpace ad/subscription revenues.
- Cheap validation: Run a load test simulating 10,000 concurrent drawing connections to calculate hosting costs and project MRR targets needed to sustain them.
- Kill probability if wrong: Medium

---

### The One Thing Most Likely to Kill This Idea
The moderation risk of public canvases. If a malicious user bypasses filters and posts offensive sketches directly onto hundreds of users' home screens, the app will face immediate user backlash, public PR crises, and swift removal from the iOS App Store and Google Play Store for violating UGC safety guidelines.

### What the Team is Probably Overconfident About
The team is overconfident that visual matching alone can sustain social relationships, assuming that the novelty of doodle matching can replace the rich text-and-media features of mature social apps. They are also underestimating the operational overhead of trust & safety moderation.

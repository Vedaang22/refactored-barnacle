# Feasibility Analysis — Scribble

**Analyst:** Antigravity  
**Date:** 2026-06-20  
**Overall Verdict:** 🟡 Conditionally Feasible  

---

## 1. Technical Feasibility

| Dimension | Assessment | Confidence |
|---|---|---|
| Core tech exists? | Yes | High |
| Build complexity | Very High / Extreme | High |
| Key technical risks | iOS 17+ / Android widget interaction budgets, coordinate-to-audio sync for Voice Scribbles, high-density WebSocket state sync in Community Halls | High |
| Existing solutions to learn from | Habbo/Club Penguin (2D room assets), dynamic vector playback engines, iOS WidgetKit interactive configurations | High |

**Technical verdict:**
Transitioning Scribble from a simple doodling tool to a spatial social media app raises build complexity to Very High. While 2D pixel-art room layouts (JSON-based coordinates) are highly feasible, syncing drawing coordinates to voice recordings (Voice Scribbles) requires tight timestamp synchronization. Interactive widget games (e.g., Tic-Tac-Toe) are feasible but bounded by iOS/Android widget background processing budgets and latency rules.

---

## 2. Market Feasibility

| Dimension | Assessment |
|---|---|
| Problem validated (evidence)? | Yes (The revival of customized spatial profiles like Noplace and aesthetic desktop customizing apps prove Gen Z's high interest in cozy digital workspaces and expressive avatars) |
| Estimated TAM | $61.8 Billion (Future Market Insights - 2025 global mobile social networking market) |
| Existing competitors | Noplace (custom profiles), Roblox (virtual spaces), Discord (interest lounges), noteit (widgets), Locket Widget |
| Differentiation | Home screen widget-native spatial lounges. It marries room decoration games (like Animal Crossing) with a micro-widget social network and community lobbies. |
| Market timing | Right (Massive trend towards cozy, low-pressure aesthetic digital environments and anti-scroll platforms) |

**Market verdict:**
Pivoting to spatial Rooms and Community Halls elevates Scribble from a utility widget to an authentic social network. It taps into Gen Z's desire for visual, slow-paced spaces to interact without standard algorithmic pressure.

---

## 3. Operational Feasibility

| Dimension | Assessment |
|---|---|
| Team skills gap | Requires mobile developers who understand WidgetKit interactive APIs, audio compression, and 2D canvas collision systems. |
| Key dependencies | Apple APNs/FCM, Spotify SDK (for Jukebox integration), scalable CDN storage for voice clips and room assets. |
| Time to MVP | 12–14 weeks |
| Blockers | Content moderation rules for public Community Halls and Room guest boards. The App Store requires instant reporting and automatic screening of user-drawn visuals. |

**Operational verdict:**
High operational effort. Moderating text and doodles in public Community Halls is a major operational dependency requiring both automated screening models and user-led moderation systems.

---

## 4. Regulatory / Legal
Requires strict compliance with **COPPA** and **GDPR** as the demographic trends young (ages 13–22). Features like Jukebox (Spotify sync) must comply with music licensing guidelines (utilizing official Spotify/Apple Music SDK widgets rather than hosting copyrighted audio streams).

---

## 5. Key Risks
Rank by severity × probability:

| Risk | Severity | Probability | Mitigation |
|---|---|---|---|
| **Widget UI Throttling** (Interactive widget clicks lag) | High | High | Keep widget games asynchronous and local. Store state changes locally and sync to the cloud in the background, updating the widget interface instantly from local memory. |
| **Public Hall Spam / Griefing** | Critical | High | Implement strict room submission gates (e.g., must be a user for 24h before posting in a public Hall) and automatic sketch screening APIs. |
| **Asset Fatigue** (Users run out of furniture/room items) | Medium | High | Partner with indie pixel artists to publish weekly themed furniture drops, creating a continuous content pipeline. |
| **Audio-Sync Latency** (Voice Scribbles drawing plays out of sync with sound) | Medium | Medium | Compress audio to lightweight ACC formats and bundle drawing vectors with audio delta-time arrays in a single compressed JSON package. |

---

## 6. Critical Assumptions to Validate First
1. **Interactive Widget Latency:** Build a basic Tic-Tac-Toe widget on iOS using `AppIntent` and Android using `PendingIntent` to measure responsiveness and OS limits.
2. **Audio-Drawing Sync Array:** Build a prototype vector capture loop that records coordinate timestamps relative to an active audio input.
3. **Room Render Budget:** Test mobile device memory profiles when rendering a room containing 50+ custom pixel-art layers.

---

## Verdict & Recommendation
**Verdict:** 🟡 Conditionally Feasible  
**Reasoning:** The spatial pivot is highly viable but technically challenging. The core risk shifts from "do users want to draw" to "does the widget feel responsive during interactions." Focus Phase 0 on interactive widget latency test spikes.  
**Recommended next step:** Refine the virtual item pricing models and draft the updated MVP roadmap.

---

## Assumption Stress-Test: Scribble

### The 5 Most Dangerous Assumptions

---

**Assumption 1: Mobile operating systems allow interactive home-screen widgets to handle fast tap events (e.g. playing games, decorating) with low latency.**
- Why it might be wrong: iOS WidgetKit reloads timelines asynchronously. Tap interactions that trigger complex calculations or network requests will result in a visual lag (1-2 seconds) on the widget, causing users to get frustrated and open the main app, rendering the widget gimmick useless.
- Cheap validation: Build an interactive widget prototype with a button that increments a counter on tap. Run it on iOS 17/18 and Android to measure latency from tap to visual update.
- Kill probability if wrong: High

---

**Assumption 2: Gen Z users will continuously customize and interact with their 2D virtual rooms rather than treating it as a one-time setup.**
- Why it might be wrong: Customization games (like Habbo or Animal Crossing) require continuous progression loops. Without quests, new item releases, or events, users will customize their room once, show it off, and never open the editor screen again.
- Cheap validation: Launch a simple web-based room builder mock (using Canva or Figma components) and share it with 30 Gen Z users. Track if they return to edit or share new layouts after 7 days.
- Kill probability if wrong: Medium

---

**Assumption 3: Fandoms and communities will hang their canvases in "Halls" and explore other rooms, instead of using standard scroll feeds.**
- Why it might be wrong: Discovering content by walking through virtual "Halls" is slower than scrolling a feed. Users might find the navigation tedious, leading to low discovery engagement and lower overall pageviews.
- Cheap validation: Set up a simulated community directory on a website (e.g. Notion or a visual web-page) where users click through rooms to see content. Measure exit rates versus a standard scrollable wall.
- Kill probability if wrong: High

---

**Assumption 4: Users will use Voice Scribbles (audio-synced drawings) as a regular communication channel.**
- Why it might be wrong: Recording voice notes and drawing simultaneously requires dual coordination and high friction. Most users will find it easier to just record a voice note or send a simple text, leading to low adoption of the feature.
- Cheap validation: Give a pilot group access to a tool where they must record a voice memo while sketching. Track their usage frequency and compare it to text messaging.
- Kill probability if wrong: Medium

---

**Assumption 5: Microtransactions for virtual furniture and wallpapers can support the hosting costs of real-time spatial servers.**
- Why it might be wrong: Virtual economy apps depend on high volumes. If user retention drops before they buy assets, server costs for WebSockets and CDN storage will drain our operational runway.
- Cheap validation: Run a survey with 100 Gen Z mobile game players to measure their willingness to spend ₹49-199 on non-functional virtual bedroom decorations.
- Kill probability if wrong: Medium

---

### The One Thing Most Likely to Kill This Idea
Interactive widget lag. If Apple and Google's background execution rules restrict widget reloads to prevent battery drain, the interactive home-screen features (widget games, music jukebox taps) will feel sluggish and unresponsive, defeating the core value proposition of an interactive home-screen social platform.

### What the Team is Probably Overconfident About
The team is overconfident about Gen Z's patience. They assume users will navigate a 2D spatial lounge (Halls) and tap on rooms to discover content rather than defaulting to the instant gratification of algorithmic scroll feeds like TikTok.

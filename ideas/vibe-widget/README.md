# Scribble (formerly VibeWidget)

**Stage:** Seed  
**Created:** 2026-06-19  
**Owner(s):** User  
**One-liner:** A visual-first social network where Gen Z connects, explores, and builds communities through interactive home-screen widgets and collaborative canvases.

---

## Problem
Gen Z is experiencing extreme fatigue from performative, ad-cluttered, and algorithmically bloated social platforms (Instagram, TikTok). They are shifting toward smaller, authentic micro-communities, but existing platforms (like WhatsApp or Discord) are text-heavy and lack casual, creative, and ambient ways to co-exist and discover like-minded people visually.

## Solution
**Scribble** is a visual social platform anchored directly on the user's home screen via interactive widgets. Instead of standard text feeds, communication happens on shared, real-time visual canvases. Users can maintain private "Vibe Rooms" for close friends, join public "fandom/interest tapestries," and explore new friends through low-pressure visual matches (Doodle Matchmaking).

## Target User
- **Primary:** Gen Z (aged 13–24) seeking casual, creative, and authentic ways to stay in touch with friends and find their "niche" online.
- **Secondary:** Digital artists, custom keyboard/theme creators, and online fandom communities.

## Key Assumptions
1. Gen Z will engage with visual doodling and avatar interaction as a primary, sustainable method of social messaging.
2. Users will permit community-generated content (public tapestries) to update directly on their highly personal home-screen widgets.
3. Visual matchmaking (matching people based on how they draw or complete prompts) provides a lower-friction, safer discovery loop than photo-based swiping.
4. Mobile operating systems (iOS/Android) will allow background widget updates at a frequency high enough to feel interactive without killing device battery.

## Initial Scope (MVP)
A mobile application with companion widgets supporting:
1. **Vibe Rooms:** Private collaborative canvases for up to 5 friends with custom avatar presence overlay.
2. **Doodle-Duets:** Real-time live drawing with a friend when both are active.
3. **Doodle Match:** Visual discovery feature where users complete a drawing prompt and are matched with others who drew similarly.
4. **Push-to-Widget:** Home screen widget that automatically displays the latest canvas edits via silent APNs/FCM triggers.

## Out of Scope (v1)
- Video posts, live-streaming, or stories.
- Professional creator suites or complex monetized marketplaces.
- Direct messaging via standard text chats (communication is strictly visual drawings, stamps, and short drawing notes).

## Open Questions
- [ ] How do we scale public "Community Canvases" without them becoming cluttered with inappropriate content or spam?
- [ ] Can we use on-device vector stroke rendering instead of heavy PNG uploads to enable animated drawing replays on the widget?
- [ ] How do we balance privacy and safety in the "Doodle Match" discovery loop?

## Related Ideas
*None yet*

## Notes
- Inspired by Noplace's profiles, Loklok's lock-screen overlay, and Locket's home-screen intimacy.
- Aims to turn home-screen widgets into a full-scale discovery and community social network.

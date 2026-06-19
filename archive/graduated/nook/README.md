# Nook

**Stage:** Seed  
**Created:** 2026-06-20  
**Owner(s):** User  
**One-liner:** A virtual room-based spatial social network for Gen Z featuring customizable pixel-art rooms, personalized pixel avatars ("Nookies"), interactive widget pets, and haptic widget communication.

---

## Problem
Gen Z is disconnected by flat scrolling feeds and lonely chat groups. They crave spatial "hangout" environments that replicate physical spaces (like customized bedrooms or neighborhood lounges) and expressive visual identities, but existing virtual platforms are either too heavy/gaming-focused (Roblox) or lack widget-native OS integration for continuous low-pressure connection.

## Solution
**Nook** is a lightweight, spatial social network. Every user gets a customizable **Virtual Room** and a customizable **Nookie (Pixel Avatar)**. Users explore by entering public **Community Halls** (fandom lounges, gaming spaces) where their avatars can hang out. Communication is ambient and visual, utilizing "Vibe-Knocks" (haptic rhythmic knocks), "Widget Duets" (asynchronous widget doodles), and interactive "Nook Pets" cared for co-operatively on the home screen.

## Target User
- **Primary:** Gen Z teens and young adults (aged 13–24) who love aesthetic customization, avatar styling, and low-pressure online hangout spots.
- **Secondary:** Independent digital artists, custom theme designers, and online fandom communities.

## Key Assumptions
1. Gen Z is willing to invest time customizing a digital space (Room) and character (Nookie) as a primary form of self-expression.
2. Home-screen widgets are viable channels for playing asynchronous micro-games, feeding virtual pets, and sharing ambient status updates.
3. Interest-based "Community Halls" will drive natural user discovery and reduce app install friction.
4. Scale limits on real-time canvas synchronizations can be managed via server-side spatial tiling.
5. High customization asset variety can be loaded on client devices without exceeding mobile widget memory limits (~30MB on iOS).

## Initial Scope (MVP)
A mobile application with widgets supporting:
1. **The Room (Profile):** A pixel-art canvas room where users arrange furniture and place their custom Nookie avatar.
2. **Nookies (Pixel Avatars):** Modular 2D pixel character styling system (mix-and-match outfits, accessories, and active status emotes).
3. **Nook Pets (Widget Companions):** A virtual widget pet that you and your visitors can pet/feed to maintain its health and mood.
4. **Community Halls:** Themed lobbies (Anime, Gaming, Chill Lounge) where users can walk around, showcase rooms, and interact.
5. **Widget Duets & Vibe-Knocks:** Asynchronous home-screen doodles (Duets) and custom rhythmic vibration pings (Knocks) sent directly to close friends' widgets.
6. **On-Device AI Moderation:** Local classifier to scan Guest Board doodles and custom uploads before saving.

## Out of Scope (v1)
- 3D environments or VR support (strictly 2D pixel-art/vector spaces).
- Complex custom animation builders (all avatar emotes and furniture movements are pre-designed templates).
- Unrestricted public room styling (all assets are loaded from standard theme libraries and marketplaces to maintain performance).

## Open Questions
- [ ] How do we prevent inappropriate imagery on public Hall canvases and guest whiteboards in real time?
- [ ] How do we handle modular pixel asset loading (avatar clothes + body + room accessories) inside iOS's strict 30MB widget RAM execution budget?
- [ ] What data structures are most efficient for syncing room furniture layout states and avatar coordinates (JSON coordinates vs server-side canvas renders)?

## Related Ideas
*None yet*

## Notes
- Drawing inspiration from Club Penguin, Habbo Hotel, Snapchat Bitmojis, Locket, and iOS interactive widgets.
- Expanding beyond basic drawing to focus on digital co-presence and spatial hanging out.

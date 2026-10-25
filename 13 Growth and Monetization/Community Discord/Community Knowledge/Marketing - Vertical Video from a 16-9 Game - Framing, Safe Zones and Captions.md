---
area: "13 Growth and Monetization"
cluster: "Community Discord"
title: "Marketing - Vertical Video from a 16-9 Game - Framing, Safe Zones and Captions"
tags: [roblox, community-knowledge, marketing, vertical-video, editing, captions]
cssclasses: [tg-a13]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://ads.tiktok.com/help/article/creative-best-practices
  - https://support.google.com/youtube/answer/15424877?hl=en
  - https://create.roblox.com/docs/workspace/camera/free-camera
  - https://obsproject.com/forum/resources/aitum-vertical.1715/
---
# Marketing - Vertical Video from a 16-9 Game - Framing, Safe Zones and Captions

Roblox renders 16:9 on PC, but TikTok, Shorts and Reels are 9:16. A centre crop keeps only about a third of the frame width and often cuts off the action, the HUD and the player. Plan vertical **at capture time**, not in the edit. This note covers three capture strategies, where platform UI covers the frame, and caption rules that survive sound-off viewing.

## 1. Three ways to get vertical footage

| Method | How | Pros / cons |
|---|---|---|
| **Crop from a high-res master** | record 1440p or 4K 16:9, crop a 9:16 window and keyframe it to follow the action | easy; you lose resolution (a 1440p crop is about 810 px wide, upscaled) |
| **Vertical OBS canvas** | Aitum Vertical plugin (third-party) or a second 1080×1920 scene | composed live; more setup |
| **Vertical window capture** | run the Roblox client in a tall window (e.g. 1080×1920 on a rotated or large monitor) so the game renders natively tall | the game itself frames for portrait; UI may re-layout, so test |

Roblox's engine renders whatever window shape it gets, so a portrait window gives true vertical with a wider vertical FOV. Freecam's zoom (scroll wheel / X-Y) adjusts FOV to taste. Check your ScreenGuis on narrow screens: anchoring that works on phones usually holds up.

## 2. Framing rules for 9:16
- **Subject in the centre third vertically**, a bit above middle. The bottom is covered by captions and buttons.
- **Track the action:** keyframe the crop to follow the player (slow eased moves, no jitter).
- **Stack two views:** gameplay on top and a reaction or zoomed detail below (the "split screen" format). It works well for building-plus-result clips.
- Prefer **closer camera distance** than in 16:9. Small characters disappear on a phone.

## 3. Platform UI safe zones
TikTok's creative guide says to keep key content **inside the UI safe zone** (exact pixel boxes are in TikTok's ad specs and change by placement). A practical rule of thumb for 1080×1920 that works across TikTok, Shorts and Reels (our estimate, not an official spec):
- Keep text and faces out of roughly the **bottom ~20%** (caption, sound and username area) and the **right ~15%** (like, comment and share column).
- Leave a small top margin for the status bar and the "Following / For You" tabs.
- Export a **safe-zone overlay PNG** once and put it on a guide track in your editor template.

## 4. Captions and text
- Most viewers watch muted at first. Burn in **captions** for any voice line, using big sans-serif text with an outline or box.
- TikTok suggests on-screen text at about **5-10 words per second** at most. Fewer is better for a hook (3-7 words).
- Keep text in the upper-middle third. Place it differently from the platform's auto-captions to avoid overlap.
- Use the same font and colour on every post (brand recognition).

## 5. Export settings
- 1080×1920, 30 or 60 fps (match the capture), H.264, high bitrate (the platform will re-compress anyway).
- YouTube treats vertical or square videos **≤ 3 minutes** as Shorts.
- Keep a **clean master** with no platform stickers, so you can re-post on each platform.

## Pitfalls
- Centre-cropping a wide fight: the action happens off-crop. Re-shoot vertical-first.
- Tiny HUD text that is unreadable after cropping. Hide it, or zoom into it on purpose.
- Captions under the TikTok description text. Check every export against the overlay.

## Related
[[Community Discord - Hub]] · [[Marketing - OBS Settings for Recording Roblox Gameplay]] · [[Marketing - Short-Form Hooks - Winning the First Two Seconds]] · [[Gameplay Video Thumbnail - Shot List and Edit Structure]]

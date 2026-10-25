---
area: "13 Growth and Monetization"
cluster: "Community Discord"
title: "Marketing - OBS Settings for Recording Roblox Gameplay"
tags: [roblox, community-knowledge, marketing, obs, recording, capture]
cssclasses: [tg-a13]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://obsproject.com/kb/standard-recording-output-guide
  - https://obsproject.com/blog/obs-studio-30-2-release-notes
  - https://obsproject.com/forum/threads/best-settings.140188/
  - https://obsproject.com/forum/resources/aitum-vertical.1715/
---
# Marketing - OBS Settings for Recording Roblox Gameplay

Social platforms re-compress everything you upload. Footage that is blurry or stuttery before upload looks much worse afterwards, so record at much higher quality than you publish. OBS Studio is free, and once set up it handles 16:9 masters, a vertical canvas and separate audio tracks for editing. This note gives a recording profile for Roblox capture. The official OBS points are marked; the quality numbers are community-recommended starting points.

## 1. Output mode and container (official OBS guidance)
- Settings > Output > **Output Mode: Advanced** (needed for audio-track selection).
- **Format: MKV** or **Hybrid MP4**. OBS recommends MKV because a crash won't corrupt the whole file. A plain MP4 that doesn't close properly is lost.
- **Hybrid MP4** (beta, added in **OBS 30.2**) combines fragmented-MP4 crash safety with normal MP4 compatibility. It also supports **chapter markers** set by hotkey, which are handy for "clip this moment" markers that show up in DaVinci Resolve.
- If you record MKV: **File > Remux Recordings**, or turn on **"Automatically remux to mp4"** in Advanced settings.
- Enable **"Generate File Name without Space"** if your editor or scripts dislike spaces.

## 2. Video settings
| Setting | Value | Why |
|---|---|---|
| Base (canvas) resolution | your monitor, e.g. 1920×1080 or 2560×1440 | capture native |
| Output (scaled) | 1920×1080 for 16:9 masters; keep 1440p if you crop for vertical | crop headroom |
| FPS | **60** | smooth pans; social apps can take 60 |
| Capture source | **Game Capture** (window: RobloxPlayerBeta / RobloxStudioBeta) or Window Capture | Window Capture is the fallback if Game Capture shows black |

## 3. Encoder and quality (community starting points)
- **GPU encoder** if available (NVENC, AMD AMF, Intel QSV) so recording doesn't cost game FPS.
- Rate control **CQP** (NVENC) or **CRF** (x264), not CBR. CBR is for streaming. Quality-based modes use whatever bitrate each scene needs.
- OBS forum regulars suggest **CQ/CRF ≈ 22** as a starting point, **≈ 16** as visually lossless, and lower only if you will re-encode heavily. Expect large files at 16-18.
- Preset: **Quality** (not Max Quality). Forum advice is to turn off Look-ahead and Psycho-visual tuning if you see lag.
- Keyframe interval: leave on auto for recording.

## 4. Audio tracks for editing
In Output > Recording, tick several **Audio Tracks** and route sources in **Edit > Advanced Audio Properties**:

| Track | Contents |
|---|---|
| 1 | everything (quick preview) |
| 2 | game audio only |
| 3 | your microphone |
| 4 | music or Discord (or leave out) |

Separate tracks let you duck game audio under voice and drop copyrighted background audio. The official guide gives keeping unwanted music off a track as one example.

## 5. Vertical and dual output
- Third-party **Aitum Vertical** plugin (obsproject.com resources) adds a second **vertical canvas** with its own scenes and record/stream outputs. Version 1.6.4+ supports Hybrid MP4 (requires OBS 30.2).
- Without a plugin, record 1440p 16:9 and crop 9:16 in the editor. See [[Marketing - Vertical Video from a 16-9 Game - Framing, Safe Zones and Captions]].

## 6. Replay Buffer for clip-worthy moments
Turn on **Replay Buffer** (Output > Replay Buffer, for example 30-60 s) and bind a hotkey. When something funny happens in a playtest, press it and the last minute is saved. Most viral Roblox moments are unplanned.

## Pre-record checklist
- [ ] Test 10 s recording, play it back, check sync and stutter
- [ ] Roblox in fullscreen or borderless at the capture resolution
- [ ] Notifications off (Discord, Windows focus assist)
- [ ] Disk space: CQ 18-22 at 1080p60 can use several GB per hour (varies)
- [ ] Hotkeys set: record, replay save, chapter marker

## Related
[[Community Discord - Hub]] · [[Marketing - Clean Roblox Footage - Freecam, Hiding UI and Staging a Shot]] · [[Gameplay Video Thumbnail - Shot List and Edit Structure]] · [[Marketing - Making a Roblox Game Trailer - Gameplay First Structure]]

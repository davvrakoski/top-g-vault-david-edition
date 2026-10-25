---
area: "40 Community Resources"
cluster: "Free Animations"
source_note: "community/free-animations/free-video-mocap-options"
title: "Free Video Mocap Options for Roblox"
tags: [roblox, community, animation, free-assets, "cluster/free-animations"]
verified: 2026-10-25
license: "mixed - see table"
sources:
  - https://create.roblox.com/docs/animation/capture
  - https://github.com/freemocap/freemocap
  - https://www.rokoko.com/ja/products/vision
  - https://www.cgchannel.com/?p=149851
  - https://deepmotion.com/article/getting-started
cssclasses: [tg-a40]
---

# Free Video Mocap Options for Roblox

> **Idea:** record yourself (phone or webcam) and turn it into an animation instead of hunting for a free clip that almost fits. Output you capture of **your own performance** is your own work, so these avoid most license questions - as long as the tool's terms don't claim rights or block commercial use.

## Options compared

Tool | Creator | Cost / license | Output | Roblox fit | Status in this vault
---|---|---|---|---|---
**Animation Capture** (in Studio) | Roblox | Built into Studio, free | Face (webcam, up to 60 s) and full body (uploaded video) straight onto your rig as keyframes | Best - no export step; lands in the Animation Editor | Recommended first try
**FreeMoCap** | FreeMoCap project (Jon Matthis, Endurance Idehen; open source) | Free software, **AGPL-3.0** | Markerless multi-camera capture; hardware-agnostic | Needs a Blender/retarget step to R15 | OK as a tool (AGPL covers the software, not your capture)
Rokoko Vision (now in Rokoko Create) | Rokoko | Free tier exists; quota changed over time (older coverage: free single-camera; newer page: 30 s/month free) | FBX | Retarget to R15 | Output terms not confirmed - see [[Animation Sources Checked and Left Out]]
DeepMotion Animate 3D | DeepMotion | Freemium; free minutes per month varied by year | FBX, BVH, GLB, MP4 | Retarget to R15 | Commercial terms for free output not confirmed - left out

## Getting good results from Roblox Animation Capture
- **Body (docs requirements):** .mp4 or .mov, **one** well-lit person visible the whole time, a **single continuous shot under 15 seconds** from a stable camera, R15 rig selected. Path: Clip Editor > `...` > Import > **Live Animation Creator** > Choose Video; keyframes appear after about a minute.
- **Body (practical):** whole body in frame, plain background, fitted clothes, one action per clip - short clips clean up faster.
- **Face:** only works on rigs with animation-compatible (dynamic) heads; the docs ask for a well-lit room with your face centred.
- Expect cleanup: capture gives you keyframes to edit, not a final animation. Run the same pass as [[Mocap Cleanup for Roblox - In-Place, Loops and Foot Slide]] (trim, in-place, loop).
- Publish under the game owner like any other animation ([[Animation Permissions and Sharing - 2025 Update]]).

## Rules for any video-mocap tool
- Only capture **performances you have the right to use** (yourself, or a performer who agreed). Tracing a clip from a film, game cutscene or someone's TikTok is copying their work.
- Read the tool's terms before shipping: some free tiers are non-commercial or watermark/limit exports.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free Animations - Hub]]

**Related notes:** [[Animation capture]] · [[Animation Editor]] · [[Mocap Cleanup for Roblox - In-Place, Loops and Foot Slide]] · [[Free Animation Sources - License Table]]

<!-- TDOD_GRAPH_END -->

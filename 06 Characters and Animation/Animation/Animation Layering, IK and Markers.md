---
area: "06 Characters and Animation"
cluster: "Animation"
source_note: "23_Expanded_Knowledge/12_Animation_Layering_IK_and_Markers"
title: "Animation Layering, IK & Markers"
tags: [roblox, premium, "cluster/animation"]
verified: 2026-10-25
cssclasses: [tg-a06]
---

# Animation Layering, IK & Markers

Animation quality comes from timing, blending and state ownership as much as the raw animation clip.

## Layers
Separate full-body locomotion from upper-body actions only when the design needs simultaneous behaviors. Define priority rules so reload, melee, stun and emotes do not fight for the same joints.

## Markers
Use animation markers for footsteps, hit windows, shell ejection, interaction moments and sound cues. The animation tells the presentation system when an event should happen; the server still validates gameplay truth.

## IK
IK is useful for hand placement, looking, aiming and foot alignment, but should have limits and fallbacks. Bad IK creates more uncanny motion than no IK.

## Blend tests
Test transitions at speed extremes, weapon changes, slopes, low frame rate and latency. Watch for foot slide, snapping and tracks that never stop.

## Lab
Build a three-hit combo where hitboxes are enabled from markers, then interrupt it with stun and verify every track/state cleans up.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Animation - Hub]]

**Related notes:** [[Anime Roblox Visual Direction]] · [[Springs and Damping for Game Feel]] · [[Animation]] · [[Procedural Animation, Springs and Recoil]]

<!-- TDOD_GRAPH_END -->

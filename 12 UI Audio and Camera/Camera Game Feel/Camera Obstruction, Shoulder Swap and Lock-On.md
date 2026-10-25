---
area: "12 UI Audio and Camera"
cluster: "Camera Game Feel"
source_note: "23_Expanded_Knowledge/14_Camera_Obstruction_Shoulder_and_LockOn"
title: "Camera Obstruction, Shoulder Swap & Lock-On"
tags: [roblox, premium, "cluster/camera-game-feel"]
verified: 2026-10-25
cssclasses: [tg-a12]
---

# Camera Obstruction, Shoulder Swap & Lock-On

Third-person cameras fail when they ignore walls, cramped interiors and target motion.

## Obstruction
Ray/sphere-cast between desired camera and character. Pull the camera forward smoothly when blocked and recover gradually when clear. Prevent rapid oscillation around thin geometry.

## Shoulder swap
Keep aim origin, reticle, character rotation and camera offset consistent. A shoulder swap should not change where bullets magically originate without accounting for muzzle/world obstruction.

## Lock-on
Score targets by distance, angle, line of sight and threat. Provide predictable switch-target input. Break lock when the target is invalid or hidden too long.

## Lab
Create a test corridor with pillars, low ceilings, stairs and doorways. Record camera failures before tuning anything else.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Camera Game Feel - Hub]]

**Related notes:** [[Camera, Feel and Game Juice]]

<!-- TDOD_GRAPH_END -->

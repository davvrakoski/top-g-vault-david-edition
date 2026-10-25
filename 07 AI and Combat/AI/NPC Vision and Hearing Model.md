---
area: "07 AI and Combat"
cluster: "AI"
source_note: "06_AI_NPC_Combat/02_Perception_Vision_Hearing"
title: "NPC Vision and Hearing Model"
tags: [roblox, premium, "cluster/ai"]
verified: 2026-10-25
cssclasses: [tg-a07]
---

# NPC Vision and Hearing Model

## Vision

Use distance + field of view + line of sight.

```luau
local toTarget = targetPosition - eyePosition
local distance = toTarget.Magnitude
if distance > maxDistance then return false end
local direction = toTarget.Unit
local dot = lookVector:Dot(direction)
local minimumDot = math.cos(math.rad(fieldOfViewDegrees * 0.5))
if dot < minimumDot then return false end
-- raycast for obstruction next
```

Do not raycast against every target every frame. First reject by cheap distance/FOV checks.

## Hearing

Gameplay systems can publish a sound event:

```text
position
radius
category
intensity
source
```

NPC evaluates whether it should investigate based on distance, alert state, faction, and cooldown.

This is often better than attempting to infer AI hearing directly from every Sound object.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[AI - Hub]]

**Related notes:** [[AI Change Log]] · [[Production NPC State Machine]] · [[Scalable NPC Update Scheduler]] · [[Pathfinding Engineering]]

<!-- TDOD_GRAPH_END -->

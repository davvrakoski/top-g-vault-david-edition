---
area: "11 VFX Lighting and Weather"
cluster: "VFX"
source_note: "05_VFX_Weather_Destruction/17_FIRE_SMOKE_LIGHTNING_and_DESTRUCTION"
title: "FIRE, SMOKE, LIGHTNING & DESTRUCTION"
tags: [roblox, tdod-vault, reference, "cluster/vfx"]
status: verified-baseline
cssclasses: [tg-a11]
---

# FIRE, SMOKE, LIGHTNING & DESTRUCTION

=================================================

FIRE:
Layers:
- core glow
- flame particles
- smoke
- embers
- local light
- crackling audio
- heat distortion illusion if practical

SMOKE:
- soft particles
- varied lifetime
- upward motion
- wind influence
- distance LOD

DESTRUCTION:
True physics destruction is expensive.

Use:
- pre-fractured models
- chunk pools
- local debris
- server only tracks gameplay-important destruction state
- disable collision on tiny debris
- remove debris quickly
- use particles/dust to sell impact

"CRUSHING MATERIALS" SYSTEM:
Classify materials:
Wood -> splinters/dust
Glass -> shards/sparkle
Metal -> sparks/dents
Concrete -> chunks/dust
Flesh/character -> animation/VFX based on rating
Vegetation -> leaves/branches

The impact should choose sound, VFX, decal, physics response, and damage based on material tags.

=================================================

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[VFX - Hub]]

**Related notes:** [[VFX]] · [[Blood - Damage VFX - Gore Policy]] · [[Destructible Props Blueprint]] · [[Water and Surface Interaction]]

<!-- TDOD_GRAPH_END -->

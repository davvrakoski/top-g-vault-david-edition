---
area: "11 VFX Lighting and Weather"
cluster: "VFX"
source_note: "19_System_Blueprints/24_Destructible_Props"
title: "Destructible Props Blueprint"
tags: [roblox, blueprint, "cluster/vfx"]
verified: 2026-10-25
cssclasses: [tg-a11]
---

# Destructible Props Blueprint

Prefer authored destruction states over uncontrolled physics for repeated gameplay objects.

State:
Intact -> Damaged -> Broken

Server owns state and collision/gameplay. Client can add dust, fragments and camera/audio presentation.

Pre-fractured chunks can be pooled. Disable tiny debris collision and remove/recycle quickly.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[VFX - Hub]]

**Related notes:** [[Blood - Damage VFX - Gore Policy]] · [[Fire, Smoke, Lightning and Destruction]] · [[Water and Surface Interaction]] · [[Post-Processing - Bloom, Color and DOF]]

<!-- TDOD_GRAPH_END -->

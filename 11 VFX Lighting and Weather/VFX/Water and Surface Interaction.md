---
area: "11 VFX Lighting and Weather"
cluster: "VFX"
source_note: "23_Expanded_Knowledge/28_Water_and_Surface_Interaction"
title: "Water & Surface Interaction"
tags: [roblox, premium, "cluster/vfx"]
verified: 2026-10-25
cssclasses: [tg-a11]
---

# Water & Surface Interaction

Water is a combined rendering, audio, physics and gameplay problem.

## Presentation
Use splash particles, ripples, wet sounds and material cues only near relevant interaction. Avoid global expensive simulation for effects a player cannot see.

## Gameplay
Decide whether water changes movement, buoyancy, damage, vehicles, projectiles or AI navigation. Keep these rules centralized so different systems agree.

## Surface interaction framework
Instead of separate code for every material, define a surface response table: sound set, particles, decal, friction/gameplay modifier and footstep type.

## Lab
Test the same impact on concrete, wood, metal, grass and water using one material-response interface.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[VFX - Hub]]

**Related notes:** [[Fire, Smoke, Lightning and Destruction]] · [[Destructible Props Blueprint]] · [[Post-Processing - Bloom, Color and DOF]] · [[VFX Budget and Readability]]

<!-- TDOD_GRAPH_END -->

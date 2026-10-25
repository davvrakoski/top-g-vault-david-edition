---
area: "11 VFX Lighting and Weather"
cluster: "VFX"
source_note: "24_Visual_Reference_Production/14_Energy_Orb_and_Projectile_VFX"
title: "Energy Orb & Projectile VFX"
tags: [roblox, premium, visual-reference, "cluster/vfx"]
verified: 2026-10-25
cssclasses: [tg-a11]
---

# Energy Orb & Projectile VFX

The blue energy reference can be translated into a layered projectile: **core + orbit + wake + impact**.

## Core
Use a small MeshPart or particle core with controlled emissive appearance. Keep the center readable; pure white cores can work when the outer color defines the element.

## Orbit
Use Attachments + Beams/Trails or orbiting particle textures to imply rotation. Do not create dozens of physical orbiting Parts.

## Wake
A short Trail and sparse particles sell motion. The wake should point backward relative to velocity.

## Projectile architecture
Server owns the important result: fire permission, projectile/hit validation and damage. The client can render cosmetic projectiles/effects for responsiveness when your architecture supports reconciliation.

## Impact
Separate effects by material/element: sparks on metal, dust on stone, mist on water, elemental burst on characters.

## Pooling
Repeated projectiles are good candidates for object/effect pooling, but only if profiling shows creation churn is meaningful.

Related: [[Hitscan and Projectile Weapon Blueprint|Projectile Weapon Blueprint]] · [[VFX Performance, LOD and Pooling|VFX Performance]]

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[VFX - Hub|VFX]]

**Related:** [[Visual Production Atlas - Hub|Visual Production Atlas]] · [[Official Roblox Rendering and Art Sources — October 2026|Official Roblox rendering & art sources]]

<!-- TDOD_GRAPH_END -->

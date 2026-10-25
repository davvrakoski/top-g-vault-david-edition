---
area: "11 VFX Lighting and Weather"
cluster: "VFX"
source_note: "05_VFX_Weather_Destruction/15_VFX"
title: "VFX"
tags: [roblox, tdod-vault, reference, "cluster/vfx"]
status: verified-baseline
cssclasses: [tg-a11]
---

# VFX

=================================================

VFX TOOLKIT:
- ParticleEmitter
- Beam
- Trail
- attachments
- tweens
- lights
- animated textures
- mesh particles
- sound
- camera shake
- color correction
- decals
- temporary parts/meshes

VFX PRINCIPLE:
VFX should communicate gameplay, not hide it.

For every effect define:
START:
PEAK:
DECAY:
END:

A HIT EFFECT:
- impact spark/blood/dust
- sound
- animation reaction
- tiny camera impulse
- damage number only if style fits
- decal if needed
- short duration

A MAGIC EFFECT:
- anticipation
- charge
- release
- travel
- impact
- residue

OPTIMIZE:
- emit bursts rather than always-on emitters where possible
- reduce particle count before reducing readability
- use size/brightness to carry impact
- disable distant effects
- keep transparent overdraw under control
- pool repeated effect objects

=================================================

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[VFX - Hub]]

**Related notes:** [[VFX Budget and Readability]] · [[Blood - Gore System — Architecture + Policy Gate]] · [[Blood - Damage VFX - Gore Policy]] · [[Fire, Smoke, Lightning and Destruction]]

<!-- TDOD_GRAPH_END -->

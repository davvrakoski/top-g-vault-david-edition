---
area: "02 Game Design and Economy"
cluster: "Foundations Planning"
source_note: "24_Visual_Reference_Production/01_Reference_Decomposition_Method"
title: "Reference Decomposition Method — Turn Any Image Into a Build Plan"
tags: [roblox, premium, visual-reference, "cluster/foundations-planning"]
verified: 2026-10-25
cssclasses: [tg-a02]
---

# Reference Decomposition Method — Turn Any Image Into a Build Plan

When you see an impressive reference, do **not** ask an AI only: "How do I make this?" Break the image into production layers first.

## The 10-layer breakdown
For every screenshot identify:
1. **Composition** — focal point, foreground, midground, background, leading lines.
2. **Geometry** — terrain, architecture, props, characters, silhouette meshes.
3. **Materials** — stone, metal, cloth, snow, water, skin, emissive surfaces.
4. **Lighting** — sun/key direction, fill, local lights, shadow softness, atmosphere.
5. **VFX** — particles, beams, trails, sparks, dust, smoke, glow, decals.
6. **Animation** — idle movement, wind, weapon motion, camera motion, characters.
7. **Audio** — impacts, ambience, loops, one-shots, reverb/zone changes.
8. **Gameplay** — collisions, damage, traversal, cover, interaction.
9. **Networking** — what is authoritative and what is cosmetic/client-only.
10. **Scalability** — what disappears, simplifies or sleeps at distance/low quality.

## Roblox translation worksheet
For each visible element write:
- **Roblox object/system:** Terrain, MeshPart, SurfaceAppearance, MaterialVariant, ParticleEmitter, Beam, Trail, Attachment, Light, Atmosphere, Sound, AnimationTrack, etc.
- **Authoring tool:** Studio, Blender, texture software, audio editor.
- **Runtime owner:** server / all clients / local client.
- **Update frequency:** static / event-driven / low-rate / per-frame only if required.
- **Fallback:** mobile/low quality version.

## Example: glowing elemental sword
Geometry = one optimized sword mesh.
Material = metal/roughness + optional emissive mask.
VFX = Trail + sparks + small aura particles + controlled light.
Gameplay = server validates hits and damage.
Presentation = local client plays most cosmetic particles after a validated swing.
Low tier = fewer sparks, shorter trail, no extra point light.

## Test
If you cannot name which layer creates a visual detail, keep analyzing before building. This prevents throwing particles and bloom at a problem that is actually geometry or lighting.

Related: [[Asset vs Effect Decision Matrix — What Should Be Geometry|Asset vs Effect Decision Matrix]] · [[Visual Debugging From Screenshots|Visual Debugging From Screenshots]]

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Foundations Planning - Hub|Foundations Planning]]

**Related:** [[Visual Production Atlas - Hub|Visual Production Atlas]] · [[Official Roblox Rendering and Art Sources — October 2026|Official Roblox rendering & art sources]]

<!-- TDOD_GRAPH_END -->

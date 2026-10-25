---
area: "40 Community Resources"
cluster: "Free VFX and FX"
source_note: "community/free-vfx/devforum-glow-mesh-blender"
title: "DevForum Glow Mesh VFX from Blender Breakdown"
tags: [roblox, community, vfx, technique, blender, mesh-vfx, "cluster/free-vfx-and-fx"]
verified: 2026-10-25
license: "n/a - technique summary"
sources:
  - https://devforum.roblox.com/t/vfx-tutorial-roblox/872437
  - https://devforum.roblox.com/t/what-are-good-ways-to-learn-vfx/725749
cssclasses: [tg-a40]
---

# DevForum Glow Mesh VFX from Blender Breakdown

A popular free Community Tutorial: "VFX Tutorial | ROBLOX" by **Drakoliann**, Nov 2020, roughly 270 likes. It shows how to make the broken, swirling **energy-wrap meshes** used in aura and ability effects, using only Blender modifiers. It matches the jordonh23 tip from "What are good ways to learn VFX" (2020): many Roblox ability effects start as a cylinder plus modifiers.

## The modifier stack (summary)

1. Add a **cylinder**, rotate it 90 degrees, stretch it along one axis, and **subdivide** in edit mode (3 times).
2. **Vertex Weight Edit** on a vertex group, with a *Custom Curve* falloff and a **Texture Mask** set to **Clouds** in *Global* space. This writes noisy weights.
3. **Mask** modifier on that group with a threshold (the author used 0.419) to **cut the surface into torn strips**.
4. **Simple Deform** (Angle 360, Axis Z) to **twist** the strips, then **Smooth** (Repeat about 30) to round them off. Simple Deform sits above Smooth in the stack.
5. Optional: tug the end vertices for variation, then export **OBJ** and import as a MeshPart.

Replies flagged two gotchas. The Mask threshold seemed to do nothing for some users until they followed the video version, and Blender 2.79's Mask modifier has no threshold. Use a current Blender.

## Making it glow in Roblox (the tutorial's Blender preview, mapped to Studio)

| Blender preview step | Roblox equivalent |
|---|---|
| Emission material, strength 5, light blue | `MeshPart.Material = Neon`, `Color` light blue. Neon self-lights and feeds Bloom |
| Dark background | Test against your real map lighting, not a void |
| Bloom on | `Lighting.Bloom`: Threshold about 0.9-1, Intensity 0.5-1, Size 24-40 (tune; see [[Post-Processing - Bloom, Color and DOF]]) |
| Motion blur | No built-in equivalent; fake it with short Trails on the mesh |

## Animating it in Studio (the thread left this unanswered)

- Spin with `TweenService` on the CFrame (or an AlignOrientation on an attached part), and tween `Size` up while `Transparency` goes 0 -> 1 over 0.3-0.6 s.
- Use several copies at different scales and opposite spins to fake a vortex.
- For a softer, less "plastic" glow, add a ParticleEmitter with a soft glow texture (`LightEmission = 1`) on the same part, and keep the Neon mesh fairly transparent (0.3-0.6).

Budget the triangle count: subdivided cylinders get heavy. Decimate before export and keep the mesh under a few thousand triangles ([[VFX Budget and Readability]]).

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free VFX and FX - Hub]]

**Related notes:** [[Mesh VFX Recipes with the Top G VFX Mesh Pack]] · [[Energy Orb and Projectile VFX]] · [[Free Tools for Making Your Own VFX Textures]]

<!-- TDOD_GRAPH_END -->

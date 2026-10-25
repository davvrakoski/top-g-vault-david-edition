---
area: "10 3D Art and Materials"
cluster: "3D Modeling Blender"
title: "Cute Stylized Pets - Proportions, Topology and Rig-Ready Shapes"
tags: [roblox, community-knowledge, 3d-art, blender, pets, characters, stylized]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/art/modeling/rig-a-simple-mesh
  - https://create.roblox.com/docs/art/modeling/skin-a-simple-mesh
  - https://create.roblox.com/docs/art/modeling/specifications
  - https://docs.blender.org/manual/en/latest/modeling/meshes/editing/edge/loopcut_slide.html
---
# Cute Stylized Pets - Proportions, Topology and Rig-Ready Shapes

Pets drive whole genres on Roblox (pet simulators, hatch-and-collect, companion followers). A pet must look appealing at a tiny size next to the player, read clearly in a hatching UI, and be cheap enough that dozens can follow players around one server. Cuteness is mostly a **proportion** problem, and cheapness is mostly a **topology and rig** decision made early.

## Proportions that read as cute

- **Big head, small body:** head about 50-60% of total height for chibi pets (house guidance). Baby-schema features (large head, large eyes, short limbs, round forms) make shapes read as young and friendly.
- **Eyes low and wide on the head:** placing eyes below the head's midline makes faces look younger.
- **Short, stubby limbs** that are wider at the base; tiny paws or no paws at all.
- **Simple silhouette with one signature feature:** long ears, a curled tail, a horn. In a hatch screen every pet in a set should be recognisable from its silhouette alone.
- Size in game: commonly 1.5-3 studs tall next to a 5-stud character (house guidance), larger for legendary tiers.

## Modeling order

1. Block head and body as two spheres (UV sphere 12-16 segments). Squash and overlap them.
2. Join, then use **Remesh** or bridge the gap, or model as one mesh from a cube with Subdivision level 1-2 and edit the cage.
3. Pull out legs as extrusions from the body's underside (4-6 faces each). Ears and tail are extrusions or separate closed shells joined in.
4. Eyes: either painted into the texture (cheapest, best for large collections) or separate low-poly spheres/discs for a glossy look. Painted eyes also make swapping expressions and colour variants trivial.
5. Apply subdivision and reduce to budget: 500-2,000 triangles is typical for a follower pet in a simulator (house guidance; the mesh cap is 20,000).

## Topology for animation

Even simple bounce-and-wiggle animations look better with a few well-placed loops:

- 2-3 edge loops at the **neck** (head bob), at each **leg root** (walk), and along the **tail** (wag).
- Keep the rest of the mesh low; flat-shaded or smooth-shaded both work.
- Avoid long thin triangles across deforming areas.

## Rig options

| Option | How | Good for |
|---|---|---|
| No rig | Animate the whole pet by script (bob, tilt, spin) | Huge collections, mobile |
| Rigid parts | Separate head, body, tail, legs MeshParts joined by `Motor6D` | Cheap animated pets |
| Skinned mesh | One mesh, Blender armature, automatic weights, exported as FBX | Hero pets, smooth squash |

Roblox's official "rig a simple mesh" and "skin a simple mesh" guides cover the armature and weight workflow. Many simulators start with no rig and add skinned hero pets later.

## Variants and tiers

- Model once, recolour with a texture palette or a `SurfaceAppearance` tint mask ([[SurfaceAppearance AlphaMode and TintMask - Recolorable Assets]]) for shiny/gold/rainbow tiers.
- Add tier signals as cheap accessories (crown, halo, wings) attached to an attachment on the head, rather than remodelling.
- Keep one shared texture layout across a pet family so variants are only a texture swap.

## Pitfalls

- Realistic animal anatomy at small size: reads muddy. Simplify.
- Every pet a unique skinned mesh with its own 1024 texture: memory adds up fast with 30+ pets on screen.
- Eyes modelled so close to the surface that they z-fight; offset or paint them.

## Related
[[3D Modeling Blender - Hub]] - [[Companion and Pet Follower AI]] - [[Case Study - Pet Simulator 99]] - [[Art - Retopology Basics - Turning Sculpts and AI Meshes into Game Meshes]]

---
area: "10 3D Art and Materials"
cluster: "3D Modeling Blender"
title: "Melee Weapon Blockout - Sword, Axe and Hammer from Silhouette to Export"
tags: [roblox, community-knowledge, 3d-art, blender, weapons, low-poly]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/art/modeling/specifications
  - https://create.roblox.com/docs/reference/engine/classes/Tool
  - https://docs.blender.org/manual/en/latest/modeling/modifiers/generate/solidify.html
  - https://docs.blender.org/manual/en/latest/modeling/modifiers/generate/mirror.html
---
# Melee Weapon Blockout - Sword, Axe and Hammer from Silhouette to Export

Melee weapons are read almost entirely by silhouette: in a Roblox fight the camera is 10-20 studs away and the weapon moves fast. The quickest way to a good-looking low-poly weapon is to design the **side profile** first as a flat shape, give it thickness, and only then add bevels. This note is the step-by-step modeling order. Grip placement, origin and scale are in [[Art - Modeling Hand-Held Tools and Weapons - Handle, Grip Point and Scale]]; this note does not repeat them. Triangle ranges below are house guidance for third-person games, not engine rules.

## Step 0: a profile sketch

- Draw (or trace from your own concept) the weapon's side outline on a plane in Blender's Front view. Use *Add > Image > Reference* for a sketch.
- Test readability: fill the outline black. If you cannot tell sword vs axe vs hammer from the black shape at thumbnail size, change the shape, not the texture.
- Exaggerate: blades 10-20% wider than real, guards and axe heads larger. Stylised games push it further.

## Sword (about 150-600 triangles)

1. Add a plane, enter Edit Mode, delete all but one vertex, and extrude (E) vertex by vertex around the **half outline** of the blade (spine to edge).
2. Add a **Mirror** modifier across the blade's centre line (clipping on) so both edges match.
3. Fill the outline (F), then triangulate cleanly or add a centre-line loop for the fuller.
4. Add **Solidify** for thickness (a stylised blade is about 0.08-0.15 studs thick at the spine), then pull the edge vertices in to make the cutting edge thin: this "diamond" cross-section catches light along the spine.
5. Guard, grip and pommel are separate primitives (cube, 8-sided cylinder, low sphere). Keep cylinders at 6-8 sides; the eye does not count sides on a moving handle.

## Axe (about 300-900 triangles)

1. Same outline method for the head; the cheek (flat side) can be a simple solidified shape with the bit (edge) bevelled thin.
2. The haft is a 6-8 sided cylinder with a slight taper; add one edge loop near the head and squash it to suggest the eye of the axe.
3. Add wedges or wraps where the head meets the haft. This single detail sells the axe more than any texture.

## Hammer / mace (about 300-1,000 triangles)

1. Head from a cube: bevel all edges with 1-2 segments (chunky reads better than sharp).
2. For spikes, use *Extrude Faces Along Normals* on selected faces then scale to a point; or place one cone and use an **Array** / duplicated instances, then join.
3. Make the head visibly heavier than the handle: weight reads as power.

## Shared finishing steps

- **Bevel + Weighted Normal** modifiers for clean shading on low triangle counts ([[Art - Blender Modifiers for Game Assets - Bevel, Weighted Normal, Mirror, Array, Decimate]]).
- Apply modifiers, join parts into one object unless a part must animate (a flail chain, a folding blade).
- UV: straight-unwrap the blade faces so a gradient or trim reads cleanly; handle wraps can share a small tiling area.
- Roblox mesh limit is 20,000 triangles per mesh, but a held weapon is tiny on screen: stay well under 2,000 for third-person games.

## Collision and hitboxes

Set the weapon's collision to Box or Hull in Studio and turn `CanCollide` off for visuals; do damage with your own hitbox or raycasts. Thin blades with `PreciseConvexDecomposition` add physics cost for no gameplay gain.

## Pitfalls

- Starting from a cube and sculpting the blade: the silhouette is usually weak. Profile first.
- Equal thickness everywhere: weapons look like cardboard cut-outs. Vary thickness from spine to edge.
- Too many cylinder sides on the grip while the blade has none: spend triangles on the silhouette.

## Related
[[3D Modeling Blender - Hub]] - [[Art - Modeling Hand-Held Tools and Weapons - Handle, Grip Point and Scale]] - [[Art - Prop Style Guide - Shape Language, Bevel Size and Detail Density]] - [[Animating Tools and Weapons with Motor6D Grips]]

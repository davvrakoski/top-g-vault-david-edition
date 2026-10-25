---
area: "10 3D Art and Materials"
cluster: "3D Modeling Blender"
title: "Car Body Blockout from Reference Images - Half Model, Mirror and Wheel Arches"
tags: [roblox, community-knowledge, 3d-art, blender, vehicles, cars]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://docs.blender.org/manual/en/latest/modeling/modifiers/generate/mirror.html
  - https://docs.blender.org/manual/en/latest/modeling/empties.html
  - https://create.roblox.com/docs/art/modeling/specifications
  - https://create.roblox.com/docs/parts/model-generation
---
# Car Body Blockout from Reference Images - Half Model, Mirror and Wheel Arches

The car body is the hardest single shape most Roblox devs model: big smooth curves, symmetry, and wheel arches that must line up with physics wheels. The reliable method is old-school: **three orthographic reference views, half a car, a Mirror modifier, and a low-poly cage you refine from the side profile outward**. How to split wheels, doors and pivots is in [[Art - Low-Poly Vehicle Models - Separate Wheels, Body Parts and Pivots]]; this note is about getting the body shape right.

## 1. References that line up

- Use your own drawings or a fictional design. Real car brands' shapes, badges and names are trademarks; keep designs original or generic for anything you publish.
- Draw or collect **side, front and top** views at the same scale. In Blender: *Add > Image > Reference* (or an Image Empty) in Right, Front and Top orthographic views (*Numpad 3, 1, 7*).
- Align the wheel centres in side and top views and match the overall length/width/height to your target size. Decide the size from your chassis first: wheelbase, track width and wheel radius in studs.
- Set the image empties to show only in orthographic view and lower their opacity.

## 2. Half model with Mirror

1. Add a plane, delete half, place the remaining edge on the car's centre line (X = 0).
2. Add a **Mirror** modifier with **Clipping** on so centre vertices cannot cross the middle, and **Merge** on.
3. Work only on the right half; the left updates live.

## 3. Profile first, then volume

1. In side view, extrude edges around the **side silhouette**: front bumper, bonnet line, windscreen, roof, rear window, boot, rear bumper, sill.
2. In top view, pull the vertices in to follow the plan shape (cars taper toward the front and rear).
3. In front view, shape the cross-section: tumblehome (the sides lean in toward the roof) is what makes a car look like a car rather than a box.
4. Fill between profile edges with *Grid Fill* or by bridging edge loops (*Bridge Edge Loops*). Keep quads, roughly even spacing.

## 4. Wheel arches that match physics wheels

- Place a cylinder at each wheel position with your real wheel radius **before** cutting arches.
- Cut the arch with a circle of radius = wheel radius + suspension travel + clearance (for example +0.3 to +0.6 studs, house guidance) so wheels never clip through the body when the suspension compresses or steers.
- Leave a small inner lip extruded inward so you cannot see into the body through the arch.

## 5. Panels and windows

- Mark window shapes with *Knife* (K) or an inset on the glass faces, then give glass its own material slot (later split into its own MeshPart for a Glass material or transparency).
- Door seams: a thin inset or a painted line. Only separate doors if they open in your game.
- Keep the underbody as a simple flat closed panel; nobody sees it.

## 6. Smoothness vs triangles

- A Subdivision Surface level 1 on a clean cage gives smooth curves; apply it and then dissolve flat areas (roof centre, doors) with *Limited Dissolve* to save triangles.
- House budgets for the body alone: 2,000-6,000 triangles for a third-person driving game; up to the 20,000-per-mesh cap only for hero showroom cars.
- Add **Weighted Normal** at the end for clean highlights on large panels ([[Smooth and Hard Edges - Shading Normals for Roblox Meshes]]).

## Quick alternative: Roblox model generation

`GenerationService:GenerateModelAsync` with the `Car5` schema generates a body plus four wheels from a prompt, and Roblox's sample behaviour scripts make it drivable. It is useful for player-made cars or fast prototypes, but you do not control topology or exact arch placement, so hand-modelled bodies remain the choice for core vehicles ([[Model generation]]).

## Pitfalls

- References at different scales: nothing lines up and you chase the shape forever.
- Modelling both halves by hand: asymmetric body, doubled work.
- Arches cut to the wheel radius exactly: wheels clip on bumps.
- Very dense cage before the silhouette is right: changes become painful. Stay low until the side profile reads.

## Related
[[3D Modeling Blender - Hub]] - [[Art - Low-Poly Vehicle Models - Separate Wheels, Body Parts and Pivots]] - [[Constraint Car Build - CylindricalConstraint, SpringConstraint and VehicleSeat]] - [[Smooth and Hard Edges - Shading Normals for Roblox Meshes]]

---
area: "10 3D Art and Materials"
cluster: "3D Modeling Blender"
title: "Furniture Sets - Shared Dimensions, Seats and Collision"
tags: [roblox, community-knowledge, 3d-art, blender, furniture, props]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Seat
  - https://create.roblox.com/docs/reference/engine/classes/BasePart
  - https://create.roblox.com/docs/art/modeling/specifications
  - https://create.roblox.com/docs/studio/importer
---
# Furniture Sets - Shared Dimensions, Seats and Collision

Roleplay, tycoon, horror and housing games are full of furniture, and players notice when a chair is taller than a table or a sofa looks like it came from another game. The fix is to model furniture as a **set** with shared measurements, shared materials and shared rules for seats and collision. Build the set once and every room you dress afterwards looks intentional.

## 1. Write the set sheet first (house numbers)

A default R15 character is about 5 studs tall, so real-world furniture sizes (scaled at about 1 stud = 28 cm) come out small next to Roblox's big heads and hands. Most games scale furniture up slightly. Pick values and keep them on a reference board:

| Dimension | Suggested value (studs) |
|---|---|
| Seat height (chair, sofa) | 1.6-2.0 |
| Table top height | 2.6-3.2 |
| Counter / desk height | 3.0-3.4 |
| Bed top | 1.6-2.0 |
| Door clearance | 7-8 high, 4-5 wide |
| Shelf spacing | 1.5-2 |

These are house values tuned for the default camera, not engine rules. Test with an actual character sitting in Studio before finalising.

## 2. One family, one shape language

- Choose a few shared parts: one leg profile, one bevel width, one panel trim. Every piece in the "modern" set uses the same leg; every piece in the "rustic" set uses the same chunky plank.
- Model the shared parts once and duplicate them (*Shift+D*) or link them (*Alt+D*) in Blender so changing the leg changes all pieces.
- Keep bevel size identical across the set ([[Art - Prop Style Guide - Shape Language, Bevel Size and Detail Density]]).

## 3. Modeling order for a chair (about 200-600 triangles)

1. Seat: cube scaled to the seat sheet size, bevel edges 1-2 segments.
2. Legs: 4-8 sided cylinders or bevelled cubes, placed with **Mirror** on X and Y around the seat centre.
3. Back: a slab or a couple of rails; tilt it 5-10 degrees for comfort silhouette.
4. Join everything; set the origin to the **bottom centre** (so it sits on floors when placed) unless your build system snaps from a corner.

Tables, beds and shelves follow the same steps. Sofas: one bevelled base, cushions as separate slightly rounded boxes joined into the same mesh.

## 4. Seats in Studio

- Players sit on a `Seat` (or `VehicleSeat`) part, not on the mesh. Add an invisible `Seat` part on top of the seat cushion, sized to the cushion, with `Transparency` 1 and `CanCollide` on as needed.
- The `Seat` faces its front surface; rotate it so characters face away from the backrest. `Seat.Occupant` tells scripts who sits there; `Seat.Disabled` blocks sitting.
- Weld the `Seat` to the furniture so moving the model moves the seat.
- Test the sit height: if legs sink into the cushion, raise the Seat part rather than the mesh.

## 5. Collision and performance

- Furniture is touched constantly but needs no exact collision: set `CollisionFidelity` to **Box** for tables and beds, **Hull** for chairs with angled backs. Tiny decorative items (cups, books) can have `CanCollide` off and `CanQuery` off.
- Use one shared texture or palette atlas for the whole set ([[Low-Poly Colour Workflows - Palette Atlas vs Vertex Colours]]); identical meshes are instanced by the renderer.
- For a placement or housing system, keep furniture footprints on your build grid (whole or half studs) so items snap neatly.

## Kit checklist

- [ ] Chair, stool, armchair, sofa
- [ ] Dining table, coffee table, desk
- [ ] Bed (single, double), nightstand
- [ ] Shelf, wardrobe, counter, sink unit
- [ ] Lamp (with an attachment point for a light), rug (a flat mesh, `CanCollide` off)
- [ ] Every item: origin rule, set-sheet size, one material, collision type noted

## Pitfalls

- Modelling each piece from scratch: legs and bevels drift apart.
- Seat height set in Blender but never tested with a sitting character.
- Rugs and posters with collision: players trip on 0.05-stud bumps.

## Related
[[3D Modeling Blender - Hub]] - [[Modular Kits and Grid Snapping in Studs]] - [[Art - Pivots for Moving Props - Blender Origins, PivotOffset and Hinges]] - [[Low-Poly Colour Workflows - Palette Atlas vs Vertex Colours]]

---
area: "09 Maps and Worlds"
cluster: "Maps"
title: "World - Clutter and Prop Density"
tags: [roblox, community-knowledge, maps, props, set-dressing, performance]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/performance-optimization/design
  - https://create.roblox.com/docs/performance-optimization/improve
  - https://create.roblox.com/docs/parts/meshes
  - https://kenney.nl/assets/furniture-kit
  - https://polyhaven.com/models
---
# World - Clutter and Prop Density

Clutter is what makes a room look lived-in, a street look used, or a ruin look abandoned. Too little and the world feels like a test map; too much and players can't read paths, collide with junk, and phones choke. Treat props in **layers with a budget**, not as "add more until it looks good".

## The three layers
| Layer | Examples | Density | Collision |
|---|---|---|---|
| Hero | Car wreck, fountain, desk with computer | 1-3 per room or street | Yes, simple boxes |
| Supporting | Crates, chairs, benches, bins, shelves | Groups of 3-5 at walls and corners | Yes for large, no for small |
| Detail | Papers, cans, cables, leaves, bottles | Clusters on surfaces and edges | Off (`CanCollide`, `CanTouch`, `CanQuery` = false) |

## Placement rules
1. **Edges and corners first.** Clutter collects against walls and in corners, not in the middle of paths. Keep a clear walking lane (at least 8-10 studs in interiors).
2. **Clusters tell stories.** A chair knocked over next to a spilled box tells more than ten neat chairs. Aim for 3-5 clustered groups per room, each with a "why".
3. **Odd numbers and variety in scale.** One big, two medium, a few small. Rotate and tilt slightly so nothing is perfectly aligned (except in shops and offices, where neat alignment is the story).
4. **Clutter guides.** Leave the intended path cleaner and brighter than dead ends; trails of debris can lead to a goal.
5. **Match the setting's state.** Abandoned = dust, broken, tipped over; lived-in = personal items, tidy surfaces; commercial = repetition and order.

## Key kits
- Kenney **Furniture Kit**, **Survival Kit**, **Mini Market** and **City Kit (Industrial)** (CC0, bundle-safe) cover most indoor and street clutter.
- Poly Haven models (CC0) are realistic but often high-poly; decimate to your budget before import.

## Performance budget
- **Reuse meshes.** 200 copies of 10 meshes are far cheaper than 200 unique meshes.
- **Merge static clusters.** A shelf of 30 items should be one mesh; a desk scene can be one or two.
- **Shadows off** on everything small (`CastShadow = false`).
- **Collision:** `CollisionFidelity = Box` for supporting props; detail props non-collidable. Mesh-accurate collision on clutter is wasted physics.
- **Streaming:** detail props in models that can stream out; consider client-only spawning of pure decoration.
- Check with the MicroProfiler and Studio's render stats on a phone before and after a dressing pass.

## Common mistakes
- Uniform scatter with even spacing - looks procedural.
- Clutter in doorways and on stairs that snags characters and blocks the camera.
- Detail props with collision that players trip over (Humanoids stutter on tiny parts).
- Every prop at the same scale and rotation, perfectly snapped.
- A beautiful but unreadable scene: if a playtester can't find the exit, remove clutter until they can.

## Related
[[Maps - Hub]] - [[Map Performance Budgets - Draw Calls, Triangles and Mesh Reuse]] - [[Overgrown Abandoned Interior — Ruin + Nature Recipe]] - [[Map Audit Command Bar Script - Parts, Mesh IDs, Collision and Shadows]]

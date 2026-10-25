---
area: "10 3D Art and Materials"
cluster: "3D Modeling Blender"
source_note: "27_Production_Labs/10_Art_Asset_Game_Ready_Lab"
title: "Art Asset Game-Ready Lab"
tags: [roblox, legendary, lab, "cluster/3d-modeling-blender"]
verified: 2026-10-25
cssclasses: [tg-a10]
---

# Art Asset Game-Ready Lab

## Goal
Take one impressive reference/AI-generated asset and prove it is actually usable in Roblox gameplay.

## Build procedure
1. Define target camera distance and silhouette.
2. Correct scale/transforms.
3. Inspect topology/non-manifold/hidden geometry.
4. UV and material plan.
5. Create PBR maps only where valuable.
6. Set collision strategy.
7. Rig/weight if animated.
8. Create lower-detail option if needed.
9. Import and test under real Roblox lighting.
10. Measure memory/performance in scene.

## Evidence to collect
- before/after profiler screenshots or measurements when performance is involved;
- logs for rejected/failed actions;
- a short capture of the happy path;
- a note describing the worst failure discovered;
- exact build/device/server conditions.

## Test matrix
- [ ] wireframe.
- [ ] extreme pose.
- [ ] close camera.
- [ ] normal gameplay distance.
- [ ] many copies.
- [ ] low graphics/device.

## Pass condition
Pass when the asset looks good in the game, not only in a Blender/render preview.

## Failure review
If the lab fails, do not paper over it with waits, more particles, more retries or a giant refactor. Identify which layer owns the failure: state, timing, networking, data, physics, streaming, presentation, device input, or content. Fix the owner, then rerun the same test.

## Knowledge graph connections
**Primary cluster:** [[3D Modeling Blender - Hub|3D Modeling Blender]]

**Related:** [[Legendary Production Hub]]

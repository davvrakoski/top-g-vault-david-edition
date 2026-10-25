---
area: "10 3D Art and Materials"
cluster: "3D Modeling Blender"
title: "Low-Poly Guns - Blockout, Moving-Part Split and Readable Silhouettes"
tags: [roblox, community-knowledge, 3d-art, blender, weapons, guns]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/art/modeling/specifications
  - https://create.roblox.com/docs/reference/engine/classes/Motor6D
  - https://create.roblox.com/docs/studio/pivot-tools
  - https://create.roblox.com/docs/resources/weapons-kit
---
# Low-Poly Guns - Blockout, Moving-Part Split and Readable Silhouettes

A gun is a hard-surface prop that also has to animate: the magazine drops, the slide or bolt moves, sometimes a cylinder spins. If you model it as one solid lump you will have to cut it apart later; if you split it wrongly the pieces rotate around the wrong points. This note covers the modeling order for blasters and guns (fictional or stylised designs are the safe choice; avoid copying a real manufacturer's trademarked design or logos). Holding, grip origin and scale are covered in [[Art - Modeling Hand-Held Tools and Weapons - Handle, Grip Point and Scale]].

## 1. Block the silhouette in side view

1. Put a reference sketch on an image empty in Right view.
2. Block the main masses with cubes only: receiver/body, barrel, grip, stock, magazine. No bevels yet.
3. Check the black-fill silhouette at thumbnail size. Players must tell pistol vs SMG vs rifle vs shotgun from shape alone (barrel length, stock or not, magazine shape and position).
4. Stylised Roblox guns usually exaggerate the barrel diameter, magazine and sights by 20-40% (house guidance), because the viewmodel or the third-person camera makes them small.

## 2. Decide the split before detailing

List what moves in your reload and fire animations, then make each a **separate object** with its origin at its pivot:

| Piece | Origin at | Motion |
|---|---|---|
| Body (`Handle`) | Grip centre | none (root) |
| Magazine | Top-centre where it seats | slides down/out |
| Slide / bolt | Rear of its travel | slides back |
| Trigger | Trigger pin | small rotate |
| Revolver cylinder | Cylinder axis | spins / swings out |
| Pump | Its centre | slides along barrel |

In Studio, each moving part becomes a MeshPart joined to the body by a `Motor6D` so animations can drive it (see [[Animating Tools and Weapons with Motor6D Grips]]). Static extras (sight, rail, muzzle) are joined into the body mesh.

## 3. Detail in this order

1. **Bevel** the large edges (1-2 segments) so the body catches highlights.
2. **Inset and extrude** for panel lines, ejection port and grip texture blocks. Real cut-outs read better than painted ones at first-person distance.
3. Barrel: 8-12 sided cylinder for first-person, 6-8 for third-person only. Inset the muzzle face and extrude inward so the bore looks dark.
4. Add **Weighted Normal** after bevels for clean flat faces ([[Smooth and Hard Edges - Shading Normals for Roblox Meshes]]).

## 4. Budgets (house guidance)

- Third-person only: 800-3,000 triangles for the whole gun.
- First-person viewmodel: 3,000-10,000 is common; the hard cap is 20,000 per mesh.
- One texture set shared by all pieces of one gun (atlas the UVs together) so the split costs draw calls, not texture memory.

## 5. Muzzle and attachment points

Add a small empty at the barrel tip and another at the ejection port in Blender and note their positions. In Studio recreate them as `Attachment` objects named e.g. `Muzzle` and `Eject` on the Handle; VFX and raycasts start from them ([[Muzzle Flash Recipe - Flash, Light, Smoke and Shell]]).

## Export checklist

- [ ] Apply rotation and scale; consistent forward axis for every gun in the game
- [ ] Moving parts separate, origins at pivots, names match your animation rig
- [ ] No hidden interior faces (inside the receiver) that nobody sees
- [ ] One shared material, UVs packed together
- [ ] Collision Box on all pieces, `CanCollide` off for visuals

## Pitfalls

- Magazine merged into the body: the reload animation cannot move it.
- Origin of the slide at its centre: it rotates oddly when animated with any rotation.
- Modelling screws and text: paint them into the normal or colour map instead.

## Related
[[3D Modeling Blender - Hub]] - [[Art - Modeling Hand-Held Tools and Weapons - Handle, Grip Point and Scale]] - [[Animating Tools and Weapons with Motor6D Grips]] - [[Recoil, Spread and Bloom for Roblox Guns]] - [[Art - Hard-Surface Props with Booleans - Cleanup for Clean Game Shading]]

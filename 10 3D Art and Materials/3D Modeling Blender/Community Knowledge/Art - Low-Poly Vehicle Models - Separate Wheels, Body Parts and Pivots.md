---
area: "10 3D Art and Materials"
cluster: "3D Modeling Blender"
title: "Low-Poly Vehicle Models - Separate Wheels, Body Parts and Pivots"
tags: [roblox, community-knowledge, 3d-art, blender, vehicles]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/HingeConstraint
  - https://create.roblox.com/docs/reference/engine/classes/MeshPart
  - https://create.roblox.com/docs/reference/engine/classes/BasePart
  - https://create.roblox.com/docs/art/modeling/specifications
---
# Low-Poly Vehicle Models - Separate Wheels, Body Parts and Pivots

A car mesh exported as one lump cannot spin its wheels, open its doors or show glass. Roblox vehicles are built from constraints (hinges, springs, cylindrical constraints) between separate parts, so the model has to arrive already split into the pieces those constraints need, each with a sensible pivot. Getting the split right in Blender saves hours of re-exporting later. Chassis tuning lives in the Vehicles area; this note is only about the mesh.

## The split (one object per moving or special piece)

| Piece | Why separate | Origin |
|---|---|---|
| Body shell | main visual, welded to chassis | centre of the wheelbase at ground height |
| Each wheel (x4) | spins on a hinge | exact centre of the hub |
| Steering knuckles (optional) | rotate for steering | on the steering axis above each front wheel |
| Doors, hood, trunk | open on hinges | on the hinge line |
| Glass | needs its own transparency | anywhere (welded) |
| Lights | Neon material or emissive map, toggled by script | anywhere (welded) |
| Interior / seats | lower detail, often hidden at range | anywhere |

Keep every wheel a **separate object with its own origin**, even if all four are identical. Better: model one wheel, export it once, and duplicate it in Studio. Roblox reuses the same mesh asset for all copies.

## Wheel rules

- Model the wheel with its axle on Blender's X axis (side to side) and apply rotation, so in Studio the rotation axis is predictable for the hinge attachment.
- Many builders make the **physics wheel** an invisible `Part` with `Shape = Cylinder` (perfectly round collision) and weld the visual tire mesh to it with `CanCollide`, `CanQuery` and `CanTouch` off and `Massless` on. A low-poly tire mesh with Hull collision is not round and makes the car bounce.
- 16-24 sides around the tire is enough for a stylized game; hide faceting with smooth shading and a tread normal map.

## Body rules

- Set the body's `CollisionFidelity` to `Box` or `Hull`; detailed mirrors and spoilers should have `CanCollide` off. A real collision box for the chassis is usually a simple invisible part.
- Mark cosmetic parts `Massless` so the centre of mass comes from the chassis you designed, not from a heavy spoiler.
- Glass gets its own MeshPart so you can set `Transparency` there without affecting the paint. One material per MeshPart applies (see [[One Material per MeshPart - Splitting vs Atlasing Multi-Material Models]]).
- Recolourable paint: model the body with a white or grey albedo and a tint mask (see [[SurfaceAppearance AlphaMode and TintMask - Recolorable Assets]]) so one asset can be every car colour.

## Budgets (house guidance)

- A whole drivable car at 3k-12k triangles total fits most Roblox games; spend triangles on the silhouette (wheel arches, roof line), not hidden undersides.
- Delete faces nobody sees: under the floor pan, inside closed doors.
- Use one shared 1024 atlas for body trims, lights and interior where possible.

## Export checklist

1. Apply all transforms, check each origin.
2. Name objects clearly: `Body`, `Wheel_FL`, `Door_L`, `Glass` (see [[Art - Naming Conventions for Meshes, Materials and Textures]]).
3. Export the set as one FBX with *Use Imported Pivot* style settings so each piece keeps its own pivot ([[FBX Import Settings, Scale and Collision Fidelity]]).
4. In Studio, check wheel centres line up with the attachments before tuning anything.

## Pitfalls

- Origins all at world zero: hinges rotate the door around the middle of the car.
- Mirrored wheels with negative scale: normals flip and the tire looks inside-out; apply scale.
- Visual tire used as the collider: bumpy driving and tunnelling at speed.

## Related
[[3D Modeling Blender - Hub]] - [[Vehicle Suspension, Chassis and Grip]] - [[Art - Pivots for Moving Props - Blender Origins, PivotOffset and Hinges]] - [[FBX Import Settings, Scale and Collision Fidelity]]

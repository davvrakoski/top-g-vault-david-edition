---
area: "03 Scripting and Systems"
cluster: "Math Geometry"
title: "Raycasts and Shapecasts - RaycastParams in 2026"
tags: [roblox, community-knowledge, math, raycast, shapecast, hit-detection, physics-queries]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot
  - https://create.roblox.com/docs/reference/engine/datatypes/RaycastParams
  - https://create.roblox.com/docs/workspace/raycasting
---
# Raycasts and Shapecasts - RaycastParams in 2026

Spatial queries are how games answer "what is there?": bullets, line of sight, ground checks, melee sweeps, placement validation, camera collision. Roblox now offers four cast shapes and a RaycastParams object that gained new fields (`ExcludeInstances`, `IncludeInstances`, `Margin`, `SizeGradient`). Most older tutorials only know `FilterDescendantsInstances`. This note is the current picture, taken from the API reference.

## The four casts

| Method | Shape | Typical use |
| --- | --- | --- |
| `workspace:Raycast(origin, direction, params)` | infinitely thin line | hitscan guns, line of sight, ground check |
| `workspace:Spherecast(position, radius, direction, params)` | sphere | thick bullets, character-sized sweeps, camera collision |
| `workspace:Blockcast(cframe, size, direction, params)` | box | melee swings, vehicle sweeps, door clearance |
| `workspace:Shapecast(part, direction, params, cframeOverride?, sizeOverride?)` | the part's real geometry | odd-shaped weapons, placement previews |

Shared facts:
- `direction` is a vector whose **length is the max distance**. A unit vector casts 1 stud. For shapecasts, max distance is **1024 studs**.
- Each returns a `RaycastResult` or `nil`: `Instance`, `Position`, `Normal`, `Material`, `Distance`.
- Shapecasts (Block/Sphere/Shape) **do not detect parts that already overlap the shape at the start.** If a target might be inside your hitbox when the swing begins, also run `GetPartsInPart` / `GetPartBoundsInBox` once.
- `Shapecast` always excludes the part being cast and errors on Terrain-shaped parts or invalid directions.

## RaycastParams fields

| Field | Meaning |
| --- | --- |
| `ExcludeInstances` | descendants of these are ignored (new, preferred) |
| `IncludeInstances` | only descendants of these count (new, preferred). `nil` = everything; `{}` = nothing |
| (both set) | mixed filtering; **exclusion wins** when both match |
| `FilterDescendantsInstances` + `FilterType` | older single-list filter; still works but superseded |
| `IgnoreWater` | skip Terrain water |
| `CollisionGroup` | ignore parts whose group does not collide with this one |
| `RespectCanCollide` | use the part's `CanCollide` instead of `CanQuery` |
| `Margin` | inflate the cast shape; a non-zero margin turns a raycast into a sphere cast of that radius |
| `SizeGradient` | grow/shrink the shape along the cast (`0.5` ends 50% bigger, `-1` shrinks to nothing) |
| `BruteForceAllSlow` | debug only; ignores collision properties and checks every part |

`params:AddToFilter(instOrArray)` appends to the filter without rebuilding it.

## Recipes (own code)

**Hitscan that ignores the shooter and their accessories**
```lua
local params = RaycastParams.new()
params.ExcludeInstances = { shooter.Character, workspace.Effects }
local result = workspace:Raycast(origin, aimDir.Unit * 500, params)
```

**Forgiving bullet** (thin ray near the muzzle, fat at range):
```lua
params.SizeGradient = 3 -- shape scales by 1 + 3 = 4x: radius 0.1 grows to 0.4 studs by the end
local hit = workspace:Spherecast(origin, 0.1, aimDir.Unit * 300, params)
```
If you also set `Margin`, remember the Spherecast exception from the docs: for a sphere, radius and margin are the same thing, so both scale with `SizeGradient` (for boxes and parts, the margin stays constant).

**Grounded check** with a short sphere instead of a ray, so standing on an edge still counts:
```lua
local hit = workspace:Spherecast(root.Position, 0.8, Vector3.new(0, -3.2, 0), params)
local grounded = hit ~= nil and hit.Normal.Y > 0.7 -- slope limit ~45 degrees
```

**Melee sweep**: cast a box from last frame's blade CFrame toward this frame's, so fast swings don't skip targets between frames. Libraries that do this for you: [[Melee Hitbox Modules - RaycastHitbox to ShapecastHitbox]].

## Pitfalls

1. **CanQuery.** Parts with `CanQuery = false` are invisible to casts (unless `RespectCanCollide` is on). Decorative parts should have it off for performance; hitboxes must keep it on.
2. **Reusing params across scripts** is fine, but mutating a shared `ExcludeInstances` list from two systems causes surprises; give each system its own params.
3. **Server vs client.** Clients see their own predicted positions; the server must re-validate important hits ([[Server Authority 2026 - What the Community Learned]]).
4. **Cost.** Casts are cheap but not free. Hundreds per frame from many NPCs add up; cache results or stagger checks across frames.
5. **Direction length.** `(target - origin).Unit` alone casts 1 stud. Multiply by range.

## Related
[[Math Geometry - Hub]] · [[CFrame Recipes - Facing, Offsets and Relative Space]] · [[Projectile Libraries - FastCast, FastCast2 and SwiftCast]] · [[Collision Groups - Setup Recipes and the WorldRoot API]]

---
area: "03 Scripting and Systems"
cluster: "Math Geometry"
title: "Math - Vector Projection, Reflection and Slope Checks"
tags: [roblox, community-knowledge, math, vector3, dot-product, physics]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/datatypes/Vector3
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://en.wikipedia.org/wiki/Vector_projection
---
# Math - Vector Projection, Reflection and Slope Checks

The dot product is not only for "is it in front of me". Three more recipes come up constantly in Roblox games: **projecting** a vector onto an axis or a plane (slide along walls, move along a rail, flatten camera vectors), **reflecting** it off a surface (ricochets, bouncing grenades, laser mirrors), and measuring **slope** from a raycast normal (can I stand here, should this car slide). All three are one line once you have a unit normal.

## The three formulas

With `n` a **unit** vector (a raycast `Normal` already is):

| Goal | Formula | Luau |
| --- | --- | --- |
| Part of `v` along `n` | `n * (v . n)` | `n * v:Dot(n)` |
| Part of `v` along a plane with normal `n` | `v - n * (v . n)` | `v - n * v:Dot(n)` |
| Reflect `v` off a surface | `v - 2 * n * (v . n)` | `v - 2 * v:Dot(n) * n` |

If `n` is not unit length, use `n.Unit` first. `.Unit` of a zero vector gives NaN, so guard with a magnitude check.

## Recipe: ricochet a bullet (own code)

```lua
local function bounce(dir: Vector3, hit: RaycastResult, keep: number): Vector3
	local n = hit.Normal
	local reflected = dir - 2 * dir:Dot(n) * n
	return reflected * keep -- keep = 0.6 loses 40% speed per bounce
end
```

Cast again from `hit.Position + hit.Normal * 0.05` so the next ray does not start inside the wall.

## Recipe: slide along a wall instead of stopping

When a custom mover hits a wall, remove only the part of the velocity that points into the wall:

```lua
local into = velocity:Dot(n)
if into < 0 then
	velocity -= n * into -- now parallel to the wall
end
```

The `into < 0` test keeps you from cancelling motion that is already moving away from the surface.

## Recipe: flat camera direction

To move a character "where the camera looks" without walking into the sky, project the camera look onto the ground plane:

```lua
local look = camera.CFrame.LookVector
local flat = look - Vector3.yAxis * look:Dot(Vector3.yAxis)
if flat.Magnitude > 1e-3 then flat = flat.Unit end
```

`Vector3.new(look.X, 0, look.Z)` is the same thing for the world Y axis; the projection form works for any up vector (planet gravity, wall-walking).

## Slope angle from a normal

```lua
local slopeDeg = math.deg(hit.Normal:Angle(Vector3.yAxis))
local walkable = slopeDeg <= humanoid.MaxSlopeAngle
```

`Vector3:Angle` returns radians in `[0, pi]` without an axis. `Humanoid.MaxSlopeAngle` is the engine's own "slide down the slope" threshold, so comparing against it keeps placement or AI checks consistent with how characters actually behave.

## Pitfalls

- Distance checks in hot loops: compare squared lengths, `(a - b):Dot(a - b) < r * r`, to skip the square root.
- Use `Vector3:FuzzyEq` (default epsilon `1e-5`) instead of `==` for computed vectors.
- Reflection assumes the normal faces the incoming ray. Raycast normals do; normals you compute might not, so flip with `if dir:Dot(n) > 0 then n = -n end`.

## Related
[[Math Geometry - Hub]] · [[Dot Product, Cross Product, and FOV]] · [[Raycasts and Shapecasts - RaycastParams in 2026]] · [[CFrame Recipes - Facing, Offsets and Relative Space]]

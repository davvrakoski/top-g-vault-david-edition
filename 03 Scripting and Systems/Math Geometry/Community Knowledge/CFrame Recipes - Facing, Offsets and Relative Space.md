---
area: "03 Scripting and Systems"
cluster: "Math Geometry"
title: "CFrame Recipes - Facing, Offsets and Relative Space"
tags: [roblox, community-knowledge, math, cframe, rotation, vectors]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/datatypes/CFrame
  - https://create.roblox.com/docs/workspace/cframes
---
# CFrame Recipes - Facing, Offsets and Relative Space

A `CFrame` is a position plus a rotation (a 3x4 matrix). Nearly every placement problem in Roblox (aim a turret, spawn a projectile at the muzzle, keep a pet behind the player, snap a build-mode block, orbit a camera) is a two-line CFrame recipe once you know which operation to use. This note collects the ones that come up most, using only constructors and methods listed in the current API reference.

## The two rules

1. **`a * b` means "apply b inside a's space".** `part.CFrame * CFrame.new(0, 0, -5)` is 5 studs in front of the part, wherever it faces. Roblox's forward is **-Z**.
2. **Order matters.** `cf * CFrame.Angles(...)` rotates around the object's own axes; `CFrame.Angles(...) * cf` rotates around the world origin (rarely what you want).

## Facing and aiming

| Goal | Recipe |
| --- | --- |
| Stand at A, look at B | `CFrame.lookAt(a, b)` |
| Look along a direction | `CFrame.lookAlong(a, dir)` (same as `lookAt(a, a + dir)`) |
| Look at B but stay upright (yaw only) | `CFrame.lookAt(a, Vector3.new(b.X, a.Y, b.Z))` |
| Rotate vector `from` onto `to` (surface alignment) | `CFrame.fromRotationBetweenVectors(from, to)` |
| Rotate about an arbitrary axis | `CFrame.fromAxisAngle(axis, radians)` |
| Angle between two orientations | `cfA:AngleBetween(cfB)` (radians, 0 to pi) |

Edge case: `lookAt` with the target straight above or below has an undefined "up". Pass a different `up` vector (third argument) when aiming vertically.

## Offsets and relative space

```lua
local muzzle = gun.Handle.CFrame * CFrame.new(0, 0.2, -1.5)        -- local offset
local behind = root.CFrame * CFrame.new(2, 0, 4)                   -- pet follow slot

local rel = root.CFrame:ToObjectSpace(target.CFrame)               -- target relative to me
local back = root.CFrame:ToWorldSpace(rel)                         -- and back again

local localPoint = part.CFrame:PointToObjectSpace(hitPosition)     -- where on the part was hit
local worldDir   = part.CFrame:VectorToWorldSpace(Vector3.zAxis)   -- direction only, no position
```

- `PointTo*` transforms positions (uses translation); `VectorTo*` transforms directions (ignores translation). Mixing them up is the classic "my offset drifts with distance" bug.
- `ToObjectSpace` is how you "remember" an offset (a weld-like attachment) and re-apply it later.

## Is the target in front / to the side?

```lua
local toTarget = (target.Position - root.Position).Unit
local forward = root.CFrame.LookVector:Dot(toTarget)   -- 1 ahead, 0 side, -1 behind
local side    = root.CFrame.RightVector:Dot(toTarget)  -- + right, - left
```
Pair with a cone check for vision: `forward > math.cos(math.rad(halfFov))` ([[Dot Product, Cross Product, and FOV]]).

## Extracting and rebuilding angles

- `cf:ToEulerAnglesYXZ()` returns rx, ry, rz in the order cameras and characters usually need; rebuild with `CFrame.fromEulerAnglesYXZ(rx, ry, rz)`.
- Yaw only: `local _, yaw, _ = cf:ToEulerAnglesYXZ()` then `CFrame.new(cf.Position) * CFrame.Angles(0, yaw, 0)`.
- `cf.Rotation` is the rotation with zero position; `cf.Position` the translation.

## Smooth motion

`a:Lerp(b, alpha)` blends both position and rotation between two CFrames. Use a frame-rate independent alpha, not a constant ([[Frame-Rate Independent Smoothing - Exponential Decay and Springs]]).

## Orbit camera (own example)

```lua
local function orbit(center: Vector3, yaw: number, pitch: number, dist: number): CFrame
	local rot = CFrame.fromEulerAnglesYXZ(pitch, yaw, 0)
	local pos = center + rot:VectorToWorldSpace(Vector3.new(0, 0, dist))
	return CFrame.lookAt(pos, center)
end
```

## Grid snapping (build mode)

```lua
local function snap(cf: CFrame, grid: number, stepDeg: number): CFrame
	local p = cf.Position
	local _, yaw = cf:ToEulerAnglesYXZ()
	local step = math.rad(stepDeg)
	return CFrame.new(math.round(p.X / grid) * grid, math.round(p.Y / grid) * grid, math.round(p.Z / grid) * grid)
		* CFrame.Angles(0, math.round(yaw / step) * step, 0)
end
```

## Precision
Repeatedly multiplying CFrames accumulates float error that makes rotation matrices slightly non-orthogonal. If you integrate rotation every frame, call `cf:Orthonormalize()` occasionally, or rebuild from stored angles.

## Related
[[Math Geometry - Hub]] · [[Dot Product, Cross Product, and FOV]] · [[Math for Game Development]] · [[Grid Placement System - Community Blueprint]]

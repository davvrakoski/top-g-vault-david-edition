---
area: "03 Scripting and Systems"
cluster: "Math Geometry"
title: "Projectile Ballistics - Gravity Arcs, Launch Angles and Lead"
tags: [roblox, community-knowledge, math, projectiles, ballistics, aiming, combat]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Workspace
  - https://en.wikipedia.org/wiki/Projectile_motion
  - https://create.roblox.com/docs/reference/engine/classes/BasePart
---
# Projectile Ballistics - Gravity Arcs, Launch Angles and Lead

Grenades, arrows, cannon NPCs, basketball shots and trajectory preview lines all need the same three formulas: where a projectile is at time t, what angle hits a target at a given speed, and where to aim at a moving target. Getting these right in code (instead of trial-and-error multipliers) means NPCs that actually hit and previews that match the real throw.

## Constants

- Roblox gravity is `workspace.Gravity`, default **196.2 studs/s^2** (not 9.81). Always read the property; maps may change it.
- Units are studs and seconds. See [[Scale in Studs - Real-World Sizes Converted]] for intuition.

## 1. Position at time t (no drag)

p(t) = p0 + v0 t + 0.5 g t^2, with g = (0, -workspace.Gravity, 0)

```lua
local function posAt(p0: Vector3, v0: Vector3, t: number): Vector3
	local g = Vector3.new(0, -workspace.Gravity, 0)
	return p0 + v0 * t + g * (0.5 * t * t)
end
```

Use it to draw a trajectory preview (sample 20-40 points, raycast between consecutive points to find where it lands) and to move scripted projectiles deterministically. Server and client computing the same `posAt` from the same `p0`, `v0` and start time is how projectile systems stay in sync cheaply ([[Projectile Libraries - FastCast, FastCast2 and SwiftCast]]).

## 2. Launch angle to hit a point at fixed speed

Work in the vertical plane: `x` = horizontal distance to target, `y` = height difference, `v` = launch speed, `g` = gravity. The classic result:

tan(theta) = ( v^2 +/- sqrt( v^4 - g (g x^2 + 2 y v^2) ) ) / (g x)

- The `-` root is the **flat, fast** shot; `+` is the **high lob** (mortars, basketball).
- If the value under the square root is negative, the target is **out of range** at that speed.

```lua
local function launchVelocity(from: Vector3, to: Vector3, speed: number, high: boolean): Vector3?
	local g = workspace.Gravity
	local delta = to - from
	local flat = Vector3.new(delta.X, 0, delta.Z)
	local x, y = flat.Magnitude, delta.Y
	local v2 = speed * speed
	local disc = v2 * v2 - g * (g * x * x + 2 * y * v2)
	if disc < 0 or x < 1e-3 then return nil end
	local root = math.sqrt(disc)
	local theta = math.atan((v2 + (if high then root else -root)) / (g * x))
	return flat.Unit * (speed * math.cos(theta)) + Vector3.yAxis * (speed * math.sin(theta))
end
```

## 3. Fixed flight time instead of fixed speed

Designers often prefer "lands in 1.2 seconds". Then the velocity is direct:

v0 = (target - p0) / T - 0.5 g T

```lua
local function velocityForTime(p0: Vector3, target: Vector3, T: number): Vector3
	local g = Vector3.new(0, -workspace.Gravity, 0)
	return (target - p0) / T - g * (0.5 * T)
end
```
This never fails (no range limit) and makes lob height scale naturally with distance.

## 4. Leading a moving target

For a straight-flying projectile at speed `s` and a target at relative position `d` moving with velocity `u`, solve for the time `t` when distance equals `s t`:

(u.u - s^2) t^2 + 2 (d.u) t + d.d = 0

Take the smallest positive root, then aim at `targetPos + u * t`. If there is no positive root, the target is faster than the projectile and moving away: fire at current position or don't fire. For gravity projectiles, iterate: estimate `t` from the straight-line solution, predict the target position, compute the arc with formula 2 or 3, refine once or twice.

NPC fairness tip: add deliberate error (a random offset that shrinks the longer the NPC tracks you) so leading AI doesn't feel like an aimbot.

## Applying it in Roblox

- Physical projectile: set `part.AssemblyLinearVelocity = v0` (or `part:ApplyImpulse(v0 * part.AssemblyMass)`) right after spawning, with network ownership decided up front.
- Scripted projectile: compute `posAt` each frame and raycast from last to current position for hits.
- Drag/air resistance is not modelled by these formulas; if you add drag, use small numeric steps instead of the closed forms.

## Related
[[Math Geometry - Hub]] · [[Projectile Libraries - FastCast, FastCast2 and SwiftCast]] · [[Raycasts and Shapecasts - RaycastParams in 2026]] · [[Bezier Curves and Catmull-Rom Splines in Luau]]

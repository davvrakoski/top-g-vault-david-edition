---
area: "03 Scripting and Systems"
cluster: "Math Geometry"
title: "Math - Points on Circles, Disks and Spheres - Uniform Placement"
tags: [roblox, community-knowledge, math, placement, spawning, random]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/datatypes/Random
  - https://create.roblox.com/docs/reference/engine/libraries/math
  - https://mathworld.wolfram.com/DiskPointPicking.html
---
# Math - Points on Circles, Disks and Spheres - Uniform Placement

Spawning enemies around a player, arranging pets in a ring, scattering coins in a circle, placing orbiting shields or picking random directions for debris all need points on a circle, disk or sphere. Two of the obvious approaches are subtly wrong (they clump points in the centre or at the poles). These are the correct versions.

## Evenly spaced ring (own code)

```lua
local function ring(center: Vector3, radius: number, count: number, phase: number?): {Vector3}
	local out = table.create(count)
	for i = 0, count - 1 do
		local a = (phase or 0) + i * (2 * math.pi / count)
		out[i + 1] = center + Vector3.new(math.cos(a) * radius, 0, math.sin(a) * radius)
	end
	return out
end
```

Animate `phase` over time (`os.clock() * speed`) for orbiting pets or shields. To make each item face outward: `CFrame.lookAt(p, p + (p - center))`.

## Random point in a disk: use the square root

Picking `radius = R * u` with uniform `u` crowds points near the centre, because the outer rings have more area. Correct:

```lua
local function randomInDisk(rng: Random, center: Vector3, R: number): Vector3
	local a = rng:NextNumber(0, 2 * math.pi)
	local r = R * math.sqrt(rng:NextNumber())
	return center + Vector3.new(math.cos(a) * r, 0, math.sin(a) * r)
end
```

For a ring-shaped band (spawn 30 to 60 studs away, never on top of the player): `r = math.sqrt(rng:NextNumber(rMin^2, rMax^2))`.

## Random direction in 3D

`Random:NextUnitVector()` returns a uniformly random unit vector, so debris, particle-like parts and random explosion pushes need no extra math. Random point **inside** a ball: `center + rng:NextUnitVector() * R * rng:NextNumber() ^ (1/3)` (cube root for the same area reason as above).

## Even spread on a sphere (Fibonacci / golden angle)

For N nicely spaced points (sensor rays for AI, dome lights, planet props):

```lua
local GOLDEN = math.pi * (3 - math.sqrt(5))
local function sphere(n: number, R: number): {Vector3}
	local pts = table.create(n)
	for i = 0, n - 1 do
		local y = 1 - (i + 0.5) * (2 / n)
		local rad = math.sqrt(1 - y * y)
		local a = i * GOLDEN
		pts[i + 1] = Vector3.new(math.cos(a) * rad, y, math.sin(a) * rad) * R
	end
	return pts
end
```

The same golden-angle idea on a flat disk (`r = R * sqrt((i + 0.5) / n)`) gives sunflower patterns: good for crowds, tree clusters and formation layouts without overlap.

## Snap to the ground

After choosing an X/Z point, raycast down from above (for example `Vector3.new(x, 500, z)` with direction `Vector3.new(0, -1000, 0)`) and use the hit position. Reject points where the hit normal is too steep or the material is water.

## Pitfalls

- Uniform random points can still land on top of each other; for minimum spacing use Poisson disk sampling.
- Avoid spawning inside walls: test each candidate with a small `GetPartBoundsInRadius` query.
- Ring spacing in degrees vs radians: `math.cos` takes radians.

## Related
[[Math Geometry - Hub]] · [[Poisson Disk Sampling for Prop Scatter]] · [[Seeded Random - Deterministic Worlds with Random.new]] · [[Math - Angle Wrapping and Turn-Rate Limited Rotation]]

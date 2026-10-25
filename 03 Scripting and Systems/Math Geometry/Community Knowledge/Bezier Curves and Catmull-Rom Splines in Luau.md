---
area: "03 Scripting and Systems"
cluster: "Math Geometry"
title: "Bezier Curves and Catmull-Rom Splines in Luau"
tags: [roblox, community-knowledge, math, bezier, splines, curves, paths]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://pomax.github.io/bezierinfo/
  - https://en.wikipedia.org/wiki/Centripetal_Catmull%E2%80%93Rom_spline
  - https://create.roblox.com/docs/reference/engine/datatypes/Vector3
---
# Bezier Curves and Catmull-Rom Splines in Luau

Curves turn a few control points into smooth motion: homing projectiles, thrown-item arcs, roller coasters, camera fly-throughs, rail grinding, NPC patrol paths, UI swooshes. Two tools cover nearly all of it. **Bezier curves** are best when you design one shaped segment (start, end, and "pull" handles). **Catmull-Rom splines** are best when you have a list of waypoints and want a smooth path that passes *through* every one of them.

## Bezier basics

A Bezier curve of degree n has n+1 control points and a parameter `t` from 0 to 1. The curve starts at the first point and ends at the last; middle points pull it but are not touched.

**De Casteljau** (the intuitive way): repeatedly lerp neighbouring points by `t` until one point remains. In Luau, `Vector3:Lerp(goal, alpha)` does each step.

```lua
local function quadratic(p0: Vector3, p1: Vector3, p2: Vector3, t: number): Vector3
	local a = p0:Lerp(p1, t)
	local b = p1:Lerp(p2, t)
	return a:Lerp(b, t)
end
```

**Cubic polynomial form** (faster, no temporaries):

B(t) = (1-t)^3 P0 + 3(1-t)^2 t P1 + 3(1-t) t^2 P2 + t^3 P3

```lua
local function cubic(p0, p1, p2, p3, t: number): Vector3
	local u = 1 - t
	return p0 * (u*u*u) + p1 * (3*u*u*t) + p2 * (3*u*t*t) + p3 * (t*t*t)
end
```

**Tangent (direction of travel)**: the derivative of a cubic is a quadratic with points `3(P1-P0)`, `3(P2-P1)`, `3(P3-P2)`. Normalize it and feed it to `CFrame.lookAlong(pos, tangent)` so a projectile or cart faces where it is going.

## The constant-speed problem

Equal steps in `t` are **not** equal distances along the curve; objects speed up where control points are far apart. Fix with an arc-length lookup table:

1. Sample the curve at, say, 50 values of `t`, summing straight-line distances into a cumulative array.
2. To move at speed `v`, track distance travelled `d`, find the two samples around `d` (binary search), and interpolate `t` between them.

```lua
local function buildLUT(curve: (number) -> Vector3, samples: number)
	local lut, total, prev = { 0 }, 0, curve(0)
	for i = 1, samples do
		local p = curve(i / samples)
		total += (p - prev).Magnitude
		lut[i + 1] = total
		prev = p
	end
	return lut, total
end
```

## Catmull-Rom: smooth through waypoints

For four consecutive points P0..P3, the segment from P1 to P2 is (uniform version):

P(t) = 0.5 * ( 2P1 + (P2 - P0) t + (2P0 - 5P1 + 4P2 - P3) t^2 + (-P0 + 3P1 - 3P2 + P3) t^3 )

- Duplicate the first and last waypoints (or extrapolate) so the end segments have neighbours.
- The **uniform** version can loop or overshoot at sharp, uneven spacing. The **centripetal** variant (knot spacing by the square root of distance) avoids cusps and self-intersections; prefer it for tracks and camera rails.
- Converting a Catmull-Rom segment to a cubic Bezier: `B0 = P1`, `B1 = P1 + (P2 - P0) / 6`, `B2 = P2 - (P3 - P1) / 6`, `B3 = P2`. Then reuse your Bezier and arc-length code.

## Practical recipes

| Feature | Approach |
| --- | --- |
| Lobbed grenade preview | Quadratic Bezier from hand to target with the middle point raised; or exact physics arc ([[Projectile Ballistics - Gravity Arcs, Launch Angles and Lead]]) |
| Homing missile | Re-build a cubic each frame from current position, current velocity handle and target |
| Rail / coaster | Catmull-Rom through placed Attachments, arc-length LUT for constant speed, tangent for facing |
| Cutscene camera | Centripetal Catmull-Rom for position, separate spline (or `CFrame:Lerp`) for look target |
| Visualizing a path | Sample points and stretch thin parts or a Beam between them |

## Performance notes
- Evaluate on the **client** for visuals; the server only needs start time, curve id and parameters, so it can reconstruct position when validating.
- Precompute LUTs once per path, not per frame.
- Beams with two Attachments and `CurveSize0/CurveSize1` already draw a cubic Bezier for visuals without any parts.

## Related
[[Math Geometry - Hub]] · [[CFrame Recipes - Facing, Offsets and Relative Space]] · [[Frame-Rate Independent Smoothing - Exponential Decay and Springs]] · [[Math for Game Development]]

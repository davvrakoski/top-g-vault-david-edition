---
area: "03 Scripting and Systems"
cluster: "Math Geometry"
title: "Math - Point-in-Region Tests - Boxes, Spheres, Cylinders and Polygons"
tags: [roblox, community-knowledge, math, zones, regions, geometry]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/datatypes/CFrame
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot
  - https://en.wikipedia.org/wiki/Point_in_polygon
---
# Math - Point-in-Region Tests - Boxes, Spheres, Cylinders and Polygons

Safe zones, shop areas, capture points, out-of-bounds checks and "is the player inside the store" all reduce to one question: is this point inside this shape? Engine queries (`WorldRoot:GetPartBoundsInBox`, `GetPartsInPart`) answer the reverse question, "which parts are in here", and cost more. When you already have the player's position, a pure-math test is cheaper, works in Parallel Luau and is easy to run every frame for many zones.

## Sphere and cylinder

```lua
local function inSphere(p: Vector3, c: Vector3, r: number): boolean
	local d = p - c
	return d:Dot(d) <= r * r
end
local function inCylinder(p: Vector3, base: Vector3, r: number, h: number): boolean
	local dx, dz = p.X - base.X, p.Z - base.Z
	return dx * dx + dz * dz <= r * r and p.Y >= base.Y and p.Y <= base.Y + h
end
```

Cylinders are the better default for capture points: a sphere wrongly includes players on a balcony above.

## Oriented box (any rotated part)

Move the point into the box's own space, then compare against half the size:

```lua
local function inBox(p: Vector3, boxCF: CFrame, size: Vector3): boolean
	local l = boxCF:PointToObjectSpace(p)
	local h = size / 2
	return math.abs(l.X) <= h.X and math.abs(l.Y) <= h.Y and math.abs(l.Z) <= h.Z
end
-- usage: inBox(rootPart.Position, zonePart.CFrame, zonePart.Size)
```

This handles rotation for free, which is why invisible zone parts are such a common authoring tool: designers place and rotate them in Studio, scripts read `CFrame` and `Size` once.

## Polygon on the ground (crossing rule, own code)

For irregular areas (a lake shore, a district outline), store corner points on X/Z and count edge crossings:

```lua
local function inPolygon(x: number, z: number, pts: {Vector2}): boolean
	local inside = false
	local j = #pts
	for i = 1, #pts do
		local a, b = pts[i], pts[j]
		if (a.Y > z) ~= (b.Y > z) then
			local xCross = a.X + (z - a.Y) * (b.X - a.X) / (b.Y - a.Y)
			if x < xCross then inside = not inside end
		end
		j = i
	end
	return inside
end
```

Here `Vector2.Y` holds the world Z. Add a height range check separately if needed. Get the corners from Attachments inside a folder so designers can edit the outline.

## Making it cheap for many zones

1. Give each zone a bounding sphere; reject with `inSphere` first.
2. Only test zones in the player's grid chunk (see the square-grid note).
3. Check at 5-10 Hz, not every frame; zone entry does not need 60 Hz.
4. Add **hysteresis**: enter at radius `r`, leave at `r + 2`, so players on the border do not flicker in and out and spam enter/exit events.

## When to use engine queries instead

Use `GetPartBoundsInBox`/`GetPartBoundsInRadius` with `OverlapParams` when you need **all parts** inside (explosions, area damage on props), or the shape is a mesh (`GetPartsInPart` uses real geometry). For "is this one character inside", math wins.

## Pitfalls

- Test the HumanoidRootPart position, not the head; heads poke through ceilings.
- Server is the authority for rewards (safe zone, shop discount); clients can run the same math for UI only.
- Unions and meshes used as zone parts have bounding boxes larger than their visual shape.

## Related
[[Math Geometry - Hub]] · [[Zone Detection - ZonePlus, QuickZone and Doing It Yourself]] · [[Map Boundaries, Kill Planes and Out-of-Bounds Handling]] · [[Math - Bounding Boxes - GetBoundingBox, AABB Overlap and Fitting]]

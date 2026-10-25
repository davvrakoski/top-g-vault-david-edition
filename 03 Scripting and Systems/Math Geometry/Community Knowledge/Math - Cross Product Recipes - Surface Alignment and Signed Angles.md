---
area: "03 Scripting and Systems"
cluster: "Math Geometry"
title: "Math - Cross Product Recipes - Surface Alignment and Signed Angles"
tags: [roblox, community-knowledge, math, vector3, cross-product, cframe]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/datatypes/Vector3
  - https://create.roblox.com/docs/reference/engine/datatypes/CFrame
  - https://en.wikipedia.org/wiki/Cross_product
---
# Math - Cross Product Recipes - Surface Alignment and Signed Angles

`a:Cross(b)` returns a vector perpendicular to both `a` and `b`, with length `|a||b|sin(angle)`. That powers the jobs a dot product cannot do: building a rotation from a surface normal (decals, footprints, wall-running, objects on slopes), getting a **signed** turn angle (left or right?), and computing triangle normals and areas for procedural meshes.

## Handedness in Roblox

Roblox is right-handed with **-Z as forward**. Useful identities:

- `Vector3.xAxis:Cross(Vector3.yAxis)` equals `Vector3.zAxis`.
- `forward:Cross(up)` is the **right** vector when forward is a LookVector: `(0,0,-1) x (0,1,0) = (1,0,0)`.
- Order flips the sign: `a:Cross(b) == -b:Cross(a)`.

## Recipe: align to a surface, keep the heading (own code)

```lua
local function alignToNormal(pos: Vector3, normal: Vector3, look: Vector3): CFrame
	local up = normal.Unit
	local right = look:Cross(up)
	if right.Magnitude < 1e-4 then -- look parallel to normal: pick any side
		right = Vector3.xAxis:Cross(up)
		if right.Magnitude < 1e-4 then right = Vector3.zAxis:Cross(up) end
	end
	right = right.Unit
	local back = right:Cross(up) -- +Z axis of the result, so LookVector = -back
	return CFrame.fromMatrix(pos, right, up, back)
end
```

Feed it a raycast `Position` and `Normal` plus the current LookVector: the object stands on the surface and still faces roughly where it was facing. This is the core of footprint decals, slope-aligned pets and "stick to wall" placement.

## Recipe: signed turn angle

`Vector3:Angle(other, axis)` returns a signed angle in `[-pi, pi]` when you pass an axis (positive by the right-hand rule around it).

```lua
local function turnAngle(cf: CFrame, target: Vector3): number
	local to = target - cf.Position
	local flatTo = Vector3.new(to.X, 0, to.Z)
	local flatLook = Vector3.new(cf.LookVector.X, 0, cf.LookVector.Z)
	return flatLook:Angle(flatTo, Vector3.yAxis) -- > 0: target is counter-clockwise (to the left) seen from above
end
```

The older equivalent is `math.atan2(flatLook:Cross(flatTo).Y, flatLook:Dot(flatTo))`.

## Recipe: triangle normal and area

For a triangle `a, b, c` (procedural meshes, navmesh debug, terrain analysis):

```lua
local e = (b - a):Cross(c - a)
local normal = e.Unit
local area = e.Magnitude / 2
```

Winding order decides which side the normal points to. If faces render inside out, swap `b` and `c`.

## Recipe: torque direction

A force `F` applied at offset `r` from the center of mass produces torque `r:Cross(F)`. That is why `BasePart:ApplyImpulseAtPosition` on the corner of a crate makes it spin, and it lets you predict the spin axis before you test.

## Pitfalls

- Cross of parallel vectors is the zero vector and `.Unit` of it is NaN. Check `Magnitude` (fallback above).
- `CFrame.fromMatrix` expects perpendicular axes. Normalize `right` before building `back`, or the CFrame is skewed.
- Keep one shared helper so different scripts do not use opposite cross orders.

## Related
[[Math Geometry - Hub]] · [[Dot Product, Cross Product, and FOV]] · [[CFrame Recipes - Facing, Offsets and Relative Space]] · [[Math - Vector Projection, Reflection and Slope Checks]]

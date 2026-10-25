---
area: "03 Scripting and Systems"
cluster: "Math Geometry"
title: "Math - Bounding Boxes - GetBoundingBox, AABB Overlap and Fitting"
tags: [roblox, community-knowledge, math, bounding-box, models, placement]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Model
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot
  - https://create.roblox.com/docs/reference/engine/datatypes/Vector3
---
# Math - Bounding Boxes - GetBoundingBox, AABB Overlap and Fitting

A bounding box is the cheapest description of "how big is this thing and where is it". You need one to drop a model exactly onto the floor, check that a placed furniture item does not overlap others, frame a model in a ViewportFrame thumbnail, or size a selection highlight. Roblox gives you the box; the overlap and fitting math is yours.

## What the engine gives you

- `Model:GetBoundingBox()` returns `(CFrame, Vector3)`: the centre and size of a box containing all BaseParts. Its **orientation follows the model's pivot** (the PrimaryPart pivot if set, otherwise `WorldPivot`).
- `Model:GetExtentsSize()` returns just the size, same orientation rule.
- `BasePart.Size` and `BasePart.CFrame` describe each part's own oriented box.
- `WorldRoot:GetPartBoundsInBox(cframe, size, overlapParams)` lists parts whose bounding boxes touch a box.

## Recipe: sit a model on the ground (own code)

```lua
local function placeOnGround(model: Model, groundY: number)
	local cf, size = model:GetBoundingBox()
	local bottom = cf.Position.Y - size.Y / 2
	model:PivotTo(model:GetPivot() + Vector3.new(0, groundY - bottom, 0))
end
```

This only works when the model is upright (pivot not tilted). For tilted models compute the world AABB below.

## World-aligned AABB of a rotated part

An axis-aligned box (AABB) is easier to compare. For a part with half size `h`, the world half extents are the absolute rotation matrix times `h`:

```lua
local function worldAABB(cf: CFrame, size: Vector3): (Vector3, Vector3)
	local h = size / 2
	local r, u, l = cf.RightVector:Abs(), cf.UpVector:Abs(), cf.LookVector:Abs()
	local ext = r * h.X + u * h.Y + l * h.Z
	return cf.Position - ext, cf.Position + ext -- min, max
end
```

Merge many parts with `Vector3:Min` / `Vector3:Max` on the results.

## AABB overlap test

```lua
local function overlaps(minA: Vector3, maxA: Vector3, minB: Vector3, maxB: Vector3): boolean
	return minA.X < maxB.X and maxA.X > minB.X
		and minA.Y < maxB.Y and maxA.Y > minB.Y
		and minA.Z < maxB.Z and maxA.Z > minB.Z
end
```

Shrink both boxes by a small margin (0.05 studs) before testing, otherwise items placed flush against each other count as overlapping.

## Fit a model in a camera view

To frame a model of bounding radius `R` (half the diagonal: `size.Magnitude / 2`) with vertical field of view `fov` degrees, place the camera at distance:

```lua
local dist = R / math.sin(math.rad(fov) / 2)
camera.CFrame = CFrame.lookAt(cf.Position + dir.Unit * dist, cf.Position)
```

Using a sphere radius means any rotation of the model still fits. Works for ViewportFrame item icons and shop previews.

## Pitfalls

- `GetBoundingBox` includes invisible parts (hitboxes, zone parts, attachment helpers). Put those in a separate model or ignore them by computing your own box.
- Accessories with large invisible handles inflate character bounds.
- AABBs of rotated objects are loose; for tight placement tests on rotated furniture use oriented checks (`GetPartsInPart`) as the final step.

## Related
[[Math Geometry - Hub]] · [[Math - Point-in-Region Tests - Boxes, Spheres, Cylinders and Polygons]] · [[Grid Placement System - Community Blueprint]] · [[CFrame Recipes - Facing, Offsets and Relative Space]]

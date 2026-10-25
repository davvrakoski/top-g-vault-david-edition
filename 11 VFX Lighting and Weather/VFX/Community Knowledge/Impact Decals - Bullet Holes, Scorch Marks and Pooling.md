---
area: "11 VFX Lighting and Weather"
cluster: "VFX"
title: "Impact Decals - Bullet Holes, Scorch Marks and Pooling"
tags: [roblox, community-knowledge, vfx, decals, impacts, shooter]
cssclasses: [tg-a11]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Decal
  - https://create.roblox.com/docs/reference/engine/datatypes/RaycastResult
  - https://create.roblox.com/docs/workspace/raycasting
  - https://create.roblox.com/docs/reference/engine/classes/WeldConstraint
---
# Impact Decals - Bullet Holes, Scorch Marks and Pooling

Marks left behind by gameplay (bullet holes, sword gashes, scorch rings, blood splats where your policy allows, footprints in snow) make a fight feel like it happened somewhere. On Roblox they are usually a `Decal` on a thin invisible part placed at the raycast hit and aligned to the surface normal. Without a cap, a 20-minute match leaves thousands of parts in the workspace and frame rate slowly drops, so pooling is the core of the system.

## Placement from a raycast

`workspace:Raycast` returns a `RaycastResult` with `Position`, `Normal`, `Instance` and `Material`. Build a CFrame that faces out of the surface:

```lua
local function surfaceCFrame(result: RaycastResult): CFrame
	local pos = result.Position + result.Normal * 0.01 -- tiny lift avoids z-fighting
	-- look along the normal; pick a world-up that isn't parallel to the normal
	local up = if math.abs(result.Normal.Y) > 0.95 then Vector3.xAxis else Vector3.yAxis
	return CFrame.lookAt(pos, pos + result.Normal, up)
		* CFrame.Angles(0, 0, math.random() * math.pi * 2) -- random spin per mark
end
```

The holder part: `Size = (0.6, 0.6, 0.05)`, `Transparency = 1`, `Anchored = true`, `CanCollide/CanQuery/CanTouch = false`, `CastShadow = false`. Put the `Decal` on `Face = Back` or `Front` depending on which side faces out with your `lookAt` (with `lookAt` toward the normal, the part's Front face points out of the surface).

## Pool, don't create

```lua
local MAX_MARKS = 80
local pool, nextIndex = {}, 1

local function getMark(): BasePart
	local mark = pool[nextIndex]
	if not mark then
		mark = script.MarkTemplate:Clone()
		mark.Parent = workspace.Debris
		pool[nextIndex] = mark
	end
	nextIndex = nextIndex % MAX_MARKS + 1
	return mark
end

local function placeMark(result: RaycastResult, decalTexture: string)
	local mark = getMark()
	mark.CFrame = surfaceCFrame(result)
	mark.Decal.Texture = decalTexture
	mark.Decal.Transparency = 0
	mark.Parent = workspace.Debris
end
```

The oldest mark is reused when the cap is reached. 50-150 marks per client is a reasonable range; lower on mobile.

## Surface-aware marks

Pick textures by `result.Material`:

| Material group | Mark |
|---|---|
| Concrete, Brick, Rock | Grey chipped hole + small dust puff |
| Metal, DiamondPlate | Small bright dent + spark burst |
| Wood, WoodPlanks | Splintered dark hole + wood chips |
| Glass | Cracked star (and maybe break the pane) |
| Grass, Sand, Ground, Snow | No decal; dirt or snow puff only |
| Water | No decal; splash ring |

Skip decals on characters and on the `Terrain` water surface. On Humanoid hits, play a hit effect instead.

## Moving surfaces

If `result.Instance` is unanchored (a door, a car), an anchored mark will float in the air when it moves. Either skip marks on unanchored parts, or make the holder unanchored and weld it with a `WeldConstraint` (`Part0 = holder`, `Part1 = result.Instance`). Welding to many moving parts has a physics cost, so cap it lower.

## Fading

Let marks fade instead of popping: when a mark is about to be recycled, or after 30-60 s, tween `Decal.Transparency` to 1. In PvP shooters, keep marks a short while only; they leak information about where fights happened (sometimes that is desirable).

## Scorch marks and big impacts

- Explosions: one larger decal (3-8 studs) on the ground with random rotation; raycast down from the blast centre.
- Big decals on uneven ground clip or float. Raycast at 3-5 points and skip or shrink the decal if the normals disagree a lot.
- For ground slams, combine a decal crack with a mesh shockwave from the mesh VFX pack note.

## Rules

- Client-side only; the server sends the hit (position, normal, material) and clients place marks.
- Never parent marks under the hit model (it may be destroyed or streamed out), except welded marks on moving parts.
- Respect your gore policy for blood decals; offer a toggle.

## Related
[[VFX - Hub]] · [[Replicating VFX - Server Signals, Client Renders]] · [[Blood - Gore System — Architecture + Policy Gate]] · [[Mesh VFX Recipes with the Top G VFX Mesh Pack]]

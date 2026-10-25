---
area: "11 VFX Lighting and Weather"
cluster: "VFX"
title: "Hit Sparks per Material - An Impact Lookup Table"
tags: [roblox, community-knowledge, vfx, impacts, materials, shooter, melee]
cssclasses: [tg-a11]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/datatypes/RaycastResult
  - https://create.roblox.com/docs/reference/engine/enums/Material
  - https://create.roblox.com/docs/reference/engine/classes/ParticleEmitter
  - https://create.roblox.com/docs/parts/materials
---
# Hit Sparks per Material - An Impact Lookup Table

A bullet that throws orange sparks off wood, or dust off a metal door, breaks immersion instantly. Per-material impacts are a small table plus one function: every raycast hit already tells you the `Material`, the `Position` and the surface `Normal`, so the right effect costs nothing extra to choose. This note gives a ready-to-use grouping of Roblox materials and a tuned effect for each group.

## Step 1: group materials

Roblox has dozens of materials. Group them into 6-8 impact families so you only author a few effects:

```lua
local M = Enum.Material
local Family = {
	[M.Metal] = "Metal", [M.DiamondPlate] = "Metal", [M.CorrodedMetal] = "Metal", [M.Foil] = "Metal",
	[M.Wood] = "Wood", [M.WoodPlanks] = "Wood",
	[M.Concrete] = "Stone", [M.Brick] = "Stone", [M.Cobblestone] = "Stone", [M.Slate] = "Stone",
	[M.Granite] = "Stone", [M.Marble] = "Stone", [M.Rock] = "Stone", [M.Basalt] = "Stone",
	[M.Pavement] = "Stone", [M.Asphalt] = "Stone", [M.Limestone] = "Stone", [M.Sandstone] = "Stone",
	[M.Grass] = "Soil", [M.LeafyGrass] = "Soil", [M.Ground] = "Soil", [M.Mud] = "Soil", [M.Sand] = "Soil",
	[M.Snow] = "Snow", [M.Ice] = "Glass", [M.Glacier] = "Glass", [M.Glass] = "Glass",
	[M.Water] = "Water",
	[M.Fabric] = "Soft", [M.Plastic] = "Soft", [M.SmoothPlastic] = "Soft",
}
local function familyOf(mat: Enum.Material): string
	return Family[mat] or "Stone"
end
```

Characters are a separate family: check if the hit instance belongs to a model with a Humanoid before using the material.

## Step 2: one effect per family

| Family | Main burst | Secondary | Decal | Sound character |
|---|---|---|---|---|
| Metal | Bright sparks: `Orientation = VelocityParallel`, `Speed = 25-40`, `Acceleration = (0, -50, 0)`, `Lifetime = 0.2-0.35`, yellow-white, `LightEmission = 1` | One-frame PointLight | Small dark dent | Ping / ricochet |
| Wood | Splinters: small brown rectangles, `Speed = 12`, gravity, `RotSpeed` random | Light dust | Splintered hole | Thock |
| Stone | Grey chips + dust puff (`Lifetime = 0.8`, `Drag = 3`) | Debris chips with gravity | Chipped crater | Crack |
| Soil | Dirt spray upward in a narrow cone | Low dust | None (or faint) | Thud |
| Snow | White puff, slow, large | None | None | Soft crunch |
| Glass | Bright white shards, fast, short | Glint | Cracked-glass decal | Tink / shatter |
| Water | Splash crown (see water element note) | Ripple ring | None | Splash |
| Soft | Faint dust or fibres | None | Small mark | Muffled |
| Character | Hit flash + hit spark (no blood for wide audiences) | Damage number | None | Flesh / armour hit |

Point every burst along the surface normal: put the emitter on an attachment oriented with `CFrame.lookAt(pos, pos + normal)` and use `EmissionDirection = Front` (or orient so the emitter's emission axis matches the normal), with `SpreadAngle` 20-35. A cone that sprays out of the wall reads as an impact; a sphere does not.

For ricochet sparks on metal, reflect the shot direction about the normal (`d - 2 * d:Dot(n) * n`) and bias the sparks toward that direction.

## Step 3: one pooled emitter per family

```lua
local emitters = {} -- [family] = ParticleEmitter on a pooled attachment in workspace.Terrain

local function playImpact(result: RaycastResult)
	local fam = familyOf(result.Material)
	local fx = emitters[fam]
	fx.Parent.WorldCFrame = CFrame.lookAt(result.Position, result.Position + result.Normal)
	fx:Emit(fx:GetAttribute("Count") or 8)
end
```

Store the per-family emit count as an attribute on the template emitter so artists can tune it without editing code. Because `Emit()` spawns particles at the attachment's current position, one emitter can serve many impacts in the same frame: move, emit, move, emit.

## Terrain and custom materials

- Terrain hits return the terrain material in `RaycastResult.Material`, so the same table works.
- `MaterialVariant`s report their base material. If a custom variant should behave differently (for example a "rubber" variant based on Plastic), check `result.Instance.MaterialVariant` for parts.

## Budget

- Automatic weapons: cap to one impact per 0.03 s per shooter, and skip decals on every other hit.
- Other players' impacts: only show within 150 studs; beyond that, nothing.

## Related
[[VFX - Hub]] · [[Impact Decals - Bullet Holes, Scorch Marks and Pooling]] · [[Muzzle Flash Recipe - Flash, Light, Smoke and Shell]] · [[FX - Kid-Friendly Hit Feedback - Blood Alternatives and Maturity Labels]] · [[MaterialVariant and MaterialService - Custom Materials for Parts and Terrain]]

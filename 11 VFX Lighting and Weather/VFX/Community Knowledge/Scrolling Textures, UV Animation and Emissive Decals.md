---
area: "11 VFX Lighting and Weather"
cluster: "VFX"
title: "Scrolling Textures, UV Animation and Emissive Decals"
tags: [roblox, community-knowledge, vfx, textures, decals, emissive, uv-animation]
cssclasses: [tg-a11]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Texture
  - https://create.roblox.com/docs/reference/engine/classes/Decal
  - https://create.roblox.com/docs/reference/engine/classes/SurfaceAppearance
  - https://create.roblox.com/docs/reference/engine/classes/Beam
---
# Scrolling Textures, UV Animation and Emissive Decals

Conveyor belts, flowing lava, waterfalls on a flat mesh, scrolling energy on a portal, blinking warning signs and glowing screens are all "texture motion" effects. They cost almost nothing compared with particles because nothing is spawned: you move the texture coordinates of something that already exists. Roblox exposes this on `Texture` (stud offsets) and on `Decal` (UV offset, scale and rotation), and decals can now glow through an emissive mask.

## Which tool

| Need | Use | Animated property |
|---|---|---|
| Tiling texture across a part face (conveyor, lava floor) | `Texture` | `OffsetStudsU` / `OffsetStudsV` (studs) |
| Single image on a face (sign, screen, portal swirl) | `Decal` | `UVOffset`, `UVScale` (Vector2), `Rotation` (degrees, clockwise) |
| Glow on part of a decal (screen pixels, neon sign letters) | `Decal` + emissive mask | `EmissiveStrength`, `EmissiveTint` |
| Ribbon of flowing energy between points | `Beam` | `TextureSpeed` (built-in scroll) or `SetTextureOffset` |
| Mesh with full PBR glow | `SurfaceAppearance` | Its emissive mask / strength / tint |

`Texture` is a subclass of `Decal`, so it also has the decal properties; `StudsPerTileU/V` set tile size.

## Recipe 1: conveyor belt

```lua
local RunService = game:GetService("RunService")
local tex: Texture = workspace.Conveyor.Top.Texture
local SPEED = 6 -- studs per second; match the belt's physics velocity
RunService.Heartbeat:Connect(function(dt)
	tex.OffsetStudsV = (tex.OffsetStudsV + SPEED * dt) % tex.StudsPerTileV
end)
```

Wrap with `%` the tile size to avoid float precision loss after hours. Match the visual speed to the actual push speed of the belt (`AssemblyLinearVelocity` on an anchored part), or players notice the slide.

## Recipe 2: lava or water flow on a flat part

- Two `Texture`s on the same face: a base layer scrolling slowly in V, and a semi-transparent detail layer scrolling faster in a slightly different direction. The parallax between them hides the tile repeat.
- Colour with `Color3` on each texture; keep the base dark and the detail bright.
- For lava, add a `SurfaceLight` facing up with low brightness to light the walls, and an occasional bubble burst particle.

## Recipe 3: spinning portal or radar sweep

```lua
local decal: Decal = workspace.Portal.Front.Decal
RunService.Heartbeat:Connect(function(dt)
	decal.Rotation = (decal.Rotation + 40 * dt) % 360
end)
```

Use `UVScale` slightly below 1 if the corners of a square image show while rotating, or design the art as a circle with transparent corners.

## Recipe 4: emissive screens and signs

A `Decal` with an **emissive mask** (greyscale: black = no glow, white = full) glows on top of normal lighting; the result is multiplied by the colour map. From the Decal reference:

- `EmissiveMaskContent` is set at edit time (scripts can't write it).
- `EmissiveStrength` (default 1, 0 = off) and `EmissiveTint` (Color3; black = off) are scriptable. Very high strength clamps to white.

That means a sign's letters can flicker or pulse from a script without swapping images:

```lua
local sign: Decal = workspace.Motel.Sign.Decal
RunService.Heartbeat:Connect(function()
	local flicker = math.noise(os.clock() * 8) > 0.35 and 0.15 or 1
	sign.EmissiveStrength = 2.5 * flicker
end)
```

Pair with Bloom in Lighting for halo, and a weak `SurfaceLight` if the glow should light the wall.

## Recipe 5: flipbook on a decal

For a looping animated screen (static noise, a waving flag on a billboard), upload a sprite sheet with N frames in a row and step `UVScale = Vector2.new(1/N, 1)` and `UVOffset = Vector2.new(frame/N, 0)` every 1/12 s. Cheaper than a ViewportFrame or video, but use a modest sheet resolution.

## Performance rules

- Run all of this on the **client**. Server-side offset changes replicate every frame to every player.
- Update only what's visible or near: disconnect loops for decals in streamed-out or far areas.
- One loop driving many textures (a list) beats one connection per texture.
- Animated decals don't need to be in sync between players, so nothing needs networking.

## Related
[[VFX - Hub]] · [[Waterfall and Stream VFX — Layered Roblox Recipe]] · [[Beams, Trails and Attachments - Production Setups]] · [[ForceField Material and Neon Glow Tricks]]

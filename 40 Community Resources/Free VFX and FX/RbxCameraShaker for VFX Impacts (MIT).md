---
area: "40 Community Resources"
cluster: "Free VFX and FX"
source_note: "community/free-vfx/rbx-camera-shaker"
title: "RbxCameraShaker for VFX Impacts (MIT)"
tags: [roblox, community, vfx, open-source, mit, camera, game-feel, "cluster/free-vfx-and-fx"]
verified: 2026-10-25
license: "MIT"
sources:
  - https://github.com/Sleitnick/RbxCameraShaker
  - https://www.roblox.com/library/1461025953/Camera-Shaker
cssclasses: [tg-a40]
---

# RbxCameraShaker for VFX Impacts (MIT)

**Creator:** Stephen Leitnick (Sleitnick) · **License:** MIT · About 128 GitHub stars; last push July 2023. It is a Luau port of the Unity "EZ Camera Shake" asset's approach.

A big VFX hit needs camera motion, or it looks pasted on. The vault's [[Hitstop, Screen Shake and Camera Impact Feel]] explains *why* and *how much*. This note is about the free, MIT-licensed module many Roblox games use for the shake.

| Resource | What | License | Redistribute? | Link |
|---|---|---|---|---|
| RbxCameraShaker | Camera shake with presets + custom shakes | MIT | Yes | https://github.com/Sleitnick/RbxCameraShaker |
| Camera Shaker (Roblox library copy by the author) | Same module as a model | MIT | Yes | https://www.roblox.com/library/1461025953/Camera-Shaker |

## API basics (from the README)

```lua
-- LocalScript
local CameraShaker = require(path.to.CameraShaker)
local camera = workspace.CurrentCamera

local shaker = CameraShaker.new(Enum.RenderPriority.Camera.Value + 1, function(shakeCf)
	camera.CFrame = camera.CFrame * shakeCf
end)
shaker:Start()

-- one-off preset on an explosion
shaker:Shake(CameraShaker.Presets.Explosion)

-- custom: magnitude, roughness, fadeIn, fadeOut
shaker:ShakeOnce(2, 12, 0, 0.35)
```

- Once-type presets: **Bump**, **Explosion**. Sustained presets: **Earthquake**, **BadTrip**, **HandheldCamera**, **Vibration**, **RoughDriving**.
- `ShakeSustain` / `StartShake` for loops; `StopSustained(fadeOut)` to end them.

## Matching shake to VFX size

| VFX | Call | Feel |
|---|---|---|
| Light hit spark | `ShakeOnce(0.6, 10, 0, 0.15)` | Barely there |
| Heavy melee / shotgun | `ShakeOnce(1.5, 14, 0, 0.25)` | Punchy |
| Explosion near player | `Presets.Explosion`, scaled down by distance | Big but short |
| Boss stomp / earthquake | `ShakeSustain(Presets.Earthquake)` then `StopSustained(1)` | Rolling |

These numbers are starting points, not values from the README. Scale magnitude by distance from the effect, and offer a "reduce camera shake" setting for comfort.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free VFX and FX - Hub]]

**Related notes:** [[Hitstop, Screen Shake and Camera Impact Feel]] · [[Camera, Feel and Game Juice]] · [[DevForum Impact Frame Techniques]]

<!-- TDOD_GRAPH_END -->

---
area: "12 UI Audio and Camera"
cluster: "Camera Game Feel"
title: "FOV Punch, Sprint FOV and Zoom"
tags: [roblox, community-knowledge, camera, fov, game-feel, sprint]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Camera
  - https://create.roblox.com/docs/workspace/camera
  - https://create.roblox.com/docs/reference/engine/classes/GuiService
  - https://www.gamedeveloper.com/programming/improved-lerp-smoothing-
---
# FOV Punch, Sprint FOV and Zoom

Changing `Camera.FieldOfView` is the cheapest speed and impact effect in Roblox. Widening the view while sprinting makes movement feel faster without changing speed; a quick widen-and-return "punch" sells a dash, a shotgun blast or a ground slam; narrowing it gives a scope or focus zoom. The trouble starts when several systems (sprint, dash, aim, cutscene) all write `FieldOfView` directly and fight. The fix is one owner that combines layers.

## Facts to remember

- `Camera.FieldOfView` is the **vertical** FOV in degrees; Roblox's default is 70. The API reference says it is clamped between 1 and 120 degrees, and even suggests a wider FOV for sprinting and a narrower one for binoculars.
- Because it is vertical, ultra-wide monitors already see more horizontally; don't push the base FOV much past 80-90 or edges stretch.
- FOV changes are client-only. Set them in a LocalScript on the local camera.

## One FOV owner, many layers

Each system registers a target **offset**; the owner smooths toward `base + sum of offsets`:

```lua
local RunService = game:GetService("RunService")
local GuiService = game:GetService("GuiService")
local camera = workspace.CurrentCamera

local FOV = { base = 70, layers = {} :: { [string]: number }, punch = 0 }
local SMOOTH = 10 -- higher = snappier
local PUNCH_DECAY = 8

function FOV.set(layer: string, offset: number?)
	FOV.layers[layer] = offset
end

function FOV.kick(amount: number)
	FOV.punch += amount
end

RunService:BindToRenderStep("FOVOwner", Enum.RenderPriority.Camera.Value + 2, function(dt)
	local target = FOV.base
	for _, offset in FOV.layers do
		target += offset
	end
	FOV.punch *= math.exp(-PUNCH_DECAY * dt) -- punch springs back on its own
	local reduce = GuiService.ReducedMotionEnabled
	local goal = target + (reduce and 0 or FOV.punch)
	local alpha = 1 - math.exp(-SMOOTH * dt) -- frame-rate independent smoothing
	camera.FieldOfView = math.clamp(camera.FieldOfView + (goal - camera.FieldOfView) * alpha, 20, 110)
end)

return FOV
```

Usage:

- Sprint: `FOV.set("Sprint", 8)` on start, `FOV.set("Sprint", nil)` on stop.
- Aim down sights: `FOV.set("Aim", -25)`; the sprint layer can be cleared at the same time.
- Dash: `FOV.kick(10)`; it decays back automatically.
- Shotgun: `FOV.kick(4)` plus camera shake.

Because layers add, sprint + dash just works, and aiming always wins if you clear sprint while aiming.

## Good values

| Effect | Change | Timing |
|---|---|---|
| Sprint | +6 to +10 | Ease in about 0.25 s, out about 0.35 s |
| Dash / boost | +8 to +14 punch | Peak instantly, decay about 0.3 s |
| Speed-scaled (vehicles, sliding) | +0 to +15 mapped from speed | Smooth continuously |
| Aim down sights | -15 to -30 | 0.15-0.2 s |
| Sniper scope | down to 10-20 | Swap to a scope overlay at the same time |
| Big hit taken | -3 (brief narrowing) | Feels like a flinch |

## Sensitivity while zoomed

Players expect aim sensitivity to scale with zoom, or a zoomed scope feels twitchy. A common approach is scaling your custom camera's rotation input by `currentFOV / baseFOV` while aiming. The default camera scripts don't do this for you; it applies when you own the camera input (custom camera).

## Comfort and accessibility

- With Reduce Motion on, skip punches and keep sprint FOV small or off.
- Offer an FOV slider (for example 60-90) in settings and treat it as `FOV.base`.
- Avoid rapid repeated punches (automatic weapons). Use camera recoil there instead.

## Pitfalls

- Using `TweenService` on `FieldOfView` from several scripts: the newest tween cancels the others, so sprint ends and your aim zoom snaps.
- Fixed-alpha lerps (`fov += (goal - fov) * 0.1`) that run faster at 240 FPS than at 30 FPS. Use the exponential form above.
- Changing FOV on the server; it replicates nothing useful and ignores the player's camera.

## Related
[[Camera Game Feel - Hub]] · [[Custom Camera Systems in Luau]] · [[Frame-Rate Independent Camera Smoothing]] · [[Trauma-Based Camera Shake]]

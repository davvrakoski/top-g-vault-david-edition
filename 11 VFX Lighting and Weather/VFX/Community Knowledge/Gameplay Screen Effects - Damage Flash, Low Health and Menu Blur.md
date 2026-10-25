---
area: "11 VFX Lighting and Weather"
cluster: "VFX"
title: "Gameplay Screen Effects - Damage Flash, Low Health and Menu Blur"
tags: [roblox, community-knowledge, vfx, post-processing, screen-effects, feedback]
cssclasses: [tg-a11]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/environment/post-processing-effects
  - https://create.roblox.com/docs/reference/engine/classes/ColorCorrectionEffect
  - https://create.roblox.com/docs/reference/engine/classes/BlurEffect
  - https://create.roblox.com/docs/reference/engine/classes/DepthOfFieldEffect
  - https://create.roblox.com/docs/reference/engine/classes/GuiService
---
# Gameplay Screen Effects - Damage Flash, Low Health and Menu Blur

Post-processing is usually treated as a "make it pretty" lighting setting. In gameplay it is also feedback: a red pulse when you take damage, desaturation near death, blur behind an open shop, a flash for a flashbang. The key Roblox trick is **where** you parent the effect: effects under the `Camera` show only for that player, while effects under `Lighting` affect everyone's view. This note gives client-only recipes that don't fight the map's lighting setup.

## Lighting vs Camera

The post-processing docs: effects added to the **Camera** only display to that specific player, e.g. blurring the world while their menu is open. So:

- The map's look (base bloom, grading, sun rays) lives in `Lighting`, owned by your lighting/weather system.
- Gameplay feedback effects are **created by a LocalScript under `workspace.CurrentCamera`**, each with its own name, and tweened back to neutral.

Keep separate instances per job (e.g. `DamageCC`, `LowHealthCC`, `MenuBlur`) instead of editing the map's own `ColorCorrectionEffect`. Then the weather system and gameplay never overwrite each other. Multiple ColorCorrection effects combine, so a neutral one (Brightness 0, Contrast 0, Saturation 0, TintColor white) has no visible effect; verify stacking in Studio for your exact setup.

## Recipe 1: damage flash

```lua
local TweenService = game:GetService("TweenService")
local GuiService = game:GetService("GuiService")
local camera = workspace.CurrentCamera

local cc = Instance.new("ColorCorrectionEffect")
cc.Name = "DamageCC"
cc.Parent = camera

local function damageFlash(severity: number) -- 0..1
	local s = math.clamp(severity, 0, 1)
	if GuiService.ReducedMotionEnabled then s *= 0.5 end
	cc.TintColor = Color3.new(1, 1 - 0.45 * s, 1 - 0.45 * s) -- toward red
	cc.Saturation = -0.15 * s
	TweenService:Create(cc, TweenInfo.new(0.35 + 0.25 * s, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
		{ TintColor = Color3.new(1, 1, 1), Saturation = 0 }):Play()
end
```

Pair it with a UI vignette (an ImageLabel with a red radial-edge texture) whose `ImageTransparency` tweens from about 0.3 to 1. The vignette tells the player the direction if you offset it toward the attacker.

## Recipe 2: low health state

Continuous, not a flash: as health drops below 30%, slowly lower `Saturation` (to about -0.6), raise `Contrast` slightly (+0.1), and add a gentle heartbeat pulse of the vignette. Return smoothly when healed. Muffle audio at the same time (low-pass on the SFX bus) for a strong combined effect.

## Recipe 3: menu blur

```lua
local blur = Instance.new("BlurEffect")
blur.Name = "MenuBlur"
blur.Size = 0
blur.Parent = camera

local function setMenuBlur(open: boolean)
	TweenService:Create(blur, TweenInfo.new(0.2), { Size = open and 16 or 0 }):Play()
end
```

`BlurEffect.Size` around 12-20 is enough to push the world back. Combine with a dim UI overlay for contrast. Disable (`Enabled = false`) when Size reaches 0 if you want to be extra careful about cost on low-end devices.

## Recipe 4: focus and aim with depth of field

`DepthOfFieldEffect` (`FocusDistance`, `InFocusRadius`, `NearIntensity`, `FarIntensity`) can blur the background while aiming down sights or during dialogue. Set `FocusDistance` from a raycast to what the player looks at, and smooth it. Keep `FarIntensity` low in competitive modes; blurred backgrounds hide enemies.

## Recipe 5: flashbang / explosion white-out

Brief `Brightness` +0.6 and `Contrast` -0.3 on a camera ColorCorrection, decaying over 1-3 s depending on distance and facing direction, plus a high-pitched ringing with ducked SFX. **Photosensitivity:** full-screen bright flashes can harm players; cap intensity, never strobe, and honour a reduce-flashing setting (Reduce Motion is a reasonable proxy if you don't have one).

## Rules

- One owner per effect instance; all gameplay effects decay to neutral by themselves.
- Effects are client-side only; never tween Lighting effects from the server for one player's damage.
- Check how effects look on top of each weather preset (night + rain + damage flash should still read).
- Don't rely only on the screen effect: pair damage with sound and UI so players with effects turned down still know.

## Related
[[VFX - Hub]] · [[Post-Processing - Bloom, Color and DOF]] · [[Lighting too dark - overprocessed]] · [[Trauma-Based Camera Shake]]

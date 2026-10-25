---
area: "11 VFX Lighting and Weather"
cluster: "VFX"
title: "Level-Up and Reward Bursts - Light Pillars, Confetti and Screen Pops"
tags: [roblox, community-knowledge, vfx, rewards, level-up, game-feel]
cssclasses: [tg-a11]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/effects/particle-emitters
  - https://create.roblox.com/docs/reference/engine/classes/ParticleEmitter
  - https://create.roblox.com/docs/reference/engine/classes/UIScale
  - https://create.roblox.com/docs/reference/engine/classes/TweenService
  - https://www.vfxapprentice.com/blog/the-soul-of-effects-what-is-timing-in-vfx
---
# Level-Up and Reward Bursts - Light Pillars, Confetti and Screen Pops

The moment a player levels up, opens a chest or unlocks a rare item is the biggest emotional beat in many Roblox games, and it is often shown with a plain text popup. A short, layered reward burst (in the world for other players to see, on screen for the player) makes progress feel earned and advertises it to everyone nearby. The key is a **tiered** system: common rewards get a small pop, rare ones get the full show, so the big version keeps its impact.

## The four layers

1. **World pillar** (others see it): a vertical beam of light at the player.
2. **Burst particles:** confetti or stars thrown up and falling.
3. **Screen pop** (the player only): a UI banner that scales in with overshoot.
4. **Sound and haptics:** a rising chime; the vault's UI sound note covers this.

## World pillar

- Two attachments: one at the feet, one 25-40 studs up. A `Beam` between them, `FaceCamera = true`, `Width0 = 3`, `Width1 = 1`, `LightEmission = 1`, a vertical gradient texture scrolling upward (`TextureSpeed = 2`).
- `Transparency` sequence fading at both ends so there is no hard cap.
- Tween the width from 0 to full in 0.15 s, hold 0.6 s, then fade over 0.5 s.
- Add a `PointLight` at the feet (`Range = 14`, `Brightness = 3`) for the same duration so the ground glows.

## Burst particles

| Emitter | Emit | Settings |
|---|---|---|
| Confetti | 40-60 | `Speed = 25-35`, `SpreadAngle = (30, 30)` upward, `Acceleration = (0, -30, 0)`, `Drag = 1.5`, `RotSpeed = (-360, 360)`, small rectangles, multi-colour `Color` via several emitters or random per emitter |
| Stars | 10-15 | Star texture, `LightEmission = 1`, `Speed = 10`, `Lifetime = 0.8`, `Size` 0.6 -> 0 |
| Ring | 1 | Flat ring at feet scaling out to 8 studs in 0.3 s |

Try confetti with `Orientation = VelocityPerpendicular` against the default `FacingCamera`: because the particle's facing follows its changing velocity, it can read more like paper turning as it falls.

## Screen pop

```lua
local TweenService = game:GetService("TweenService")

local function popBanner(frame: Frame)
	local scale = frame:FindFirstChildOfClass("UIScale") or Instance.new("UIScale", frame)
	scale.Scale = 0.4
	frame.Visible = true
	TweenService:Create(scale, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 }):Play()
	task.delay(2.2, function()
		TweenService:Create(scale, TweenInfo.new(0.2), { Scale = 0 }):Play()
	end)
end
```

Animate a `UIScale` instead of `Size` so the layout inside the banner does not reflow. Behind the banner, a rotating "sunburst" image (spin `Rotation` slowly) is a classic reward backdrop.

## Timing

Use wind-up / climax / fall-off: a 0.2 s gather (a few particles drawn toward the player, sound rising), the climax in one frame (pillar, burst, banner, chime together), then a 1-2 s fall-off of falling confetti. The climax must land on the same frame for all layers; spread over several frames it feels laggy.

## Tiers

| Tier | Pillar | Particles | Screen | Others see |
|---|---|---|---|---|
| Common item | none | 8 stars | small toast | nothing |
| Level up | 0.6 s | confetti 40 | banner | pillar + burst |
| Rare drop | 1.2 s, rarity colour | confetti 60 + stars | banner + sunburst | pillar + burst + chat line |
| Legendary | 2 s + ring pulses | all + screen flash | full-screen card | all, plus server-wide message |

Rarity colours must stay consistent with your item rarity UI.

## Pitfalls

- **Reward spam:** idle and simulator games can grant many rewards per second. Queue banners and merge repeated common rewards ("+5 coins x12"), and rate-limit world pillars per player.
- **Blocking view in combat:** never play a full-screen card while the player is fighting; queue it until they are safe.
- **Accessibility:** avoid strobing on legendary drops; one flash at most, and respect a reduced-effects setting.

## Related
[[VFX - Hub]] · [[UI and Feedback Sound Design - Clicks, Rewards and Errors]] · [[TweenService UI Animation Recipes]] · [[Gameplay Screen Effects - Damage Flash, Low Health and Menu Blur]] · [[VFX Color Language and Readability]]

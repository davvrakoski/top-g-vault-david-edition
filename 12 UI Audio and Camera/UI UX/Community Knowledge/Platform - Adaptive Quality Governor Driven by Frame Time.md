---
area: "12 UI Audio and Camera"
cluster: "UI UX"
title: "Platform - Adaptive Quality Governor Driven by Frame Time"
tags: [roblox, community-knowledge, ui, platform, performance, adaptive-quality, mobile]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Stats
  - https://create.roblox.com/docs/reference/engine/classes/UserGameSettings
  - https://create.roblox.com/docs/performance-optimization/design
  - https://create.roblox.com/docs/performance-optimization/test-on-hardware
  - https://create.roblox.com/docs/production/publishing/vr-guidelines
  - https://developer.android.com/games/optimize/adpf/thermal
---
# Platform - Adaptive Quality Governor Driven by Frame Time

Roblox already scales its own rendering with the automatic quality system, but it cannot know which of **your** effects are optional: the extra debris, the fake god rays, the 40 ambient NPCs. A small client-side governor that watches frame time and switches your own effect tiers keeps phones smooth in busy moments without making high-end PCs look worse. This is the code side of the tier plan in [[Visual Scalability and Quality Tiers]].

## Design
1. **Measure** smoothed frame time (`Stats.FrameTime`) over a few seconds, not per frame.
2. **Compare** to a budget with a gap between "too slow" and "fast enough" (hysteresis), so the tier does not flip back and forth.
3. **Step** one tier at a time, with a cooldown, cheapest-to-lose effects first.
4. **Hint** from the player: if `SavedQualityLevel` is a manual 1 to 3, start one tier lower (see [[Platform - Reading Graphics Quality and Frame Time - UserGameSettings and Stats]]).
5. **Never cut gameplay-critical visuals** (telegraphs, hitboxes, objective markers).

Frame rate cap note: the default client cap is 60 FPS, so `FrameTime` bottoms out near 16.7 ms on most devices; a Windows player who raised the cap (up to 240) will show lower numbers. Budget around 60 FPS: "too slow" above about 22 ms (under 45 FPS), "fast enough" below about 17.5 ms.

## Implementation

```lua
-- StarterPlayerScripts/QualityGovernor (LocalScript)
local Stats = game:GetService("Stats")
local RunService = game:GetService("RunService")

local SLOW_MS, FAST_MS = 22, 17.5
local WINDOW_S, COOLDOWN_S = 3, 6
local MAX_TIER = 3 -- 3 = full effects, 0 = minimum

local settings = UserSettings():GetService("UserGameSettings")
local saved = settings.SavedQualityLevel
local tier = MAX_TIER
if saved ~= Enum.SavedQualitySetting.Automatic and saved.Value <= 3 then
	tier = MAX_TIER - 1
end

local tierChanged = Instance.new("BindableEvent")
local sum, count, windowStart, lastChange = 0, 0, os.clock(), 0

local function setTier(newTier: number)
	newTier = math.clamp(newTier, 0, MAX_TIER)
	if newTier == tier then return end
	tier = newTier
	lastChange = os.clock()
	workspace:SetAttribute("FxTier", tier) -- effects read this attribute
	tierChanged:Fire(tier)
end
workspace:SetAttribute("FxTier", tier)

RunService.Heartbeat:Connect(function()
	sum += Stats.FrameTime
	count += 1
	local now = os.clock()
	if now - windowStart < WINDOW_S then return end
	local avgMs = (sum / count) * 1000
	sum, count, windowStart = 0, 0, now
	if now - lastChange < COOLDOWN_S then return end
	if avgMs > SLOW_MS then
		setTier(tier - 1)
	elseif avgMs < FAST_MS and tier < MAX_TIER then
		setTier(tier + 1)
	end
end)
```

Effects subscribe through the attribute so nothing needs to require the governor:

```lua
-- Example consumer: ambient particle emitters tagged "AmbientFx"
local CollectionService = game:GetService("CollectionService")
local baseRate: {[ParticleEmitter]: number} = {}

local function apply()
	local t = workspace:GetAttribute("FxTier") or 3
	local mult = ({ [0] = 0, [1] = 0.3, [2] = 0.65, [3] = 1 })[t]
	for _, e in CollectionService:GetTagged("AmbientFx") do
		if e:IsA("ParticleEmitter") then
			baseRate[e] = baseRate[e] or e.Rate
			e.Rate = baseRate[e] * mult
		end
	end
end
workspace:GetAttributeChangedSignal("FxTier"):Connect(apply)
apply()
```

## What each tier can drop (cheapest loss first)

| Tier drop | Candidates |
|---|---|
| 3 to 2 | Ambient particles down, secondary dynamic lights off, decorative far props hidden |
| 2 to 1 | Post effects you added (Bloom/DepthOfField/SunRays) off, crowd NPC count down, `CastShadow` off on small props |
| 1 to 0 | Decorative ViewportFrames paused, UI animations simplified, minimum crowd |

Keep the client-only nature in mind: these are local visuals, so different players can sit at different tiers without any gameplay unfairness.

## Pitfalls
- **Oscillation:** no hysteresis and no cooldown makes the scene pulse. Keep both.
- **Spikes vs sustained load:** a loading hitch is not a reason to drop a tier; the 3 s window filters it.
- **Thermal drift:** phones get slower over 10 to 15 minutes as they heat up (hardware testing guide); the Android thermal docs describe the same effect and recommend lowering workload, frame rate or fidelity before throttling. A governor that only steps down at startup misses this; keep it running.
- **Recovering too eagerly:** stepping up as soon as FPS recovers can reheat the device. A longer cooldown for upward steps (for example 20 s) is gentler.
- **VR:** on Quest, the engine's auto quality targets at least 72 FPS; set `SLOW_MS` near 14 for VR sessions.

## Related
[[UI UX - Hub]] · [[Visual Scalability and Quality Tiers]] · [[Mobile FPS collapses]] · [[Platform - Battery and Thermal Throttling on Phones]]

---
area: "11 VFX Lighting and Weather"
cluster: "Weather"
tags: [deep-dive, roblox, weather, day-night, lighting, atmosphere]
cssclasses: [tg-a11]
---

# Day-Night Cycle and Weather Transitions in Practice

> **Why this matters:** A server script doing `Lighting.ClockTime += 0.01` in a loop replicates a property change to every player many times a second, looks steppy, and cannot blend with weather. Most "weather systems" then fight it by setting the same Lighting properties from another script.
> The production pattern: every client computes time of day from the shared server clock, samples a lighting gradient, and blends weather on top with weights, so one director owns `Lighting`.

---

## 1. Architecture

```
Server                                  Every client
------                                  ------------
cycle length, epoch (attributes)  --->  t = f(GetServerTimeNow())
weather state + start time       --->   weatherWeight = transition curve
(changes a few times per hour)          profile = sample(dayGradient, t)
                                        profile = blend(profile, weatherProfile, weight)
                                        apply to Lighting / Atmosphere / Clouds / wind / post
                                        rain/snow emitters near the camera only
```

- **Nothing per-frame crosses the network.** The server only replicates a handful of attributes when something changes.
- **One owner of `Lighting`** on each client: the director. Other systems (indoor zones, cutscenes, damage flashes) request modifiers from it instead of writing `Lighting` themselves.
- **Deterministic:** two players standing side by side see the same sky at the same moment, because both read the same server clock.

This builds on the state design in [[Production Weather State Machine]] and the profiles in [[Day - Night and Lighting Blueprint]].

## 2. Shared time of day

```lua
--!strict
-- ReplicatedStorage/Shared/WorldClock.lua
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local WorldClock = {}

-- Server sets these attributes once (and again only if an admin changes them):
--   CycleSeconds: real seconds per in-game day (e.g. 1200 = 20 minutes)
--   EpochClock:   in-game hour at EpochServerTime
--   EpochServerTime: workspace:GetServerTimeNow() when the epoch was set
local config = ReplicatedStorage

function WorldClock.hour(): number
	local cycle = config:GetAttribute("CycleSeconds") or 1200
	local epochClock = config:GetAttribute("EpochClock") or 8
	local epochTime = config:GetAttribute("EpochServerTime") or 0
	local elapsed = Workspace:GetServerTimeNow() - epochTime
	return (epochClock + elapsed / cycle * 24) % 24
end

return WorldClock
```

Server boot:

```lua
-- ServerScriptService/WorldClockInit.server.lua
local ReplicatedStorage = game:GetService("ReplicatedStorage")
ReplicatedStorage:SetAttribute("CycleSeconds", 1200)
ReplicatedStorage:SetAttribute("EpochClock", 7.5)       -- servers start at 07:30
ReplicatedStorage:SetAttribute("EpochServerTime", workspace:GetServerTimeNow())
```

Skipping time ("sleep until morning") is just new epoch attributes. To skip smoothly, have clients tween toward the new value instead of jumping.

If the server needs the time for gameplay (shops close at night, zombies stronger at night), it calls the same `WorldClock.hour()`.

## 3. A lighting gradient over the day

Define a few keys and interpolate. Colours lerp per channel; numbers lerp linearly; the gradient wraps around midnight.

```lua
--!strict
-- ReplicatedStorage/Shared/DayGradient.lua
local C = Color3.fromRGB

export type Profile = {
	Brightness: number, ExposureCompensation: number,
	Ambient: Color3, OutdoorAmbient: Color3, ColorShift_Top: Color3,
	AtmoDensity: number, AtmoHaze: number, AtmoGlare: number, AtmoColor: Color3, AtmoDecay: Color3,
	CCSaturation: number, CCContrast: number, CCTint: Color3,
	CloudCover: number, CloudDensity: number,
	Wind: Vector3,
}

local KEYS: { { hour: number, p: Profile } } = {
	{ hour = 0, p = { Brightness = 0.5, ExposureCompensation = -0.2, Ambient = C(25, 27, 35), OutdoorAmbient = C(45, 50, 70),
		ColorShift_Top = C(120, 140, 180), AtmoDensity = 0.4, AtmoHaze = 1.5, AtmoGlare = 0, AtmoColor = C(60, 70, 95),
		AtmoDecay = C(25, 30, 45), CCSaturation = -0.2, CCContrast = 0.1, CCTint = C(225, 235, 255),
		CloudCover = 0.5, CloudDensity = 0.4, Wind = Vector3.new(4, 0, 2) } },
	{ hour = 6, p = { Brightness = 1.6, ExposureCompensation = 0.1, Ambient = C(60, 50, 50), OutdoorAmbient = C(120, 95, 90),
		ColorShift_Top = C(255, 180, 130), AtmoDensity = 0.42, AtmoHaze = 2.4, AtmoGlare = 1.4, AtmoColor = C(255, 200, 170),
		AtmoDecay = C(140, 90, 90), CCSaturation = 0.05, CCContrast = 0.1, CCTint = C(255, 238, 225),
		CloudCover = 0.55, CloudDensity = 0.45, Wind = Vector3.new(3, 0, 1) } },
	{ hour = 12, p = { Brightness = 3, ExposureCompensation = -0.1, Ambient = C(45, 45, 50), OutdoorAmbient = C(115, 120, 130),
		ColorShift_Top = C(255, 245, 225), AtmoDensity = 0.3, AtmoHaze = 1.2, AtmoGlare = 0.3, AtmoColor = C(200, 205, 215),
		AtmoDecay = C(106, 112, 125), CCSaturation = 0.05, CCContrast = 0.05, CCTint = C(255, 255, 255),
		CloudCover = 0.6, CloudDensity = 0.5, Wind = Vector3.new(6, 0, 3) } },
	{ hour = 18, p = { Brightness = 2, ExposureCompensation = 0.1, Ambient = C(60, 45, 45), OutdoorAmbient = C(125, 95, 85),
		ColorShift_Top = C(255, 170, 110), AtmoDensity = 0.4, AtmoHaze = 2.2, AtmoGlare = 1.8, AtmoColor = C(255, 190, 150),
		AtmoDecay = C(150, 80, 70), CCSaturation = 0.1, CCContrast = 0.12, CCTint = C(255, 235, 220),
		CloudCover = 0.55, CloudDensity = 0.45, Wind = Vector3.new(5, 0, 2) } },
	{ hour = 20.5, p = { Brightness = 0.8, ExposureCompensation = -0.1, Ambient = C(30, 30, 45), OutdoorAmbient = C(60, 60, 90),
		ColorShift_Top = C(140, 130, 200), AtmoDensity = 0.4, AtmoHaze = 1.8, AtmoGlare = 0.2, AtmoColor = C(90, 80, 130),
		AtmoDecay = C(40, 35, 70), CCSaturation = -0.1, CCContrast = 0.1, CCTint = C(235, 235, 255),
		CloudCover = 0.5, CloudDensity = 0.4, Wind = Vector3.new(4, 0, 2) } },
}

local function lerpValue(a: any, b: any, t: number): any
	if typeof(a) == "number" then
		return a + (b - a) * t
	end
	return a:Lerp(b, t) -- Color3 and Vector3 both have :Lerp
end

local DayGradient = {}

function DayGradient.sample(hour: number): Profile
	local n = #KEYS
	for i = 1, n do
		local a = KEYS[i]
		local b = KEYS[i % n + 1]
		local startH = a.hour
		local endH = if b.hour > a.hour then b.hour else b.hour + 24
		local h = if hour < startH then hour + 24 else hour
		if h >= startH and h < endH then
			local t = (h - startH) / (endH - startH)
			t = t * t * (3 - 2 * t) -- smoothstep: no visible "kinks" at keys
			local out = {}
			for k, v in a.p do
				out[k] = lerpValue(v, (b.p :: any)[k], t)
			end
			return out :: any
		end
	end
	return KEYS[1].p
end

DayGradient.lerpValue = lerpValue
return DayGradient
```

Five keys are enough; most of the "magic" is in dawn and dusk. Note `ClockTime` itself is set from the clock (it moves the sun and moon); the gradient only drives colour and atmosphere.

## 4. Weather as weighted overrides

Weather is not a separate lighting setup; it is a set of **target overrides with a weight**. At weight 0 you see the day gradient; at weight 1 the weather fully applies.

```lua
-- ReplicatedStorage/Shared/WeatherProfiles.lua
local C = Color3.fromRGB
return {
	Clear = { weight = 0 },
	Overcast = {
		Brightness = 1.4, AtmoDensity = 0.45, AtmoHaze = 2.5, AtmoGlare = 0, CCSaturation = -0.15,
		CloudCover = 0.85, CloudDensity = 0.65, rain = 0,
	},
	Rain = {
		Brightness = 1.0, ExposureCompensation = -0.2, AtmoDensity = 0.5, AtmoHaze = 3, AtmoGlare = 0,
		AtmoColor = C(120, 130, 145), CCSaturation = -0.25, CCContrast = 0.08,
		CloudCover = 0.95, CloudDensity = 0.8, Wind = Vector3.new(14, 0, 6), rain = 1,
	},
	Fog = {
		AtmoDensity = 0.7, AtmoHaze = 4, AtmoGlare = 0, AtmoColor = C(190, 195, 200), CCSaturation = -0.1,
		CloudCover = 0.7, rain = 0,
	},
}
```

The server owns the state machine and replicates only:

- `WeatherFrom`, `WeatherTo` (names),
- `WeatherChangedAt` (server time),
- `WeatherBlendSeconds` (e.g. 45).

Clients compute `w = smoothstep(clamp((now - changedAt) / blendSeconds, 0, 1))` and blend `profile = blend(blend(base, from, 1), to, w)` (for `Clear`, nothing is overridden). Because both ends of the transition are known, a player joining mid-transition sees exactly the same blend as everyone else.

## 5. The client director

```lua
--!strict
-- StarterPlayerScripts/WorldDirector.client.lua
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local Shared = ReplicatedStorage:WaitForChild("Shared")
local WorldClock = require(Shared.WorldClock)
local DayGradient = require(Shared.DayGradient)
local Weather = require(Shared.WeatherProfiles)

local atmo = Lighting:FindFirstChildOfClass("Atmosphere") or Instance.new("Atmosphere", Lighting)
local cc = Lighting:FindFirstChildOfClass("ColorCorrectionEffect") or Instance.new("ColorCorrectionEffect", Lighting)
local clouds = Workspace.Terrain:FindFirstChildOfClass("Clouds") or Instance.new("Clouds", Workspace.Terrain)

local function smooth(x: number) local t = math.clamp(x, 0, 1); return t * t * (3 - 2 * t) end

local function overlay(base: { [string]: any }, over: { [string]: any }, w: number)
	if w <= 0 then return end
	for k, v in over do
		if base[k] ~= nil then
			base[k] = DayGradient.lerpValue(base[k], v, w)
		elseif k == "rain" then
			base.rain = (base.rain or 0) + (v - (base.rain or 0)) * w
		end
	end
end

local UPDATE_HZ = 15
local acc = 0
RunService.Heartbeat:Connect(function(dt)
	acc += dt
	if acc < 1 / UPDATE_HZ then return end
	acc = 0

	local hour = WorldClock.hour()
	local p: { [string]: any } = DayGradient.sample(hour) :: any
	p = table.clone(p)
	p.rain = 0

	local fromName = ReplicatedStorage:GetAttribute("WeatherFrom") or "Clear"
	local toName = ReplicatedStorage:GetAttribute("WeatherTo") or "Clear"
	local changedAt = ReplicatedStorage:GetAttribute("WeatherChangedAt") or 0
	local blend = ReplicatedStorage:GetAttribute("WeatherBlendSeconds") or 45
	local w = smooth((Workspace:GetServerTimeNow() - changedAt) / blend)
	overlay(p, Weather[fromName] or {}, 1 - w)
	overlay(p, Weather[toName] or {}, w)

	Lighting.ClockTime = hour
	Lighting.Brightness = p.Brightness
	Lighting.ExposureCompensation = p.ExposureCompensation
	Lighting.Ambient = p.Ambient
	Lighting.OutdoorAmbient = p.OutdoorAmbient
	Lighting.ColorShift_Top = p.ColorShift_Top
	atmo.Density, atmo.Haze, atmo.Glare = p.AtmoDensity, p.AtmoHaze, p.AtmoGlare
	atmo.Color, atmo.Decay = p.AtmoColor, p.AtmoDecay
	cc.Saturation, cc.Contrast, cc.TintColor = p.CCSaturation, p.CCContrast, p.CCTint
	clouds.Cover, clouds.Density = p.CloudCover, p.CloudDensity
	Workspace.GlobalWind = p.Wind
	Workspace:SetAttribute("RainAmount", p.rain) -- read by the local rain system
end)
```

15 Hz is smooth for lighting (changes are slow) and cheap. If you see stepping at dawn, raise the rate or shorten `CycleSeconds`.

`Workspace.GlobalWind` drives terrain grass, dynamic clouds and particles with `WindAffectsDrag`, per the docs, so one wind value keeps grass, clouds and rain consistent.

Applying the old weather at weight `1 - w` and then the new one at `w` gives exactly the old weather at `w = 0` and exactly the new one at `w = 1`; in between it is a close approximation of a true cross-fade, which is visually indistinguishable for slow blends.

## 6. Rain and snow near the camera only

- One emitter part (or a small grid of 4) that follows the camera at ~25 studs above it, `Rate = baseRate × RainAmount`.
- **Roof check:** raycast up from the camera every 0.25 s; if covered, lower `Rate` to 0 and switch to "rain on roof" ambience.
- **Splashes** only within ~30 studs, as a separate low-rate emitter on the ground below the camera, or skip on mobile.
- Respect the particle limits (100/s per emitter on mobile) from [[ParticleEmitter Bursts, Flipbooks and Budgets]]; the rain system design is in [[Rain Production System]] and tiering in [[Weather Quality Tiers Lab]].

## 7. Night lights with hysteresis

Street lamps and windows switch at dusk. Without hysteresis they flicker when time hovers around the threshold.

```lua
local CollectionService = game:GetService("CollectionService")
local lightsOn = false
local function updateNightLights(hour: number)
	local shouldBeOn = if lightsOn then not (hour > 6.6 and hour < 17.9) else (hour >= 18.3 or hour <= 6.2)
	if shouldBeOn == lightsOn then return end
	lightsOn = shouldBeOn
	for _, light in CollectionService:GetTagged("NightLight") do
		if light:IsA("Light") then light.Enabled = lightsOn end
	end
end
```

Run it from the director on the client. Only enable shadows on the few lamps players stand near; many shadow-casting lights are expensive.

## 8. Storm flashes (accessibility first)

A lightning flash is a 0.1 to 0.2 s bump in `ExposureCompensation` or `ColorCorrectionEffect.Brightness`, plus a bolt mesh or beam. Provide a setting to reduce or disable flashes and never flash more than a few times per second. Details in [[Thunder, Lightning and Accessibility]].

## 9. Indoors

Inside buildings, the director should apply a zone modifier (lower exposure, less haze, rain off) instead of another script writing `Lighting`. Zone detection and blending is in [[Interior - Exterior Lighting Transitions]].

## Common mistakes

- Server loop writing `Lighting.ClockTime` every frame (replication spam, stepping).
- Weather scripts and day-night scripts both writing `Lighting` and fighting.
- Weather changes as instant swaps instead of timed blends.
- New players seeing a different sky because the transition state is not replicated.
- Gradients interpolated linearly with visible "kinks" at keyframes (use smoothstep).
- Rain emitters across the whole map instead of around the camera.
- Night lights toggled at one exact threshold (flicker).
- Global wind changed abruptly (clouds and grass jump).

## Checklist

- [ ] Time of day computed from `GetServerTimeNow()` and three replicated attributes.
- [ ] Day gradient with 4 to 6 keys, smoothstep, wraps midnight.
- [ ] Weather = override profiles + replicated from/to/changedAt/blend.
- [ ] One client director owns Lighting, Atmosphere, post, Clouds and GlobalWind.
- [ ] Updates at 10 to 20 Hz.
- [ ] Rain/snow camera-local with roof check and mobile caps.
- [ ] Night lights with hysteresis.
- [ ] Flash accessibility setting; indoor zone modifiers.

---

**Related:** [[Weather - Hub]] · [[Production Weather State Machine]] · [[Day - Night and Lighting Blueprint]] · [[Weather Environment Framework]] · [[Weather looks fake or disconnected]] · [[Fog, Snow, Wind and Layered Weather]]

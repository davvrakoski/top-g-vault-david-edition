---
area: "11 VFX Lighting and Weather"
cluster: "Lighting"
tags: [deep-dive, roblox, lighting, atmosphere, post-processing, presets]
cssclasses: [tg-a11]
---

# Lighting Presets by Genre - LightingStyle, Atmosphere and Post

> **Why this matters:** Lighting is the fastest way to make a Roblox game look expensive or cheap, and the settings changed in 2025-2026: `Lighting.Technology` ("Future", "ShadowMap", "Voxel") is now deprecated and replaced by `LightingStyle` plus `PrioritizeLightingQuality`. Old tutorials no longer match Studio.
> This note explains the current model and gives seven genre presets as a script you can apply, tween between and tune.

---

## 1. The current lighting model (what replaced "Future")

From the current `Lighting` reference:

- **`Lighting.Technology` is deprecated** and non-scriptable. Its enum still lists `Voxel`, `ShadowMap`, `Future` (and deprecated `Legacy`, `Compatibility`, `Unified`), but new work should use the two properties below.
- **`Lighting.LightingStyle`** (`Enum.LightingStyle.Realistic` or `Soft`) states the artistic intent. `Realistic` is the most advanced, naturalistic lighting and shadows; `Soft` is the flatter, softer, stylized "retro Roblox" look.
- **`Lighting.PrioritizeLightingQuality`** (boolean) says what to sacrifice first when a device lowers quality: `true` keeps advanced shadows and high-quality shaders up close; `false` keeps view distance. The docs note the actual shadowing path depends on both properties (for example `Soft` with this enabled uses shadow maps rather than voxel lighting).
- **`ShadowSoftness`** only applies when `LightingStyle` is `Realistic`.
- The old Compatibility look is recreated with `Voxel`-style lighting plus a `ColorGradingEffect` with `TonemapperPreset = Retro`.
- Local light `Range` (PointLight/SpotLight/SurfaceLight) is clamped to 120 studs per the Lighting reference.

Practical mapping when following older tutorials:

| Old tutorial says | Use now |
|---|---|
| "Set Technology to Future" | `LightingStyle = Realistic`, `PrioritizeLightingQuality = true` |
| "ShadowMap for performance" | `LightingStyle = Realistic`, `PrioritizeLightingQuality = false` |
| "Voxel / Compatibility for the classic look" | `LightingStyle = Soft` (+ `ColorGradingEffect` Retro if you want the old tonemapper) |

This mapping is a reasonable reading of the docs, not an official equivalence table; compare in Studio before committing.

## 2. The knobs, grouped by job

| Job | Properties |
|---|---|
| Overall style | `LightingStyle`, `PrioritizeLightingQuality` |
| Sun/moon | `ClockTime`, `GeographicLatitude`, `Brightness` |
| Shadows | `GlobalShadows`, `ShadowSoftness` (Realistic only), `ShadowColor` |
| Fill light | `Ambient` (everywhere, including indoors), `OutdoorAmbient` (outdoors only), `EnvironmentDiffuseScale`, `EnvironmentSpecularScale` |
| Tint by facing | `ColorShift_Top` (faces toward sun), `ColorShift_Bottom` (away) |
| Exposure | `ExposureCompensation` (range starts at -5) |
| Air | `Atmosphere`: `Density`, `Offset`, `Color`, `Decay`, `Glare`, `Haze` |
| Sky | `Sky` (skybox, `SunAngularSize`, `MoonAngularSize`, `StarCount`, `CelestialBodiesShown`), `Clouds` under `Terrain` (`Cover`, `Density`, `Color`) |
| Post | `ColorCorrectionEffect` (`Brightness`, `Contrast`, `Saturation`, `TintColor`), `BloomEffect` (`Intensity`, `Size`, `Threshold`), `SunRaysEffect` (`Intensity`, `Spread`), `DepthOfFieldEffect`, `ColorGradingEffect` (`TonemapperPreset`) |

Atmosphere rules from the docs: `Glare` needs `Haze > 0` to show; `Decay` needs `Haze` and `Glare > 0`. Low `Offset` can let the skybox show through distant terrain; high `Offset` makes distant objects too detailed. When an `Atmosphere` is present, the classic `FogStart`/`FogEnd` are not what controls distance haze; use `Atmosphere.Density`.

`Clouds` only render when parented under `Terrain`; their drift comes from `Workspace.GlobalWind`.

## 3. Preset data

Values are tuned starting points for each look, not official presets. Atmosphere `Density`/`Offset` run 0..1 and `Haze`/`Glare` use Studio's 0..10 slider range (as observed in Studio's Properties panel). Tune on a phone as well as a PC.

```lua
--!strict
-- ReplicatedStorage/Shared/LightingPresets.lua
local C = Color3.fromRGB

export type Preset = {
	lighting: { [string]: any },
	atmosphere: { [string]: any },
	cc: { [string]: any },      -- ColorCorrectionEffect
	bloom: { [string]: any },
	sunRays: { [string]: any },
	clouds: { [string]: any }?,
}

return {
	-- Bright, saturated, friendly. Simulators, tycoons, obbies.
	CozySimulator = {
		lighting = { ClockTime = 13.5, Brightness = 2.6, ExposureCompensation = 0.1,
			Ambient = C(90, 90, 100), OutdoorAmbient = C(140, 140, 150),
			ColorShift_Top = C(255, 245, 225), ColorShift_Bottom = C(0, 0, 0),
			EnvironmentDiffuseScale = 0.6, EnvironmentSpecularScale = 0.4, ShadowSoftness = 0.4 },
		atmosphere = { Density = 0.25, Offset = 0.15, Color = C(200, 220, 255), Decay = C(120, 150, 200), Glare = 0.2, Haze = 0.8 },
		cc = { Brightness = 0.02, Contrast = 0.08, Saturation = 0.15, TintColor = C(255, 252, 245) },
		bloom = { Intensity = 0.6, Size = 24, Threshold = 1.6 },
		sunRays = { Intensity = 0.04, Spread = 0.6 },
		clouds = { Cover = 0.55, Density = 0.4, Color = C(255, 255, 255) },
	},

	-- Cel-like contrast, punchy colour, strong bloom for VFX. Anime battlegrounds.
	AnimeAction = {
		lighting = { ClockTime = 15.5, Brightness = 3, ExposureCompensation = 0,
			Ambient = C(80, 70, 100), OutdoorAmbient = C(120, 110, 140),
			ColorShift_Top = C(255, 230, 210), ColorShift_Bottom = C(40, 30, 70),
			EnvironmentDiffuseScale = 0.4, EnvironmentSpecularScale = 0.3, ShadowSoftness = 0.15 },
		atmosphere = { Density = 0.3, Offset = 0.25, Color = C(210, 190, 230), Decay = C(140, 110, 170), Glare = 0.6, Haze = 1.2 },
		cc = { Brightness = 0, Contrast = 0.2, Saturation = 0.25, TintColor = C(255, 248, 255) },
		bloom = { Intensity = 1, Size = 32, Threshold = 1.2 },
		sunRays = { Intensity = 0.08, Spread = 0.8 },
	},

	-- Naturalistic daylight for open worlds. Realistic style, soft shadows.
	RealisticDay = {
		lighting = { ClockTime = 10.5, Brightness = 3.2, ExposureCompensation = -0.2,
			Ambient = C(40, 40, 45), OutdoorAmbient = C(110, 115, 125),
			ColorShift_Top = C(255, 240, 215), ColorShift_Bottom = C(0, 0, 0),
			EnvironmentDiffuseScale = 1, EnvironmentSpecularScale = 1, ShadowSoftness = 0.25 },
		atmosphere = { Density = 0.33, Offset = 0.2, Color = C(199, 199, 199), Decay = C(106, 112, 125), Glare = 0.3, Haze = 1.5 },
		cc = { Brightness = 0, Contrast = 0.05, Saturation = 0.02, TintColor = C(255, 255, 255) },
		bloom = { Intensity = 0.4, Size = 24, Threshold = 2 },
		sunRays = { Intensity = 0.06, Spread = 0.7 },
		clouds = { Cover = 0.6, Density = 0.55, Color = C(255, 255, 255) },
	},

	-- Golden hour: warm key light, long shadows, glare. Western, racing showcase, menus.
	GoldenHour = {
		lighting = { ClockTime = 17.6, Brightness = 2.4, ExposureCompensation = 0.1,
			Ambient = C(60, 45, 40), OutdoorAmbient = C(120, 95, 80),
			ColorShift_Top = C(255, 190, 130), ColorShift_Bottom = C(30, 30, 60),
			EnvironmentDiffuseScale = 0.8, EnvironmentSpecularScale = 0.8, ShadowSoftness = 0.3 },
		atmosphere = { Density = 0.38, Offset = 0.3, Color = C(255, 205, 160), Decay = C(150, 90, 70), Glare = 1.6, Haze = 2.2 },
		cc = { Brightness = 0.02, Contrast = 0.12, Saturation = 0.1, TintColor = C(255, 240, 225) },
		bloom = { Intensity = 0.7, Size = 30, Threshold = 1.5 },
		sunRays = { Intensity = 0.15, Spread = 1 },
	},

	-- Horror: dark but readable. Ambient never black; fog hides distance, not the floor.
	HorrorNight = {
		lighting = { ClockTime = 0.5, Brightness = 0.6, ExposureCompensation = -0.3,
			Ambient = C(25, 25, 32), OutdoorAmbient = C(45, 48, 60),
			ColorShift_Top = C(120, 140, 170), ColorShift_Bottom = C(0, 0, 0),
			EnvironmentDiffuseScale = 0.3, EnvironmentSpecularScale = 0.5, ShadowSoftness = 0.5 },
		atmosphere = { Density = 0.55, Offset = 0.05, Color = C(70, 78, 90), Decay = C(30, 32, 40), Glare = 0, Haze = 2.5 },
		cc = { Brightness = -0.03, Contrast = 0.18, Saturation = -0.35, TintColor = C(225, 235, 255) },
		bloom = { Intensity = 0.3, Size = 20, Threshold = 2.2 },
		sunRays = { Intensity = 0, Spread = 0 },
	},

	-- Neon city night: dark sky, coloured local lights carry the scene.
	NeonCity = {
		lighting = { ClockTime = 22, Brightness = 0.8, ExposureCompensation = 0.2,
			Ambient = C(30, 20, 45), OutdoorAmbient = C(55, 40, 80),
			ColorShift_Top = C(150, 120, 255), ColorShift_Bottom = C(20, 60, 90),
			EnvironmentDiffuseScale = 0.5, EnvironmentSpecularScale = 1, ShadowSoftness = 0.2 },
		atmosphere = { Density = 0.35, Offset = 0.1, Color = C(90, 60, 130), Decay = C(40, 20, 70), Glare = 0, Haze = 1.8 },
		cc = { Brightness = 0, Contrast = 0.15, Saturation = 0.3, TintColor = C(245, 235, 255) },
		bloom = { Intensity = 1.2, Size = 36, Threshold = 1 },
		sunRays = { Intensity = 0, Spread = 0 },
	},

	-- Competitive: even light, minimal haze, low post. Readability over mood.
	CompetitiveClear = {
		lighting = { ClockTime = 12, Brightness = 2.5, ExposureCompensation = 0,
			Ambient = C(100, 100, 105), OutdoorAmbient = C(130, 130, 135),
			ColorShift_Top = C(255, 250, 240), ColorShift_Bottom = C(0, 0, 0),
			EnvironmentDiffuseScale = 0.7, EnvironmentSpecularScale = 0.5, ShadowSoftness = 0.6 },
		atmosphere = { Density = 0.15, Offset = 0.1, Color = C(200, 210, 220), Decay = C(150, 160, 175), Glare = 0, Haze = 0.3 },
		cc = { Brightness = 0, Contrast = 0.05, Saturation = 0.05, TintColor = C(255, 255, 255) },
		bloom = { Intensity = 0.25, Size = 20, Threshold = 2.5 },
		sunRays = { Intensity = 0, Spread = 0 },
	},
} :: { [string]: Preset }
```

## 4. Applying and blending presets

```lua
--!strict
-- ReplicatedStorage/Shared/LightingDirector.lua (client or server; see section 5)
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local Presets = require(script.Parent.LightingPresets)

local Director = {}

local function ensure(className: string, parent: Instance): Instance
	local existing = parent:FindFirstChildOfClass(className)
	if existing then return existing end
	local inst = Instance.new(className)
	inst.Parent = parent
	return inst
end

local function tweenProps(inst: Instance, props: { [string]: any }, info: TweenInfo)
	-- TweenService handles numbers, Color3, Vector3, CFrame... ClockTime wraps at 24, see note below
	TweenService:Create(inst, info, props):Play()
end

function Director.apply(name: string, seconds: number?)
	local p = Presets[name]
	assert(p, "Unknown preset " .. name)
	local info = TweenInfo.new(seconds or 0, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)

	local lightingProps = table.clone(p.lighting)
	local clock = lightingProps.ClockTime
	lightingProps.ClockTime = nil
	tweenProps(Lighting, lightingProps, info)
	if clock then
		-- tween ClockTime the short way around midnight via a NumberValue
		local from = Lighting.ClockTime
		local delta = ((clock - from + 12) % 24) - 12
		local nv = Instance.new("NumberValue")
		nv.Value = from
		nv.Changed:Connect(function(v) Lighting.ClockTime = v % 24 end)
		local t = TweenService:Create(nv, info, { Value = from + delta })
		t.Completed:Once(function() nv:Destroy() end)
		t:Play()
	end

	tweenProps(ensure("Atmosphere", Lighting), p.atmosphere, info)
	tweenProps(ensure("ColorCorrectionEffect", Lighting), p.cc, info)
	tweenProps(ensure("BloomEffect", Lighting), p.bloom, info)
	tweenProps(ensure("SunRaysEffect", Lighting), p.sunRays, info)
	if p.clouds then
		tweenProps(ensure("Clouds", Workspace.Terrain), p.clouds, info)
	end
end

return Director
```

Set `LightingStyle` and `PrioritizeLightingQuality` once, in Studio, per place. They are scriptable in the reference, but switching lighting paths at runtime is not something to animate; treat them as project settings.

## 5. Server or client?

- **One global look for everyone:** set properties on the server (or in Studio). `Lighting` replicates.
- **Per-player looks** (indoor/outdoor zones, per-player time of day, cutscenes, menu screens): change `Lighting` on the **client**. Client changes are local only, which is exactly what you want for zone transitions. See [[Interior - Exterior Lighting Transitions]].
- Day-night and weather layered on top: [[Day-Night Cycle and Weather Transitions in Practice]].

## 6. Genre notes

- **Horror:** the trap is pure black. Keep `Ambient` around 20-30 per channel so silhouettes read, darken with `ColorCorrectionEffect` contrast and saturation, and let local lights (flashlight `SpotLight`) do the work. See [[Lighting too dark - overprocessed]] and [[Horror Starter Architecture]].
- **Anime:** bloom drives the look of Neon VFX; keep `Threshold` above 1 so only emissive things bloom, not white walls. More in [[Stylized and Anime Lighting]].
- **Realistic:** most of the realism is `EnvironmentDiffuseScale`/`EnvironmentSpecularScale` at 1 with PBR materials and a good skybox, not extra post-processing. See [[Environment Lighting — Stylized to Realistic]].
- **Competitive:** players must see enemies at any angle. Low haze, low contrast, no depth of field, no sun rays in eyes. Test silhouettes against every background.
- **Neon city:** the sun barely matters; many small coloured lights do. Budget local lights per area: each shadow-casting light costs, so turn `Shadows` off on most of them.

## 7. Performance and quality tiers

- Post effects are cheap individually but stack. `DepthOfFieldEffect` is the one to drop first on low-end devices.
- `PrioritizeLightingQuality = false` is the safer choice for huge open worlds where seeing far matters more than crisp shadows.
- Many shadow-casting local lights hurt more than any Lighting property. Count them.
- Profile with the MicroProfiler and on a real phone: [[Visual Scalability and Quality Tiers]].

## Common mistakes

- Following a 2022 tutorial and looking for "Future" in Technology (deprecated, non-scriptable).
- Tweening `ClockTime` from 23 to 1 the long way round (a 22-hour sweep through daytime).
- Pure black ambient in horror games (players quit, not scared).
- Bloom threshold below 1, making the whole scene glow.
- Atmosphere `Glare` set with `Haze = 0` (no visible effect) and assuming it is broken.
- `Clouds` parented under `Lighting` (they only render under `Terrain`).
- Per-player lighting changes done on the server (affects everyone).

## Checklist

- [ ] `LightingStyle` and `PrioritizeLightingQuality` chosen per place in Studio.
- [ ] One preset per mood in a data module; no scattered property edits.
- [ ] Director tweens Lighting, Atmosphere, post and Clouds together.
- [ ] `ClockTime` tweened the short way around midnight.
- [ ] Global looks on the server; zone/menu looks on the client.
- [ ] Horror/night presets checked for readability.
- [ ] Tested on low and high quality levels and on mobile.

---

**Related:** [[Lighting - Hub]] · [[Lighting, Atmosphere and Graphics]] · [[Environment Lighting — Stylized to Realistic]] · [[Post-Processing - Bloom, Color and DOF]] · [[Grounded Lighting Composition]] · [[Color Composition and Art Direction Across Styles]]

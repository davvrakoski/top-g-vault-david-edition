---
area: "11 VFX Lighting and Weather"
cluster: "Weather"
title: "Rain Splashes and Ripples - Raycast Sampling Around the Camera"
tags: [roblox, community-knowledge, weather, rain, splashes, raycasting]
cssclasses: [tg-a11]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/workspace/raycasting
  - https://create.roblox.com/docs/reference/engine/datatypes/RaycastParams
  - https://create.roblox.com/docs/reference/engine/classes/ParticleEmitter
  - https://create.roblox.com/docs/effects/particle-emitters
---
# Rain Splashes and Ripples - Raycast Sampling Around the Camera

Falling rain alone looks like a screen filter. What makes it feel like rain is the **ground reacting**: small splashes on pavement, rings on puddles and water, drips off roofs, and no splashes under cover. You can't simulate every drop, but you can fake impacts by raycasting a few random points around the camera each frame and playing a tiny splash where they land. Players only notice splashes close to them, so 20-60 per second near the camera is enough.

## How it works

1. Every frame (or every other frame), pick N random points in a ring around the camera (for example 3-30 studs away).
2. Raycast **down** from high above each point (for example 80 studs up, 150 studs long) with a filter that ignores characters, rain parts and VFX.
3. If the ray hits something and nothing is above it (the hit is the first surface from the sky), that point is **outdoors and exposed**: play a splash there.
4. Choose the effect by `result.Material`: splash on hard ground, ring on water, nothing on grass (or a softer mist).

Because the ray starts in the sky, roofs automatically block it: no splashes indoors, for free.

## Code sketch (client)

```lua
local RunService = game:GetService("RunService")
local camera = workspace.CurrentCamera

local params = RaycastParams.new()
params.FilterType = Enum.RaycastFilterType.Exclude
params.FilterDescendantsInstances = { workspace.VFX, workspace.Characters } -- your folders
params.IgnoreWater = false

local splashAtt = Instance.new("Attachment")
splashAtt.Parent = workspace.Terrain
local splash = script.Splash:Clone() -- ParticleEmitter, Rate 0
splash.Parent = splashAtt
local ring = script.Ring:Clone()
ring.Parent = splashAtt

local SAMPLES_PER_FRAME = 2 -- scale with quality and rain intensity
local HARD = { [Enum.Material.Concrete] = true, [Enum.Material.Asphalt] = true,
	[Enum.Material.Brick] = true, [Enum.Material.Slate] = true, [Enum.Material.Metal] = true,
	[Enum.Material.Wood] = true, [Enum.Material.WoodPlanks] = true, [Enum.Material.Plastic] = true }

RunService.Heartbeat:Connect(function()
	if workspace:GetAttribute("RainIntensity") == 0 then return end
	local camPos = camera.CFrame.Position
	for _ = 1, SAMPLES_PER_FRAME do
		local angle = math.random() * math.pi * 2
		local r = 3 + math.random() * 27
		local origin = camPos + Vector3.new(math.cos(angle) * r, 80, math.sin(angle) * r)
		local result = workspace:Raycast(origin, Vector3.new(0, -150, 0), params)
		if result then
			splashAtt.WorldPosition = result.Position + result.Normal * 0.05
			if result.Material == Enum.Material.Water then
				ring:Emit(1)
			elseif HARD[result.Material] then
				splash:Emit(2)
			end
		end
	end
end)
```

One attachment is moved and emitted from repeatedly; already-emitted particles stay in world space where they spawned as long as `LockedToPart` is false, so a single emitter can serve every splash. If you see particles jump with the attachment, pool a few attachments instead.

## Effect settings

**Splash (hard ground)**
- Tiny upward burst: `Size` 0.1-0.2, `Speed` 3-6, `SpreadAngle` (40, 40), `Acceleration` (0, -40, 0), `Lifetime` 0.15-0.25, `Transparency` 0.3 -> 1, white-blue, `LightInfluence` 1.

**Ring (water and puddles)**
- Flat expanding ring: `Orientation = VelocityPerpendicular` with an upward emission direction so it lies flat, `Speed` small (about 0.01) so it has a direction, `Size` 0.2 -> 1.2, `Lifetime` 0.4-0.6, `Transparency` 0.4 -> 1, ring texture. Check orientation in Studio; flat-lying particles need the right `EmissionDirection`.

## Scaling with intensity

- Tie `SAMPLES_PER_FRAME` to rain intensity (0-4) and device quality (half on mobile).
- Light drizzle: rings on water only. Heavy storm: splashes everywhere plus a thin ground mist emitter around the camera.
- Raycasts are cheap but not free; 2-6 per frame is a safe range for most games.

## Extra details that sell it

- **Drips:** under roof edges, place static drip emitters (authored, not raycast) that only enable while raining.
- **Wet look:** during and after rain, raise reflectance-like shine by swapping to a wet `MaterialVariant` on key ground parts, or darken ground colour slightly; dry off over a minute after rain stops. (Material variant swaps on many parts are a build-time choice; test cost.)
- **Sound:** layer close rain hits (from the same samples, rate-limited) on top of the rain bed; tin roofs over the player get a louder patter when the raycast up from the camera hits a Metal part.

## Related
[[Weather - Hub]] · [[Rain Production System]] · [[Day-Night Cycle and Weather Transitions in Practice]] · [[Weather Quality Tiers Lab]] · [[Impact Decals - Bullet Holes, Scorch Marks and Pooling]]

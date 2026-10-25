---
area: "40 Community Resources"
cluster: "Maps Worlds and Level Design"
source_note: "community/maps-level-design/biome-zone-detection"
title: "Biome Zone Detection for Lighting and Ambience Swaps"
tags: [roblox, community, biomes, lighting, atmosphere, luau, "cluster/maps-worlds-and-level-design"]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/environment/atmosphere
  - https://create.roblox.com/docs/reference/engine/classes/Lighting
  - https://create.roblox.com/docs/workspace/streaming
  - https://devforum.roblox.com/t/ruskis-tutorial-5-how-to-design-an-open-world-map/3554962
---
# Biome Zone Detection for Lighting and Ambience Swaps

A desert that has the same sky, fog and sound as the forest next to it looks like a recoloured forest. Changing `Lighting`, `Atmosphere` and ambient sound per biome is one of the cheapest ways to make districts feel distinct (Ruski's open-world tutorial recommends distinct palettes and moods per location). The presets and the blending code already exist in [[Lighting Presets by Genre - LightingStyle, Atmosphere and Post]]. This note adds the missing part: knowing **which biome the player is in**, reliably, with streaming on.

## The zone trick that survives streaming
Put biome zones as plain parts in **ReplicatedStorage**, not in Workspace:
- ReplicatedStorage is fully replicated and never streamed out, so every client always has every zone.
- Parts there are never rendered or simulated, so they cost nothing visually.
- A part's `CFrame` and `Size` work for maths wherever it is parented.

Each zone part gets two attributes:
- `Biome` (string): the preset name, e.g. `Desert`.
- `Priority` (number): higher wins where zones overlap (a cave inside a mountain biome, an oasis inside a desert).

Lighting changes made on the client affect only that player, which is exactly right for zones (the presets note explains server vs client).

## Client script (original)
```lua
-- StarterPlayerScripts/BiomeZones.client.lua
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local TweenService = game:GetService("TweenService")

-- LightingDirector + LightingPresets come from the Lighting Presets by Genre note.
local Director = require(ReplicatedStorage:WaitForChild("Shared"):WaitForChild("LightingDirector"))
local ZONES = ReplicatedStorage:WaitForChild("BiomeZones")

local DEFAULT_BIOME = "RealisticDay"
local CONFIRM_SECONDS = 0.5 -- must stay in a new biome this long before switching (stops flicker at borders)
local BLEND_SECONDS = 3
local player = Players.LocalPlayer

local function inside(part: BasePart, point: Vector3): boolean
	local p = part.CFrame:PointToObjectSpace(point)
	local h = part.Size / 2
	return math.abs(p.X) <= h.X and math.abs(p.Y) <= h.Y and math.abs(p.Z) <= h.Z
end

local function biomeAt(point: Vector3): string
	local best, bestPriority = DEFAULT_BIOME, -math.huge
	for _, zone in ZONES:GetChildren() do
		if zone:IsA("BasePart") and inside(zone, point) then
			local priority = zone:GetAttribute("Priority") or 0
			if priority > bestPriority then
				best, bestPriority = zone:GetAttribute("Biome") or DEFAULT_BIOME, priority
			end
		end
	end
	return best
end

local function setAmbience(biome: string)
	-- SoundService.Ambience holds one looping Sound per biome, named like the biome.
	local folder = SoundService:FindFirstChild("Ambience")
	if not folder then return end
	for _, sound in folder:GetChildren() do
		if sound:IsA("Sound") then
			local target = if sound.Name == biome then (sound:GetAttribute("Volume") or 0.3) else 0
			if target > 0 and not sound.IsPlaying then
				sound.Volume = 0
				sound.Looped = true
				sound:Play()
			end
			TweenService:Create(sound, TweenInfo.new(BLEND_SECONDS), { Volume = target }):Play()
		end
	end
end

local current: string? = nil
local candidate: string? = nil
local candidateTime, elapsed = 0, 0

RunService.Heartbeat:Connect(function(dt)
	elapsed += dt
	if elapsed < 0.25 then return end
	local step = elapsed
	elapsed = 0

	local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	local point = if root then root.Position else workspace.CurrentCamera.CFrame.Position
	local biome = biomeAt(point)

	if biome == current then
		candidate = nil
		return
	end
	if biome ~= candidate then
		candidate, candidateTime = biome, 0
	end
	candidateTime += step
	if candidateTime >= CONFIRM_SECONDS then
		current, candidate = biome, nil
		Director.apply(biome, BLEND_SECONDS)
		setAmbience(biome)
	end
end)
```

Add biome entries (Desert, Swamp, Snow, Cave...) to the `LightingPresets` table in the same format as the genre presets.

## Tuning directions per biome
Starting directions, not official values; tune on a phone and a PC:

| Biome | Atmosphere | Lighting / post | Sound |
|---|---|---|---|
| Desert | Low density, high haze, warm colour and decay | Bright; slight warm tint; some glare | Wind, sparse |
| Forest | Medium density, green-grey colour | Slightly lower brightness; greener outdoor ambient | Birds, leaves |
| Snow | Low-medium density, cool colour | Lower exposure (snow blows out), cool tint, little glare | Wind, muffled |
| Swamp | High density, low offset (fog close), sickly yellow-green decay | Desaturated | Insects, water |
| Cave | Low density (it's "indoors") | Ambient low but **not black**, local lights carry the scene | Drips, echo |
| Volcanic | Red-orange decay, high haze | Bloom up for lava glow; warm tint | Rumble |

Rules:
- **Keep readability first.** A biome look that hides enemies or paths is a bug (see [[Lighting too dark - overprocessed]]).
- **Blend over 2-4 seconds.** Instant swaps feel like a glitch; very slow blends feel laggy.
- **Make zone borders follow the art** (a ridge, a tree line, a cave mouth) so the change has a visible reason.
- Weather and time of day layer on top: [[Day-Night Cycle and Weather Transitions in Practice]].

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Maps Worlds and Level Design - Hub]]

**Related notes:** [[Lighting Presets by Genre - LightingStyle, Atmosphere and Post]] · [[Terrain and Biome Production]] · [[Audio Zones, Occlusion and Mixing]] · [[Open World Layout - POIs, Triangle Rule and Travel Time]]

<!-- TDOD_GRAPH_END -->

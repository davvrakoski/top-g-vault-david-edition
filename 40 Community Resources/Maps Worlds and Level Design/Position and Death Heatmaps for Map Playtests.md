---
area: "40 Community Resources"
cluster: "Maps Worlds and Level Design"
source_note: "community/maps-level-design/position-death-heatmaps"
title: "Position and Death Heatmaps for Map Playtests"
tags: [roblox, community, playtesting, heatmap, analytics, luau, "cluster/maps-worlds-and-level-design"]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/player-heatmap-module/3961813
  - https://book.leveldesignbook.com/process/blockout/playtesting
  - https://create.roblox.com/docs/cloud-services/data-stores
  - https://create.roblox.com/docs/reference/engine/classes/GlobalDataStore#UpdateAsync
---
# Position and Death Heatmaps for Map Playtests

Watching testers tells you *why* they struggle; heatmaps tell you *where*, across hundreds of sessions. The Level Design Book's playtesting chapter recommends telemetry and heatmaps of where players move, die or score, then looking for unexpected clumps. Roblox has no built-in map heatmap; Adrenilane's *Player heatmap module* on the DevForum (2025) fills the gap by sampling player positions into a grid every 5 seconds, saving every 60 seconds to a DataStore, and drawing 3D bars in Studio. No license is stated, so this note gives an original implementation of the same idea, plus death heatmaps.

## What to record
| Map | Tells you |
|---|---|
| **Presence** (where players are, sampled every few seconds) | Dead zones nobody visits; places people stand around (good or confusing?) |
| **Deaths** (where players die) | Unfair spots, spawn camping, obby stages that are too hard |
| **Kills from** (where the killer stood) | Camping spots and sightlines that are too strong |

Aggregate counts per grid cell only. Don't store UserIds with positions; you don't need them.

## Server collector (original)
```lua
-- ServerScriptService/HeatmapCollector.server.lua
local DataStoreService = game:GetService("DataStoreService")
local Players = game:GetService("Players")

local MAP_VERSION = "arena_v3"  -- change when the layout changes, or old data misleads you
local CELL = 16                  -- studs per cell
local SAMPLE_EVERY = 5           -- seconds
local SAVE_EVERY = 120           -- seconds

local store = DataStoreService:GetDataStore("Heatmaps")
local pending = { presence = {}, deaths = {} } :: { [string]: { [string]: number } }

local function cellKey(p: Vector3): string
	return math.floor(p.X / CELL) .. "," .. math.floor(p.Z / CELL)
end

local function add(layer: string, p: Vector3)
	local t = pending[layer]
	local k = cellKey(p)
	t[k] = (t[k] or 0) + 1
end

Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
		local humanoid = character:WaitForChild("Humanoid") :: Humanoid
		humanoid.Died:Once(function()
			local root = character:FindFirstChild("HumanoidRootPart")
			if root then add("deaths", root.Position) end
		end)
	end)
end)

local function flush()
	for layer, cells in pending do
		if next(cells) ~= nil then
			pending[layer] = {}
			local ok, err = pcall(function()
				store:UpdateAsync(MAP_VERSION .. "/" .. layer, function(old)
					old = old or {}
					for k, n in cells do old[k] = (old[k] or 0) + n end
					return old
				end)
			end)
			if not ok then
				warn("Heatmap save failed:", err)
				for k, n in cells do -- put the counts back for the next try
					pending[layer][k] = (pending[layer][k] or 0) + n
				end
			end
		end
	end
end

task.spawn(function()
	local sinceSave = 0
	while true do
		task.wait(SAMPLE_EVERY)
		for _, player in Players:GetPlayers() do
			local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
			if root then add("presence", root.Position) end
		end
		sinceSave += SAMPLE_EVERY
		if sinceSave >= SAVE_EVERY then
			sinceSave = 0
			flush()
		end
	end
end)

game:BindToClose(flush)
```

Size check: a 2,048 x 2,048-stud map at 16-stud cells is at most 16,384 cells, comfortably inside a single DataStore value. Use bigger cells or split by zone for larger worlds.

## Studio visualizer (command bar, original)
Enable **Game Settings > Security > Enable Studio Access to API Services**, then:

```lua
-- Command bar: draw a heatmap layer as coloured tiles (not saved with the place)
local DataStoreService = game:GetService("DataStoreService")
local LAYER, MAP_VERSION, CELL, Y = "deaths", "arena_v3", 16, 2

local data = DataStoreService:GetDataStore("Heatmaps"):GetAsync(MAP_VERSION .. "/" .. LAYER) or {}
local maxCount = 1
for _, n in data do maxCount = math.max(maxCount, n) end

local old = workspace:FindFirstChild("HeatmapViz")
if old then old:Destroy() end
local folder = Instance.new("Folder")
folder.Name = "HeatmapViz"
folder.Archivable = false
folder.Parent = workspace

for key, n in data do
	local cx, cz = string.match(key, "^(-?%d+),(-?%d+)$")
	if cx then
		local t = n / maxCount
		local tile = Instance.new("Part")
		tile.Anchored, tile.CanCollide, tile.CanQuery, tile.CanTouch = true, false, false, false
		tile.Material = Enum.Material.Neon
		tile.Transparency = 0.35
		tile.Color = Color3.fromHSV((1 - t) * 0.66, 1, 1) -- blue (few) to red (many)
		local height = 0.5 + t * 20
		tile.Size = Vector3.new(CELL - 1, height, CELL - 1)
		tile.Position = Vector3.new((tonumber(cx) + 0.5) * CELL, Y + height / 2, (tonumber(cz) + 0.5) * CELL)
		tile.Parent = folder
	end
end
print("Drew", #folder:GetChildren(), "cells; max count", maxCount)
```

Set `Y` near your floor height, or raycast down per cell for multi-level maps.

## Reading the maps
- **Presence hot spot with no reason** (no shop, no objective): players are lost or stuck. Walk there yourself.
- **Death cluster at one spot**: unfair jump, hidden hazard or a camping spot. Compare with the kills-from layer.
- **Cold zones**: content nobody finds. Add a landmark or path to it, or cut it.
- Always compare **before and after** a layout change, with a new `MAP_VERSION`.
- Pair with step funnels to see where players *quit*: [[Zone and Stage Funnels with AnalyticsService]].

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Maps Worlds and Level Design - Hub]]

**Related notes:** [[Playtest Scripts and Session Facilitation]] · [[Analytics Instrumentation Plan]] · [[DataStore Production Patterns]] · [[Sightlines, Cover and Chokepoints for PvP Maps]]

<!-- TDOD_GRAPH_END -->

---
area: "40 Community Resources"
cluster: "Maps Worlds and Level Design"
source_note: "community/maps-level-design/zone-stage-funnels"
title: "Zone and Stage Funnels with AnalyticsService"
tags: [roblox, community, analytics, funnels, level-design, luau, "cluster/maps-worlds-and-level-design"]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/production/analytics/funnel-events
  - https://create.roblox.com/docs/production/analytics/custom-events
  - https://create.roblox.com/docs/production/analytics/custom-fields
  - https://create.roblox.com/docs/reference/engine/classes/AnalyticsService
---
# Zone and Stage Funnels with AnalyticsService

Heatmaps show where players are. A **funnel** shows how many of them reach each part of your map, and where they give up. Roblox's built-in Analytics dashboard draws funnels for you if you log the right events. This note applies the generic setup in [[Analytics Custom Events, Funnels and Dashboards Setup]] to maps: zones in an open world, stages in an obby, rooms in a dungeon.

## What Roblox's docs say (2026-10-25)
- `AnalyticsService:LogFunnelStepEvent(player, funnelName, funnelSessionId, step, stepName, customFields)` logs a step. The dashboard has tabs for **up to ten funnels**.
- **One-time funnels** (things a user does once, like reaching a zone for the first time) **don't need a `funnelSessionId`**. Recurring funnels (each run of a dungeon, each shop visit) use one, such as a GUID; Analytics keeps only the **10 most recent** session IDs per user per funnel.
- A user's saved step **expires after 180 days** without events.
- **Custom fields:** up to three per event (`CustomField01`-`03`), values must be **strings**, and there can be up to **8,000 unique combinations** across the three.
- The progression methods (`LogProgressionStartEvent`, `LogProgressionFailEvent`, ...) exist, but all four reference pages say these events don't currently display in any Roblox-provided chart, so funnels are the better choice for map progress today.

## Design the funnel
- **Steps in the order players should reach them.** Zone 1 Spawn, 2 Village, 3 Forest, 4 Cave, 5 Boss.
- **Group big step counts.** An obby with 200 stages makes an unreadable funnel; log every 5th or 10th stage as a step and put the exact stage in a custom field elsewhere.
- **One funnel per map or mode**, not per zone. You only have ten tabs.
- **Same names as the map** (see [[Wayfinding with Landmarks and Weenies]]).

## Original script: first-time zone reach + deaths per zone
Zones are invisible parts in `workspace.MapZones` with attributes `ZoneStep` (number) and `ZoneName` (string). The server checks positions, so it works with streaming (the server has the whole map).

```lua
-- ServerScriptService/ZoneFunnel.server.lua
local AnalyticsService = game:GetService("AnalyticsService")
local Players = game:GetService("Players")

local FUNNEL = "MainMapZones"
local zones = {}
for _, part in workspace:WaitForChild("MapZones"):GetChildren() do
	if part:IsA("BasePart") and typeof(part:GetAttribute("ZoneStep")) == "number" then
		table.insert(zones, part)
	end
end
table.sort(zones, function(a, b) return a:GetAttribute("ZoneStep") < b:GetAttribute("ZoneStep") end)

local function zoneAt(position: Vector3): BasePart?
	for _, part in zones do
		local p = part.CFrame:PointToObjectSpace(position)
		local h = part.Size / 2
		if math.abs(p.X) <= h.X and math.abs(p.Y) <= h.Y and math.abs(p.Z) <= h.Z then
			return part
		end
	end
	return nil
end

local reached: { [Player]: { [number]: boolean } } = {}

local function zoneName(part: BasePart): string
	return part:GetAttribute("ZoneName") or part.Name
end

Players.PlayerAdded:Connect(function(player)
	-- Load the player's already-reached steps from your save data here, so returning
	-- players don't log zone 1 again every session.
	reached[player] = {}
	player.CharacterAdded:Connect(function(character)
		local humanoid = character:WaitForChild("Humanoid") :: Humanoid
		humanoid.Died:Once(function()
			local root = character:FindFirstChild("HumanoidRootPart")
			local zone = root and zoneAt(root.Position)
			AnalyticsService:LogCustomEvent(player, "DeathInZone", 1, {
				[Enum.AnalyticsCustomFieldKeys.CustomField01.Name] = zone and zoneName(zone) or "None",
			})
		end)
	end)
end)
Players.PlayerRemoving:Connect(function(player) reached[player] = nil end)

while true do
	task.wait(1)
	for _, player in Players:GetPlayers() do
		local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
		local done = reached[player]
		local zone = root and done and zoneAt(root.Position)
		if zone then
			local step = zone:GetAttribute("ZoneStep")
			if not done[step] then
				done[step] = true
				AnalyticsService:LogFunnelStepEvent(player, FUNNEL, nil, step, zoneName(zone))
			end
		end
	end
end
```

Notes:
- `funnelSessionId` is `nil` because "reached this zone" is a one-time funnel. For a dungeon run, generate one ID per run with `HttpService:GenerateGUID()` and pass it on every step.
- Log a step **after** the player reaches it, consistently, as the docs advise.
- Players can skip zones (open worlds). The funnel still works; skipped steps just show fewer users.
- `DeathInZone` uses one custom field with zone names, well under the 8,000-combination limit.

## Reading it
- **A big drop between two steps** = the route between them is the problem: too long, unclear, too hard, or boring. Check the heatmap for that stretch ([[Position and Death Heatmaps for Map Playtests]]).
- **Deaths concentrated in one zone** with a drop after it = a difficulty wall.
- Compare funnels **before and after** map updates, and by platform (phone players often drop where controls get hard).

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Maps Worlds and Level Design - Hub]]

**Related notes:** [[Analytics Custom Events, Funnels and Dashboards Setup]] · [[Funnel events]] · [[Custom fields]] · [[Obby Stage Design - Difficulty Ramp, Checkpoints and Readable Hazards]]

<!-- TDOD_GRAPH_END -->

---
area: "40 Community Resources"
cluster: "Maps Worlds and Level Design"
source_note: "community/maps-level-design/obby-stage-design"
title: "Obby Stage Design - Difficulty Ramp, Checkpoints and Readable Hazards"
tags: [roblox, community, level-design, obby, checkpoints, luau, "cluster/maps-worlds-and-level-design"]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/how-to-refine-your-obby-game/862904
  - https://book.leveldesignbook.com/process/preproduction/pacing
  - https://create.roblox.com/docs/reference/engine/classes/SpawnLocation
  - https://create.roblox.com/docs/reference/engine/classes/Player#RespawnLocation
---
# Obby Stage Design - Difficulty Ramp, Checkpoints and Readable Hazards

Obbies look simple, so the competition is huge and players quit fast. What separates a good one is the stage design: a fair difficulty ramp, hazards you can read at a glance, and checkpoints that never cost more than one stage of progress.

## Community checklist (sydmisst, DevForum, 2020)
The tutorial *How to refine your "Obby" game!* lists ten tips. The map-relevant ones:
- **Play-test every stage after building it**: building in Studio feels different from playing, and some stages turn out impossible.
- **Make kill blocks obvious** (the author suggests Neon) so players know what hurts.
- **Theme your stages** as rooms and places (a school, a factory) instead of floating parts in the sky.
- **Keep UI out of the bottom-left** on mobile, where the thumbstick is.
- **Turn off shadows** if your players are mostly on low-end devices (`CastShadow = false` on obby parts is the per-part version).
- **Checkpoints and saved progress** so players can come back later.
Replies in the thread disagree with some of the monetisation tips (paid power-ups feel pay-to-win), so treat those as opinions.

## Difficulty: a sawtooth, not a straight line
The Level Design Book's pacing chapter (summarized, CC BY-NC-SA) gives two tools that fit obbies well:
- **Alternate highs and lows.** Follow a hard stage with an easier "rest" stage. Constant difficulty causes fatigue and quits.
- **Teach, test, twist.** Introduce a new obstacle in a safe form, repeat it with less help, then vary it. For example: a moving platform over a floor (teach), over a kill floor (test), then two platforms moving out of sync (twist).

Practical ramp:
| Stage band | Goal |
|---|---|
| First 5 stages | Nearly impossible to fail: teach movement and jumping, reward fast |
| Each new obstacle type | Teach-test-twist across 3 stages |
| Every ~10 stages | A rest or "showcase" stage and a reward (badge, cosmetic, coins) |
| Late stages | Combine learned obstacles; avoid brand-new mechanics at the end |

Use real numbers for jumps: default jump reach on flat ground is roughly 8-9 studs; keep normal gaps around 6-7 (see the metrics gym in [[Map Blockout to Art Pass Workflow]]).

## Readable hazards
- One hazard language for the whole game: e.g. red Neon = kills, orange = pushes, blue = slippery. Never reuse the kill colour on safe parts.
- No invisible kill parts and no hazards hidden behind the camera.
- Show the next platform from the current one. If players must jump blind, add a marker.
- Moving hazards need a readable rhythm; test on a phone at 30 FPS, not just a PC.

## Checkpoint script (stage number + RespawnLocation)
Put Neutral `SpawnLocation`s in a `Checkpoints` folder, each with a number attribute `Stage` (1, 2, 3...). `RespawnLocation` works with neutral spawns, so no Teams are needed.

```lua
-- ServerScriptService/ObbyCheckpoints.server.lua
local Players = game:GetService("Players")

local MAX_SKIP = 1 -- 1 = players must touch checkpoints in order
local folder = workspace:WaitForChild("Checkpoints")
local byStage: { [number]: SpawnLocation } = {}

local function setStage(player: Player, stage: number)
	local cp = byStage[stage]
	if not cp then return end
	player:SetAttribute("Stage", stage)
	player.RespawnLocation = cp
end

for _, cp in folder:GetChildren() do
	local stage = cp:GetAttribute("Stage")
	if cp:IsA("SpawnLocation") and typeof(stage) == "number" then
		cp.Neutral = true
		byStage[stage] = cp
		cp.Touched:Connect(function(hit)
			local character = hit.Parent
			local player = character and Players:GetPlayerFromCharacter(character)
			local humanoid = character and character:FindFirstChildOfClass("Humanoid")
			if not player or not humanoid or humanoid.Health <= 0 then return end
			local current = player:GetAttribute("Stage") or 1
			if stage > current and stage <= current + MAX_SKIP then
				setStage(player, stage)
			end
		end)
	end
end

Players.PlayerAdded:Connect(function(player)
	-- Replace 1 with the stage loaded from your save system.
	local saved = 1
	setStage(player, saved)
	player.CharacterAdded:Connect(function(character)
		-- Covers the first spawn if it happened before the saved stage was applied.
		local cp = byStage[player:GetAttribute("Stage") or 1]
		if cp then
			character:PivotTo(cp.CFrame + Vector3.new(0, 4, 0))
		end
	end)
end)
```

Save `player:GetAttribute("Stage")` with your data system (see [[DataStore Production Patterns]]). Log stage reach to analytics to find the stage where players quit: [[Zone and Stage Funnels with AnalyticsService]] and [[Position and Death Heatmaps for Map Playtests]].

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Maps Worlds and Level Design - Hub]]

**Related notes:** [[Obby Platformer Starter Architecture]] · [[Flopped Launch Teardown - Elevation Obby Case]] · [[Session Time and D1 Rescue - Tag Obby Teardown]] · [[Spawn Area Design - SpawnLocation Rules, Protection and Exits]]

<!-- TDOD_GRAPH_END -->

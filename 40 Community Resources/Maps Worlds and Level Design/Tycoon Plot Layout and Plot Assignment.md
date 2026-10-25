---
area: "40 Community Resources"
cluster: "Maps Worlds and Level Design"
source_note: "community/maps-level-design/tycoon-plot-layout"
title: "Tycoon Plot Layout and Plot Assignment"
tags: [roblox, community, level-design, tycoon, plots, luau, "cluster/maps-worlds-and-level-design"]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/open-source-plotservice/981713
  - https://devforum.roblox.com/t/how-to-make-plot-system/1997460
  - https://devforum.roblox.com/t/help-system-of-plot/1167672
  - https://create.roblox.com/docs/reference/engine/classes/PVInstance#PivotTo
  - https://create.roblox.com/docs/workspace/streaming
---
# Tycoon Plot Layout and Plot Assignment

Tycoons, simulators with bases, and farming games all share one map problem: every player needs their own plot, the plots must look fair, and the space between them must stay fun. This note covers the layout and an original server script for assigning plots.

## Layout patterns
| Pattern | How it looks | Good for |
|---|---|---|
| **Row** | Plots side by side along a road | Small servers (4-6), easy to read |
| **Ring around a hub** | Plots in a circle around a central plaza or shop | Social tycoons, a shared event in the middle |
| **Grid with streets** | 2 x 3 or 3 x 3 blocks | Bigger servers, city themes |
| **Islands** | Each plot on its own island linked by bridges | Strong ownership feel, natural boundaries |

Rules that apply to all of them:
- **One plot per server slot**, identical in size and shape, so nobody gets the "bad" plot. Build one plot as a Model, then copy it.
- **Same orientation relative to the centre**: each plot's entrance faces the hub, so every player's view is equivalent. The 180-degree copy trick in [[Arena Map Typologies - Bowl, Figure 8, Hub and Three Lane]] works for two-plot pairs.
- **Buttons along a loop.** Place purchase buttons so the player walks a short loop past the dropper/conveyor line and back to the collector, not a long dead-end corridor.
- **Leave room to grow.** Plan the fully upgraded footprint first, then remove pieces to get the starting state. Upgrades that spill outside the plot cause overlap bugs.
- **Neighbours visible, not reachable.** Seeing other players' bigger bases is motivation; walking into them causes griefing. Use a low fence, a gap or a collision group (see [[Map Boundaries, Kill Planes and Out-of-Bounds Handling]]).
- **Streaming:** plots far from the player stream out. A plot that must react to the owner's purchases from far away should keep its state on the server and rebuild visuals when it streams in (see [[StreamingEnabled Gotchas and Streaming-Safe Client Code]]).

## Assignment patterns from the DevForum
Threads on plot systems converge on the same design: a folder of plots, ownership stored on each plot (a value or attribute with the owner's UserId), claim on join, free on leave, and **the server decides**. One reply stresses that a claim must only succeed if the plot is still free when the server checks it. ItzPlanes' open-source *PlotService* module (2021) wraps this with `Occupy`/`UnOccupy`, allow and blacklist lists, and helpers like `GetPlotByPlayer`; no license is stated, so link it rather than copy it.

## Original script: claim on join, free on leave
Plots are Models in `workspace.Plots`, each with a part named `Spawn`.

```lua
-- ServerScriptService/PlotAssigner.server.lua
local Players = game:GetService("Players")

local plotsFolder = workspace:WaitForChild("Plots")
local plotOf: { [Player]: Model } = {}

local function freePlots(): { Model }
	local list = {}
	for _, plot in plotsFolder:GetChildren() do
		if plot:IsA("Model") and plot:GetAttribute("OwnerUserId") == nil then
			table.insert(list, plot)
		end
	end
	table.sort(list, function(a, b) return a.Name < b.Name end) -- stable order: fill Plot1, Plot2...
	return list
end

local function sendHome(player: Player)
	local plot = plotOf[player]
	local character = player.Character
	local spawnPart = plot and plot:FindFirstChild("Spawn")
	if character and spawnPart and spawnPart:IsA("BasePart") then
		character:PivotTo(spawnPart.CFrame + Vector3.new(0, 4, 0))
	end
end

local function claim(player: Player): Model?
	local plot = freePlots()[1]
	if not plot then
		warn("No free plot for", player.Name)
		return nil
	end
	plot:SetAttribute("OwnerUserId", player.UserId) -- single server thread: no race between check and set
	plotOf[player] = plot
	return plot
end

local function release(player: Player)
	local plot = plotOf[player]
	if not plot then return end
	plotOf[player] = nil
	-- Reset purchased items here before freeing, so the next owner gets a clean plot.
	plot:SetAttribute("OwnerUserId", nil)
end

Players.PlayerAdded:Connect(function(player)
	if claim(player) then
		player.CharacterAdded:Connect(function()
			task.defer(sendHome, player)
		end)
		if player.Character then sendHome(player) end
	end
end)

Players.PlayerRemoving:Connect(release)
```

Notes:
- Set `Players.MaxPlayers` (in Game Settings) to the number of plots, so there is always a free one.
- Clients read `OwnerUserId` to show name signs; they never set it.
- Rebuild the saved base after `claim` from your data system, not before.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Maps Worlds and Level Design - Hub]]

**Related notes:** [[Simulator Tycoon Starter Architecture]] · [[Tycoon Starters - Factorial Defense and Industry Tycoon (MIT)]] · [[Grid Placement System - Community Blueprint]] · [[Plant Reference Project - Official Farming Microgame]]

<!-- TDOD_GRAPH_END -->

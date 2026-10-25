---
area: "40 Community Resources"
cluster: "Reddit Scripting and Systems"
source_note: "community/reddit-scripting/melee-hitbox-modules"
title: "Melee Hitbox Modules - RaycastHitbox to ShapecastHitbox"
tags: [roblox, community, reddit, "cluster/reddit-scripting-and-systems"]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/raycast-hitbox-401-for-all-your-melee-needs/374482
  - https://devforum.roblox.com/t/shapecasthitbox-for-all-your-melee-needs-v025/3624241
  - https://devforum.roblox.com/t/how-do-i-make-touched-not-activate-wayyyyy-before-it-actually-touches-smth/4699525
cssclasses: [tg-a40]
---

# Melee Hitbox Modules - RaycastHitbox to ShapecastHitbox

**RaycastHitbox** (TeamSwordphin) was the default melee answer for years: 3,300+ likes and 330k+ views. Its thread now marks it **no longer supported** and points to the successor, **ShapecastHitbox** (released Apr 2025).

## What changed

- RaycastHitbox casts rays from attachment points ("DmgPoints") along the weapon between frames. It still works but has known bugs and performance issues nobody is fixing.
- ShapecastHitbox adds **blockcasts and spherecasts** alongside rays, better performance with many hitboxes, a simpler API, typechecking, and hitboxes that are **decoupled from instances/humanoids** so you can reuse them.
- One reply (@no_l00p) captures the old pain: hand-editing hundreds of DmgPoint attachments.

## Why not .Touched for swords?

The 2026 "Touched fires way before it touches" thread lists the alternatives people should use instead: `GetPartBoundsInBox`, `GetPartBoundsInRadius`, `GetPartsInPart`, `Raycast`, `Shapecast`, `Spherecast`, run on a RunService event during the swing. Touched is unreliable for fast-moving parts, and network travel time still applies even on the server (@ChiDj123).

## Own swing-window sketch with a blockcast

```lua
local RunService = game:GetService("RunService")

-- Sweeps a box along the blade between frames during the swing window.
local function runSwing(blade: BasePart, duration: number, params: RaycastParams, onHit: (Model) -> ())
	local alreadyHit: {[Model]: boolean} = {}
	local lastCFrame = blade.CFrame
	local elapsed = 0
	local connection
	connection = RunService.Heartbeat:Connect(function(dt)
		elapsed += dt
		local current = blade.CFrame
		local travel = current.Position - lastCFrame.Position
		if travel.Magnitude > 0.01 then
			local result = workspace:Blockcast(lastCFrame, blade.Size, travel, params)
			local model = result and result.Instance:FindFirstAncestorOfClass("Model")
			if model and not alreadyHit[model] and model:FindFirstChildOfClass("Humanoid") then
				alreadyHit[model] = true
				onHit(model)
			end
		end
		lastCFrame = current
		if elapsed >= duration then
			connection:Disconnect()
		end
	end)
end
```

A single blockcast returns only the first hit; for multi-target cleaves add each hit to the filter and recast, or use a library. Validate hits on the server either way ([[Server Melee Validation]]).

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Reddit Scripting and Systems - Hub]]

**Related notes:** [[Hitbox Detection - Spatial Queries vs Raycasts vs Shapecasts]] · [[Melee Combo Blueprint]] · [[Server Melee Validation]] · [[Touched Events - Network Delay and Reliability]]

<!-- TDOD_GRAPH_END -->

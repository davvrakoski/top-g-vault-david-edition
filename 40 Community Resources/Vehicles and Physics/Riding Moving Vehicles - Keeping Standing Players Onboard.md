---
area: "40 Community Resources"
cluster: "Vehicles and Physics"
source_note: "community/vehicles-physics/riding-moving-vehicles"
title: "Riding Moving Vehicles - Keeping Standing Players Onboard"
tags: [roblox, community, vehicles, trains, boats, platforms, characters, luau, "cluster/vehicles-and-physics"]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/falling-off-moving-platform/766764
  - https://devforum.roblox.com/t/help-with-characters-falling-off-moving-platforms/1365210
  - https://devforum.roblox.com/t/two-humanoids-standing-inside-each-other-will-slide-off-moving-platform/3939102
  - https://devforum.roblox.com/t/how-would-you-handle-a-train-system/3363135
  - https://devforum.roblox.com/t/train-move-system-dead-rails/3619607
---
# Riding Moving Vehicles - Keeping Standing Players Onboard

Seated players are welded to their seat and ride anything. **Standing** players on a train, ferry or bus are the problem: they slide off, get left behind, or jitter.

## Why it happens
| Platform moved by... | What the character feels | Result |
|---|---|---|
| **Physics** (unanchored, pushed by constraints / movers) | The floor has real velocity; friction carries the Humanoid | Usually works; can jitter at high speed or under latency |
| **CFrame / tween / BulkMoveTo** (anchored) | The floor teleports a little each frame with **zero velocity** | Characters stay behind or slide off |

DevForum answers on moving platforms keep pointing to this: tweening a platform's Position is the usual cause, and moving it with physics movers (AlignPosition, the old BodyPosition) carries players properly. In the Dead Rails train thread, standing players still jitter on a fast physics cart, which the author put down to ping and could not fully fix.

A DevForum bug report adds one more case: two Humanoids standing **inside each other** on a moving platform slowly slide off. Staff suggested replacing those Humanoids with simple parts in a non-colliding collision group, with no quick engine fix promised.

## Fix for CFrame-moved vehicles: carry the rider on the client
Each frame, find the floor under the local character; if it is the same floor as last frame, apply the floor's movement since last frame to the character. The train thread's reply offered a similar small CFrame snippet; this one is written from scratch.

LocalScript in `StarterCharacterScripts`. Tag the floor parts of trains and boats `RidePlatform`.

```lua
--!strict
local CollectionService = game:GetService("CollectionService")
local RunService = game:GetService("RunService")

local character = script.Parent :: Model
local root = character:WaitForChild("HumanoidRootPart") :: BasePart

local params = RaycastParams.new()
params.FilterType = Enum.RaycastFilterType.Include

local function refreshFilter()
	params.FilterDescendantsInstances = CollectionService:GetTagged("RidePlatform")
end
refreshFilter()
CollectionService:GetInstanceAddedSignal("RidePlatform"):Connect(refreshFilter)
CollectionService:GetInstanceRemovedSignal("RidePlatform"):Connect(refreshFilter)

local lastFloor: BasePart? = nil
local lastFloorCFrame = CFrame.identity

RunService.PreSimulation:Connect(function()
	local hit = workspace:Raycast(root.Position, Vector3.new(0, -8, 0), params)
	local floor = if hit then hit.Instance :: BasePart else nil

	if floor and floor == lastFloor then
		-- How the floor moved since last frame, applied to the rider.
		local moved = floor.CFrame * lastFloorCFrame:Inverse()
		root.CFrame = moved * root.CFrame
	end

	lastFloor = floor
	if floor then
		lastFloorCFrame = floor.CFrame
	end
end)
```

Notes:
- The local client owns its own character, so moving its root here replicates normally.
- The ray length (8 studs) should cover a jump, or players lose the train mid-jump. Make it longer for high-speed trains.
- Moving the train **on each client** (from a shared start time) instead of the server removes replication lag between the floor and the rider, which matters at speed ([[Trains on Roblox - Spline CFrame Trains vs PrismaticConstraint Carts]]).

## Fix for physics vehicles
- Keep the deck a plain part with normal friction; avoid `Massless` decks.
- Give the **same network owner** to the vehicle and anything loose on it, as the network ownership docs advise ([[Vehicle Network Ownership Recipes - Drivers, Passengers and Exit Jolts]]).
- For very fast vehicles, seat passengers or weld them on board (a "hold on" prompt) instead of letting them stand.

## Design shortcuts
- Fast travel: fade to black, teleport, fade in. Nobody stands on the train at all.
- Interior "cabin" that does not move, with a moving view outside the windows.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Vehicles and Physics - Hub]]

**Related notes:** [[Boats and Ocean Resources - BuoyancySensor, Gerstner Waves and FFT Ocean]] · [[Vehicle Enter - Exit, Seats and Camera]] · [[Physics, Collisions and Ragdolls]] · [[Network ownership]]

<!-- TDOD_GRAPH_END -->

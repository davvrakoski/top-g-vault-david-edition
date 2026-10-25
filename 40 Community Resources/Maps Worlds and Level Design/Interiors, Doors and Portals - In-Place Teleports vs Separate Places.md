---
area: "40 Community Resources"
cluster: "Maps Worlds and Level Design"
source_note: "community/maps-level-design/interiors-doors-portals"
title: "Interiors, Doors and Portals - In-Place Teleports vs Separate Places"
tags: [roblox, community, level-design, interiors, teleport, streaming, luau, "cluster/maps-worlds-and-level-design"]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/workspace/streaming/techniques
  - https://create.roblox.com/docs/reference/engine/classes/Player#RequestStreamAroundAsync
  - https://create.roblox.com/docs/reference/engine/classes/Workspace#FallenPartsDestroyHeight
  - https://create.roblox.com/docs/projects/teleport
  - https://create.roblox.com/docs/characters/pathfinding
  - https://book.leveldesignbook.com/process/scripting/doors
---
# Interiors, Doors and Portals - In-Place Teleports vs Separate Places

Interiors are where many maps get expensive: every house, shop and dungeon that players can enter adds parts, lights and memory. There are three ways to connect an exterior to an interior on Roblox, and the right one depends on size and how many players share it.

| Approach | How | Best for | Watch out |
|---|---|---|---|
| **Real interior** | The room is inside the building's shell | Small rooms, shops with windows, PvP buildings | Every interior costs memory even when nobody is inside (streaming helps) |
| **Off-map interior** | The room is built elsewhere in the same place; a door teleports you there | Houses that are "bigger on the inside", dungeons, shops with their own lighting | Players must stream in the destination; windows can't show the real street |
| **Separate place** | `TeleportService` to another place in the same experience | Huge dungeons, instanced raids, different game modes | Loading screen, server hop, data handoff (see [[TeleportService Flows With Data and Reserved Servers]]) |

The Level Design Book has a whole page on why doors are one of the hardest things in games (locked or not, who can open them, NPCs, networking). Decide early which doors are real, which are portals and which are just decoration.

## Off-map interiors: rules
- **Keep them inside safe coordinates.** Parts behave badly far from the origin; Roblox clamps `FallenPartsDestroyHeight` to +/-50,000 for that reason. A few thousand studs from the map is plenty.
- **Never below `FallenPartsDestroyHeight`** (check the value in your place's Workspace properties). Interiors placed under the map are often placed too low by accident and characters are destroyed on arrival.
- **Farther than the streaming radius.** If interiors sit more than the streaming target radius (1024 studs recommended) from the exterior, the exterior can stream out while players are inside, which saves memory.
- **Arrival points face into the room**, a few studs from the door, so players don't bounce straight back.
- **Lighting per interior** on the client: switch to an interior preset when players arrive (see [[Lighting Presets by Genre - LightingStyle, Atmosphere and Post]] and [[Interior - Exterior Lighting Transitions]]).
- **Shared or private?** One copy of an interior is shared by everyone who enters. For private rooms, clone a copy per player or party at an offset, and destroy it when they leave.

## Portal script (original)
Tag door parts `Portal` (Tag Editor). Give each a string attribute `PortalId` and `TargetId` (the id of the paired portal), an optional `Interior` name, a `ProximityPrompt` child, and optionally an `Attachment` named `Exit` that marks where and which way players arrive.

```lua
-- ServerScriptService/Portals.server.lua
local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local MAX_USE_DISTANCE = 15
local arrived = Instance.new("RemoteEvent") -- tells the client which lighting/ambience to use
arrived.Name = "PortalArrived"
arrived.Parent = ReplicatedStorage

local portals: { [string]: BasePart } = {}
local busy: { [Player]: boolean } = {}

local function arrivalCFrame(portal: BasePart): CFrame
	local exit = portal:FindFirstChild("Exit")
	if exit and exit:IsA("Attachment") then
		return exit.WorldCFrame
	end
	return portal.CFrame * CFrame.new(0, 0, -6) -- 6 studs in front of the door
end

local function travel(player: Player, from: BasePart)
	if busy[player] then return end
	local target = portals[from:GetAttribute("TargetId") or ""]
	local character = player.Character
	local root = character and character:FindFirstChild("HumanoidRootPart")
	if not target or not root then return end
	if (root.Position - from.Position).Magnitude > MAX_USE_DISTANCE then return end -- server-side check

	busy[player] = true
	local dest = arrivalCFrame(target)
	-- Pre-stream the destination so the player doesn't land in an empty void.
	pcall(function() player:RequestStreamAroundAsync(dest.Position, 5) end)
	if character.Parent then
		character:PivotTo(dest + Vector3.new(0, 3, 0))
		arrived:FireClient(player, target:GetAttribute("Interior") or "Outside")
	end
	task.delay(1, function() busy[player] = nil end)
end

local function register(portal: Instance)
	if not portal:IsA("BasePart") then return end
	local id = portal:GetAttribute("PortalId")
	if typeof(id) ~= "string" then return end
	portals[id] = portal
	local prompt = portal:FindFirstChildOfClass("ProximityPrompt")
	if prompt then
		prompt.Triggered:Connect(function(player) travel(player, portal) end)
	end
end

for _, p in CollectionService:GetTagged("Portal") do register(p) end
CollectionService:GetInstanceAddedSignal("Portal"):Connect(register)
Players.PlayerRemoving:Connect(function(player) busy[player] = nil end)
```

Why this shape:
- The server owns the move, checks distance itself, and debounces, so exploiters can't spam or trigger far-away doors.
- `RequestStreamAroundAsync` is the method Roblox's streaming docs recommend before moving a character to a far location. It is a request, not a guarantee, so keep a floor under the arrival point.
- `CFrame + Vector3` moves up 3 studs without changing the arrival direction set by the `Exit` attachment.

## Doors and NPCs
If NPCs path through doors, add a `PathfindingModifier` with `PassThrough` on the door part so the navmesh ignores it, then open it in your NPC code (details in [[Enemy AI Pathing Loop with PathfindingService]]). Physical swinging doors: Roblox's [[Build a hinged door]] tutorial.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Maps Worlds and Level Design - Hub]]

**Related notes:** [[Buildings, Interiors and Modular Streaming]] · [[Multi-Place Experience Architecture]] · [[Teleport between places]] · [[Zone Visibility Culling for Indoor and City Maps]]

<!-- TDOD_GRAPH_END -->

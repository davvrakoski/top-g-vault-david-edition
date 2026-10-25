---
area: "40 Community Resources"
cluster: "Maps Worlds and Level Design"
source_note: "community/maps-level-design/room-chain-generation"
title: "Room-Chain Generation with Connector Attachments"
tags: [roblox, community, procedural, level-design, rooms, luau, "cluster/maps-worlds-and-level-design"]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/procedural-room-generation/3088481
  - https://devforum.roblox.com/t/problem-with-room-generation/3971134
  - https://devforum.roblox.com/t/issues-with-procedural-room-generation/4764229
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot#GetPartBoundsInBox
  - https://create.roblox.com/docs/reference/engine/classes/Model#GetBoundingBox
---
# Room-Chain Generation with Connector Attachments

"Doors"-style horror games, endless runners and roguelite dungeons build their maps from a pool of prefab rooms snapped end to end. DevForum threads on room generation keep arriving at the same recipe:
- a room model with a **start node and one or more end nodes**, placing each new room's start on an end of the last room (heymar2025's reply in *Problem with room generation*, 2025; GnomeCode's "doors-like" tutorial series is recommended in the same thread for linear chains);
- **bounding-box parts** to stop rooms overlapping, a seed for repeatable layouts, and storing each exit's CFrame before placing the next room (CategoriaSOFC and Sametc4n in *Issues with procedural room generation*, 2026, on a Pressure-style generator with a 32-stud grid);
- room sizes on a grid, such as multiples of 8 (DEV_N1GHTM4RE, *Procedural Room Generation*, 2024).

This note gives an original, seeded implementation of that recipe. For room-graph theory (critical path, keys, loops) see [[Procedural Dungeon and Room Generation]].

## Build the room prefabs
In `ServerStorage.Rooms`, each room is a Model with:
- An `Attachment` named `Entrance` on a floor part at the doorway, its **front (-Z / LookVector) pointing out of the room**.
- One or more `Attachment`s named `Exit` at the other doorways, also pointing **out** of the room.
- A number attribute `Weight` (how often it appears) and optional `Kind` (e.g. "Hall", "Safe", "Threat").
- Walls that end flush with the doorway, so two rooms meet without a gap.

Show attachments in Studio (Model tab, Constraint Details) to check every arrow points outward.

## The maths in one line
To join new room B to an exit on room A, B's entrance must sit on A's exit, facing the opposite way:

`B pivot = exitWorldCFrame * CFrame.Angles(0, pi, 0) * entranceOffset:Inverse()`

where `entranceOffset` is the entrance's CFrame relative to B's pivot.

## Generator (original)
```lua
-- ServerScriptService/RoomChain (ModuleScript)
local ServerStorage = game:GetService("ServerStorage")

local ROOMS = ServerStorage:WaitForChild("Rooms")
local DEAD_END = ROOMS:FindFirstChild("DeadEnd") -- a small cap room with only an Entrance
local MAX_TRIES = 8
local SHRINK = 1 -- studs; shrink the overlap box so touching doorways don't count as overlap

local RoomChain = {}

local function weightedPick(rng: Random, pool: { Model }): Model
	local total = 0
	for _, room in pool do total += room:GetAttribute("Weight") or 1 end
	local roll = rng:NextNumber(0, total)
	for _, room in pool do
		roll -= room:GetAttribute("Weight") or 1
		if roll <= 0 then return room end
	end
	return pool[#pool]
end

local function attachments(model: Model, name: string): { Attachment }
	local list = {}
	for _, d in model:GetDescendants() do
		if d:IsA("Attachment") and d.Name == name then table.insert(list, d) end
	end
	return list
end

local function overlaps(model: Model, placed: Folder): boolean
	local cf, size = model:GetBoundingBox()
	local params = OverlapParams.new()
	params.FilterType = Enum.RaycastFilterType.Include
	params.FilterDescendantsInstances = { placed }
	local hits = workspace:GetPartBoundsInBox(cf, size - Vector3.one * SHRINK * 2, params)
	return #hits > 0
end

-- Try to attach a clone of `template` to `exit`. Returns the placed room or nil.
local function tryPlace(template: Model, exit: Attachment, placed: Folder): Model?
	local room = template:Clone()
	local entrance = attachments(room, "Entrance")[1]
	if not entrance then
		room:Destroy()
		return nil
	end
	local entranceOffset = room:GetPivot():ToObjectSpace(entrance.WorldCFrame)
	room:PivotTo(exit.WorldCFrame * CFrame.Angles(0, math.pi, 0) * entranceOffset:Inverse())
	-- Check while the clone is still unparented, so it can't overlap itself.
	if overlaps(room, placed) then
		room:Destroy()
		return nil
	end
	room.Parent = placed
	return room
end

-- Builds `count` rooms starting from `startExit` (an Exit attachment already in Workspace).
function RoomChain.build(seed: number, count: number, startExit: Attachment): Folder
	local rng = Random.new(seed)
	local placed = Instance.new("Folder")
	placed.Name = "GeneratedRooms"
	placed.Parent = workspace

	local pool = {}
	for _, m in ROOMS:GetChildren() do
		if m:IsA("Model") and m ~= DEAD_END then table.insert(pool, m) end
	end

	local openExits = { startExit }
	local built = 0
	while built < count and #openExits > 0 do
		local exit = table.remove(openExits, 1) -- breadth-first; use rng index for wilder layouts
		local room: Model? = nil
		for _ = 1, MAX_TRIES do
			room = tryPlace(weightedPick(rng, pool), exit, placed)
			if room then break end
		end
		if room then
			built += 1
			room.Name = string.format("Room_%03d", built)
			for _, e in attachments(room, "Exit") do table.insert(openExits, e) end
		elseif DEAD_END then
			tryPlace(DEAD_END, exit, placed) -- cap the doorway so it isn't a hole into the void
		end
	end
	for _, exit in openExits do -- cap whatever is left open
		if DEAD_END then tryPlace(DEAD_END, exit, placed) end
	end
	return placed
end

return RoomChain
```

Notes on the code:
- `GetPartBoundsInBox` only sees parts **in Workspace**, so the generated folder lives in Workspace, and the candidate room is checked before it is parented (its own parts can't count as hits). The bounding box and attachment positions are plain CFrame maths and work on the unparented clone.
- The overlap test uses the room's bounding box, which is coarse for L-shaped rooms. Add an invisible `Bounds` part per room and check only those parts if you need tighter packing.
- The same seed gives the same layout, so you can share seeds, reproduce bugs and run the generator on the server only.
- Put the start room inside the `GeneratedRooms` folder (or add it to the overlap filter) so new rooms can't be placed through it.
- For a linear "Doors" game, use rooms with exactly one Exit and generate a few rooms ahead of the leading player instead of the whole map at once. Destroy rooms far behind to keep part counts flat.

## Pacing the pool
Weights alone give random pacing. For horror, keep a small history and re-roll if the last two rooms were both `Kind = "Threat"`, or force a `Safe` room every N rooms (see [[Horror Map Design - Pacing, Loops and Readable Darkness]]).

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Maps Worlds and Level Design - Hub]]

**Related notes:** [[Procedural Dungeon and Room Generation]] · [[Procedural Generation - Hub]] · [[Tile Grid Generation with Adjacency Rules]] · [[Horror Starter Architecture]]

<!-- TDOD_GRAPH_END -->

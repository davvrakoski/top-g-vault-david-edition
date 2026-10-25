---
area: "40 Community Resources"
cluster: "Maps Worlds and Level Design"
source_note: "community/maps-level-design/map-rotation-voting"
title: "Map Rotation and Voting - Loading Maps from ServerStorage"
tags: [roblox, community, level-design, rounds, map-voting, luau, "cluster/maps-worlds-and-level-design"]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/help-with-voting-system/2055943
  - https://devforum.roblox.com/t/scripting-a-map-voting-gui/245951
  - https://devforum.roblox.com/t/how-to-make-a-round-based-system/487712
  - https://create.roblox.com/docs/reference/engine/classes/Player#RequestStreamAroundAsync
  - https://create.roblox.com/docs/performance-optimization/design
---
# Map Rotation and Voting - Loading Maps from ServerStorage

Round-based games (shooters, minigames, survival rounds) keep several maps and load one per round. DevForum threads on map voting describe the same flow: maps in a `Maps` folder in `ServerStorage`, the server offers a few, clients vote through a RemoteEvent, the server counts and loads the winner into Workspace. This note gives an original, safer version of that flow plus the map-building rules that make it work.

## Build each map for loading
- **One Model per map** in `ServerStorage.Maps`. `ServerStorage` doesn't replicate to clients, so unloaded maps cost clients no memory (Roblox's *Design for performance* page recommends ServerStorage for anything clients don't need).
- **Same pivot convention for every map.** Set each map Model's pivot at its centre floor, so loading is one `PivotTo` to a fixed anchor.
- **Spawn markers inside the map** (parts named `MapSpawn`, anchored, `CanCollide = false`, `Transparency = 1`), several per map so players don't stack.
- **Attributes for metadata**: `DisplayName`, `MinPlayers`, `Thumbnail` (image asset ID for the vote UI). Then designers can add maps without touching code.
- **No scripts that assume they run once.** Maps are cloned and destroyed every round; scripts inside them start fresh each time. A round-system thread on the DevForum suggests the map runs its own logic and signals the round script when done; keep that contract small.

## Server module (original)
```lua
-- ServerScriptService/MapVote (ModuleScript). require() it once from your round loop.
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")

local MAPS = ServerStorage:WaitForChild("Maps")
local ANCHOR = workspace:WaitForChild("MapAnchor") -- invisible part where the active map is placed
local CHOICES, VOTE_TIME = 3, 15

local function remote(name: string): RemoteEvent
	local r = Instance.new("RemoteEvent")
	r.Name = name
	r.Parent = ReplicatedStorage
	return r
end
local voteEvent = remote("MapVote")          -- client -> server: chosen map name
local optionsEvent = remote("MapVoteOptions") -- server -> clients: candidates, seconds

local rng = Random.new()
local candidates: { string } = {}
local votes: { [Player]: string } = {}
local lastMap: string? = nil
local currentMap: Model? = nil

voteEvent.OnServerEvent:Connect(function(player, choice)
	-- Never trust the client: only accept a current candidate, one vote per player (changeable).
	if typeof(choice) == "string" and table.find(candidates, choice) then
		votes[player] = choice
	end
end)
Players.PlayerRemoving:Connect(function(player) votes[player] = nil end)

local function pickCandidates(): { string }
	local pool = {}
	local count = #Players:GetPlayers()
	for _, map in MAPS:GetChildren() do
		if map:IsA("Model") and map.Name ~= lastMap and count >= (map:GetAttribute("MinPlayers") or 0) then
			table.insert(pool, map.Name)
		end
	end
	if #pool == 0 and lastMap then pool = { lastMap } end
	for i = #pool, 2, -1 do -- shuffle
		local j = rng:NextInteger(1, i)
		pool[i], pool[j] = pool[j], pool[i]
	end
	return table.move(pool, 1, math.min(CHOICES, #pool), 1, {})
end

local function winner(): string
	local tally = {}
	for _, name in votes do tally[name] = (tally[name] or 0) + 1 end
	local best, tied = -1, {}
	for _, name in candidates do
		local n = tally[name] or 0
		if n > best then best, tied = n, { name }
		elseif n == best then table.insert(tied, name) end
	end
	return tied[rng:NextInteger(1, #tied)] -- random tie-break (also covers zero votes)
end

local function loadMap(name: string): Model
	if currentMap then currentMap:Destroy() end
	local map = MAPS[name]:Clone()
	map:PivotTo(ANCHOR.CFrame)
	map.Parent = workspace
	currentMap = map
	return map
end

local function sendPlayersTo(map: Model)
	local spawns = {}
	for _, d in map:GetDescendants() do
		if d:IsA("BasePart") and d.Name == "MapSpawn" then table.insert(spawns, d) end
	end
	if #spawns == 0 then return end
	for i, player in Players:GetPlayers() do
		local spawnPart = spawns[(i - 1) % #spawns + 1]
		task.spawn(function()
			pcall(function() player:RequestStreamAroundAsync(spawnPart.Position, 5) end)
			local character = player.Character
			if character then character:PivotTo(spawnPart.CFrame + Vector3.new(0, 4, 0)) end
		end)
	end
end

-- Call from your round loop (see the Lobby and Round System Blueprint).
local function runVote(): Model?
	candidates = pickCandidates()
	if #candidates == 0 then return nil end
	table.clear(votes)
	optionsEvent:FireAllClients(candidates, VOTE_TIME)
	task.wait(VOTE_TIME)
	local name = winner()
	lastMap = name
	local map = loadMap(name)
	sendPlayersTo(map)
	return map
end

return { runVote = runVote }
```

Notes:
- `RequestStreamAroundAsync` pre-streams the spawn area so players don't arrive in an empty void when `StreamingEnabled` is on. It yields, so each player runs in its own thread.
- Excluding `lastMap` stops the same map winning twice in a row.
- Big maps can hitch the server when cloned. If that happens, keep each map in Workspace far from the lobby instead (it streams to clients only when they approach) and teleport players there.
- The client UI listens to `MapVoteOptions`, shows thumbnails from the map attributes, and fires `MapVote` with a name. It never decides the result.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Maps Worlds and Level Design - Hub]]

**Related notes:** [[Lobby and Round System Blueprint]] · [[StreamingEnabled Gotchas and Streaming-Safe Client Code]] · [[Arena Map Typologies - Bowl, Figure 8, Hub and Three Lane]] · [[Social Hub and Lobby Layout]]

<!-- TDOD_GRAPH_END -->

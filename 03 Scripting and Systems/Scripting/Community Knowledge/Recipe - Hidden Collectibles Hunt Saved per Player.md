---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Recipe - Hidden Collectibles Hunt Saved per Player"
tags: [roblox, community-knowledge, scripting, recipe, luau, collectibles, egg-hunt, datastore, collectionservice, streaming]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/tutorials/curriculums/core/scripting/script-game-behavior
  - https://create.roblox.com/docs/reference/engine/classes/CollectionService
  - https://create.roblox.com/docs/workspace/streaming
  - https://create.roblox.com/docs/scripting/security/security-tactics
---
# Recipe - Hidden Collectibles Hunt Saved per Player

"Find all 25 hidden eggs": each collectible can be picked up **once per player, forever**, other players still see their own copy, and progress ("12/25") is saved. The official coin tutorial covers shared coins that come back after a cooldown; a per-player hunt needs a different shape: the server records *which IDs this player has*, and each client hides the ones it already collected, locally.

> **Code status:** original example, **not run in Studio**. API names checked against `30 Official Roblox Docs/API Reference` (2026-10-25).

## Where it goes
| Item | Type | Location |
|---|---|---|
| `Collectibles` | Script | `ServerScriptService` |
| `CollectiblesClient` | LocalScript | `StarterPlayer > StarterPlayerScripts` |
| `PlayerData` | ModuleScript from [[Recipe - Developer Product Shop with Safe ProcessReceipt]] | `ServerScriptService` |
| collectibles | Parts tagged `Collectible`, each with a **unique** string attribute `CollectibleId` (e.g. `"egg_07"`) | `Workspace` |

Stable IDs matter: instances are recreated each server, so save `CollectibleId` strings, not instance references. Remotes are created by the server script: `CollectRequest` (RemoteEvent) and `CollectedList` (RemoteEvent).

## Server
```lua
-- ServerScriptService/Collectibles (Script)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CollectionService = game:GetService("CollectionService")
local ServerScriptService = game:GetService("ServerScriptService")
local PlayerData = require(ServerScriptService:WaitForChild("PlayerData"))

local PICKUP_RANGE = 10
local REWARD = 25

local request = Instance.new("RemoteEvent"); request.Name = "CollectRequest"; request.Parent = ReplicatedStorage
local listEvent = Instance.new("RemoteEvent"); listEvent.Name = "CollectedList"; listEvent.Parent = ReplicatedStorage

local total = 0
for _, part in CollectionService:GetTagged("Collectible") do
	if part:GetAttribute("CollectibleId") then total += 1 end
end
ReplicatedStorage:SetAttribute("CollectiblesTotal", total)

local function sendList(player: Player)
	local data = PlayerData.get(player)
	if not data then return end
	data.Collected = data.Collected or {}
	local ids = {}
	for id in data.Collected do table.insert(ids, id) end
	listEvent:FireClient(player, ids)
end

request.OnServerEvent:Connect(function(player, part)
	-- validate: a real tagged part with an ID, close to the player
	if typeof(part) ~= "Instance" or not part:IsA("BasePart") or not part:HasTag("Collectible") then return end
	local id = part:GetAttribute("CollectibleId")
	if type(id) ~= "string" then return end
	local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	if not root or (root.Position - part.Position).Magnitude > PICKUP_RANGE then return end

	local data = PlayerData.get(player)
	if not data then return end
	data.Collected = data.Collected or {}
	if data.Collected[id] then return end -- already have it

	data.Collected[id] = true
	PlayerData.addCoins(player, REWARD)
	local count = 0
	for _ in data.Collected do count += 1 end
	player:SetAttribute("CollectedCount", count)
	listEvent:FireClient(player, { id }) -- tell this client to hide it
end)

local function onPlayer(player: Player)
	local data = PlayerData.waitFor(player)
	if not data then return end
	data.Collected = data.Collected or {}
	local count = 0
	for _ in data.Collected do count += 1 end
	player:SetAttribute("CollectedCount", count)
	sendList(player)
end
Players.PlayerAdded:Connect(onPlayer)
for _, p in Players:GetPlayers() do task.spawn(onPlayer, p) end
```

## Client
```lua
-- StarterPlayerScripts/CollectiblesClient (LocalScript)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CollectionService = game:GetService("CollectionService")

local player = Players.LocalPlayer
local request = ReplicatedStorage:WaitForChild("CollectRequest") :: RemoteEvent
local listEvent = ReplicatedStorage:WaitForChild("CollectedList") :: RemoteEvent

local have: {[string]: boolean} = {}
local asked: {[string]: number} = {}

local function hide(part: BasePart)
	part.Transparency = 1 -- a client-side change: it does not replicate, others still see theirs
	part.CanTouch = false              -- local change: stops this client's Touched
	for _, d in part:GetDescendants() do
		if d:IsA("ParticleEmitter") or d:IsA("PointLight") then d.Enabled = false end
	end
end

local function apply(part: Instance)
	if not part:IsA("BasePart") then return end
	local id = part:GetAttribute("CollectibleId")
	if id and have[id] then hide(part) end
end

local function hook(part: Instance)
	if not part:IsA("BasePart") then return end
	apply(part)
	part.Touched:Connect(function(hit)
		local character = player.Character
		local id = part:GetAttribute("CollectibleId")
		if not character or not hit:IsDescendantOf(character) or not id or have[id] then return end
		if asked[id] and os.clock() - asked[id] < 1 then return end
		asked[id] = os.clock()
		request:FireServer(part)
	end)
end

listEvent.OnClientEvent:Connect(function(ids)
	for _, id in ids do have[id] = true end
	for _, part in CollectionService:GetTagged("Collectible") do apply(part) end
end)

for _, part in CollectionService:GetTagged("Collectible") do hook(part) end
CollectionService:GetInstanceAddedSignal("Collectible"):Connect(hook) -- parts streaming in later
```
Show progress anywhere with `player:GetAttribute("CollectedCount")` and `ReplicatedStorage:GetAttribute("CollectiblesTotal")`.

## How to test
1. Tag five parts `Collectible` with IDs `egg_01`..`egg_05`. Play with 2 players. Player 1 touches `egg_01`: it vanishes for Player 1 only, coins +25, `CollectedCount = 1`.
2. Player 2 still sees `egg_01` and can collect it too.
3. Rejoin (API access on): `egg_01` stays hidden for Player 1 and the count is still 1.
4. From the client command bar fire `CollectRequest` for an egg 200 studs away: rejected (range). Fire it twice for the same nearby egg: paid once.
5. With StreamingEnabled and eggs far away, walk to them: they appear already hidden if collected (the `GetInstanceAddedSignal` path re-applies).

## Common mistakes
- **Destroying the part on the server**: it disappears for everyone.
- **Treating "hidden on my screen" as "collected".** Client-side hiding is cosmetic; an exploiter can unhide everything. The server's ID set is what counts, and the server ignores repeat requests.
- **Duplicate `CollectibleId`s** after copy-pasting parts: two eggs share one save slot. Run a quick uniqueness check in the command bar before publishing.
- **Saving instance paths** like `workspace.Eggs.Egg7`: renaming a folder wipes everyone's progress.
- **No range check**: exploiters loop over every tagged part and collect the whole map in one frame.

## Related
[[Scripting - Hub]] · [[CollectionService Tag-Driven Architecture]] · [[Instance Arguments Over Remotes - Nil, Streaming and Ownership Checks]] · [[Recipe - Obby Stage Save and Skip Stage Product]]

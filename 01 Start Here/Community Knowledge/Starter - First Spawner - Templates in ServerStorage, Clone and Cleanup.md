---
area: "01 Start Here"
cluster: "Start Here"
title: "First Spawner - Templates in ServerStorage, Clone and Cleanup"
tags: [roblox, community-knowledge, start-here, spawning, clone, debris, serverstorage]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Instance
  - https://create.roblox.com/docs/reference/engine/classes/Debris
  - https://create.roblox.com/docs/reference/engine/classes/ServerStorage
  - https://create.roblox.com/docs/reference/engine/classes/CollectionService
---
# First Spawner - Templates in ServerStorage, Clone and Cleanup

Coins that reappear, crates that drop every 10 seconds, enemies that respawn, a car that appears when you press a button: all of these are the same pattern. Keep one **template** hidden in `ServerStorage`, `Clone()` it, place it, parent it to Workspace, and remove it when done. Getting this pattern right early prevents two classic problems: maps slowly filling with thousands of leftover parts, and clones that appear at the world origin.

## Why ServerStorage

- Things in `ServerStorage` are **not** in the world and are **not sent to players**. Templates there cost nothing until cloned and cannot be inspected by exploiters.
- `ReplicatedStorage` also works when the client needs a copy (for example local-only effects), but gameplay objects that the server owns belong in ServerStorage.
- Never use a part sitting in Workspace as the template: players can touch, break or move it.

## Step by step: a coin spawner with a cap

1. Build a coin (a Cylinder part, anchored, CanCollide off). Name it `Coin`, tag it `Coin` if you use tags. Drag it into **ServerStorage**.
2. Create a Folder in Workspace called `SpawnPoints` with a few invisible anchored parts.
3. Create a Folder in Workspace called `Spawned` (keeps the Explorer tidy and makes counting easy).
4. Add a Script to `ServerScriptService`:

```lua
local ServerStorage = game:GetService("ServerStorage")
local Players = game:GetService("Players")

local TEMPLATE = ServerStorage:WaitForChild("Coin")
local POINTS = workspace:WaitForChild("SpawnPoints"):GetChildren()
local FOLDER = workspace:WaitForChild("Spawned")
local MAX_COINS = 15
local SPAWN_EVERY = 3

local function spawnCoin()
	local point = POINTS[math.random(1, #POINTS)]
	local coin = TEMPLATE:Clone()
	coin:PivotTo(point.CFrame + Vector3.new(0, 2, 0)) -- position BEFORE parenting
	coin.Parent = FOLDER

	local taken = false
	coin.Touched:Connect(function(hit)
		if taken then return end
		local player = Players:GetPlayerFromCharacter(hit.Parent)
		if not player then return end
		taken = true
		player.leaderstats.Coins.Value += 1
		coin:Destroy() -- also disconnects this Touched connection
	end)
end

while true do
	if #FOLDER:GetChildren() < MAX_COINS then
		spawnCoin()
	end
	task.wait(SPAWN_EVERY)
end
```

## The rules inside that script

- **Position, then parent.** Setting the position before `Parent = FOLDER` means the clone appears in the right place on the first frame instead of flashing at 0,0,0. It is also slightly cheaper.
- **A cap.** `MAX_COINS` stops infinite growth. Every spawner needs a limit.
- **`Destroy()` when done.** It removes the object, locks its Parent, disconnects all its connections and destroys its children. Setting `Parent = nil` alone leaves connections alive.
- **A `taken` flag.** `Touched` can fire several times in the same moment; the flag makes sure one coin pays once.

## Timed cleanup with Debris

For things that should disappear on their own (dropped items, shell casings, effects), schedule removal:

```lua
local Debris = game:GetService("Debris")
local crate = ServerStorage.Crate:Clone()
crate:PivotTo(dropPoint.CFrame)
crate.Parent = workspace
Debris:AddItem(crate, 30) -- gone after 30 seconds, no yield
```

`task.delay(30, function() crate:Destroy() end)` does the same and is easy to cancel. Either is fine; just never forget the cleanup.

## Clone gotchas

- **`Archivable` off = not cloned.** If `Clone()` returns `nil`, check the template's `Archivable` property. Children with Archivable off are skipped silently.
- **Scripts inside clones run** once the clone is parented somewhere scripts run (Workspace for server Scripts). Handy, but one script per clone adds up; for many copies, a single managing script (like the one above) or tags scale better.
- **Clones share nothing.** Changing the template after cloning does not change existing clones.
- **Unanchored clones** need their parts welded, or they fall apart (see [[Starter - Models That Hold Together - Anchored, Welds, PrimaryPart and PivotTo]]).

## Checklist

- [ ] Template lives in ServerStorage, not Workspace
- [ ] Clones go into one named folder
- [ ] `PivotTo` before `Parent`
- [ ] A maximum count
- [ ] Every clone has a way to be destroyed (pickup, timer, round end)

## Related
[[00 START HERE - Top G Vault]] · [[Starter - First Chasing Enemy - Nearest Player, Touch Damage and a Leash]] · [[Perf - Destroy vs Parent nil vs Debris - Teardown Without Spikes]] · [[Map Rotation and Voting - Loading Maps from ServerStorage]] · [[Create a coin collection mechanic]]

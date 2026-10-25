---
area: "01 Start Here"
cluster: "Start Here"
title: "First DataStore Save - Load, Save, Leave and Shutdown"
tags: [roblox, community-knowledge, start-here, datastore, saving, persistence]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/tutorials/use-case-tutorials/data-storage/save-player-data
  - https://create.roblox.com/docs/cloud-services/data-stores
  - https://create.roblox.com/docs/cloud-services/data-stores/best-practices
  - https://create.roblox.com/docs/cloud-services/data-stores/error-codes-and-limits
  - https://create.roblox.com/docs/reference/engine/classes/DataModel
---
# First DataStore Save - Load, Save, Leave and Shutdown

Without saving, every session starts from zero and players do not come back. **DataStoreService** stores data in Roblox's cloud under keys you choose. A first save system needs only four moments: load on join, save on leave, save on server shutdown, and save every few minutes as insurance. This note builds exactly that for a `Coins` stat, with the error handling beginners usually skip and then regret.

## Before you start

1. **Publish** the place (data stores need a real game ID).
2. **File > Experience Settings > Security > Enable Studio Access to API Services**, then Save. Without this, Studio tests fail with an access error.
3. Know that Studio tests then read and write **real** data for that game. Use a separate test place for experiments (see [[Studio API Access and Data Safety During Testing]]).

## Key facts

- Server only. Clients are blocked from DataStores.
- Keys are strings; values can be numbers, strings, booleans or tables (no Instances, no Vector3/CFrame directly).
- Up to 4 MB per key. Store one player's data under one key, such as `"Player_" .. player.UserId`.
- Read and write budgets scale with the server: roughly `60 + 40 x players` requests per minute for standard reads and writes. Saving on every coin pickup will hit the limit; save on events and timers instead.
- Calls can fail (network, throttling). Wrap every call in `pcall`.

## The script (ServerScriptService)

```lua
local Players = game:GetService("Players")
local DataStoreService = game:GetService("DataStoreService")
local store = DataStoreService:GetDataStore("PlayerData_v1")

local loaded = {} -- [player] = true once their data loaded safely

local function keyFor(player)
	return "Player_" .. player.UserId
end

local function load(player)
	local ok, data = pcall(function()
		return store:GetAsync(keyFor(player))
	end)
	local stats = Instance.new("Folder")
	stats.Name = "leaderstats"
	local coins = Instance.new("IntValue")
	coins.Name = "Coins"
	coins.Parent = stats
	stats.Parent = player

	if not ok then
		warn("Load failed for", player.Name, data)
		return -- do NOT mark loaded: we must not overwrite their real save with 0
	end
	coins.Value = (data and data.Coins) or 0
	loaded[player] = true
end

local function save(player)
	if not loaded[player] then return end
	local coins = player.leaderstats.Coins.Value
	local ok, err = pcall(function()
		store:UpdateAsync(keyFor(player), function(old)
			old = old or {}
			old.Coins = coins
			return old
		end)
	end)
	if not ok then warn("Save failed for", player.Name, err) end
end

Players.PlayerAdded:Connect(load)
Players.PlayerRemoving:Connect(function(player)
	save(player)
	loaded[player] = nil
end)

-- Server shutting down (update, last player left): save everyone still here
game:BindToClose(function()
	for _, player in Players:GetPlayers() do
		task.spawn(save, player)
	end
	task.wait(3) -- give the saves time to finish
end)

-- Autosave every 2 minutes as insurance against crashes
task.spawn(function()
	while true do
		task.wait(120)
		for _, player in Players:GetPlayers() do
			save(player)
		end
	end
end)
```

## Why each piece is there

| Piece | Without it |
| --- | --- |
| `pcall` | One failed request errors the whole script |
| `loaded[player]` guard | A failed load followed by a save **wipes** the player's real data with zeros |
| `UpdateAsync` | Docs prefer it when the new value depends on the old one or several servers may write the same key |
| `BindToClose` | Players in the last server of an update lose their session |
| Autosave | A crash loses everything since join |
| `_v1` in the store name | Lets you start a fresh schema later without clashing |

## Test it

1. Test, collect coins, Stop. Test again: coins should be back.
2. Test in **Server & Clients**, leave with one client, rejoin.
3. Watch Output for "Load failed" or "Save failed" lines.

## When to graduate

This is fine for a first game. When you add inventories, trading or purchases, use session locking and a proven library: see [[DataStore Production Patterns]] and [[ProfileStore in 2026 - Status, Wrappers and Lock Lessons]]. For "data does not save" debugging, see [[Data Not Saving on Leave - Help Thread Patterns]].

## Pitfalls

- Saving `player.leaderstats` after the player is gone: it can already be destroyed. Read values first (as above) or keep data in a table.
- Renaming the data store later: everyone "loses" data because the new store is empty.
- Saving on every change: throttling warnings, then dropped saves.

## Related
[[00 START HERE - Top G Vault]] · [[First Leaderboard with leaderstats]] · [[BindToClose and Server Shutdown Save Flush]] · [[DataStore Production Patterns]] · [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/Data Storage/Save player data with standard data stores|Save player data (official)]]

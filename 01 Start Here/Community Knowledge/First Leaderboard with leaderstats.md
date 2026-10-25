---
area: "01 Start Here"
cluster: "Start Here"
title: "First Leaderboard with leaderstats"
tags: [roblox, community-knowledge, start-here, leaderboard, leaderstats]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/players/leaderboards
  - https://create.roblox.com/docs/tutorials/use-case-tutorials/scripting/basic-scripting/score-points
  - https://create.roblox.com/docs/tutorials/use-case-tutorials/data-storage/create-leaderboard
---
# First Leaderboard with leaderstats

The player list in the top-right corner doubles as a free leaderboard. Put a Folder called `leaderstats` inside a player and every value object in it shows as a column. It is the fastest way to show coins, kills or stage, and it is the first "server owns the numbers" system most developers build. In 2026 the same list also has **Friends** and **Global** views backed by an ordered data store (beta).

## The three views

| View | Shows | Source |
| --- | --- | --- |
| **Here** | Players in this server | `leaderstats` folder (this note) |
| **Friends** | Persistent ranks among friends who played | One registered ordered data store (beta) |
| **Global** | Persistent ranks across the game | Same ordered data store (beta) |

## Build it (server Script in ServerScriptService)

```lua
local Players = game:GetService("Players")

local function setupLeaderstats(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats" -- must be exactly this, all lowercase

	local coins = Instance.new("IntValue")
	coins.Name = "Coins"   -- column title as players see it
	coins.Value = 0
	coins.Parent = leaderstats

	local level = Instance.new("IntValue")
	level.Name = "Level"
	level.Value = 1
	level.Parent = leaderstats

	leaderstats.Parent = player -- parent last
end

Players.PlayerAdded:Connect(setupLeaderstats)
for _, player in Players:GetPlayers() do -- players who joined before this ran
	task.spawn(setupLeaderstats, player)
end
```

Any value type works: `IntValue` for whole numbers, `NumberValue` for decimals, `StringValue` for text such as a rank name.

## Change a stat (server only)

```lua
local coins = player.leaderstats.Coins
coins.Value += 10
```

Do this from server Scripts (coin pickups, kills, round wins). A LocalScript that changes `Coins.Value` only changes that player's own screen; the server and everyone else still see the old number.

Example: a coin part that pays once and disappears.

```lua
local coin = script.Parent
local taken = false
coin.Touched:Connect(function(hit)
	local player = game:GetService("Players"):GetPlayerFromCharacter(hit.Parent)
	if player and not taken then
		taken = true
		player.leaderstats.Coins.Value += 1
		coin:Destroy()
	end
end)
```

## Column order

1. Stats appear in the order you add them.
2. Add a `BoolValue` named `IsPrimary` (value `true`) under a stat to put it first.
3. Or add a `NumberValue` named `Priority` under stats; higher shows earlier (default 0). `IsPrimary` beats `Priority`.

## Hide the list

From a LocalScript (menus, cutscenes):

```lua
game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
```

## Make it persistent

`leaderstats` resets every session. To keep values:
- Save the numbers with a standard data store: [[First DataStore Save - Load, Save, Leave and Shutdown]].
- For the built-in **Friends / Global** views, write each player's score (one number, key based on UserId, written from the server) to an **ordered data store** and register it in Creator Hub. The beta supports one active persistent leaderboard per experience.
- For an in-world "Top 10" board on a wall, see the official custom leaderboard tutorial and [[Leaderboard Blueprint]].

## Pitfalls

- `Leaderstats`, `LeaderStats` or `leaderstat`: none show up. Exact name only.
- Using a Model or Configuration instead of a Folder: use a Folder.
- Huge numbers: very large values become hard to read; abbreviate them in your own UI (see [[Number Abbreviation for Simulator UIs]]).
- Storing the only copy of important data (like inventory) in value objects: fine for display, but keep the real data in a server table and save it.

## Related
[[00 START HERE - Top G Vault]] · [[Leaderboard Blueprint]] · [[First Obby in 30 Minutes]] · [[Key Player State by UserId, Not the Player Object]] · [[30 Official Roblox Docs/Players/Leaderboards|Leaderboards (official)]]

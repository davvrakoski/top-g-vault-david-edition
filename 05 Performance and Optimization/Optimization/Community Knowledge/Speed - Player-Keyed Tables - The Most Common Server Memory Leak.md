---
area: "05 Performance and Optimization"
cluster: "Optimization"
title: "Speed - Player-Keyed Tables - The Most Common Server Memory Leak"
tags: [roblox, community-knowledge, optimization, memory, server, leaks, players]
cssclasses: [tg-a05]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/performance-optimization/improve
  - https://create.roblox.com/docs/reference/engine/classes/Workspace
  - https://create.roblox.com/docs/production/analytics/performance
---
# Speed - Player-Keyed Tables - The Most Common Server Memory Leak

Servers live for hours or days and see hundreds of players come and go. Any table that gains an entry on `PlayerAdded` and never loses it on `PlayerRemoving` grows forever, and it also keeps the `Player` object and everything it references alive. The Creator Hub uses exactly this pattern as its example of a script memory leak. It shows up as a steady climb in "Server memory by age" on the Performance dashboard. This note gives a pattern that makes the leak impossible to forget, and a check that proves it.

## Where these tables hide

Search your code for `[player]`, `[player.UserId]` and `[plr]`. Typical offenders:

- cooldowns and debounces: `lastAttack[player] = os.clock()`
- session state: `sessionData[player.UserId] = {...}`
- per-player connections: `conns[player] = player.CharacterAdded:Connect(...)`
- rate limiters, anti-cheat strike counters, trade requests, party invites
- caches in ModuleScripts that many systems share

Keying by `UserId` (a number) does not hold the Player alive, but the entry and its nested tables still leak.

## Engine help (and its limit)

The engine does not automatically destroy the `Player` object or old characters, so connections on them stay alive. Setting `Workspace.PlayerCharacterDestroyBehavior` to enabled makes the engine call `Destroy()` on the old character when it is replaced and on the `Player` when they leave, which disconnects events on those instances. It cannot clean your Luau tables. Those are always your job.

## The pattern: one registry, one cleanup path

Make every per-player table register a cleanup with one module, so `PlayerRemoving` is handled in one place.

```lua
-- ReplicatedStorage/Shared/PlayerScope.lua (server use)
local Players = game:GetService("Players")
local PlayerScope = {}
local stores = {} -- name -> table keyed by Player

function PlayerScope.table(name: string)
	local t = {}
	stores[name] = t
	return t
end

Players.PlayerRemoving:Connect(function(player)
	task.defer(function() -- let other PlayerRemoving handlers read first
		for _, t in stores do
			local v = t[player]
			if typeof(v) == "RBXScriptConnection" then v:Disconnect() end
			t[player] = nil
		end
	end)
end)

function PlayerScope.debugCounts()
	local out = {}
	for name, t in stores do
		local n = 0
		for _ in t do n += 1 end
		out[name] = n
	end
	return out
end

return PlayerScope
```

Usage: `local lastAttack = PlayerScope.table("Combat.lastAttack")`. Nobody writes their own cleanup, so nobody forgets it.

Deferring matters: save systems often read session state in their own `PlayerRemoving` handler; clearing it in the same frame races them.

## Prove it: the empty-server check

1. Start a local server with 4 test players in Studio.
2. Leave with all of them (close the client windows).
3. On the server, print `PlayerScope.debugCounts()`: every count must be 0.
4. Repeat 20 join/leave cycles and watch `LuaHeap` and `InstanceCount` in the server Developer Console. They should return to the same baseline, not step up each cycle.

Add the count check to your soak test so a new system that bypasses the registry fails fast.

## Pitfalls

- Weak-keyed tables (`__mode = "k"`) with Player keys are not a fix: the Player may be kept alive elsewhere, and the cleanup timing is unpredictable. Explicit removal is clearer.
- Closures stored per player (for example in a UI or tool system) capture upvalues; clear the table that holds the closure, not just the data.
- `BindToClose` paths still need saving; clearing tables early can drop unsaved data.
- Iterating a table that only grows also gets slower over time, so a leak is a CPU problem too.

## Related
[[Optimization - Hub]] · [[Memory Leaks and Lifecycle Management]] · [[Signals, Connections and Leak-Proof Cleanup]] · [[Soak Tests - Long-Session Memory and Leak Checks]] · [[Weak Tables and Instance Caches in Luau]]

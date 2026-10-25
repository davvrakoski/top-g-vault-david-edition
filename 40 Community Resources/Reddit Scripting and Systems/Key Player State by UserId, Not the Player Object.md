---
area: "40 Community Resources"
cluster: "Reddit Scripting and Systems"
source_note: "community/reddit-scripting/key-state-by-userid"
title: "Key Player State by UserId, Not the Player Object"
tags: [roblox, community, reddit, "cluster/reddit-scripting-and-systems"]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/be-careful-using-player-instances-instead-of-userid-can-cause-duplicate-state/4922846
cssclasses: [tg-a40]
---

# Key Player State by UserId, Not the Player Object

An Oct 2026 PSA by @Yarik_superpro (950+ views) sparked a useful argument about using `Player` instances as table keys.

## The fact

- One user can have **more than one `Player` instance** in the same server over time: they leave, your code still holds the old instance, they rejoin and get a **new** instance.
- Both instances have the same `UserId`, but `oldPlayer == newPlayer` is false.
- Any table keyed by `Player` can then hold **two entries for one person**.

## The pushback (also correct)

- @baseparts: if you clean up on `PlayerRemoving`, the old entry is gone, so this is really a **memory leak** symptom.
- @Plixby9601: the normal shape (save, then `data[player] = nil` on leave) already avoids it. Session locking handles cross-server duplicates.

## What to take from it

The problem appears when cleanup is late or async:
- `PlayerRemoving` yields on a save, the player rejoins quickly, and `PlayerAdded` creates a fresh entry before the old one is cleared.
- Long-lived systems (matchmaking queues, party lists, cooldown maps) forget to remove the player at all.

Using `UserId` as the key makes the rejoin collide with the old entry, so you can detect and handle it on purpose.

```lua
local Players = game:GetService("Players")

local state: {[number]: {joinedAt: number, leaving: boolean}} = {}

Players.PlayerAdded:Connect(function(player)
	local existing = state[player.UserId]
	if existing and existing.leaving then
		-- Quick rejoin while the old session is still saving:
		-- wait for it to finish (or reuse it) instead of creating a duplicate.
		while state[player.UserId] and state[player.UserId].leaving do
			task.wait(0.1)
		end
	end
	state[player.UserId] = {joinedAt = os.clock(), leaving = false}
end)

Players.PlayerRemoving:Connect(function(player)
	local entry = state[player.UserId]
	if not entry then return end
	entry.leaving = true
	-- saveAsync(player.UserId) -- yields
	state[player.UserId] = nil
end)
```

Rule of thumb: **Player instance for live engine calls; UserId for any table that outlives a frame.**

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Reddit Scripting and Systems - Hub]]

**Related notes:** [[Player and Character Lifecycle Without Race Conditions]] · [[Memory Leaks and Lifecycle Management]] · [[Data Not Saving on Leave - Help Thread Patterns]] · [[Players]]

<!-- TDOD_GRAPH_END -->

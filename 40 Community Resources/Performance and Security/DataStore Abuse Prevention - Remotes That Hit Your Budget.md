---
area: "40 Community Resources"
cluster: "Performance and Security"
source_note: "community/performance-security/datastore-abuse-prevention"
title: "DataStore Abuse Prevention - Remotes That Hit Your Budget"
tags: [roblox, community, "cluster/performance-and-security", security, datastore, remotes]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/player-spamming-datastore/3229838
  - https://create.roblox.com/docs/cloud-services/data-stores/error-codes-and-limits
  - https://create.roblox.com/docs/cloud-services/data-stores/best-practices
---
# DataStore Abuse Prevention - Remotes That Hit Your Budget

Exploiters can't call DataStoreService. **Your remotes can.** Any RemoteEvent or RemoteFunction whose handler calls `GetAsync`, `SetAsync`, `UpdateAsync` or `GetSortedAsync` hands a spammer a lever on the server's **shared** request budget. When that budget runs out, real saves start to queue and fail, for everyone in that server.

## The case that keeps coming up

Ryguy903 (DevForum, Oct 2024) reported one player repeatedly flooding the game's DataStores, `GetSortedAsync` included. The suspect: remotes that returned inventory and coins by calling DataStore2 `:Get()` on each request. They had also expected Roblox to warn about remote spam. Seargent pointed out that **no such warning exists**; you have to build your own. The fix that was accepted came from erin5: **load data once on join, serve it from server memory, and refresh leaderboards on a timer** rather than on request.

## Why it hurts so fast (official numbers)

Default per-server budgets from the Creator Hub limits page (version mirrored in this vault):

| Request type | Requests per minute |
|---|---|
| Standard Read / Write | 60 + numPlayers × 40 |
| Standard List | 5 + numPlayers × 2 |
| Ordered Write | 30 + numPlayers × 5 |
| **Ordered List (`GetSortedAsync`)** | **5 + numPlayers × 2** |

`GetSortedAsync` has the **smallest** budget. A leaderboard remote that one player can trigger whenever they like will drain it within seconds in a small server. Other limits to design around: keys and store names max **50 characters**, values max **4,194,304 characters** per key, plus per-key throughput limits counted over the last 60 seconds and rounded up to the next KB. Budgets can change. Read `DataStoreService:GetRequestBudgetForRequestType()` at runtime instead of hard-coding them.

## Rules

1. **No remote ever triggers a DataStore call directly.** Remotes read and write an in-memory profile. A server loop (autosave, leave, BindToClose) does the actual saving.
2. **Leaderboards are cached server-side.** Fetch on a timer, for example every 60 seconds, and return the cached page to everyone who asks.
3. **Keys are never built from client strings.** Use the `UserId` the engine passes to the handler (`"Player_" .. player.UserId`), never a name or id the client sends.
4. **Validate before storing.** Check types and clamp numbers. Cap string lengths and table sizes, so a client can't grow its own saved data toward the 4 MB limit.
5. **Store user text raw and filter it when you display it.** See [[Text Filtering in Practice - Pet Names, Signs and Offline Authors]].
6. **Rate-limit per player** anyway, as defence in depth (see [[Remote Rate Limiting Pattern]]).

## Original leaderboard cache

```lua
-- ServerScriptService/LeaderboardCache (Script)
local DataStoreService = game:GetService("DataStoreService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local store = DataStoreService:GetOrderedDataStore("Wins_v1")
local REFRESH_SECONDS = 60
local cachedTop = {} -- array of {userId, value}

local function refresh()
	local ok, pages = pcall(store.GetSortedAsync, store, false, 50)
	if not ok then return end -- keep the old cache on failure
	local fresh = {}
	for _, entry in pages:GetCurrentPage() do
		table.insert(fresh, { tonumber(entry.key), entry.value })
	end
	cachedTop = fresh
end

task.spawn(function()
	while true do
		refresh()
		task.wait(REFRESH_SECONDS)
	end
end)

-- Clients ask as often as they like: the answer never touches the DataStore.
local getTop = ReplicatedStorage:WaitForChild("GetLeaderboard") :: RemoteFunction
getTop.OnServerInvoke = function()
	return cachedTop
end
```

Every server in your game runs this refresh, so the total `GetSortedAsync` load grows with the number of servers, not with players spamming the remote. That's what you want.

## Credits

DevForum: Ryguy903, erin5, Seargent, HeCatchThose (*Player Spamming Datastore*, 2024). Roblox Creator Hub, *Data store error codes and limits* and *Best practices for data stores* (CC BY 4.0). The code above is original.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Performance and Security - Hub]]

**Related notes:** [[DataStore Session Locking, Retries, Versioning and Erasure]] · [[DataStore Production Patterns]] · [[Data store error codes and limits]] · [[Remote Rate Limiting Pattern]] · [[Anti-Dupe Transaction Blueprint]]

<!-- TDOD_GRAPH_END -->

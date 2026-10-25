---
area: "04 Networking Data and Servers"
cluster: "Data Backend"
title: "Weekly and Seasonal Leaderboards with OrderedDataStore"
tags: [roblox, community-knowledge, data-backend, leaderboards, ordereddatastore]
cssclasses: [tg-a04]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/OrderedDataStore
  - https://create.roblox.com/docs/cloud-services/data-stores/error-codes-and-limits
  - https://devforum.roblox.com/t/scripting-weekly-leaderboards/167179
  - https://devforum.roblox.com/t/2639999
  - https://devforum.roblox.com/t/how-would-i-reset-my-ods-daily/377129
---
# Weekly and Seasonal Leaderboards with OrderedDataStore

All-time leaderboards freeze after a few months: the top 100 is full of players who quit long ago and new players never see their name. Time-boxed boards (daily, weekly, season) give every player a fresh shot and a reason to come back on reset day. There is no "reset" button for an OrderedDataStore, so the community pattern is to **write each period into a new store name or scope** and let old periods go cold.

## Facts that drive the design

- `OrderedDataStore` values must be **integers**. Store decimals by scaling (time in milliseconds, cash x100).
- `GetSortedAsync(ascending, pageSize, minValue, maxValue)` returns `DataStorePages`; `pageSize` defaults to 50 and the maximum is **100**.
- Per-server budgets for ordered stores (limits page, check before shipping): `OrderedRead 60 + numPlayers x 40`, `OrderedWrite 30 + numPlayers x 5`, `OrderedList` (GetSortedAsync) `5 + numPlayers x 2` per minute. The list budget is the tight one: an 8-player server gets about 21 list calls a minute.
- Throttled calls wait in a queue of 30; past that, requests fail with codes in the 301-306 range.

## Period keys

Build the store name from a period ID computed on the server with UTC time, never from the client:

```lua
local DataStoreService = game:GetService("DataStoreService")
local WEEK = 7 * 24 * 3600
local EPOCH_MONDAY = 345600 -- 1970-01-05 00:00 UTC, a Monday

local function weekId(t: number): number
	return (t - EPOCH_MONDAY) // WEEK
end

local function weeklyStore(t: number?)
	local id = weekId(t or os.time())
	return DataStoreService:GetOrderedDataStore("Kills_W" .. id)
end
```

The DevForum threads split between changing the **name** (`Kills_W2860`) and changing the **scope** (`GetOrderedDataStore("Kills", "W2860")`). Both work; scope keeps the Data Stores Manager list shorter. Pick one and document it.

## Writing scores without burning budget

1. Keep each player's period score in their session data while they play.
2. Flush to the ordered store on a timer (every 60-120 s per player, staggered) and on leave, not on every kill.
3. For "best run" boards use `UpdateAsync` and only write when the new value beats the stored one; for "total this week" use `IncrementAsync` with the delta since the last flush.
4. If the week rolled over between flushes, write the delta to the week it was earned in (stamp deltas with the week ID when earned).

## Reading the board

- Fetch **one page of the top 50-100** on a single server timer (every 60-120 s), cache it in a table and push it to clients with a RemoteEvent or attributes. Never let clients request a refresh.
- Fetch the previous week's final top 10 once per server start for the "last week's champions" sign and for reward payouts.
- Keys are usually `tostring(userId)`; resolve names with `Players:GetNameFromUserIdAsync` or `UserService:GetUserInfosByUserIdsAsync` and cache them.

## Paying out period rewards

Do not run payouts from "whoever is online at midnight". Instead, when a player joins, check their saved `lastClaimedWeek`; if an earlier week is unclaimed, read that week's store (`GetAsync` on their key, plus your cached final top-N) and grant the reward inside the same session-locked save. This makes payouts idempotent and offline-safe.

## Cleaning up

Old stores still count toward storage. Delete retired period stores from the Data Stores Manager or with Open Cloud in a maintenance script, rather than looping `RemoveAsync` from a live server (the threads warn this eats your write budget).

## Pitfalls

- Using `os.date("*t")` (local server timezone) instead of `os.date("!*t")` or raw `os.time()` arithmetic. Servers in different regions then disagree on the week.
- Writing floats: they are rejected. Scale to integers.
- Asking for the player's own rank: `GetSortedAsync` cannot look up one key's rank. Show "Top 100" plus the player's own score, or show "not ranked" outside the cached page.
- Using `minValue` filters to hide zero scores is cheap and keeps idle players off the board.

## Related
[[Data Backend - Hub]] - [[Leaderboard Blueprint]] - [[DataStore Production Patterns]] - [[DataStore Session Locking, Retries, Versioning and Erasure]]

---
area: "04 Networking Data and Servers"
cluster: "Data Backend"
title: "MemoryStore HashMap Patterns and Quota Math"
tags: [roblox, community-knowledge, data-backend, memorystore, hashmap, quotas]
cssclasses: [tg-a04]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/cloud-services/memory-stores
  - https://create.roblox.com/docs/cloud-services/memory-stores/hash-map
  - https://create.roblox.com/docs/cloud-services/memory-stores/per-partition-limits
  - https://create.roblox.com/docs/reference/engine/classes/MemoryStoreHashMap
---
# MemoryStore HashMap Patterns and Quota Math

The hash map is the newest and most forgiving MemoryStore structure, but most tutorials still only show queues and sorted maps. If you need cross-server state looked up **by key** (which server is a player in, how many people joined an event, who holds a lock), a hash map is usually the right tool because it spreads items across many partitions instead of piling every request onto one. This note is the cheat sheet: limits, quota math and four patterns.

## Limits (from the docs, recheck before launch)

| Limit | Value |
| --- | --- |
| Key size / value size | 128 characters / 32 KB |
| Max expiration | 45 days (3,888,000 s) |
| Memory quota (whole game) | 64 KB + 1.2 KB x users; drops only after an 8-day lookback |
| Request units (whole game) | 1000 + 120 x concurrent users per minute |
| Per partition | throttling starts near 30,000 request units/min |
| Per hash map key | about 5,000 write and 15,000 read units/min |

Sorted maps and queues each live on **one** partition; a hash map spreads items across many. That is why a single global "online players" sorted map can throttle at scale while a hash map keyed by userId does not.

**Quota math example:** 2,000 concurrent users gives 1000 + 240,000 = 241,000 request units/min across all servers. A 20-player server is "worth" about 2,400 units/min plus its share of the 1,000 base. Budget your heartbeats against that, not against a single server.

## Pattern 1: presence registry ("where is my friend?")

```lua
local MSS = game:GetService("MemoryStoreService")
local presence = MSS:GetHashMap("Presence")

local function heartbeat(player: Player)
	pcall(function()
		presence:SetAsync(tostring(player.UserId), game.JobId, 120)
	end)
end
-- call every 60 s per player (staggered) and RemoveAsync on PlayerRemoving
```

Short expiration is the safety net: if a server crashes, entries vanish in two minutes instead of lingering.

## Pattern 2: global counter with sharding

One hot key ("total eggs hatched") will hit the per-key write limit. Split it: write to `counter_<random 1-16>` with `UpdateAsync(key, function(old) return (old or 0) + delta end, ttl)`, and read by summing the 16 keys on a slow timer. Batch increments locally and flush every few seconds.

## Pattern 3: short-lived locks and leases

`UpdateAsync` on a hash map key gives compare-and-set. Return `nil` from the transform to cancel when someone else holds the lease:

```lua
local function tryLease(map, key: string, owner: string, ttl: number): boolean
	local ok, result = pcall(function()
		return map:UpdateAsync(key, function(current)
			if current ~= nil and current ~= owner then
				return nil -- someone else holds it
			end
			return owner
		end, ttl)
	end)
	return ok and result == owner
end
```

Use it for "only one server runs the hourly event announcer" or "one server at a time edits clan X".

## Pattern 4: cache in front of a DataStore

For read-heavy global data (a clan's banner, an event config), cache the DataStore value in a hash map with a 1-5 minute TTL. Servers read the hash map first and fall back to the DataStore. Persistent truth stays in the DataStore.

## Pitfalls

- Treating MemoryStore as storage. It evicts by TTL and can be flushed; always keep the real record in a DataStore.
- Long default TTLs. Memory quota is game-wide; an over-full store makes every write that grows memory fail with `TotalMemoryOverLimit`.
- `ListItemsAsync` costs scanned partitions plus items returned; do not use it every frame or from many servers at once.
- Studio and live memory stores are isolated, so a Studio test does not prove the live quota is fine.
- Watch the **observability dashboard** for `PartitionRequestsOverLimit`, the sign that a key needs sharding.

## Related
[[Data Backend - Hub]] - [[MemoryStore Queues and Sorted Maps for Matchmaking]] - [[DataStore vs MemoryStore vs Messaging vs Configs]] - [[MessagingService Cross-Server Patterns and Limits]]

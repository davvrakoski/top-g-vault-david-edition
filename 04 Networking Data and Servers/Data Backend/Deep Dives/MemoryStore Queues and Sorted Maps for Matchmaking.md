---
area: "04 Networking Data and Servers"
cluster: "Data Backend"
title: "MemoryStore Queues and Sorted Maps for Matchmaking"
tags: [deep-dive, roblox, memorystore, matchmaking, sorted-map, queue, cross-server]
verified: 2026-10-25
cssclasses: [tg-a04]
---

# MemoryStore Queues and Sorted Maps for Matchmaking

**Why this matters:** a lobby-to-match flow (ranked 1v1, 4-player squads, raid parties) needs a shared, fast, cross-server waiting room, and `MemoryStoreService` is the only Roblox-native tool built for that.
This note designs a complete skill-based matchmaker on memory stores: tickets in a sorted map, a leader lease so only one server matches at a time, atomic claims, reserved servers, and the request-unit math that tells you whether it will scale.

For the decision between DataStores, MemoryStores and MessagingService, see [[DataStore vs MemoryStore vs Messaging vs Configs]].

Note: Roblox also has a built-in **server matchmaking** system (configurable signals and scoring for which public server a player joins, under Creator Dashboard matchmaking settings). That chooses public servers; it does not build custom lobbies or ranked matches. This note is about the custom case.

---

## 1. Memory store facts that drive the design (as of 2026, check the docs)

From the memory stores reference:

- Three structures: **sorted map** (key + value + optional sort key, ordered), **queue** (FIFO with optional priority, read-with-invisibility), **hash map** (key-value, spread across partitions).
- **Memory quota** per game: `64 KB + 1.2 KB x concurrent users`. Exceeding it makes size-increasing requests fail (`TotalMemoryOverLimit`).
- **Request units** per game: `1000 + 120 x concurrent users` per minute. Most calls cost 1 unit; `GetRangeAsync` and `ReadAsync` cost one unit **per item returned** (minimum 1; `ReadAsync` also costs an extra unit every 2 seconds while it waits); hash map `UpdateAsync` costs at least 2.
- **Per-partition throttling** starts around **30,000 units per minute** on a single partition. A sorted map or queue lives on **one** partition; a hash map spreads across many (with a per-key limit of about 5,000 writes and 15,000 reads per minute).
- Per structure: max 1,000,000 items and 100 MB. Values up to **32 KB**. Sorted map keys and sort keys up to **128 characters**.
- Expiration is required per item, **maximum 45 days (3,888,000 s)**. Studio and live memory stores are isolated from each other. `MemoryStoreService` can only be called from the server, in a published place.
- `UpdateAsync` transforms retry on conflict and **cancel when they return nil**; like DataStore transforms they must not yield.

Design consequences: keep tickets small, give everything short expirations, refresh what must live, and put hot per-player lookups in a **hash map**, not the sorted map.

---

## 2. Architecture

```
Lobby servers (many)                     Memory stores                      Leader (one lobby at a time)
-------------------                      -------------                      ----------------------------
player clicks Queue  --SetAsync------>  SortedMap "MM_Tickets_Ranked1v1"
                                         key=userId, sortKey=rating
heartbeat every 20s  --SetAsync------>  (refresh ticket expiry)
                                                                       <--- GetRangeAsync(Ascending, 200)
                                                                            group by rating window
                                                                       ---> UpdateAsync claim each ticket
                                                                            ReserveServerAsync(matchPlace)
                                         HashMap "MM_Assign"            <--- SetAsync(userId -> accessCode)
                                         HashMap "MM_Matches"           <--- SetAsync(privateServerId -> roster)
                                                                       ---> RemoveAsync claimed tickets
poll own waiting players --GetAsync--->  HashMap "MM_Assign"
TeleportAsync(matchPlace, {player}, ReservedServerAccessCode)

Match server: reads MM_Matches[game.PrivateServerId], kicks anyone not on the roster.
```

Why a **sorted map** for tickets instead of a queue: skill matching needs "players near rating R", which is a range scan over an ordered structure. A queue is better for pure FIFO ("first 8 players in, start a round") and its invisibility timeout gives at-least-once processing; section 7 shows that variant.

---

## 3. Lobby side: enqueue, heartbeat, cancel, receive

```luau
--!strict
-- ServerScriptService/Services/QueueClient.luau (runs in lobby places)
local MemoryStoreService = game:GetService("MemoryStoreService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

local MODE = "Ranked1v1"
local MATCH_PLACE_ID = 0 -- set to your match place id
local TICKET_TTL = 60 -- seconds; refreshed while waiting
local HEARTBEAT = 20

local tickets = MemoryStoreService:GetSortedMap("MM_Tickets_" .. MODE)
local assignments = MemoryStoreService:GetHashMap("MM_Assign")

type Ticket = { userId: number, rating: number, lobbyJobId: string, since: number }

local waiting: { [Player]: Ticket } = {}

local QueueClient = {}

local function writeTicket(t: Ticket): boolean
	local ok, err = pcall(function()
		tickets:SetAsync(tostring(t.userId), t, TICKET_TTL, t.rating)
	end)
	if not ok then
		warn("[Queue] ticket write failed:", err)
	end
	return ok
end

function QueueClient.Join(player: Player, rating: number): boolean
	if waiting[player] then
		return true
	end
	local t: Ticket = { userId = player.UserId, rating = rating, lobbyJobId = game.JobId, since = os.time() }
	if writeTicket(t) then
		waiting[player] = t
		return true
	end
	return false
end

function QueueClient.Leave(player: Player)
	if not waiting[player] then
		return
	end
	waiting[player] = nil
	pcall(function()
		tickets:RemoveAsync(tostring(player.UserId))
	end)
end

function QueueClient.Start()
	Players.PlayerRemoving:Connect(QueueClient.Leave)

	-- Heartbeat: keep tickets alive only while their lobby is alive.
	-- UpdateAsync, NOT SetAsync: a ticket the leader already removed (matched) must
	-- never be recreated, and a claimed ticket must keep its claimedBy field.
	local function refreshTicket(t: Ticket)
		pcall(function()
			tickets:UpdateAsync(tostring(t.userId), function(value, sortKey)
				if value == nil then
					return nil -- matched or expired: do not recreate
				end
				return value, sortKey -- unchanged rewrite refreshes the expiry
			end, TICKET_TTL)
		end)
	end

	task.spawn(function()
		while true do
			task.wait(HEARTBEAT)
			for _, t in waiting do
				task.spawn(refreshTicket, t)
			end
		end
	end)

	-- Poll assignments for players we are holding.
	task.spawn(function()
		while true do
			task.wait(2)
			for player, _ in waiting do
				task.spawn(function()
					local ok, assignment = pcall(function()
						return assignments:GetAsync(tostring(player.UserId))
					end)
					if not ok or not assignment or waiting[player] == nil then
						return
					end
					waiting[player] = nil
					pcall(function()
						assignments:RemoveAsync(tostring(player.UserId))
					end)
					local options = Instance.new("TeleportOptions")
					options.ReservedServerAccessCode = assignment.accessCode
					local tpOk, tpErr = pcall(function()
						TeleportService:TeleportAsync(MATCH_PLACE_ID, { player }, options)
					end)
					if not tpOk then
						warn("[Queue] teleport failed:", tpErr) -- retry policy: see TeleportService note
					end
				end)
			end
		end
	end)
end

return QueueClient
```

Points to notice:

- The ticket's **expiry is the crash detector**. If a lobby server dies, it stops refreshing, and its tickets disappear within `TICKET_TTL` instead of producing matches with players who are gone.
- The ticket key is the **UserId**, so re-queueing overwrites instead of duplicating.
- Assignment polling uses the **hash map**, which spreads per-key reads across partitions instead of hammering the single-partition sorted map. A MessagingService publish can be added as a fast path, but memory stores remain the reliable path, because MessagingService delivery is best effort ([[MessagingService Cross-Server Patterns and Limits]]).

---

## 4. Leader election with a lease

Only one server should run the matching pass at a time, or two leaders will try to claim the same tickets every cycle.

```luau
--!strict
local MemoryStoreService = game:GetService("MemoryStoreService")
local leases = MemoryStoreService:GetHashMap("MM_Leader")

local LEASE_SECONDS = 10

local function tryHoldLease(mode: string): boolean
	local held = false
	local ok = pcall(function()
		leases:UpdateAsync(mode, function(current)
			local now = os.time()
			if current == nil or current.jobId == game.JobId or current.expires < now then
				held = true
				return { jobId = game.JobId, expires = now + LEASE_SECONDS }
			end
			held = false
			return nil -- someone else holds a live lease
		end, LEASE_SECONDS * 2)
	end)
	return ok and held
end
```

Every lobby calls `tryHoldLease` every few seconds; only the holder runs the pass. If the leader crashes, its lease expires and another lobby takes over within `LEASE_SECONDS`. Server clocks (`os.time()`) are close enough for a 10-second lease; do not use leases for sub-second coordination.

---

## 5. The matching pass (leader only)

```luau
--!strict
local MemoryStoreService = game:GetService("MemoryStoreService")
local TeleportService = game:GetService("TeleportService")

local MATCH_SIZE = 2
local BASE_WINDOW = 50 -- rating points
local WINDOW_GROWTH = 10 -- extra points per second waited
local MAX_WINDOW = 400

local function windowFor(since: number, now: number): number
	return math.min(MAX_WINDOW, BASE_WINDOW + WINDOW_GROWTH * (now - since))
end

local function claim(tickets: MemoryStoreSortedMap, userId: number, matchId: string): boolean
	local claimed = false
	pcall(function()
		tickets:UpdateAsync(tostring(userId), function(value, sortKey)
			if value == nil or value.claimedBy ~= nil then
				claimed = false
				return nil -- cancelled by the player, or already claimed
			end
			value.claimedBy = matchId
			claimed = true
			return value, sortKey
		end, 30)
	end)
	return claimed
end

local function unclaim(tickets: MemoryStoreSortedMap, userId: number, matchId: string)
	pcall(function()
		tickets:UpdateAsync(tostring(userId), function(value, sortKey)
			if value and value.claimedBy == matchId then
				value.claimedBy = nil
				return value, sortKey
			end
			return nil
		end, 60)
	end)
end

local function runPass(mode: string, matchPlaceId: number)
	local tickets = MemoryStoreService:GetSortedMap("MM_Tickets_" .. mode)
	local assignments = MemoryStoreService:GetHashMap("MM_Assign")
	local matches = MemoryStoreService:GetHashMap("MM_Matches")

	local ok, items = pcall(function()
		return tickets:GetRangeAsync(Enum.SortDirection.Ascending, 200)
	end)
	if not ok or not items then
		return
	end

	local now = os.time()
	local i = 1
	while i <= #items - (MATCH_SIZE - 1) do
		local first = items[i]
		local group = { first }
		local window = windowFor(first.value.since, now)
		for j = i + 1, #items do
			if #group == MATCH_SIZE then
				break
			end
			local candidate = items[j]
			if candidate.value.claimedBy == nil and (candidate.sortKey - first.sortKey) <= window then
				table.insert(group, candidate)
			end
		end

		if #group < MATCH_SIZE then
			i += 1
			continue
		end

		local matchId = game:GetService("HttpService"):GenerateGUID(false)
		local claimedIds: { number } = {}
		local allClaimed = true
		for _, item in group do
			if claim(tickets, item.value.userId, matchId) then
				table.insert(claimedIds, item.value.userId)
			else
				allClaimed = false
				break
			end
		end

		if not allClaimed then
			for _, userId in claimedIds do
				unclaim(tickets, userId, matchId)
			end
			i += 1
			continue
		end

		local reserved, accessCode, privateServerId = pcall(function()
			return TeleportService:ReserveServerAsync(matchPlaceId)
		end)
		if not reserved then
			for _, userId in claimedIds do
				unclaim(tickets, userId, matchId)
			end
			i += 1
			continue
		end

		pcall(function()
			matches:SetAsync(privateServerId, { matchId = matchId, mode = mode, roster = claimedIds }, 600)
		end)
		for _, userId in claimedIds do
			pcall(function()
				assignments:SetAsync(tostring(userId), { accessCode = accessCode, matchId = matchId }, 60)
			end)
			pcall(function()
				tickets:RemoveAsync(tostring(userId))
			end)
		end

		i += MATCH_SIZE
	end
end
```

Design notes:

- **Widening window.** New tickets match only close ratings; the longer someone waits, the wider their acceptable range, so nobody waits forever in a thin population.
- **Claim before reserve.** `UpdateAsync` on each ticket guarantees a ticket cancelled by its lobby (removed) or already claimed is not used. If any claim fails, everything is rolled back.
- **Roster stored by `PrivateServerId`.** `ReserveServerAsync` returns an access code and the server's `PrivateServerId`, which is constant for all instances of that reserved server. The match server reads `MM_Matches[game.PrivateServerId]` and can reject anyone not on the roster.
- **Short expirations everywhere.** Assignments expire after 60 s; rosters after 10 minutes. Memory quota is shared by the whole game.

---

## 6. Capacity math for your game

Assume 3,000 concurrent users, 600 waiting in this mode:

| Activity | Units per minute |
| --- | --- |
| Ticket heartbeats: 600 every 20 s | 1,800 |
| Leader `GetRangeAsync` returning 200 items every 2 s | 6,000 |
| Claims + removes for ~150 matches/min (2 players) | ~600 |
| Assignment polling: 600 players every 2 s (hash map) | 18,000 |
| Lease updates: 50 lobbies every 5 s (hash map, min 2 units) | 1,200 |
| **Total** | **~27,600** |

Game-level budget: `1000 + 120 x 3000 = 361,000` units/min, so comfortable. The constraint that matters is **per partition**: the tickets sorted map sees about 8,400 units/min (heartbeats + range reads + claims), well under the ~30,000 partition guideline. Polling is the largest line, which is exactly why it lives in a hash map. If a single mode grows past the partition guideline, **shard** tickets by region or rating band (`MM_Tickets_Ranked1v1_EU`, `_NA`).

Watch the memory store observability dashboard for `PartitionRequestsOverLimit` and `TotalRequestsOverLimit`, and back off exponentially on throttling.

---

## 7. Variant: simple FIFO with a queue

For "first N players start a round" without skill:

```luau
local queue = MemoryStoreService:GetQueue("MM_Casual", 30) -- invisibility timeout 30 s

-- Lobby: enqueue
queue:AddAsync({ userId = player.UserId, lobbyJobId = game.JobId }, 120)

-- Leader: read exactly 8 or nothing, wait up to 5 s
local items, readId = queue:ReadAsync(8, true, 5)
if items and #items == 8 then
	-- reserve server, write assignments...
	queue:RemoveAsync(readId) -- only after success
end
-- If the leader crashes before RemoveAsync, the items become visible again
-- after the invisibility timeout and are processed by the next leader.
```

The read-invisibility-remove cycle gives **at-least-once** processing. Make the processing idempotent (an assignment written twice is harmless) and remember that a cancelled player's item may still be in the queue; check the lobby still holds them before teleporting.

---

## 8. Testing

- Memory stores work in Studio with a separate, isolated namespace; Team Test with several clients exercises the flow, but `TeleportService` does not work in Studio, so test the teleport step in a published test place.
- Simulate load with fake tickets (bots) written by a test script, with distinct UserId-like keys, short TTLs, and a cleanup pass.
- If you fill quota in testing, the Open Cloud **Flush Memory Store** endpoint clears all memory stores in a scope (`TEST` or `LIVE`). Flushing `LIVE` deletes live matchmaking data too.

---

## Common mistakes

- Using a DataStore for the waiting room (slow, throttled, and leaves stale tickets).
- Tickets without expirations, so crashed lobbies leave ghosts that get matched.
- Refreshing tickets with `SetAsync`, which resurrects tickets the leader just matched and removed (double matches).
- Every lobby running the matching pass, double-claiming tickets.
- Polling assignments from the sorted map, overloading its single partition.
- Long expirations "to be safe", eating the shared memory quota.
- Yielding inside `UpdateAsync` transforms.
- Trusting `TeleportData` for the roster; it is client-visible and unencrypted.
- Not handling `ReserveServerAsync` failure, leaving players claimed but never assigned.

## Checklist

- [ ] Tickets keyed by UserId (or party ID), small, with short TTL refreshed by heartbeat.
- [ ] One leader per mode via an expiring lease.
- [ ] Claims via `UpdateAsync` with full rollback on partial failure.
- [ ] Reserved server roster stored by `PrivateServerId` and enforced on the match server.
- [ ] Per-player lookups in a hash map; sorted map traffic under the partition guideline.
- [ ] Capacity table computed for expected peak CCU.
- [ ] Throttle and quota errors back off; observability dashboard monitored.
- [ ] Teleport step tested in a published test place.

**Related:** [[Data Backend - Hub]] · [[DataStore vs MemoryStore vs Messaging vs Configs]] · [[Data, Saving and Cross-server Systems]] · [[Leaderboard Blueprint]] · [[Server Load Shedding]]

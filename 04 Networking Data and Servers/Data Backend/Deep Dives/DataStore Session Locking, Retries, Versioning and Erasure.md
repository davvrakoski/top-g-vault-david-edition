---
area: "04 Networking Data and Servers"
cluster: "Data Backend"
title: "DataStore Session Locking, Retries, Versioning and Erasure"
tags: [deep-dive, roblox, datastore, session-locking, gdpr, rtbf, persistence]
verified: 2026-10-25
cssclasses: [tg-a04]
---

# DataStore Session Locking, Retries, Versioning and Erasure

**Why this matters:** item duplication, rolled-back progress and "my data is gone" reports almost always trace to two servers holding the same player's data at once, a retry that double-applied a change, or a load failure that was treated as a new player.
This note gives a complete, session-locked player data module built on `UpdateAsync`, the retry rules that make it safe, how to use DataStore versioning for rollbacks, and how to meet right-to-be-forgotten (GDPR/CCPA) erasure with Roblox's automated templates.

Background notes: [[DataStore Production Patterns]] (principles), [[Save Schema Migrations]] (schema changes), [[Anti-Dupe Transaction Blueprint]] (trades). If you use a library such as ProfileStore, this note explains what it is doing for you and what to verify.

---

## 1. Limits that shape the design (as of 2026, check the docs)

From the Roblox data store limits page:

| Limit | Value |
| --- | --- |
| Value size per key | 4,194,304 characters (serialised JSON) |
| Data store name, key name, scope | 50 characters each |
| User metadata | 300 characters total |
| Per-key throughput (rolling 60 s) | Read 25 MB/min, write 4 MB/min (rounded up to the next KB per request) |
| Server request budget, standard stores | Read, Write, Remove: `60 + numPlayers x 40` per minute each; List: `5 + numPlayers x 2` |
| `UpdateAsync` | Consumes **both** read and write budget |
| Game storage | `500 MB + 1 MB x lifetime users`, measured on compressed latest versions |
| `GetAsync` cache | Values cached locally for **4 seconds**; use `DataStoreGetOptions.UseCache = false` to bypass |
| Version history | Old versions expire **30 days** after being overwritten; the latest never expires |
| Studio Run mode | Separate, possibly lower static limits |

Two documented behaviours matter most:

- **A failed write may still have succeeded.** The docs state that a failed `UpdateAsync` means the server did not get a success response, not that the write did not happen. Verify with a cache-bypassing read if the outcome matters.
- **The `UpdateAsync` transform can run more than once** (if another server wrote in between) and **must not yield**. Returning `nil` cancels the write.

---

## 2. Why session locking

Roblox's own player-data guide lists the scenarios: the old server's final save is retrying, throttled or queued, or delayed by a yielding `PlayerRemoving` handler, while the player has already joined a new server (common with teleports and fast rejoins). The new server loads **stale** data; whichever server saves last wins; items given or traded in between are duplicated or lost.

A **session lock** fixes this: the loading server atomically writes a lock in the same `UpdateAsync`, and every later write checks the lock is still its own.

---

## 3. The stored shape

```luau
-- What is actually written under key "u_<UserId>"
type Stored = {
	schemaVersion: number,
	data: SaveData,          -- your game's save table (see Types)
	lock: {                  -- nil when no server holds the player
		id: string,          -- GUID unique to this session
		jobId: string,       -- game.JobId of the holder, for debugging
		time: number,        -- os.time() of last refresh
	}?,
	lastSaved: number,
}
```

The lock lives **inside the value** (visible in Data Stores Manager and Open Cloud, no 300-character metadata limit); Roblox's sample uses key metadata instead. Both work.

---

## 4. The module

```luau
--!strict
-- ServerScriptService/Services/PlayerDataService.luau
local DataStoreService = game:GetService("DataStoreService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local STORE = DataStoreService:GetDataStore("PlayerData")
local CURRENT_SCHEMA = 3
local LOCK_EXPIRY = 600 -- seconds; must be much longer than AUTOSAVE_INTERVAL
local AUTOSAVE_INTERVAL = 90
local ACQUIRE_ATTEMPTS = 8
local ACQUIRE_WAIT = 4

export type Session = {
	player: Player,
	userId: number,
	lockId: string,
	data: { [string]: any },
	dirty: boolean,
	lost: boolean,     -- lock taken by another server: stop saving
	released: boolean,
}

local sessions: { [Player]: Session } = {}

local function keyFor(userId: number): string
	return "u_" .. userId
end

local function defaultData(): { [string]: any }
	return { coins = 0, level = 1, inventory = {}, purchases = {} }
end

local function migrate(schemaVersion: number, data: { [string]: any }): { [string]: any }
	-- Run each step in order; never skip. See Save Schema Migrations.
	if schemaVersion < 2 then
		data.inventory = data.inventory or {}
	end
	if schemaVersion < 3 then
		data.purchases = data.purchases or {} -- receipt ids, for idempotent purchases
	end
	return data
end

-- Bounded exponential backoff with jitter. Only for operations that are safe to repeat.
local function retry<T>(label: string, attempts: number, fn: () -> T): (boolean, T | string)
	local delaySeconds = 1
	local lastErr = ""
	for attempt = 1, attempts do
		local ok, result = pcall(fn)
		if ok then
			return true, result
		end
		lastErr = tostring(result)
		warn(("[PlayerData] %s attempt %d/%d failed: %s"):format(label, attempt, attempts, lastErr))
		if attempt < attempts then
			task.wait(delaySeconds + math.random() * 0.5)
			delaySeconds = math.min(delaySeconds * 2, 16)
		end
	end
	return false, lastErr
end

type AcquireStatus = "ok" | "locked" | "error"

local function tryAcquire(userId: number, lockId: string): (AcquireStatus, any)
	local status: AcquireStatus = "error"
	local ok, result = pcall(function()
		return STORE:UpdateAsync(keyFor(userId), function(old, keyInfo: DataStoreKeyInfo?)
			local now = os.time()
			-- old == nil only when the key truly does not exist (a real new player).
			local stored = old or {
				schemaVersion = CURRENT_SCHEMA,
				data = defaultData(),
				lock = nil,
				lastSaved = 0,
			}
			local lock = stored.lock
			if lock and lock.id ~= lockId and (now - lock.time) < LOCK_EXPIRY then
				status = "locked"
				return nil -- respect another server's live lock; cancel write
			end
			stored.lock = { id = lockId, jobId = game.JobId, time = now }
			status = "ok"
			local metadata = if keyInfo then keyInfo:GetMetadata() else nil
			-- Associate the UserId with the key (helps data requests and tooling).
			return stored, { userId }, metadata
		end)
	end)
	if not ok then
		return "error", result
	end
	return status, result
end

local PlayerDataService = {}

function PlayerDataService.Load(player: Player): Session?
	local lockId = HttpService:GenerateGUID(false)
	for attempt = 1, ACQUIRE_ATTEMPTS do
		local status, stored = tryAcquire(player.UserId, lockId)
		if player.Parent ~= Players then
			-- Left while we were loading. Release if we got the lock.
			if status == "ok" then
				task.spawn(function()
					pcall(function()
						STORE:UpdateAsync(keyFor(player.UserId), function(old)
							if old and old.lock and old.lock.id == lockId then
								old.lock = nil
								return old
							end
							return nil
						end)
					end)
				end)
			end
			return nil
		end
		if status == "ok" then
			local session: Session = {
				player = player,
				userId = player.UserId,
				lockId = lockId,
				data = migrate(stored.schemaVersion or 1, stored.data or defaultData()),
				dirty = (stored.schemaVersion or 1) < CURRENT_SCHEMA,
				lost = false,
				released = false,
			}
			sessions[player] = session
			return session
		end
		-- "locked": previous server is probably finishing its final save.
		-- "error": DataStores degraded. Both: wait and retry.
		task.wait(ACQUIRE_WAIT)
	end
	return nil -- caller kicks: never play on default data (see note on lifecycle)
end

-- Writes the full in-memory state. Full-state writes are idempotent, so retrying is safe.
local function write(session: Session, release: boolean): boolean
	if session.lost or session.released then
		return false
	end
	local lostLock = false
	local snapshot = table.clone(session.data) -- shallow copy taken BEFORE yielding
	local ok = retry("save " .. session.userId, 4, function()
		lostLock = false
		STORE:UpdateAsync(keyFor(session.userId), function(old, keyInfo: DataStoreKeyInfo?)
			if not old or not old.lock or old.lock.id ~= session.lockId then
				lostLock = true
				return nil -- someone else owns this player now: do NOT overwrite
			end
			old.schemaVersion = CURRENT_SCHEMA
			old.data = snapshot
			old.lastSaved = os.time()
			old.lock = if release then nil else { id = session.lockId, jobId = game.JobId, time = os.time() }
			local metadata = if keyInfo then keyInfo:GetMetadata() else nil
			return old, { session.userId }, metadata
		end)
	end)
	if lostLock then
		session.lost = true
		warn("[PlayerData] lock lost for", session.userId)
		if session.player.Parent == Players then
			session.player:Kick("Your data was opened in another server. Please rejoin.")
		end
		return false
	end
	if ok then
		session.dirty = false
		if release then
			session.released = true
		end
	end
	return ok
end

function PlayerDataService.Get(player: Player): Session?
	local s = sessions[player]
	if s and not s.lost then
		return s
	end
	return nil
end

function PlayerDataService.MarkDirty(player: Player)
	local s = sessions[player]
	if s then
		s.dirty = true
	end
end

-- Save now but keep the lock (before teleports, after purchases).
function PlayerDataService.SaveNow(player: Player): boolean
	local s = sessions[player]
	return if s then write(s, false) else false
end

function PlayerDataService.Release(player: Player): boolean
	local s = sessions[player]
	if not s then
		return true
	end
	local ok = write(s, true)
	sessions[player] = nil
	return ok
end

function PlayerDataService.Start()
	Players.PlayerRemoving:Connect(function(player)
		PlayerDataService.Release(player)
	end)

	-- Autosave: also refreshes the lock so it never expires while we hold the player.
	task.spawn(function()
		while true do
			task.wait(AUTOSAVE_INTERVAL)
			for _, s in sessions do
				-- Refresh even when not dirty, or the lock will expire after LOCK_EXPIRY.
				local budget = DataStoreService:GetRequestBudgetForRequestType(Enum.DataStoreRequestType.StandardWrite)
				if budget < 5 then
					task.wait(2) -- leave headroom for leave-saves and purchases
				end
				task.spawn(write, s, false)
			end
		end
	end)
end

PlayerDataService._sessions = sessions -- for BindToClose flushing only
return PlayerDataService
```

Shutdown flushing (`BindToClose`) is covered separately in [[BindToClose and Server Shutdown Save Flush]].

### Why these choices

- **`old == nil` is the only "new player" path**: with `UpdateAsync` it means the key truly does not exist, so an erroring read can never fall through to defaults.
- **Lock checked on every write**: if another server took over, we stop and kick instead of overwriting newer data.
- **Autosave refreshes the lock even when clean**, or a quiet player's lock expires mid-session.
- **Snapshot before yielding** (`table.clone`); deep-copy or replace sub-tables if you mutate nested data.
- **Lock expiry trade-off**: a crashed server locks the player out until `LOCK_EXPIRY`; shorter expiry risks a slow-but-alive server losing its lock. Some libraries shorten this with a MessagingService "please release" request.

---

## 5. Retry rules

| Operation | Safe to retry blindly? | Why |
| --- | --- | --- |
| `UpdateAsync` writing **full state** | Yes | Writing the same state twice is harmless. |
| `UpdateAsync` that **adds** (coins += 100) based on `old` | **No**, unless guarded | If the first attempt succeeded but reported failure, the retry adds again. Guard with an operation ID stored in the value (`purchases[receiptId] = true`). |
| `IncrementAsync` | **No** | Same double-apply risk; prefer in-memory state + full saves. |
| `GetAsync` | Yes | Reads are idempotent. |
| `RemoveAsync` | Yes | Removing twice is fine. |

For Developer Product purchases specifically: record the `PurchaseId` in the player's saved data, save, and only then return `PurchaseGranted` from `ProcessReceipt`. If the save fails, return `NotProcessedYet` so Roblox retries later. Roblox's player-data purchasing guide relies on session locking to make that check reliable ([[Save and Purchase Reliability Lab]]).

Errors in the **301-306** range mean a request queue was full and the request was dropped; back off harder. Watch the budget with `GetRequestBudgetForRequestType` before bulk operations, and keep a reserve for leave-saves.

---

## 6. Versioning: rollback without a backup system

Every `SetAsync`/`UpdateAsync`/`IncrementAsync` creates a version. Old versions are kept for 30 days after being overwritten. Use this for support tickets ("my inventory vanished yesterday"):

```luau
--!strict
-- Admin-only tool (run from the command bar or a protected admin command).
local DataStoreService = game:GetService("DataStoreService")
local store = DataStoreService:GetDataStore("PlayerData")

local function stateAt(userId: number, unixSeconds: number)
	-- Returns the value that was current at that moment.
	local value, keyInfo = store:GetVersionAtTimeAsync("u_" .. userId, unixSeconds * 1000)
	return value, keyInfo
end

local function listRecentVersions(userId: number)
	-- minDate/maxDate are Unix milliseconds; 0 means "no bound" (the documented defaults).
	local pages = store:ListVersionsAsync("u_" .. userId, Enum.SortDirection.Descending, 0, 0, 20)
	for _, info in pages:GetCurrentPage() do
		print(info.Version, DateTime.fromUnixTimestampMillis(info.CreatedTime):ToIsoDate(), info.IsDeleted)
	end
end
```

Restoring: load the old value, **clear its `lock` field**, make sure the player is not online (or kick them first), then write it back with `UpdateAsync`. Never restore over a live session. Log who restored what and why ([[Errors, Observability and Incident Response]]).

---

## 7. Erasure: right to be forgotten (GDPR / CCPA)

When Roblox receives an erasure request for a user who played your game, you are expected to delete that user's personal data. Roblox now supports **automated RTBF deletion** driven by templates:

- You declare up to **100 deletion templates** that identify a user's keys or data stores using the case-sensitive `{UserId}` token (for example key pattern `u_{UserId}` in data store `PlayerData`, scope `global`).
- Eligibility: standard or ordered data stores; the user ID must appear in the key **name or scope**, matched by a static pattern. Whole-data-store deletion is supported for standard stores only.
- Configure templates in the Creator Dashboard (**Configurations > Data stores manager > RTBF Deletion**) or via the Open Cloud Configs API (`user_data_templates`), with API key permissions `universe:read` and `universe:write`.
- Roblox's guidance: verify patterns against live usage in Data Stores Manager, test end to end on a test game with a dummy account, and confirm deletions complete within 30 days of a request.

Design implications:

1. **Put the UserId in the key name for every per-user record** (`u_123`, `quests_123`). Data keyed any other way (a guild record listing member IDs, a global auction list) cannot be matched by templates and needs manual handling.
2. Keep a list of every store that can contain a user's data. It is your RTBF template list and your audit answer.
3. For data that cannot use templates, run a manual deletion (in-game admin tool or Open Cloud `DELETE` on the entry) and remove the user from shared records.
4. `RemoveAsync` creates a tombstone version; previous versions remain listable until they expire. Check the current RTBF docs for how automated deletion treats history, and do not keep extra copies (analytics exports, external backups) that templates cannot reach.

---

## Common mistakes

- Treating a failed load as a new player and saving defaults over real data.
- Saving with `SetAsync` from multiple places without a lock, so the last writer wins.
- Lock checks only on load, not on every save.
- Autosave skipping clean sessions, letting locks expire mid-session.
- Retrying additive writes, double-granting currency.
- Yielding inside the `UpdateAsync` transform.
- Restoring an old version that still contains a lock field, locking the player out.
- Keys that do not contain the UserId, so RTBF templates cannot find them.
- Reading right after writing with the default 4-second cache and trusting the result.

## Checklist

- [ ] All player data reads/writes go through one service using `UpdateAsync`.
- [ ] Load acquires a session lock; saves verify it; leave-save releases it.
- [ ] Load failure kicks; only a truly empty key creates defaults.
- [ ] Autosave refreshes the lock; `LOCK_EXPIRY` is several times the autosave interval.
- [ ] Only idempotent operations are retried; purchases are guarded by receipt IDs.
- [ ] Budget checked before bulk writes; 301-306 errors back off.
- [ ] Admin rollback tool uses `GetVersionAtTimeAsync`/`ListVersionsAsync` and clears locks.
- [ ] Every per-user key contains the UserId; RTBF templates configured and tested.
- [ ] Lock tested live: leave a test server and immediately join another; the second load waits, then succeeds. Transforms unit-tested with a fake store ([[Unit Testing Luau with Jest-Lua and TestEZ]]).
- [ ] Test and live universes separated; store and key names never renamed casually (a rename is a silent wipe).

**Related:** [[Data Backend - Hub]] · [[DataStore Production Patterns]] · [[Save Schema Migrations]] · [[Anti-Dupe Transaction Blueprint]] · [[Save data resets or corrupts]] · [[Persistence Transactions and Migrations]]

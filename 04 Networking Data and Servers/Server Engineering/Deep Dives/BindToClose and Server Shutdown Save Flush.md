---
area: "04 Networking Data and Servers"
cluster: "Server Engineering"
title: "BindToClose and Server Shutdown Save Flush"
tags: [deep-dive, roblox, bindtoclose, shutdown, datastore, reliability]
verified: 2026-10-25
cssclasses: [tg-a04]
---

# BindToClose and Server Shutdown Save Flush

**Why this matters:** every update you ship shuts down servers full of players, and a shutdown handler that saves too slowly, too twice, or not at all is the most common way an otherwise solid save system loses progress at scale.
This note explains exactly what Roblox guarantees at shutdown, how `PlayerRemoving` and `BindToClose` interact, and gives a deadline-aware flush that finishes inside the 30-second window without duplicating writes.

Pairs with [[DataStore Session Locking, Retries, Versioning and Erasure]] (the data service this flushes) and [[Server Load Shedding]].

---

## 1. What the engine guarantees

From the `DataModel:BindToClose` reference (as of 2026):

- You can bind **multiple** functions; they are **called in parallel**.
- If the bound function takes a parameter, it receives an **`Enum.CloseReason`**: `Unknown`, `RobloxMaintenance`, `DeveloperShutdown`, `DeveloperUpdate` (migrated to a new place version), `ServerEmpty` (last player left), `OutOfMemory`, `Moderation`.
- The server **waits up to 30 seconds** for all bound functions to finish, then shuts down **even if they are still running**.
- **Teleports are disabled during moderation shutdowns.**
- Use `RunService:IsStudio()` to avoid long waits when stopping a Studio playtest.

Not guaranteed, and often misunderstood:

- There is **no promise about ordering** between your `PlayerRemoving` handlers and `BindToClose`. During a shutdown, players are removed and `PlayerRemoving` fires, and `BindToClose` runs; both can be in progress at the same time.
- A server **crash** (hard failure) runs nothing. Only periodic autosaves protect against that.
- `OutOfMemory` shutdowns happen when the server is already struggling; your flush must be cheap.

---

## 2. The two failure modes

**Failure 1: saving twice in parallel.** `PlayerRemoving` starts a release-save for player A; `BindToClose` also starts a release-save for player A. Two `UpdateAsync` calls race on the same key; one releases the lock, the other then fails the lock check (or, without session locking, writes stale data last). At best you waste budget; at worst you overwrite newer data.

**Failure 2: not waiting.** `BindToClose` returns immediately because "PlayerRemoving handles saving", and the server dies while those saves are still yielding. Players lose the last few minutes.

The fix for both: **one save path per player with a shared in-flight status**, and a `BindToClose` handler that **waits for in-flight saves and starts only missing ones**, against a deadline.

---

## 3. Deadline-aware save coordination

Extend the data service with a per-player "release" that can be awaited and is never started twice:

```luau
--!strict
-- Inside PlayerDataService (see the session-locking note for write()).
type ReleaseState = { done: boolean, ok: boolean, waiters: { thread } }
local releases: { [number]: ReleaseState } = {} -- keyed by UserId (players may be gone)

-- Starts the final save once; later callers just wait for the same result.
function PlayerDataService.ReleaseOnce(session): ReleaseState
	local existing = releases[session.userId]
	if existing then
		return existing
	end
	local state: ReleaseState = { done = false, ok = false, waiters = {} }
	releases[session.userId] = state
	task.spawn(function()
		local ok = write(session, true) -- final save + unlock
		state.ok = ok
		state.done = true
		for _, thread in state.waiters do
			task.spawn(thread)
		end
		table.clear(state.waiters)
	end)
	return state
end

-- Wait for a release with a deadline (os.clock() value). Returns true if it finished.
function PlayerDataService.AwaitRelease(state: ReleaseState, deadline: number): boolean
	if state.done then
		return true
	end
	local thread = coroutine.running()
	table.insert(state.waiters, thread)
	local timer = task.delay(math.max(0, deadline - os.clock()), function()
		local index = table.find(state.waiters, thread)
		if index then
			table.remove(state.waiters, index)
			task.spawn(thread)
		end
	end)
	coroutine.yield()
	task.cancel(timer)
	return state.done
end
```

Also add two trivial helpers to the data service: `AllSessions()` (returns the sessions table, including sessions whose release is still running) and `SetShuttingDown(flag)` (sets the module-level flag described below).

`PlayerRemoving` calls `ReleaseOnce(session)` and returns. `BindToClose` calls `ReleaseOnce` for every remaining session (getting the existing state if one is already running) and waits for all of them.

Inside `write`, make retries **deadline-aware** during shutdown: a normal backoff of 1, 2, 4, 8 seconds can by itself exceed the window. A simple approach is a module-level `shuttingDown` flag that caps waits at 1 second and attempts at 3.

---

## 4. The shutdown handler

```luau
--!strict
-- ServerScriptService/Services/ShutdownService.luau
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local SAVE_DEADLINE = 25 -- seconds; leave margin inside the 30 s window

local ShutdownService = {}
local PlayerDataService -- injected in Init
local extraFlushers: { () -> () } = {}

function ShutdownService.Init(registry)
	PlayerDataService = registry.PlayerDataService
end

-- Other systems register cheap flush steps (leaderboard writes, analytics batch).
function ShutdownService.AddFlusher(fn: () -> ())
	table.insert(extraFlushers, fn)
end

function ShutdownService.Start()
	game:BindToClose(function(reason: Enum.CloseReason)
		local startedAt = os.clock()
		local deadline = startedAt + SAVE_DEADLINE

		if RunService:IsStudio() then
			-- Optional: still flush if you test with Studio data stores; keep it short.
			deadline = startedAt + 5
		end

		PlayerDataService.SetShuttingDown(true) -- caps retry backoff inside write()

		-- 1. Start (or join) a release for every session still in memory.
		local states = {}
		for _, session in PlayerDataService.AllSessions() do
			table.insert(states, PlayerDataService.ReleaseOnce(session))
		end

		-- 2. Run other flushers in parallel; they must be fast and must not block saves.
		for _, fn in extraFlushers do
			task.spawn(function()
				local ok, err = pcall(fn)
				if not ok then
					warn("[Shutdown] flusher failed:", err)
				end
			end)
		end

		-- 3. Wait for all saves, but never past the deadline.
		local finished, total = 0, #states
		for _, state in states do
			if PlayerDataService.AwaitRelease(state, deadline) then
				finished += 1
			end
		end

		print(("[Shutdown] reason=%s saved %d/%d in %.1fs"):format(
			reason.Name, finished, total, os.clock() - startedAt))
		if finished < total then
			warn("[Shutdown] some saves did not complete; autosave is the backstop")
		end
	end)
end

return ShutdownService
```

Why the details matter:

- **Saves start first**, then other flushers, so a slow analytics call cannot delay player data.
- **One deadline for everything**, measured from the start of the handler, with 5 seconds of margin.
- **`AllSessions` includes players already removed** but whose release is still running; the data service keeps sessions until the release completes. If your data service drops a session from its table at the start of `PlayerRemoving`, `BindToClose` cannot see it; keep it until the release finishes.
- **The result is logged** with the close reason, so you can see in production logs whether shutdowns are completing ([[Errors, Observability and Incident Response]]).

---

## 5. Budget check: will 50 saves fit?

For a 50-player server, standard data store write budget is `60 + 50 x 40 = 2,060` requests per minute, plus the startup burst; `UpdateAsync` counts against read and write. Fifty release saves, even with a retry each, are about 100 requests, well inside budget. Per-key throughput (4 MB/min write) is only a concern if a single player's save is megabytes.

What actually breaks budgets at shutdown:

- Writing **several keys per player** (inventory, quests, settings, stats as separate keys) multiplies requests. Consolidate player data into one key where you can.
- **OrderedDataStore** leaderboard writes for everyone at once: the ordered write budget is lower (`30 + numPlayers x 5`). Write leaderboards periodically during play, not at shutdown.
- **Retry storms** when DataStores are degraded: cap attempts during shutdown.

Check `DataStoreService:GetRequestBudgetForRequestType(Enum.DataStoreRequestType.StandardWrite)` in your flush logs if you suspect throttling.

---

## 6. Using the close reason

| Reason | Sensible behaviour |
| --- | --- |
| `ServerEmpty` | Saves already started from `PlayerRemoving`; just wait for them. Clean up server-list entries in MemoryStores. |
| `DeveloperUpdate` | Players are being moved to the new version. Normal flush. Optional: show "Updating, you will rejoin automatically" if you use a soft-shutdown teleport (below). |
| `DeveloperShutdown` | Normal flush. |
| `RobloxMaintenance` / `Unknown` | Normal flush; log it. |
| `OutOfMemory` | Flush player data only; skip optional flushers. |
| `Moderation` | Flush; **teleports are disabled**, do not attempt soft shutdown. |

**Soft shutdown** (teleporting everyone to a temporary reserved server and back so they land on the new version) was the classic way to update without kicking people. Roblox now offers server restarts with **bleed-off** through Open Cloud (`:restartServers` with `bleedOffServers`) and the Creator Dashboard, which stops matchmaking into old servers and lets them drain over up to 60 minutes. Prefer that; if you still implement a soft shutdown, it must run inside the same 30-second window and save before teleporting ([[TeleportService Flows With Data and Reserved Servers]], [[Open Cloud APIs for Live Ops - Worked Examples]]).

---

## 7. Testing the shutdown path

1. **Studio**: with Studio access to API services enabled on a **test** universe, stop the playtest and confirm the `[Shutdown]` log line and saved data.
2. **Live test universe**: join with several accounts, change data, then use the Creator Dashboard to shut down servers. Rejoin and verify every account kept its last changes.
3. **Degraded DataStores**: in a test build, make `write` fail the first two attempts (fault injection flag) and confirm saves still finish inside the deadline.
4. **Load**: a full test server (bots or testers) shutting down, checking the "saved N/N" line.

---

## Common mistakes

- No `BindToClose` at all, relying on `PlayerRemoving` during shutdown.
- `BindToClose` and `PlayerRemoving` both saving the same player in parallel.
- Sequential saves in `BindToClose` (`for each player: save and wait`), which cannot fit 50 players with retries into 30 seconds.
- Exponential backoff that alone exceeds the window.
- Optional flushers (analytics, webhooks via HttpService) running before or blocking player saves.
- Removing the session from memory at the start of `PlayerRemoving`, so `BindToClose` cannot find in-flight saves.
- Long waits in Studio that make every playtest stop take 30 seconds.
- Treating shutdown saves as the main safety net instead of regular autosaves.

## Checklist

- [ ] One release path per player (`ReleaseOnce`), shared by `PlayerRemoving` and `BindToClose`.
- [ ] `BindToClose` starts missing releases, waits for all, with a 25-second deadline.
- [ ] Shutdown mode caps retries and backoff.
- [ ] Player saves start before any optional flushers.
- [ ] Close reason and "saved N/N" logged on every shutdown.
- [ ] Leaderboards and analytics flushed periodically, not only at shutdown.
- [ ] Shutdown tested live, including with injected DataStore failures.

**Related:** [[Server Engineering - Hub]] · [[DataStore Production Patterns]] · [[Save and Purchase Reliability Lab]] · [[Save data resets or corrupts]] · [[Server Load Shedding]]

---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Coroutines vs the task Library"
tags: [deep-dive, roblox, luau, coroutines, task-library, concurrency]
verified: 2026-10-25
cssclasses: [tg-a03]
---

# Coroutines vs the task Library

**Why this matters:** every yielding Roblox API (DataStores, HTTP, `WaitForChild`, teleports) forces you to think about threads, and most "random" bugs in timers, loading screens and save flows are two threads touching the same state.
This note explains how Roblox schedules threads, when to use `task.*` versus raw `coroutine.*`, and gives tested patterns for join-all, timeouts, cancellable loops and job queues.

---

## 1. The mental model in five sentences

1. A **thread** (Luau `coroutine`) is a paused-able function call with its own stack. Every Script starts as one thread; every connected event handler runs in a thread.
2. Only one thread runs at a time per Luau VM (Parallel Luau aside); a thread runs until it **yields** or finishes.
3. The engine's **task scheduler** resumes yielded threads at fixed **resumption points** in the frame (input, `PreRender`, `PreAnimation`, `PreSimulation`, `PostSimulation`, waiting-thread resumption, and so on; see the deferred events docs).
4. Yielding APIs (`task.wait`, `GetAsync`, `InvokeServer`, `WaitForChild`) park the thread and let other threads run, then the scheduler resumes it when the result is ready.
5. Therefore: **anything can happen to shared state while your thread is yielded.** Re-check assumptions after every yield.

That last point is the root of most concurrency bugs: a player leaves during `GetAsync`, a round ends during `task.wait(3)`, a tool is unequipped while an animation loads.

---

## 2. The task library, precisely

| Function | Runs when | Returns | Notes |
| --- | --- | --- | --- |
| `task.spawn(fn or thread, ...)` | **Immediately**, until its first yield | the thread | Errors inside are reported to Output with a stack trace; they do not propagate to the caller. |
| `task.defer(fn or thread, ...)` | At the end of the **current resumption cycle** | the thread | Use when you want "soon, but after the current handler finishes". |
| `task.delay(seconds, fn or thread, ...)` | On the first Heartbeat after `seconds` elapse | the thread | Cancellable with `task.cancel`. |
| `task.wait(seconds?)` | Yields; resumes on the first Heartbeat after the time | actual elapsed seconds | Default 0 means "next Heartbeat". Not throttled. |
| `task.cancel(thread)` | Immediately | nothing | Closes the thread so neither you nor the engine can resume it. Some states cannot be cancelled (for example the currently running thread); that raises an error. |
| `task.desynchronize()` / `task.synchronize()` | Next parallel / serial phase | nothing | Parallel Luau only; see [[Parallel Luau Actors - A Worked Example]]. |

The legacy globals `wait()`, `spawn()` and `delay()` are **deprecated**. They are throttled (they can resume much later than requested under load) and `spawn` historically delayed its first run. Replace them everywhere; a find-and-replace from `wait(` to `task.wait(` is safe in almost all code, but `spawn(f)` to `task.spawn(f)` changes timing (it now runs immediately), so read each call site.

---

## 3. The coroutine library, and when you still need it

| Function | Use |
| --- | --- |
| `coroutine.create(fn)` | Make a thread without running it. |
| `coroutine.resume(co, ...)` | Run it manually. Returns `true, ...` or `false, err`. **Errors do not propagate** and are easy to swallow. |
| `coroutine.wrap(fn)` | Returns a function that resumes the thread and **re-throws** errors. |
| `coroutine.yield(...)` | Pause the current thread, passing values out to whoever resumed it. |
| `coroutine.running()` | The current thread. Needed to build your own wait primitives. |
| `coroutine.status(co)` | `"running"`, `"suspended"`, `"normal"` or `"dead"`. |
| `coroutine.close(co)` | Kill a suspended thread. |
| `coroutine.isyieldable()` | Whether yielding is allowed here. |
| `coroutine.finally(co, cb)` | Newer addition in the Roblox docs: register a callback for when a coroutine finishes, errors or is cancelled. As of 2026 check the docs for availability before relying on it. |

Rule of thumb:

- **Scheduling** ("run this later", "run this in the background", "wait N seconds") -> `task.*`.
- **Control flow** ("pause here and hand a value back", generators, building your own wait/notify) -> `coroutine.*`.
- To resume a thread you parked yourself, prefer `task.spawn(thread, ...)` over `coroutine.resume(thread, ...)`: the engine reports errors properly and the semantics match what the scheduler does.

---

## 4. Pattern: run several yielding calls at once and wait for all

Loading five DataStore keys one after another costs five round trips. Running them concurrently costs roughly one.

```luau
--!strict
-- Shared/Util/Concurrency.luau
local Concurrency = {}

export type Settled<T> = { ok: boolean, value: T?, err: string? }

-- Runs every function concurrently and returns when all have finished.
function Concurrency.all<T>(fns: { () -> T }): { Settled<T> }
	local results: { Settled<T> } = table.create(#fns)
	local remaining = #fns
	if remaining == 0 then
		return results
	end
	local caller = coroutine.running()

	for i, fn in fns do
		-- task.defer, not task.spawn: workers start only after the caller has
		-- yielded below, so the final resume can never hit a running thread.
		task.defer(function()
			local ok, valueOrErr = pcall(fn)
			if ok then
				results[i] = { ok = true, value = valueOrErr }
			else
				results[i] = { ok = false, err = tostring(valueOrErr) }
			end
			remaining -= 1
			if remaining == 0 then
				task.spawn(caller)
			end
		end)
	end

	coroutine.yield()
	return results
end

return Concurrency
```

```luau
-- Usage: three loads in parallel
local results = Concurrency.all({
	function() return profileStore:GetAsync("p_" .. userId) end,
	function() return friendsStore:GetAsync("f_" .. userId) end,
	function() return questStore:GetAsync("q_" .. userId) end,
})
for i, r in results do
	if not r.ok then warn("load", i, "failed:", r.err) end
end
```

Why `task.defer` matters: with `task.spawn`, a function that finishes **without yielding** would decrement `remaining` to zero and call `task.spawn(caller)` while the caller is still running (it has not reached `coroutine.yield()` yet). That raises "cannot resume non-suspended coroutine" or, worse, leaves the caller yielded forever. This "resume something that has not yielded yet" race is the most common bug in hand-written join helpers, and deferring the workers removes it structurally.

---

## 5. Pattern: timeout around any yielding call

`WaitForChild` has a timeout argument, but most APIs do not. Race the call against a timer:

```luau
--!strict
local function withTimeout<T>(seconds: number, fn: () -> T): (boolean, any)
	local caller = coroutine.running()
	local done = false
	local timer: thread? = nil

	-- Deferred so it starts after the caller yields (same race as section 4).
	task.defer(function()
		local ok, result = pcall(fn)
		if done then
			return -- the timeout already won; drop the late result
		end
		done = true
		if timer then
			task.cancel(timer)
		end
		task.spawn(caller, ok, result)
	end)

	timer = task.delay(seconds, function()
		if done then
			return
		end
		done = true
		task.spawn(caller, false, "timeout")
	end)

	return coroutine.yield()
end

-- Usage
local ok, result = withTimeout(5, function()
	return someRemoteFunction:InvokeClient(player) -- InvokeClient can hang forever
end)
```

Two warnings:

1. **A timeout does not cancel the underlying request.** If `fn` is a DataStore write, it may still succeed after you reported "timeout". For writes, a timeout means "unknown outcome"; follow up with a cache-bypassing read before retrying (see [[DataStore Session Locking, Retries, Versioning and Erasure]]).
2. `InvokeClient` is the classic case for this helper: a client that never answers (or an exploiter who deliberately does not) will otherwise park your server thread forever. Better still, avoid server-to-client RemoteFunctions entirely and use a RemoteEvent pair.

---

## 6. Pattern: a cancellable loop that cannot outlive its owner

```luau
--!strict
local function startRegenLoop(humanoid: Humanoid, perSecond: number): () -> ()
	local running = true
	local thread = task.spawn(function()
		while running and humanoid.Parent do
			local dt = task.wait(1)
			if not running then
				break -- re-check after every yield
			end
			if humanoid.Health > 0 then
				humanoid.Health = math.min(humanoid.MaxHealth, humanoid.Health + perSecond * dt)
			end
		end
	end)

	return function()
		running = false
		if coroutine.status(thread) == "suspended" then
			task.cancel(thread)
		end
	end
end
```

The returned stop function goes into the owner's cleanup container ([[Signals, Connections and Leak-Proof Cleanup]]). Using `dt` (the real elapsed time) instead of assuming exactly 1 second keeps regen correct when the server is under load.

---

## 7. Pattern: a serial job queue (one at a time, in order)

Some work must not overlap: saving the same player's data, processing trades, writing to one MemoryStore key. A per-key queue prevents interleaving without locks.

```luau
-- (nonstrict for brevity; type it with the class pattern from the strict-mode note)
local SerialQueue = {}
SerialQueue.__index = SerialQueue

function SerialQueue.new()
	return setmetatable({ _jobs = {} :: { () -> () }, _running = false }, SerialQueue)
end

function SerialQueue:push(job: () -> ())
	table.insert(self._jobs, job)
	if self._running then
		return
	end
	self._running = true
	task.spawn(function()
		while #self._jobs > 0 do
			local nextJob = table.remove(self._jobs, 1) :: () -> ()
			local ok, err = pcall(nextJob)
			if not ok then
				warn("[SerialQueue] job failed:", err)
			end
		end
		self._running = false
	end)
end

return SerialQueue
```

Keep one queue per player for saves: autosave, purchase-save and leave-save then run in order and never race each other's `UpdateAsync`.

---

## 8. Pattern: debounce versus throttle with threads

- **Debounce** (run once after activity stops): keep the last `task.delay` handle; on each new trigger `task.cancel` it and schedule a new one. Good for "save settings 2 seconds after the player stops dragging the slider".
- **Throttle** (run at most once per window): store `os.clock()` of the last run and skip if too recent. Good for remote handlers. See [[Cooldown Module]] and [[Rate Limiter]].

```luau
local pending: thread? = nil
local function requestSettingsSave(player: Player)
	if pending then
		task.cancel(pending)
	end
	pending = task.delay(2, function()
		pending = nil
		-- save settings here
	end)
end
```

---

## 9. Yielding inside callbacks that must not yield

Some callbacks are called by the engine and **must return immediately**: the `UpdateAsync` transform function, `MemoryStoreSortedMap:UpdateAsync` transforms, `BindToRenderStep` callbacks you want to keep frame-tight, `__index` metamethods used in hot paths. Yielding inside a DataStore transform is explicitly disallowed by the docs. If you need data from a yielding call, fetch it **before** calling `UpdateAsync` and capture it as an upvalue.

`pcall` itself is fine to yield across in Luau, so `pcall(function() return store:GetAsync(key) end)` is the normal pattern.

---

## Common mistakes

- Using deprecated `wait()`/`spawn()`/`delay()`; they throttle under load exactly when timing matters.
- Calling `coroutine.resume` and ignoring its `false, err` result, so errors vanish silently.
- Resuming a thread that has not yielded yet (join helpers, timeouts), producing "cannot resume non-suspended coroutine".
- Resuming a thread that is parked in `task.wait` or an engine call; you will wake it early with the wrong values. Only resume threads you parked with `coroutine.yield`.
- Not re-checking state after a yield (player left, round ended, tool unequipped).
- Treating a timeout as a failure for writes, then retrying and double-granting.
- Infinite `while true do task.wait() end` loops with no owner or exit flag.
- Yielding inside `UpdateAsync` transform functions.

## Checklist

- [ ] No legacy `wait`, `spawn`, `delay` in the codebase (search for them).
- [ ] Every background loop has an exit flag and a stop function owned by something.
- [ ] Every yield is followed by a re-check of the state it depends on.
- [ ] Join and timeout helpers guard against synchronous completion.
- [ ] Per-player save work goes through one serial queue.
- [ ] Timeouts on writes are treated as "unknown", verified by a fresh read.
- [ ] Transform callbacks never yield.

**Related:** [[Scripting - Hub]] · [[Events vs Polling]] · [[Fixed-Rate Scheduler]] · [[Cooldown Module]] · [[Practical Luau Pattern Library]]

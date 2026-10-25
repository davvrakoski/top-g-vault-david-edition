---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "evaera Promise - Async Recipes for Roblox"
tags: [roblox, community-knowledge, scripting, promise, async, open-source, mit]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://github.com/evaera/roblox-lua-promise
  - https://eryn.io/roblox-lua-promise/api/Promise
  - https://raw.githubusercontent.com/evaera/roblox-lua-promise/master/wally.toml
---
# evaera Promise - Async Recipes for Roblox

**License: MIT (bundle-safe).** Wally: `evaera/promise@4.0.0` (shared realm, no dependencies).

Roblox code yields constantly: DataStore calls, `InvokeServer`, `WaitForChild`, HTTP, teleports. Writing that with raw threads leads to forgotten error handling, leaked waits after a player leaves, and "it hung forever" bugs. evaera's Promise library wraps any yielding work in an object you can chain, time out, retry and **cancel**. It is the de facto standard that cleanup libraries (Trove's `AddPromise`, Janitor's `AddPromise`) integrate with.

## Mental model

A Promise is in one of four `Promise.Status` states: `Started`, `Resolved`, `Rejected`, `Cancelled`. You attach handlers; each handler returns a **new** Promise, so chains read top to bottom.

| You want | Use |
| --- | --- |
| Wrap a yielding call | `Promise.new(function(resolve, reject, onCancel) ... end)` or `Promise.try(fn)` |
| Turn a yielding function into a Promise-returning one | `Promise.promisify(fn)` |
| Wait N seconds | `Promise.delay(n)` |
| Next time an event fires | `Promise.fromEvent(signal, predicate?)` |
| All must succeed | `Promise.all({...})` |
| Collect results, failures included | `Promise.allSettled({...})` |
| First to finish | `Promise.race({...})` / `Promise.any({...})` |
| Retry flaky work | `Promise.retry(fn, times, ...)` / `Promise.retryWithDelay(fn, times, seconds, ...)` |
| Give up after N seconds | `promise:timeout(n)` |
| Block the current thread | `promise:await()` (returns success, ...) or `promise:expect()` (errors on failure) |
| Always run cleanup | `promise:finally(fn)` |

## Recipe: load data with retry, timeout and cleanup on leave

```lua
local Promise = require(ReplicatedStorage.Packages.Promise)

local getAsync = Promise.promisify(function(store, key)
	return store:GetAsync(key)
end)

local function loadProfile(player: Player)
	return Promise.retryWithDelay(getAsync, 3, 2, store, `p_{player.UserId}`)
		:timeout(15)
		:andThen(function(data)
			return data or defaultData()
		end)
end

local pending = loadProfile(player)
	:andThen(function(data) applyData(player, data) end)
	:catch(function(err) warn("load failed", player.UserId, tostring(err)) end)

-- cancel if the player leaves first (stops the andThen from running on a gone player)
player.AncestryChanged:Once(function() pending:cancel() end)
```

## Recipe: wait for a choice or a timeout

```lua
local picked = Promise.race({
	Promise.fromEvent(remote.OnServerEvent, function(p) return p == player end),
	Promise.delay(10):andThenReturn("timeout"),
})
```
`race` cancels the losers, so the 10-second delay does not keep running.

## Rules that prevent most bugs

1. **Always end a chain with `:catch`.** A rejected Promise with no consumer prints an unhandled-rejection warning on the next frame. Use `Promise.onUnhandledRejection` in development to log them centrally.
2. **Use `onCancel` for real cleanup.** Inside `Promise.new`, register `onCancel(function() ... end)` to disconnect connections or stop tweens if the caller cancels.
3. **Cancel on lifetime end.** Put Promises into the object's Trove/Janitor (`trove:AddPromise(p)`) so a destroyed tool or a leaving player cancels in-flight work. See [[Trove vs Janitor - Cleanup API Side by Side]].
4. **`expect` vs `await`.** `await` returns `false, err` and never throws; `expect` throws. Use `expect` only where an error should stop the thread.
5. **Don't wrap everything.** A plain synchronous function does not need a Promise; Promises add allocation and indirection.

## When to choose something else
- Simple fire-and-forget delays: `task.delay` is enough ([[Coroutines vs the task Library]]).
- The community also uses lighter "futures" libraries; see [[Signals, Promises and Cleanup Libraries - Community Picks]].

## Related
[[Scripting - Hub]] · [[Coroutines vs the task Library]] · [[Signals, Promises and Cleanup Libraries - Community Picks]] · [[Player and Character Lifecycle Without Race Conditions]]

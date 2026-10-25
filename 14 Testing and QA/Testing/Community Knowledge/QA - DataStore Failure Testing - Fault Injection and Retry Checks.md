---
area: "14 Testing and QA"
cluster: "Testing"
title: "QA - DataStore Failure Testing - Fault Injection and Retry Checks"
tags: [roblox, community-knowledge, testing, qa, datastore, fault-injection]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/cloud-services/data-stores/error-codes-and-limits
  - https://create.roblox.com/docs/reference/engine/classes/DataStoreService
  - https://create.roblox.com/docs/cloud-services/data-stores
---
# QA - DataStore Failure Testing - Fault Injection and Retry Checks

Data loss is the bug players never forgive. DataStores fail in production for normal reasons: throttling when a server burst-saves, brief service outages, oversized values, a player rejoining before the old server finished saving. In Studio everything succeeds, so the save code's failure branches usually ship untested. This note is a repeatable way to force those failures and check the game behaves.

## Failures worth simulating

| Failure | Real cause | Docs error code family |
|---|---|---|
| Throttled request dropped | Too many calls per minute, queue full | `301`-`306` (`GetAsyncThrottle`, `SetAsyncThrottle`, `UpdateAsyncThrottle`...) |
| Value too large | Inventory grew past the per-key limit | `105` `ValueTooLarge` |
| Bad key | Empty or over 50-character key | `101`, `102` |
| Bad value | Saving an Instance, a function, mixed tables | `103`, `104` |
| Service error / timeout | Backend trouble | 5xx range (see the docs table) |
| Stale session | Player joins server B before server A saved | no error at all - silent overwrite |

## Build a fault-injecting wrapper

Route every DataStore call through one module (you want that anyway for retries). Give it a test switch that only works in Studio or a test place:

```lua
-- DataGateway (server ModuleScript), sketch
local RunService = game:GetService("RunService")
local Gateway = { failRate = 0, failMode = nil }

local function maybeFail()
	if not RunService:IsStudio() then return end
	if Gateway.failMode and math.random() < Gateway.failRate then
		error(Gateway.failMode, 0) -- e.g. "304: UpdateAsync request dropped (simulated)"
	end
end

function Gateway.update(store, key, fn)
	return pcall(function()
		maybeFail()
		return store:UpdateAsync(key, fn)
	end)
end
return Gateway
```

Expose `failRate` and `failMode` through your gated QA commands (see [[QA Test Commands - Gated Cheats for Testers]]) so testers can type `/datafail 0.5 304` mid-session. For unit tests, inject a fake store instead (see [[Dependency Injection and Fakes for Luau Unit Tests]]).

## Test cases (run each with fail rate 0.5 and 1.0)

1. **Join with load failure:** the player must not be given a fresh empty profile that later overwrites their real save. Expected: retry with backoff, then kick with a clear message or block saving for that session.
2. **Autosave failure:** data stays in memory and is retried; a warning is logged with the key and attempt count.
3. **Leave with save failure:** `PlayerRemoving` save retries a few times; `game:BindToClose` waits for in-flight saves (there is a short shutdown window, keep retries brief).
4. **Server shutdown burst:** 20+ players leaving at once must not exceed the budget. Check `DataStoreService:GetRequestBudgetForRequestType()` before each call and queue when low.
5. **Value too large:** stuff a test inventory until it fails; expected is a logged error and refusal to save that change, not a crash of the save loop.
6. **Rejoin race:** leave and instantly rejoin another server (two Studio clients or a live test place). Expected: session lock or version check prevents the old server's late save from overwriting newer data.
7. **Purchases during failure:** a developer product bought while saves fail must not be granted twice nor lost (`ProcessReceipt` returns `NotProcessedYet` until saved).

## Pass criteria

- No test ends with a player's data reset or rolled back without a visible warning.
- Every failure produces one log line with error code, key and retry count.
- Retries use backoff (for example 1 s, 2 s, 4 s) and stop after a cap.
- Never test against production keys: use a separate store name or a test universe ([[Studio API Access and Data Safety During Testing]]).

## Related
[[Testing - Hub]] · [[Studio API Access and Data Safety During Testing]] · [[Dependency Injection and Fakes for Luau Unit Tests]] · [[Testing Purchases - Developer Products, Passes and ProcessReceipt]]

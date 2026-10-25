---
area: "04 Networking Data and Servers"
cluster: "Data Backend"
title: "Testable Save Layer - Fake DataStores and Failure Injection"
tags: [roblox, community-knowledge, data-backend, datastore, testing, mocking]
cssclasses: [tg-a04]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/cloud-services/data-stores
  - https://create.roblox.com/docs/cloud-services/data-stores/error-codes-and-limits
  - https://create.roblox.com/docs/reference/engine/classes/GlobalDataStore#UpdateAsync
  - https://github.com/jsdotlua/jest-lua
---
# Testable Save Layer - Fake DataStores and Failure Injection

Most save bugs only show up when something fails: a throttled write, a transform that runs twice, a server that dies mid-save. You cannot make the real DataStoreService fail on demand, and testing against it in Studio writes to real (Studio-scoped) data and costs budget. The fix is architectural: your save module talks to a **store interface**, and tests swap in a fake that you can tell to throw, delay or race. This note shows a minimal fake and the failure cases worth testing.

## Step 1: inject the store

Do not call `DataStoreService:GetDataStore` deep inside your profile code. Pass the store in:

```lua
-- PlayerData.lua
local PlayerData = {}
PlayerData.__index = PlayerData

function PlayerData.new(store) -- real DataStore or a fake with the same methods
	return setmetatable({ store = store }, PlayerData)
end

function PlayerData:addCoins(userId: number, amount: number)
	return self.store:UpdateAsync("p_" .. userId, function(old)
		old = old or { coins = 0 }
		old.coins += amount
		return old
	end)
end

return PlayerData
```

Production: `PlayerData.new(DataStoreService:GetDataStore("Players_v3"))`. Tests: `PlayerData.new(FakeStore.new())`.

## Step 2: a fake that behaves like the real thing

The fake must copy the behaviours that cause bugs, not just store values:

```lua
local FakeStore = {}
FakeStore.__index = FakeStore

function FakeStore.new()
	return setmetatable({ data = {}, failNext = 0, raceNext = nil }, FakeStore)
end

local function deepCopy(t) -- real stores serialize, so callers never share tables
	if type(t) ~= "table" then return t end
	local c = {}
	for k, v in t do c[k] = deepCopy(v) end
	return c
end

function FakeStore:UpdateAsync(key, transform)
	if self.failNext > 0 then
		self.failNext -= 1
		error("502: simulated throttle")
	end
	local result = transform(deepCopy(self.data[key]))
	if self.raceNext then -- another "server" wrote meanwhile: rerun like the engine does
		self.data[key] = self.raceNext(deepCopy(self.data[key]))
		self.raceNext = nil
		result = transform(deepCopy(self.data[key]))
	end
	if result ~= nil then self.data[key] = deepCopy(result) end
	return deepCopy(result)
end

function FakeStore:GetAsync(key)
	return deepCopy(self.data[key])
end

return FakeStore
```

Key details: **deep copies** (the real store never hands you a shared table), **transform reruns** (the docs say the transform may run more than once), and **errors as strings with codes**.

## Step 3: the tests that matter

| Test | What it proves |
| --- | --- |
| Transform rerun applies a delta once | No double-grant when another server wrote first |
| `failNext = 1` then retry | Retry wrapper works and does not double-apply (needs an opId) |
| Load fails three times | Player is kicked or held, never given a blank profile that later overwrites real data |
| Transform returns `nil` | Write is cancelled, caller handles "no change" |
| Migration from v1 shape | Old saves load into the new schema |
| Value near 4 MB | Your size guard triggers before the real limit |

Run them with a Luau test runner (Jest Lua, MIT licensed, or a Lune-based harness) in CI, so save logic is checked on every commit without Studio.

## Step 4: one live smoke test

Fakes can drift from reality. Keep one smoke test that hits a real store (with Studio access to API services on) and runs load, update, save and a version listing. The docs warn that Studio accesses **the same data stores as the live game**, so run it only in a separate test experience (its own universe), never in the production one.

## Pitfalls

- Fakes that return the same table they stored: tests pass, production loses edits made after save.
- Forgetting `GetAsync` caching (4 s on real servers): a test that writes then reads immediately may pass in the fake but read stale data live. Use `UpdateAsync` or bypass caching when freshness matters.
- Testing only the happy path. The value of a fake is failure injection.

## Related
[[Data Backend - Hub]] - [[Save and Purchase Reliability Lab]] - [[Save data resets or corrupts]] - [[DataStore Session Locking, Retries, Versioning and Erasure]]

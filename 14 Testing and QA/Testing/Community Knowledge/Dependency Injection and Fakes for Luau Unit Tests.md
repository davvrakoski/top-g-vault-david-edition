---
area: "14 Testing and QA"
cluster: "Testing"
title: "Dependency Injection and Fakes for Luau Unit Tests"
tags: [roblox, community-knowledge, testing, unit-tests, jest-lua, architecture]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://jsdotlua.github.io/jest-lua/
  - https://github.com/jsdotlua/jest-lua
  - https://martinfowler.com/articles/injection.html
  - https://martinfowler.com/bliki/TestDouble.html
---
# Dependency Injection and Fakes for Luau Unit Tests

The reason most Roblox code is "untestable" is not the test framework; it is that modules reach straight for `game:GetService(...)`, `os.time()` and `Players.LocalPlayer` in the middle of logic. A unit test cannot control any of those. Passing those dependencies in (dependency injection) and swapping them for small fakes in tests makes game logic testable with Jest-Lua or a plain Lune runner, without a running Studio session.

## Test doubles in one table
Martin Fowler's TestDouble article names the kinds; in Luau terms:
| Kind | What it is | Roblox example |
|---|---|---|
| Dummy | Passed but never used | A `nil`-safe placeholder player table |
| Stub | Returns canned answers | `getTime = function() return 1000 end` |
| Fake | Working but simplified | In-memory DataStore (`{}` with Get/Set) |
| Spy / Mock | Records calls to assert on | Jest-Lua `jest.fn()` |

## Shape modules as "create with deps"
```lua
-- ShopService.lua (pure logic, no GetService calls inside functions)
local ShopService = {}
ShopService.__index = ShopService

export type Deps = {
	getBalance: (userId: number) -> number,
	spend: (userId: number, amount: number) -> boolean,
	grant: (userId: number, itemId: string) -> (),
	now: () -> number,
}

function ShopService.new(deps: Deps, catalog)
	return setmetatable({ deps = deps, catalog = catalog, lastBuy = {} }, ShopService)
end

function ShopService:buy(userId: number, itemId: string): (boolean, string?)
	local item = self.catalog[itemId]
	if not item then return false, "unknown" end
	local t = self.deps.now()
	if t - (self.lastBuy[userId] or -math.huge) < 1 then return false, "cooldown" end
	if self.deps.getBalance(userId) < item.price then return false, "funds" end
	if not self.deps.spend(userId, item.price) then return false, "spend failed" end
	self.lastBuy[userId] = t
	self.deps.grant(userId, itemId)
	return true
end

return ShopService
```

The **real** wiring lives in one server bootstrap script that passes in the actual currency module, `os.clock`, and so on.

## The test (Jest-Lua style)
```lua
local ShopService = require(script.Parent.ShopService)
local JestGlobals = require(ReplicatedStorage.DevPackages.JestGlobals)
local describe, it, expect, jest = JestGlobals.describe, JestGlobals.it, JestGlobals.expect, JestGlobals.jest

describe("ShopService:buy", function()
	local clock = 0
	local function make(balance)
		local grant = jest.fn()
		local shop = ShopService.new({
			getBalance = function() return balance end,
			spend = function() return true end,
			grant = grant,
			now = function() return clock end,
		}, { Sword = { price = 50 } })
		return shop, grant
	end

	it("grants when affordable", function()
		local shop, grant = make(100)
		expect(shop:buy(1, "Sword")).toBe(true)
		expect(grant).toHaveBeenCalledWith(1, "Sword")
	end)

	it("blocks a second buy inside the cooldown", function()
		local shop = make(100)
		shop:buy(1, "Sword")
		clock += 0.5
		local ok, why = shop:buy(1, "Sword")
		expect(ok).toBe(false)
		expect(why).toBe("cooldown")
	end)
end)
```
The fake clock is the trick: the test controls time instead of waiting.

## What to inject in Roblox code
- Time: `os.clock`, `os.time`, `workspace:GetServerTimeNow`.
- Randomness: a `Random` object (see [[Seeded Randomness and Deterministic Tests]]).
- Persistence: a save interface, so tests use an in-memory fake ([[Testable Save Layer - Fake DataStores and Failure Injection]]).
- Outbound effects: "grant", "notify client", "play sound" as functions; assert they were called.
- Do **not** inject everything. Instances and maths are fine to use directly; inject only what is slow, random, external or time-based.

## Pitfalls
- Faking Roblox services wholesale (a fake `Players` with every method) becomes its own buggy engine. Fake your own narrow interfaces instead.
- Tests that pass with fakes but fail live: keep a few integration tests in Studio (Jest-Lua in a test place) that use the real wiring.

## Related
[[Testing - Hub]] · [[Unit Testing Luau with Jest-Lua and TestEZ]] · [[Jest Lua Setup Checklist - Wally, jest.config and runCLI]] · [[Lune Test Harness for Pure Luau Modules]]

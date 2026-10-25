---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Unit Testing Luau with Jest-Lua and TestEZ"
tags: [deep-dive, roblox, testing, jest-lua, testez, ci, selene, stylua]
verified: 2026-10-25
cssclasses: [tg-a03]
---

# Unit Testing Luau with Jest-Lua and TestEZ

**Why this matters:** manual playtesting cannot re-check your currency math, save migrations and trade rules on every change, and those are exactly the systems where one regression costs players items and costs you trust.
This note shows how to make Roblox code testable, how to write tests in both common frameworks, how to fake DataStores, and how to run tests automatically (locally, in Studio, and in CI through Open Cloud).

The vault's QA notes ([[Testing and QA Operating System]], [[Full Test Matrix]]) cover manual and release testing. This note covers **automated tests for Luau logic**.

---

## 1. What to unit test (and what not to)

Unit tests pay off on **pure or nearly pure logic**:

- Currency, pricing, discounts, tax/fee rounding.
- Inventory rules: stack limits, capacity, equip restrictions.
- Save schema migrations (v1 -> v2 -> v3 produce the expected shape).
- Damage formulas, cooldown math, weighted loot tables ([[Weighted Random Selection]]).
- Payload validators (every malformed input returns nil).
- Session-lock and retry logic, using a fake DataStore.
- State machines: legal and illegal transitions ([[Runtime State and FSM Architecture]]).

Poor targets: camera feel, animation timing, physics behaviour, UI layout. Test those manually or with screenshots.

The design rule that makes this possible: **logic modules do not reach out to services directly**. They receive dependencies (a DataStore-like object, a clock function, a random generator) as arguments or through `Init`. See [[Module Architecture for a 50k-Line Roblox Game]].

```luau
--!strict
-- Shared/Economy/Pricing.luau : pure, trivially testable
local Pricing = {}

function Pricing.applyDiscount(price: number, percent: number): number
	assert(price >= 0, "negative price")
	local clamped = math.clamp(percent, 0, 90)
	-- Round down so a discount never gives away a fractional coin.
	return math.floor(price * (100 - clamped) / 100)
end

function Pricing.bulkTotal(unitPrice: number, quantity: number, bulkThreshold: number, bulkPercent: number): number
	local total = unitPrice * quantity
	if quantity >= bulkThreshold then
		total = Pricing.applyDiscount(total, bulkPercent)
	end
	return total
end

return Pricing
```

---

## 2. The two frameworks

| | TestEZ | Jest Lua |
| --- | --- | --- |
| Origin | Roblox's original BDD framework | Roblox's Lua port of JavaScript Jest (maintained as Jest Lua) |
| Style | `expect(x).to.equal(y)` | `expect(x).toBe(y)`, `toEqual`, mocks via `jest.fn()` |
| Status (2026) | Archived on GitHub (2024-09-14): still works, no further updates; huge amount of existing code uses it | Actively used by Roblox for its own Lua apps; richer matchers, snapshot tests, mocks |
| Choose when | Existing codebase already uses it, or you want zero setup | New projects, teams coming from JS/TS, need mocks/snapshots |

Both install via Wally or by vendoring the source into `ReplicatedStorage/DevPackages`. Pin exact versions and check each project's README and licence before adding it ([[Open-Source Evaluation Rubric]]). Keep test frameworks out of the shipped game: put them in a dev-only folder excluded from your production Rojo project, or delete it in your publish step.

---

## 3. TestEZ: specs and runner

A spec is a ModuleScript whose name ends in `.spec` and which returns a function:

```luau
-- Shared/Economy/Pricing.spec.luau
return function()
	local Pricing = require(script.Parent.Pricing)

	describe("applyDiscount", function()
		it("rounds down", function()
			expect(Pricing.applyDiscount(99, 10)).to.equal(89) -- 89.1 -> 89
		end)

		it("clamps discounts above 90%", function()
			expect(Pricing.applyDiscount(100, 150)).to.equal(10)
		end)

		it("rejects negative prices", function()
			expect(function()
				Pricing.applyDiscount(-1, 10)
			end).to.throw()
		end)
	end)

	describe("bulkTotal", function()
		it("applies bulk discount at the threshold", function()
			expect(Pricing.bulkTotal(10, 10, 10, 20)).to.equal(80)
		end)
		it("does not apply below the threshold", function()
			expect(Pricing.bulkTotal(10, 9, 10, 20)).to.equal(90)
		end)
	end)
end
```

Runner (a Script you run in Studio, or the script your CI executes):

```luau
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TestEZ = require(ReplicatedStorage.DevPackages.TestEZ)

local results = TestEZ.TestBootstrap:run({
	ReplicatedStorage.Shared,
	game:GetService("ServerScriptService").Services,
})

if results.failureCount > 0 then
	error(("%d test(s) failed"):format(results.failureCount))
end
```

Useful TestEZ matchers: `.to.equal(v)`, `.to.be.ok()` (not nil/false), `.to.be.a("number")`, `.to.be.near(v, epsilon)`, `.to.throw()`, and `.never` to invert (`expect(x).never.to.equal(0)`).

---

## 4. Jest Lua: specs, mocks and runner

```luau
-- Shared/Economy/Pricing.spec.luau
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local JestGlobals = require(ReplicatedStorage.DevPackages.JestGlobals)
local describe, it, expect, jest = JestGlobals.describe, JestGlobals.it, JestGlobals.expect, JestGlobals.jest

local Pricing = require(script.Parent.Pricing)

describe("applyDiscount", function()
	it("rounds down", function()
		expect(Pricing.applyDiscount(99, 10)).toBe(89)
	end)
	it("throws on negative price", function()
		expect(function()
			Pricing.applyDiscount(-1, 10)
		end).toThrow("negative price")
	end)
end)

describe("audit logging", function()
	it("logs every grant with a reason", function()
		local log = jest.fn()
		local Grants = require(script.Parent.Grants)
		Grants.Init({ log = log })
		Grants.grantCoins(123, 50, "quest_reward")
		expect(log).toHaveBeenCalledTimes(1)
		expect(log).toHaveBeenCalledWith("grant", 123, 50, "quest_reward")
	end)
end)
```

Differences from TestEZ: test files do not return a function; globals come from `JestGlobals`; `toEqual` compares tables deeply while `toBe` checks identity/primitive equality.

A Jest Lua project needs a `jest.config` ModuleScript at the root of the folder being tested (for example `return { testMatch = { "**/*.spec" } }`) and a runner that calls `runCLI` from the `Jest` package and awaits its status. Jest Lua also relies on a Studio/engine capability for loading modules fresh per test file; its README documents the exact fast flag and runner snippet to use. As of 2026, follow the README for your pinned version rather than copying an old blog post, because that setup has changed between releases.

---

## 5. Faking a DataStore

The most valuable tests in a Roblox game exercise save logic, and you never want them touching real DataStores. Write an in-memory fake with the same method shapes you use:

```luau
--!nonstrict
-- DevPackages/Fakes/FakeDataStore.luau
local FakeDataStore = {}
FakeDataStore.__index = FakeDataStore

export type Options = { failNext: number?, conflictOnce: boolean? }

function FakeDataStore.new(options: Options?)
	return setmetatable({
		data = {} :: { [string]: any },
		version = {} :: { [string]: number },
		failNext = (options and options.failNext) or 0,
		calls = { get = 0, update = 0, remove = 0 },
	}, FakeDataStore)
end

local function maybeFail(self)
	if self.failNext > 0 then
		self.failNext -= 1
		error("502: API Services rejected request (fake)")
	end
end

function FakeDataStore:GetAsync(key: string)
	self.calls.get += 1
	maybeFail(self)
	return self.data[key]
end

function FakeDataStore:UpdateAsync(key: string, transform: (any, any) -> any)
	self.calls.update += 1
	maybeFail(self)
	local new = transform(self.data[key], nil) -- real API passes DataStoreKeyInfo as arg 2
	if new == nil then
		return self.data[key] -- transform cancelled the write
	end
	self.data[key] = new
	self.version[key] = (self.version[key] or 0) + 1
	return new
end

function FakeDataStore:RemoveAsync(key: string)
	self.calls.remove += 1
	maybeFail(self)
	local old = self.data[key]
	self.data[key] = nil
	return old
end

return FakeDataStore
```

Now you can test the scenarios that are impossible to trigger on demand in production:

- "Two servers load the same player": share one fake between two instances of your data service and assert the second load is refused while the lock is held.
- "Save fails twice then succeeds": `failNext = 2`, assert one final write and no duplicate grants.
- "Old lock expires": inject a fake clock function and advance it past the lock timeout.

The real session-locking design these tests exercise is in [[DataStore Session Locking, Retries, Versioning and Erasure]].

---

## 6. Static checks before tests: Selene, StyLua, type checking

Run the cheap checks first; they catch more per second than tests do.

| Tool | What it catches | Typical command |
| --- | --- | --- |
| **Selene** (linter) | Unused variables, shadowing, deprecated globals like `wait`, suspicious comparisons | `selene src` with `std = "roblox"` in `selene.toml` |
| **StyLua** (formatter) | Formatting drift, so diffs show only real changes | `stylua --check src` (CI), `stylua src` (local) |
| **luau-lsp analyze** or Studio Script Analysis | Type errors in `--!strict` files | needs a Rojo sourcemap for instance paths |

Install these with a toolchain manager (for example Rokit or Foreman; Aftman was archived in July 2025 and is no longer maintained) so every developer and CI runner uses the same pinned versions. See [[Luau Strict Mode and Type Checking in Practice]] and [[Git, Github, Rojo and Team Workflow]].

---

## 7. Running tests automatically

Three realistic options, from simplest to most automated:

**A. In Studio, on demand.** Keep a `RunTests` Script disabled in `ServerScriptService`; enable it and press Run. Zero setup, but relies on people remembering.

**B. Pure-Luau tests outside Roblox.** Modules that use no Roblox APIs (pricing, validators, migrations) can run under a standalone Luau runtime such as Lune in seconds on any CI machine. This is the fastest feedback loop but cannot test anything touching Instances.

**C. In real Roblox servers via Open Cloud Luau Execution.** Roblox's Open Cloud exposes Luau execution session tasks: you publish your test build to a dedicated **test place**, then ask Roblox to run a script in it and return the result.

```bash
# 1. Build the place from your repo (Rojo) and upload it to a TEST place (never production).
rojo build test.project.json -o test.rbxl
curl -s -X POST \
  "https://apis.roblox.com/universes/v1/$UNIVERSE_ID/places/$TEST_PLACE_ID/versions?versionType=Saved" \
  -H "x-api-key: $ROBLOX_API_KEY" -H "Content-Type: application/octet-stream" \
  --data-binary @test.rbxl

# 2. Start a task that runs the test runner and returns a summary.
curl -s -X POST \
  "https://apis.roblox.com/cloud/v2/universes/$UNIVERSE_ID/places/$TEST_PLACE_ID/luau-execution-session-tasks" \
  -H "x-api-key: $ROBLOX_API_KEY" -H "Content-Type: application/json" \
  --data '{"script": "return require(game.ServerScriptService.RunTestsModule)()"}'
# Response includes a "path" for the task.

# 3. Poll GET https://apis.roblox.com/cloud/v2/<path> until "state" is COMPLETE or FAILED,
#    then read output.results (the script's return values) and fail CI on failures.
```

Facts from the Open Cloud reference: the task's `state` moves through `QUEUED`, `PROCESSING`, then `COMPLETE` (with `output.results`) or `FAILED` (with `error`); scripts default to a 5-minute timeout; the API key needs the `universe.place.luau-execution-session:write` scope (plus read to poll), and publishing needs place write permission. The publishing guide's examples use `versionType=Published`; for a test place, `Saved` avoids pushing a live version. Check the current docs for both, and keep test and production universes separate so a CI key can never touch live data.

`RunTestsModule` should return a plain table such as `{ passed = 120, failed = 0, failures = {} }`; non-JSON values come back as null.

---

## 8. Keeping the suite healthy

- **Every bug fix adds a test** that fails before the fix. This is the regression evidence the vault's bug template asks for ([[Bug Report Template]]).
- **Tests must be deterministic.** Inject `Random.new(seed)` and a clock function instead of using `math.random` and `os.time` directly.
- **Fast suite, always run.** Under 30 seconds for the pure-logic suite or people stop running it.
- **No real network in unit tests.** DataStores, MemoryStores, HTTP and MessagingService are always fakes.
- **Name tests as behaviour**: "refuses purchase when coins are insufficient", not "test3".

---

## Common mistakes

- Logic modules that call `game:GetService("DataStoreService")` at top level, making them untestable.
- Shipping the test framework and spec files in the production place.
- Tests that depend on `os.time()`, `math.random()` or wait timing, so they fail randomly.
- Running CI tests against the production universe with a powerful API key.
- Only testing the happy path; most value is in failure, retry and malformed-input cases.
- Copying Jest Lua setup from an outdated tutorial instead of the README for the pinned version.
- Letting the suite get slow until nobody runs it.

## Checklist

- [ ] Pure logic is separated from services and receives dependencies by injection.
- [ ] One framework chosen and pinned; dev packages excluded from production builds.
- [ ] Fake DataStore covers failure, conflict and lock-expiry scenarios.
- [ ] Selene, StyLua and type checks run before tests.
- [ ] A one-command local test run exists.
- [ ] CI runs tests on every pull request (Lune for pure Luau, Open Cloud Luau Execution against a test place for engine-dependent tests).
- [ ] Every fixed bug has a regression test.

**Related:** [[Scripting - Hub]] · [[Testing - Hub]] · [[Testing and QA Operating System]] · [[Pre-Release Gate]] · [[Save and Purchase Reliability Lab]]

> Updated 2026-10-25: marked Aftman as archived/unmaintained (archived 2025-07-09) in the toolchain-manager line (source: https://github.com/LPGhatguy/aftman)

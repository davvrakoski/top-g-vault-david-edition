---
area: "14 Testing and QA"
cluster: "Testing"
title: "Server Startup Self-Checks and Invariant Asserts"
tags: [roblox, community-knowledge, testing, smoke-test, assertions, reliability]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/globals
  - https://create.roblox.com/docs/reference/engine/classes/RunService
  - https://create.roblox.com/docs/reference/engine/classes/LogService
  - https://en.wikipedia.org/wiki/Smoke_testing_(software)
---
# Server Startup Self-Checks and Invariant Asserts

Some bugs are not in code at all: a renamed RemoteEvent, a map part someone deleted, a config table with a typo, a product id pasted into the wrong field. They pass unit tests and break the live game. A **startup self-check** is a smoke test that runs in every server when it boots, verifying that the place has everything the code expects. Paired with a few invariant checks while the game runs, it turns silent breakage into a loud, logged error in the first second.

## What to check at boot
| Category | Example check |
|---|---|
| Required instances | Every remote listed in your Remotes module exists and has the right class |
| Map content | Spawn points, checkpoints 1..N with no gaps, required tagged parts present |
| Config data | Every item has id, price >= 0, rarity in the allowed set; ids are unique |
| Cross-references | Every shop entry points to a real item; every quest reward exists |
| Monetisation ids | Product / pass ids are numbers and present in the receipt handler table |
| Feature flags | Known flags only; no typos like `doubleXP` vs `DoubleXP` |

## A small framework
```lua
-- ServerScriptService/SelfCheck.server.lua
local RunService = game:GetService("RunService")
local failures = {}

local function check(ok: boolean, msg: string)
	if not ok then table.insert(failures, msg) end
end

-- remotes
local Remotes = require(game.ReplicatedStorage.Shared.RemoteNames)
for name, className in Remotes do
	local r = game.ReplicatedStorage.Remotes:FindFirstChild(name)
	check(r ~= nil and r.ClassName == className, "remote missing or wrong class: " .. name)
end

-- checkpoints 1..N without gaps
local cps = workspace.Checkpoints:GetChildren()
for i = 1, #cps do
	check(workspace.Checkpoints:FindFirstChild(tostring(i)) ~= nil, "checkpoint gap at " .. i)
end

-- config
local Items = require(game.ServerStorage.Config.Items)
local seen = {}
for id, item in Items do
	check(not seen[id], "duplicate item id " .. id)
	seen[id] = true
	check(typeof(item.price) == "number" and item.price >= 0, "bad price on " .. id)
end

if #failures > 0 then
	local report = "[SelfCheck] " .. #failures .. " problem(s):\n  " .. table.concat(failures, "\n  ")
	if RunService:IsStudio() then
		error(report) -- stop the playtest so nobody misses it
	else
		warn(report) -- live: keep the server running, but it lands in error reports and logs
	end
else
	print("[SelfCheck] OK")
end
```
In Studio the error is impossible to ignore; in live servers it is a warning that shows up in your error pipeline, so one bad publish is visible within minutes.

## Runtime invariants
Some rules must hold all game long. Check them where state changes, cheaply:
```lua
local function assertInvariant(cond: boolean, msg: string)
	if not cond then
		warn("[Invariant] " .. msg .. "\n" .. debug.traceback())
	end
end

-- after every currency change
assertInvariant(data.coins >= 0 and data.coins == data.coins, "coins invalid for " .. userId)
```
Typical invariants: currency non-negative and not NaN, inventory count within cap, a player in at most one team / round, round state only moves forward.

Prefer `warn` + traceback over `assert` in live code: `assert` throws and can abort the rest of a handler, turning a logging check into a new bug.

## Make it part of the release gate
- The self-check script ships in every build (it is cheap).
- The CI or pre-release checklist requires "[SelfCheck] OK" in a test-place server log (see [[Engine Tests in CI with Open Cloud Luau Execution]] for running code in a place from CI).
- Every bug caused by missing content adds one new check. Over time this list becomes your best regression suite for level and data mistakes.

## Related
[[Testing - Hub]] · [[Pre-Release Gate]] · [[Release Readiness Runbook 2026]] · [[Config Feature Flags and Content Data]]

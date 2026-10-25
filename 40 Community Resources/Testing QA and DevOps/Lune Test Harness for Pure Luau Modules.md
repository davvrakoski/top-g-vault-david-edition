---
area: "40 Community Resources"
cluster: "Testing QA and DevOps"
source_note: "community/testing-devops/lune-test-harness"
title: "Lune Test Harness for Pure Luau Modules"
tags: [roblox, community, "cluster/testing-qa-and-devops", testing, lune, ci]
cssclasses: [tg-a40]
verified: 2026-10-25
license: "MPL-2.0 (Lune); example code in this note is original"
sources:
  - https://github.com/lune-org/lune
  - https://lune-org.github.io/docs/api-reference/process
  - https://lune-org.github.io/docs/api-reference/fs
  - https://create.roblox.com/docs/reference/engine/globals/LuaGlobals#require
---
# Lune Test Harness for Pure Luau Modules

**Why:** Jest Lua only runs inside Roblox. For modules that touch no Roblox API (pricing, loot tables, validators, save migrations), a tiny harness under **Lune** gives a test run in a second on any CI machine, with no Studio and no API key.

Lune basics (MPL-2.0, lune-org) are in [[Lune - Run Luau Outside Studio]].

## What makes a module "Lune-testable"
- No `game:GetService`, no `Instance`, no `script.Parent` at the top level.
- Dependencies come in as arguments (clock, random, store).
- Other pure modules are required with **string paths**. Roblox's `require` accepts a string path resolved relative to the calling script, and Lune resolves string paths relative to the file, so a sibling require like `require("./LootWeights")` can work in both when Rojo keeps the same folder layout. Test this on your own setup before relying on it.

## The harness (original, ~40 lines)

```luau
-- tests/harness.luau
local Harness = {}

local results = { passed = 0, failed = 0, failures = {} :: { string } }
local prefix: { string } = {}

function Harness.describe(name: string, body: () -> ())
	table.insert(prefix, name)
	body()
	table.remove(prefix)
end

function Harness.it(name: string, body: () -> ())
	local fullName = table.concat(prefix, " > ") .. " > " .. name
	local ok, err = pcall(body)
	if ok then
		results.passed += 1
	else
		results.failed += 1
		table.insert(results.failures, fullName .. "\n    " .. tostring(err))
	end
end

function Harness.expectEqual(actual: any, expected: any, label: string?)
	if actual ~= expected then
		error(("%s: expected %s, got %s"):format(label or "value", tostring(expected), tostring(actual)), 2)
	end
end

function Harness.expectThrows(fn: () -> (), label: string?)
	local ok = pcall(fn)
	if ok then
		error((label or "function") .. " was expected to throw", 2)
	end
end

function Harness.results()
	return results
end

return Harness
```

## A spec and the entry point

```luau
-- tests/specs/Pricing.spec.luau
local T = require("../harness")
local Pricing = require("../../src/Shared/Economy/Pricing")

return function()
	T.describe("Pricing.applyDiscount", function()
		T.it("rounds down", function()
			T.expectEqual(Pricing.applyDiscount(99, 10), 89)
		end)
		T.it("rejects negative prices", function()
			T.expectThrows(function()
				Pricing.applyDiscount(-1, 10)
			end)
		end)
	end)
end
```

```luau
-- tests/run.luau  (run with: lune run tests/run.luau)
local process = require("@lune/process")
local T = require("./harness")

-- Static list: simple, explicit, and reviewable in a pull request.
local specs = {
	require("./specs/Pricing.spec"),
	require("./specs/LootTable.spec"),
	require("./specs/SaveMigration.spec"),
}

for _, spec in specs do
	spec()
end

local r = T.results()
for _, failure in r.failures do
	print("FAIL " .. failure)
end
print(("passed=%d failed=%d"):format(r.passed, r.failed))
process.exit(if r.failed == 0 then 0 else 1)
```

`process.exit(code)` is documented in Lune's process library: 0 is success, anything else is an error, which is exactly what CI needs.

## In CI
Add Lune to your toolchain file (`rokit add lune-org/lune`, see [[Toolchain Managers - Rokit, Foreman and Aftman]]) and run `lune run tests/run.luau` as one step in [[GitHub Actions CI for Rojo Projects - Lint, Format, Build]]. Keep it **before** any Open Cloud job: it is free and fast.

## Limits
- No Instances, physics, DataStores or RemoteEvents. Anything engine-bound goes to [[Engine Tests in CI with Open Cloud Luau Execution]].
- Lune's Luau version can differ from Roblox's. Avoid brand-new syntax in shared pure modules until both support it.
- This harness has no mocks or snapshots. If you need those, write the test for Jest Lua instead.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Testing QA and DevOps - Hub]]

**Related notes:** [[Lune - Run Luau Outside Studio]] · [[Unit Testing Luau with Jest-Lua and TestEZ]] · [[Automated Place Lint with Lune - QA Checks on rbxl Files]] · [[Module Architecture for a 50k-Line Roblox Game]]

<!-- TDOD_GRAPH_END -->

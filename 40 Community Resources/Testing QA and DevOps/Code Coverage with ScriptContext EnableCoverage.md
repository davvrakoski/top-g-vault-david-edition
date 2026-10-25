---
area: "40 Community Resources"
cluster: "Testing QA and DevOps"
source_note: "community/testing-devops/code-coverage-scriptcontext"
title: "Code Coverage with ScriptContext EnableCoverage"
tags: [roblox, community, "cluster/testing-qa-and-devops", testing, coverage, ci]
cssclasses: [tg-a40]
verified: 2026-10-25
license: "Roblox docs CC BY 4.0 (facts); code below is original"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/ScriptContext
  - https://create.roblox.com/docs/cloud/reference/features/luau-execution
---
# Code Coverage with ScriptContext EnableCoverage

**What exists:** `ScriptContext` has two coverage methods, documented in the engine API ([[ScriptContext]]):
- `ScriptContext:EnableCoverage(instance)`: marks `instance` and every script under it as a coverage root; the engine records per-line and per-function execution.
- `ScriptContext:GetCoverageStats()`: returns an array with one entry per tracked script. Each entry has `Script` and a `GetHits()` function. `GetHits()` returns **two arrays**: per-line hit counts (`-1` marks a line that was never executed or was excluded) and per-function records with `Name`, `Line` and `Hits`.

Both require **`PluginOrOpenCloud`** security: they work from a **plugin** or an **Open Cloud Luau Execution task**, not from game scripts. Both raise an error if coverage collection is not enabled, so test the call once in your setup before wiring it into CI.

Jest Lua's CLI page lists no coverage option, so this engine API is the practical route for coverage numbers on Roblox.

## Coverage inside a Luau Execution test task (original)
Enable coverage **before** anything requires the modules you want measured, then run the suite, then summarize. In a Luau Execution task, Scripts don't auto-run, so you control that order.

```luau
-- ci/run_tests_with_coverage.luau  (sent as the Luau Execution task script)
local ScriptContext = game:GetService("ScriptContext")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")

ScriptContext:EnableCoverage(ReplicatedStorage.Shared)
ScriptContext:EnableCoverage(ServerScriptService.Services)

local testSummary = require(ServerScriptService.RunJest)()

local perScript = {}
local totalFns, coveredFns = 0, 0

for _, entry in ScriptContext:GetCoverageStats() do
	local lineHits, functions = entry.GetHits()
	local linesHit = 0
	for _, hits in lineHits do
		if hits > 0 then
			linesHit += 1
		end
	end

	local fnTotal, fnCovered, missed = 0, 0, {}
	for _, fn in functions do
		fnTotal += 1
		if fn.Hits > 0 then
			fnCovered += 1
		else
			table.insert(missed, ("%s@%d"):format(fn.Name, fn.Line))
		end
	end
	totalFns += fnTotal
	coveredFns += fnCovered

	table.insert(perScript, {
		script = entry.Script:GetFullName(),
		linesHit = linesHit,
		functions = ("%d/%d"):format(fnCovered, fnTotal),
		missedFunctions = missed,
	})
end

return {
	passed = testSummary.passed,
	failedTests = testSummary.failedTests,
	functionCoverage = if totalFns > 0 then math.floor(coveredFns / totalFns * 1000) / 10 else 0,
	perScript = perScript,
}
```

Your CI script (see [[Engine Tests in CI with Open Cloud Luau Execution]]) reads the returned table and can fail the build when `functionCoverage` drops below a floor you set.

## Why function coverage first
The per-line array uses `-1` for both "never executed" and "excluded", so a strict line-coverage percentage is ambiguous from these docs alone. Function coverage (`Hits == 0`) is unambiguous and already answers the useful question: *which functions did no test touch?* The `missedFunctions` list is a ready-made to-do list for new tests.

## Sensible targets (recommendation)
- Economy, inventory, trading, save/migration modules: aim high; these are where regressions cost players.
- UI, camera and VFX modules: exclude them from coverage roots; they are tested by hand and by screenshots.
- Ratchet, don't jump: set the CI floor at today's number and raise it as tests land.

## Limits
- The return value of a Luau Execution task is capped at 4 MB; trim `perScript` for very large codebases.
- Coverage only measures what ran, not whether the assertions were good. Pair it with code review of the tests.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Testing QA and DevOps - Hub]]

**Related notes:** [[ScriptContext]] · [[Engine Tests in CI with Open Cloud Luau Execution]] · [[Jest Lua runCLI Options for CI]] · [[Unit Testing Luau with Jest-Lua and TestEZ]]

<!-- TDOD_GRAPH_END -->

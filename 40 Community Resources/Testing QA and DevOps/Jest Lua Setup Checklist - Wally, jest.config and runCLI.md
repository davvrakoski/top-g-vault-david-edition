---
area: "40 Community Resources"
cluster: "Testing QA and DevOps"
source_note: "community/testing-devops/jest-lua-setup"
title: "Jest Lua Setup Checklist - Wally, jest.config and runCLI"
tags: [roblox, community, "cluster/testing-qa-and-devops", testing, jest-lua]
cssclasses: [tg-a40]
verified: 2026-10-25
license: "MIT (Jest Lua)"
sources:
  - https://github.com/jsdotlua/jest-lua
  - https://jsdotlua.github.io/jest-lua/
  - https://jsdotlua.github.io/jest-lua/configuration
  - https://jsdotlua.github.io/jest-lua/expect
---
# Jest Lua Setup Checklist - Wally, jest.config and runCLI

| | |
|---|---|
| **What** | Lua port of JavaScript Jest (aligned to Jest v27.4.7 per its README) |
| **Maintainer** | jsdotlua org; fork of Roblox's `jest-roblox` |
| **License** | MIT |
| **Runs where** | **Inside Roblox only** (Studio, run-in-roblox, Open Cloud Luau Execution). Running under Lune is an open request, not a feature |
| **Link** | https://github.com/jsdotlua/jest-lua · docs https://jsdotlua.github.io/jest-lua |

The vault's deep dive [[Unit Testing Luau with Jest-Lua and TestEZ]] explains *why* and *what* to test. This note is the **setup checklist** with the exact pieces the Getting Started page asks for.

## 1. Dependencies (Wally)
Put both packages under `[dev-dependencies]` in `wally.toml`: `Jest` and `JestGlobals` from the `jsdotlua` scope (the docs pin **3.10.0** at the time of writing). Run `wally install`. Commit `wally.lock` so CI gets the same versions ([[Wally Dev Dependencies and Lockfiles for Test Packages]]).

## 2. Rojo project
Map the Wally output folder (dev packages) into the place next to your source. Keep it in a **test project file** (for example `test.project.json`) that your release project does not include, so Jest never ships.

## 3. `jest.config` in the folder under test
A ModuleScript returning a table. The minimum is a `testMatch` glob:

```luau
-- src/Shared/jest.config.luau
return {
	testMatch = { "**/*.spec" },
	-- Reset mock state between tests so one test cannot leak into the next.
	clearmocks = true,
	slowTestThreshold = 2,
}
```

Useful documented options: `testMatch`, `testPathIgnorePatterns`, `roots`, `projects` (monorepos), `setupFiles`, `setupFilesAfterEnv` (custom matchers, global `afterEach`), `slowTestThreshold` (seconds, default 5), `testFailureExitCode` (default 1), `snapshotSerializers`, `displayName`. `testRegex` cannot be combined with `testMatch`.

## 4. The engine flag
Jest Lua needs `debug.loadmodule`, which is behind the `FFlagEnableLoadModule` flag. The docs say to set it to `true` in Studio's `ClientAppSettings.json`. Without it, test files cannot be loaded fresh and the run fails. Re-check this after Studio updates; the flag requirement is the step most often missing from old tutorials.

## 5. A runner that works locally and in CI
This runner returns a small summary table (handy for Open Cloud Luau Execution, see [[Engine Tests in CI with Open Cloud Luau Execution]]) and also errors on failure so a human running it in Studio sees red.

```luau
--!strict
-- ServerScriptService/RunJest.luau (ModuleScript)
local ReplicatedStorage = game:GetService("ReplicatedStorage")

return function(): { passed: boolean, failedSuites: number, failedTests: number }
	local Jest = require(ReplicatedStorage.DevPackages.Jest)
	local root = ReplicatedStorage.Shared

	local status, result = Jest.runCLI(root, { ci = true, verbose = false }, { root }):awaitStatus()

	if status ~= "Resolved" then
		error("Jest run was rejected: " .. tostring(result))
	end

	local failedSuites = result.results.numFailedTestSuites
	local failedTests = result.results.numFailedTests
	local summary = {
		passed = failedSuites == 0 and failedTests == 0,
		failedSuites = failedSuites,
		failedTests = failedTests,
	}
	print(("[JEST] suites failed=%d tests failed=%d"):format(failedSuites, failedTests))
	return summary
end
```

The official example instead calls `ProcessService:ExitAsync(0 or 1)` when that service exists (it does under run-in-roblox-style runners). Either approach is fine; pick one signal and make CI check it.

## 6. Lua differences that trip JS developers
- Import everything from `JestGlobals` (`describe`, `test`/`it`, `expect`, `jest`, hooks). Nothing is global.
- Negation is `.never`, not `.not`: `expect(x).never.toBe(0)`.
- `toBeNil()` replaces null/undefined checks; `toBeNan` is spelled with a lower-case "an".
- `toMatchInstance` is a Lua-only matcher for comparing Instance properties.
- Regex `toMatch` needs the LuauRegExp package; promise tests need roblox-lua-promise.
- `.only` / `.skip` / `.todo` / `.failing` are documented on `test`; `it` is listed as an alias.

## Checklist
- [ ] `Jest` + `JestGlobals` in `[dev-dependencies]`, `wally.lock` committed.
- [ ] Dev packages mapped only in the test Rojo project.
- [ ] `jest.config` with `testMatch` at the root of each tested folder.
- [ ] `FFlagEnableLoadModule` set for local Studio runs.
- [ ] Runner returns or exits with a clear pass/fail signal, and CI checks it.
- [ ] `ci = true` in CI so new snapshots fail instead of being written silently ([[Jest Lua runCLI Options for CI]]).

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Testing QA and DevOps - Hub]]

**Related notes:** [[Unit Testing Luau with Jest-Lua and TestEZ]] · [[TestEZ in 2026 - Archived Status, License and Migration Path]] · [[Jest Lua runCLI Options for CI]] · [[Engine Tests in CI with Open Cloud Luau Execution]]

<!-- TDOD_GRAPH_END -->

---
area: "40 Community Resources"
cluster: "Testing QA and DevOps"
source_note: "community/testing-devops/jest-lua-runcli-options"
title: "Jest Lua runCLI Options for CI"
tags: [roblox, community, "cluster/testing-qa-and-devops", testing, jest-lua, ci]
cssclasses: [tg-a40]
verified: 2026-10-25
license: "MIT (Jest Lua)"
sources:
  - https://jsdotlua.github.io/jest-lua/cli
  - https://jsdotlua.github.io/jest-lua/configuration
---
# Jest Lua runCLI Options for CI

`runCLI(rootDir, options, projects)` takes an options table that mirrors Jest's command-line flags. The options below are listed on the Jest Lua CLI page. Pick a **CI profile** and a **local profile** and keep them in one module so nobody hand-edits flags.

## Options worth knowing

| Option | Type | Use it for |
|---|---|---|
| `ci` | boolean | CI mode: a **new** snapshot fails the run instead of being saved. Always `true` in CI |
| `updateSnapshot` | boolean | Deliberately rewrite snapshots (local only, then commit the result) |
| `json` | boolean | Print results as JSON; other output goes to stderr. Good for tools that parse results |
| `testNamePattern` | regex | Run only tests whose full name (including `describe` names) matches |
| `testPathPattern` | regex | Run only matching test files |
| `testPathIgnorePatterns` | regex[] | Skip matching files (slow or quarantined suites) |
| `testMatch` | glob[] | Override how test files are found |
| `passWithNoTests` | boolean | Don't fail when a filter matches zero files (useful for "affected tests only" jobs) |
| `listTests` | boolean | Print which files would run, then exit. Quick sanity check for globs |
| `clearMocks` / `resetMocks` | boolean | Reset mock calls (or implementations) before every test |
| `noStackTrace`, `expand` | boolean | Shorter or fuller failure output |
| `showConfig`, `debug` | boolean | Print the resolved config when tests are not being found |
| `testTimeout`, `verbose` | number / boolean | Listed on the page; use `verbose` locally, keep CI output compact |
| `oldFunctionSpying` | boolean | Roblox-only: how `jest.spyOn()` replaces methods |

There is **no `coverage` option** on that page. For coverage, see [[Code Coverage with ScriptContext EnableCoverage]].

## A profile module (original example)

```luau
--!strict
-- ServerScriptService/JestProfiles.luau
local Profiles = {}

-- Strict and quiet: what CI and Open Cloud runs use.
Profiles.ci = {
	ci = true,
	verbose = false,
	noStackTrace = false,
	passWithNoTests = false,
}

-- Friendly for a developer pressing Run in Studio.
Profiles.studio = {
	ci = false,
	verbose = true,
	expand = true,
}

-- Run one area quickly, e.g. Profiles.only("Inventory")
function Profiles.only(namePattern: string)
	return {
		ci = false,
		verbose = true,
		testNamePattern = namePattern,
	}
end

return Profiles
```

Use it from your runner: `Jest.runCLI(root, Profiles.ci, { root })`.

## Rules of thumb
- **Snapshots:** `ci = true` in CI means a missing snapshot is a failure. Generate snapshots locally with `updateSnapshot = true`, review the diff, commit.
- **Quarantine, don't delete:** a flaky suite goes into `testPathIgnorePatterns` with a ticket id comment and a date. Review the list weekly.
- **Filters in CI are risky:** a typo in `testNamePattern` can silently run zero tests. Leave `passWithNoTests` off in the main job.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Testing QA and DevOps - Hub]]

**Related notes:** [[Jest Lua Setup Checklist - Wally, jest.config and runCLI]] · [[Unit Testing Luau with Jest-Lua and TestEZ]] · [[Engine Tests in CI with Open Cloud Luau Execution]]

<!-- TDOD_GRAPH_END -->

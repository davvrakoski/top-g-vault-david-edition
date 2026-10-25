---
area: "40 Community Resources"
cluster: "Testing QA and DevOps"
source_note: "community/testing-devops/testez-2026-status"
title: "TestEZ in 2026 - Archived Status, License and Migration Path"
tags: [roblox, community, "cluster/testing-qa-and-devops", testing, testez]
cssclasses: [tg-a40]
verified: 2026-10-25
license: "Apache-2.0 (TestEZ)"
sources:
  - https://github.com/Roblox/testez
  - https://roblox.github.io/testez/api-reference/
  - https://kampfkarren.github.io/selene/roblox.html
---
# TestEZ in 2026 - Archived Status, License and Migration Path

| | |
|---|---|
| **What** | Roblox's original BDD-style test framework (`describe` / `it` / `expect`) |
| **Maintainer** | Roblox (GitHub `Roblox/testez`) |
| **Status** | **Archived on 2024-09-14**, read-only. No fixes, no new releases |
| **License** | Apache-2.0 |
| **Link** | https://github.com/Roblox/testez · docs https://roblox.github.io/testez |

## What "archived" means for you
- Existing TestEZ suites keep working. The framework is plain Luau, so an archive does not break it overnight.
- Bugs you hit will not be fixed upstream. If you vendor it, you own it.
- New projects should start on **Jest Lua** (see [[Jest Lua Setup Checklist - Wally, jest.config and runCLI]]), a fork of Roblox's `jest-roblox` that the jsdotlua org maintains (MIT).
- Apache-2.0 lets you keep a vendored copy in your repo. Keep the LICENSE file next to it.

## TestEZ features you rely on (and their Jest Lua twins)
The API reference documents these; the Jest column is the usual replacement.

| TestEZ | What it does | Jest Lua equivalent |
|---|---|---|
| `beforeAll` / `afterAll` | Run once per `describe` scope | same names |
| `beforeEach` / `afterEach` | Run around every `it`; `afterEach` runs even when the test failed | same names |
| `init.spec` file | Hooks that apply to every spec in a folder (data passed through `context`) | `setupFilesAfterEnv` in `jest.config` |
| `itFOCUS` / `fit`, `describeFOCUS` / `fdescribe` | Only run focused blocks | `test.only` / `describe.only` (`fdescribe` also listed) |
| `itSKIP` / `xit`, `describeSKIP` / `xdescribe` | Skip a block | `test.skip` / `describe.skip` (`xdescribe` also listed) |
| `itFIXME`, `FIXME(msg)` | Mark a known-broken block as skipped | `test.todo(name)` or `test.failing` |
| `expect(x).to.equal(y)` | Equality | `expect(x).toBe(y)` / `toEqual` for tables |
| `.never.to.equal(y)` | Negation | `.never.toBe(y)` (Jest Lua uses `never`, not `not`) |
| `.to.be.ok()` | Not nil/false | `toBeTruthy()` / `never.toBeNil()` |
| `.to.be.near(v, limit)` | Float compare | `toBeCloseTo` |
| `.to.throw(msg?)` | Function throws | `toThrow(msg?)` |

Names in the Jest column come from the Jest Lua API and expect pages (jsdotlua.github.io/jest-lua); `it` is an alias of `test` there, but the `.only`/`.skip` variants are documented on `test`.

Docs gotcha worth knowing: TestEZ hooks run **after** all `describe` callbacks, so setup code written directly inside a `describe` (outside `it`) runs before your `beforeAll`. Put setup in hooks, not in the `describe` body.

`FOCUS()`, `SKIP()` and `FIXME()` only work inside a `describe`, never inside an `it`.

## Migration path (low-risk order)
1. Freeze TestEZ at the version you have; pin it in `wally.toml` or vendor it.
2. Add Jest Lua as a **dev dependency** next to it ([[Wally Dev Dependencies and Lockfiles for Test Packages]]).
3. Write all **new** specs in Jest style. Run both runners in CI until the old suite is small.
4. Port old specs folder by folder: mostly a find-and-replace from `.to.equal(` to `.toBe(` plus moving to `JestGlobals` imports. Tables compared with `to.equal` need `toEqual`.
5. Delete TestEZ when the last spec moves, and drop `testez` from your selene std (`std = "roblox+testez"` becomes `std = "roblox"`; see [[selene for Roblox - Config, Std and Inline Filters]]).

## Common mistakes
- Treating "archived" as "insecure": it is a test-only dependency; the risk is unfixed bugs, not exploits.
- Shipping TestEZ in the production place. Keep it in a dev-only folder excluded from your release build.
- Comparing tables with `to.equal` (identity) and wondering why equal-looking tables fail.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Testing QA and DevOps - Hub]]

**Related notes:** [[Unit Testing Luau with Jest-Lua and TestEZ]] · [[Jest Lua Setup Checklist - Wally, jest.config and runCLI]] · [[Open-Source Evaluation Rubric]] · [[Testing - Hub]]

<!-- TDOD_GRAPH_END -->

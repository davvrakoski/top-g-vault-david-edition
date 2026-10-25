---
area: "14 Testing and QA"
cluster: "Testing"
title: "Flaky Tests in Roblox Suites - Causes and Fixes"
tags: [roblox, community-knowledge, testing, flaky-tests, ci, jest-lua]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://martinfowler.com/articles/nonDeterminism.html
  - https://testing.googleblog.com/2016/05/flaky-tests-at-google-and-how-we.html
  - https://jsdotlua.github.io/jest-lua/
  - https://create.roblox.com/docs/reference/engine/libraries/task
---
# Flaky Tests in Roblox Suites - Causes and Fixes

A flaky test passes and fails on the same code. Once a suite has a few, people start re-running CI until it goes green and stop trusting failures, which defeats the point of testing. Google's testing blog reported that a meaningful share of their tests showed some flakiness, and Martin Fowler calls non-deterministic tests "useless" until fixed or quarantined. Roblox suites have their own typical causes, mostly around yielding, replication and shared state.

## Common causes on Roblox
| Cause | Symptom | Fix |
|---|---|---|
| Real waiting (`task.wait(0.5)` then assert) | Fails on slow CI machines | Inject a clock / scheduler; or wait for the condition with a timeout |
| Replication timing in Studio integration tests | Client sees value "sometimes" | Wait for the replicated signal (`GetAttributeChangedSignal`, `ChildAdded`), not a fixed time |
| Shared module state | Order-dependent failures | Reset in `beforeEach`; construct fresh objects per test instead of singletons |
| Global randomness (`math.random`) | Rare failures, never reproducible | Pass a seeded `Random` (see the seeded randomness note) |
| `pairs` iteration order | Different order across runs | Sort keys before asserting order-sensitive output |
| Physics in tests | Positions differ slightly per run | Assert tolerances (`< 0.01`), or test logic without physics |
| Real DataStores / HTTP | Throttling, network errors | Fakes in unit tests; separate, retried integration tests |
| Leaked connections between tests | Handler from test A fires in test B | Disconnect in `afterEach`; use a cleanup helper |

## Waiting the right way
Replace sleeps with a bounded poll for the thing you actually need:
```lua
local function waitFor(predicate: () -> boolean, timeout: number): boolean
	local start = os.clock()
	while not predicate() do
		if os.clock() - start > timeout then
			return false
		end
		task.wait()
	end
	return true
end

it("grants the reward after the round ends", function()
	Round.finish(testRound)
	expect(waitFor(function()
		return player:GetAttribute("Coins") == 50
	end, 5)).toBe(true)
end)
```
Short when it works, clearly a failure (with a reason) when it does not.

Better still for unit tests: make the code under test take its timing from an injected scheduler, so the test advances time instantly (see [[Dependency Injection and Fakes for Luau Unit Tests]]).

## Process
1. **Detect.** Have CI re-run a failed suite once and flag tests that pass on retry as "flaky" rather than silently passing. Track them in a list.
2. **Quarantine.** Move flaky tests to a separate, non-blocking job (Jest-Lua lets you filter which tests run; keep the quarantined ones in their own folder or name pattern). Do not delete them.
3. **Fix within a set time** (for example one sprint), using the table above. If it cannot be fixed, rewrite it at a lower level (unit instead of integration).
4. **Prevent.** Code review rule: no fixed `task.wait` in tests, no global random, no shared mutable module state.

## Run order and isolation
- Randomise test order occasionally (or reverse it) to expose hidden dependencies.
- Run the suite 20 times in a row locally before trusting a new integration test; flakiness at 1 in 20 is common and invisible in a single run.

## Related
[[Testing - Hub]] · [[Seeded Randomness and Deterministic Tests]] · [[Jest Lua runCLI Options for CI]] · [[GitHub Actions CI for Rojo Projects - Lint, Format, Build]]

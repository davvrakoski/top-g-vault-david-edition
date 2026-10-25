---
area: "14 Testing and QA"
cluster: "Testing"
title: "Seeded Randomness and Deterministic Tests"
tags: [roblox, community-knowledge, testing, random, determinism, unit-tests]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/datatypes/Random
  - https://create.roblox.com/docs/reference/engine/libraries/math
  - https://martinfowler.com/articles/nonDeterminism.html
  - https://hypothesis.works/articles/what-is-property-based-testing/
---
# Seeded Randomness and Deterministic Tests

Loot tables, crits, procedural maps, spawn waves and AI choices all use randomness, which makes them the hardest systems to test and to reproduce bugs in. "Sometimes the boss drops nothing" is unfixable until you can replay the exact roll. The cure is to route all randomness through a seeded `Random` object you can control, and to write tests over many seeds instead of one lucky run.

## Use Random objects, not the global generator
`math.random` / `math.randomseed` share one global generator across every script in that Luau VM, so any other script calling it changes your sequence. The `Random` datatype gives each system its own stream:

```lua
local rng = Random.new(12345)         -- fixed seed: same sequence every time
rng:NextInteger(1, 100)               -- inclusive integer
rng:NextNumber()                      -- 0..1
rng:NextNumber(5, 10)                 -- range
rng:Shuffle(array)                    -- in-place shuffle
rng:NextUnitVector()
local copy = rng:Clone()              -- same state, independent from now on
```

## Inject the generator
```lua
-- Loot.lua
local Loot = {}
function Loot.roll(rng: Random, tbl: {{id: string, weight: number}}): string
	local total = 0
	for _, e in tbl do total += e.weight end
	local pick = rng:NextNumber(0, total)
	for _, e in tbl do
		pick -= e.weight
		if pick <= 0 then return e.id end
	end
	return tbl[#tbl].id
end
return Loot
```
Live code passes `Random.new()` (seeded from entropy); tests pass `Random.new(seed)`.

## Three kinds of tests
1. **Golden seed tests.** Fix a seed and assert the exact output. Catches accidental changes to roll order. Update deliberately when you change the algorithm.
2. **Distribution tests.** Roll 100,000 times with a fixed seed, check each item's share is within tolerance of its weight:
   ```lua
   local rng = Random.new(7)
   local counts = {}
   for _ = 1, 100000 do
   	local id = Loot.roll(rng, TABLE)
   	counts[id] = (counts[id] or 0) + 1
   end
   expect(math.abs(counts.Rare / 100000 - 0.05)).toBeLessThan(0.005)
   ```
3. **Property tests over many seeds.** For seeds 1..500, generate a map / wave / shop and assert invariants that must always hold: "every room reachable", "no wave above the budget", "shop never offers an owned item". This is the core idea of property-based testing (Hypothesis article): check rules over many generated inputs rather than examples. When one seed fails, the seed **is** the reproduction.

## Make live bugs reproducible
- Log the seed of each procedural generation or round: `print("[MapGen] seed", seed)` and store it on the server (attribute or analytics event).
- Allow an admin or test command to force a seed: `MapGen.generate(forcedSeed or os.clock() * 1e6 // 1)`.
- For per-player rolls (gacha, crates), store seed + roll index per transaction for support cases.

## Other sources of non-determinism
Martin Fowler's "Eradicating Non-Determinism in Tests" lists the usual culprits; on Roblox they are:
- **Time:** inject a clock instead of `os.clock()` / `task.wait`.
- **Iteration order:** `pairs` over dictionaries has no guaranteed order; sort keys before rolling if order matters.
- **Shared state between tests:** reset module-level caches in `beforeEach`.
- **Physics:** the physics engine is not deterministic across machines; test the logic around it, not exact positions.

## Pitfalls
- Re-seeding with `os.time()` twice in the same second gives the same sequence (for example two crates opened together).
- Using one `Random` for both gameplay and cosmetics means adding a particle effect changes loot. Split streams per system.

## Related
[[Testing - Hub]] · [[Dependency Injection and Fakes for Luau Unit Tests]] · [[Pity Timers and Pseudo-Random Distribution]] · [[Daily Quest Rotation - Deterministic Seeds and Fair Resets]]

---
area: "14 Testing and QA"
cluster: "Testing"
title: "Property-Based Testing in Luau - Generators, Invariants and Shrinking"
tags: [roblox, community-knowledge, testing, property-based-testing, luau, unit-tests]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://hypothesis.readthedocs.io/en/latest/
  - https://hypothesis.works/articles/what-is-property-based-testing/
  - https://create.roblox.com/docs/reference/engine/datatypes/Random
---
# Property-Based Testing in Luau - Generators, Invariants and Shrinking

Example-based unit tests check the cases you imagined: "buying a sword for 100 coins with 150 coins leaves 50". Property-based testing, popularised by QuickCheck in Haskell and Hypothesis in Python, flips this: you state a rule that must hold **for all inputs in a range**, and the framework throws hundreds of random inputs at it, including edge cases you did not think of. When a rule breaks, it **shrinks** the failing input to the smallest case that still fails, so you get "fails with inventory = {stackSize = 0}" instead of a 40-item random mess. No mature Luau library is assumed here; the core takes about 60 lines and runs in any Luau test runner (Lune, Jest Lua, TestEZ-style).

## Where it pays off in Roblox games

Pure logic modules with clear rules:

- Inventory add / remove / stack / split
- Currency math, discounts, tax on trades, rounding
- Damage formulas with armour, crits and clamps
- Save migrations (migrate twice = migrate once)
- Serialisation (decode(encode(x)) == x)
- Level/XP curves (monotonic, never negative)
- Matchmaking team balance (team sizes differ by at most 1)

It is a poor fit for physics, UI layout or anything that needs a running server.

## A tiny generator kit

Use a seeded `Random` so every failure can be replayed ([[Seeded Randomness and Deterministic Tests]]). If your headless runner lacks the `Random` datatype, wrap `math.random` after `math.randomseed(seed)` behind the same `NextInteger` shape.

```lua
local Gen = {}

function Gen.int(lo, hi)
	return function(rng) return rng:NextInteger(lo, hi) end
end

function Gen.list(itemGen, maxLen)
	return function(rng)
		local out = {}
		for i = 1, rng:NextInteger(0, maxLen) do out[i] = itemGen(rng) end
		return out
	end
end

local function forAll(name, gen, prop, runs, seed)
	seed = seed or os.time()
	local rng = Random.new(seed)
	for i = 1, runs or 200 do
		local input = gen(rng)
		local ok, err = pcall(prop, input)
		if not ok or err == false then
			error(`{name} failed (seed {seed}, run {i}): {tostring(err)}`)
		end
	end
end
```

## Writing properties

```lua
forAll("stacking never changes total count",
	Gen.list(Gen.int(1, 99), 30),
	function(amounts)
		local inv = Inventory.new({ maxStack = 64 })
		local total = 0
		for _, n in amounts do inv:add("Wood", n); total += n end
		return inv:count("Wood") == total
			and inv:largestStack("Wood") <= 64
	end)
```

Good property shapes:

| Shape | Example |
| --- | --- |
| Invariant | Currency never negative after any sequence of buys |
| Round trip | `decode(encode(save))` equals `save` |
| Idempotence | `migrate(migrate(s))` equals `migrate(s)` |
| Oracle | Fast damage function equals the slow, obvious one |
| Conservation | Trade: total items across both players unchanged |
| Monotonic | XP needed for level n+1 > level n |

## Shrinking, the simple version

Full shrinking is what libraries like Hypothesis do well. A cheap version that still helps: when a list input fails, retry with each element removed and with each number halved toward zero, keep any smaller input that still fails, and repeat until nothing shrinks. Even this crude loop usually turns a 30-element failure into a 1-3 element one, which makes the bug obvious.

## Practical rules

- Always print the **seed**; rerunning with that seed reproduces the failure exactly.
- Keep generator ranges realistic plus a little beyond (negative numbers, zero, max stack + 1), because exploiters send values beyond the UI's limits ([[RemoteEvent Fuzzing - Bad Input Tests Before Launch]]).
- 200 runs per property is plenty in CI; bump to 10,000 locally when hunting.
- When a property finds a bug, also add the shrunk input as a normal example test so it stays covered forever.

## Related

[[Testing - Hub]] · [[Seeded Randomness and Deterministic Tests]] · [[Dependency Injection and Fakes for Luau Unit Tests]] · [[Lune Test Harness for Pure Luau Modules]]

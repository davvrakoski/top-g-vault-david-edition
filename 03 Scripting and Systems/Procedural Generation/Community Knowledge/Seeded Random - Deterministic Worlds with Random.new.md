---
area: "03 Scripting and Systems"
cluster: "Procedural Generation"
title: "Seeded Random - Deterministic Worlds with Random.new"
tags: [roblox, community-knowledge, procedural, random, seeds, determinism, daily-challenge]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/datatypes/Random
  - https://create.roblox.com/docs/reference/engine/libraries/math
---
# Seeded Random - Deterministic Worlds with Random.new

Procedural content is only useful in production if you can **reproduce** it: a bug report says "seed 48213 spawned a chest inside a wall", a daily challenge must be the same map for every server, a saved world must regenerate identically, and the client should be able to rebuild cosmetic detail from a seed instead of receiving thousands of parts. The `Random` datatype gives you independent, seedable generators; using it consistently is the whole trick.

## Random API (from the reference)

| Member | Returns |
| --- | --- |
| `Random.new(seed?)` | generator; no seed = internal entropy source |
| `rng:NextInteger(min, max)` | integer in [min, max] |
| `rng:NextNumber()` / `rng:NextNumber(min, max)` | float in [0, 1) or [min, max) |
| `rng:NextUnitVector()` | random direction Vector3 |
| `rng:Shuffle(t)` | in-place Fisher-Yates shuffle of the array part; errors on nil holes |
| `rng:Clone()` | copy with the same internal state |

Seed rules: the seed is truncated toward zero to an integer and should be within +/-9,007,199,254,740,991 (values outside are clamped to 0). Seeds 0 and 0.99 give **identical** generators. The `Shuffle` docs promise a consistent number of `NextInteger` calls across engine versions for a given table size.

## Why not math.random?

`math.random` / `math.randomseed` use one shared global generator. Any other script calling `math.random` in between shifts your sequence, so the same seed stops producing the same world. Give each system its **own** `Random` object.

## Pattern: one seed, many independent streams

If terrain, loot and enemies all pull from one generator, adding one extra loot roll changes all the enemies. Derive sub-seeds per system and per chunk instead:

```lua
local function subSeed(worldSeed: number, ...: number): number
	-- simple deterministic integer mix (own code; not cryptographic)
	local h = worldSeed % 2147483647
	for _, v in { ... } do
		h = (h * 31 + v) % 2147483647
	end
	return h
end

local TERRAIN, LOOT, ENEMIES = 1, 2, 3
local function chunkRng(worldSeed: number, system: number, cx: number, cz: number): Random
	return Random.new(subSeed(worldSeed, system, cx + 100000, cz + 100000))
end
```

Now chunk (5, -2) always gets the same loot regardless of generation order, and you can regenerate a single chunk.

## Daily and weekly seeds

```lua
local function dailySeed(): number
	return math.floor(os.time() / 86400) -- UTC day number
end
```
All servers on the same UTC day agree without any shared storage. Mix in a constant per game mode so "daily obby" and "daily dungeon" differ.

## Storing and sharing seeds

- Generate a fresh seed with `math.random(1, 2^31 - 1)` or `Random.new():NextInteger(...)` and **save it** with the world/run data ([[Config Feature Flags and Content Data]]).
- Show the seed in a debug overlay or the run summary; testers can then replay a bad layout.
- Version your generator: store `{ seed = 48213, genVersion = 3 }`. When you change generation code, old saves either keep using v3 rules or are migrated deliberately.

## Client-side reconstruction

For purely cosmetic detail (grass tufts, pebbles, wall decals), send only the chunk seed and let each client generate locally from the same `Random` calls. The server never has to replicate those instances. Gameplay-relevant objects (loot, hitboxes) must stay server-generated.

## Pitfalls
1. **Iteration order.** `pairs` over a dictionary has no guaranteed order; consuming random numbers inside such a loop makes output order-dependent. Sort keys first or iterate arrays.
2. **Yields and concurrency.** Two threads sharing one generator interleave unpredictably. One generator per thread/system.
3. **Floating-point drift** across platforms is rarely an issue for `Random`, but derived physics simulation is not deterministic; don't expect physics replays to match.

## Related
[[Procedural Generation - Hub]] · [[Weighted Random Selection]] · [[Poisson Disk Sampling for Prop Scatter]] · [[Fractal Noise Terrain with math.noise - Octaves, Redistribution and Islands]]

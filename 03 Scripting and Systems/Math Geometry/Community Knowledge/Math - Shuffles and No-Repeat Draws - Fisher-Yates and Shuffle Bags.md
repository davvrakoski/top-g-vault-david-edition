---
area: "03 Scripting and Systems"
cluster: "Math Geometry"
title: "Math - Shuffles and No-Repeat Draws - Fisher-Yates and Shuffle Bags"
tags: [roblox, community-knowledge, math, random, shuffle, game-design]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/datatypes/Random
  - https://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle
---
# Math - Shuffles and No-Repeat Draws - Fisher-Yates and Shuffle Bags

Pure random picks feel unfair: the same map three rounds in a row, the same quest twice, the killer chosen four times. Players read streaks as bugs. Two tools fix this: a correct **shuffle** (every order equally likely) and a **shuffle bag** (draw without replacement, refill when empty). Roblox's `Random` object already ships a correct shuffle.

## Random:Shuffle

`Random.new(seed?)` has `Shuffle(tb)`, which "uniformly shuffles a table in-place" (API reference). Other members: `NextInteger(min, max)`, `NextNumber(min?, max?)`, `NextUnitVector()`, `Clone()`.

```lua
local rng = Random.new()
local maps = {"Mall", "Docks", "School", "Farm"}
rng:Shuffle(maps)
```

It works on array-like tables. Seed it (`Random.new(serverSeed)`) if you need the same order on every server or in tests.

## Writing Fisher-Yates yourself (own code)

Useful when you shuffle only part of an array or need to understand the bias trap:

```lua
local function shuffle<T>(arr: {T}, rng: Random)
	for i = #arr, 2, -1 do
		local j = rng:NextInteger(1, i) -- 1..i, NOT 1..#arr
		arr[i], arr[j] = arr[j], arr[i]
	end
end
```

The classic bug is picking `j` from the whole array every step. That produces some orders more often than others (n^n paths onto n! orders), which is measurable over thousands of rounds.

## Shuffle bag: no repeats until all are used (own code)

```lua
local Bag = {}
Bag.__index = Bag
function Bag.new(items, rng)
	return setmetatable({ src = table.clone(items), pool = {}, rng = rng or Random.new(), last = nil }, Bag)
end
function Bag:Next()
	if #self.pool == 0 then
		self.pool = table.clone(self.src)
		self.rng:Shuffle(self.pool)
		if #self.pool > 1 and self.pool[#self.pool] == self.last then
			-- avoid an immediate repeat across the refill boundary
			self.pool[1], self.pool[#self.pool] = self.pool[#self.pool], self.pool[1]
		end
	end
	local item = table.remove(self.pool) -- pop from the end, O(1)
	self.last = item
	return item
end
return Bag
```

Uses: map rotation, quest of the day, random voice lines, enemy spawn points, "who is the monster" in round games (put each player in once per cycle).

## Pick k distinct items

Shuffle a copy and take the first k, or run the Fisher-Yates loop only k times from the end (partial shuffle) and take the last k. Both avoid the "reroll until unique" loop, which slows down badly when k is close to n.

## Weighted bags

To keep fairness with weights, put an item in the bag several times (3 copies = 3x as likely per cycle). For true probability weights with replacement, use a weighted table instead.

## Pitfalls

- `math.random` shares global state; use a `Random` object per system so one system's draws do not shift another's.
- `Shuffle` mutates the table you pass: clone config tables first or you shuffle your source data.
- Bags reset per server. If no-repeat must hold across servers (daily quest), store the bag position in a DataStore.

## Related
[[Math Geometry - Hub]] · [[Weighted Random Selection]] · [[Seeded Random - Deterministic Worlds with Random.new]] · [[Pity Timers and Pseudo-Random Distribution]]

---
area: "02 Game Design and Economy"
cluster: "Inventory Economy"
title: "Big Numbers in Simulators - Doubles, 2^53 and Number Libraries"
tags: [roblox, community-knowledge, economy, simulator, numbers, luau, datastore]
cssclasses: [tg-a02]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/luau/numbers
  - https://devforum.roblox.com/t/numbers-above-18e308/2404565
  - https://devforum.roblox.com/t/dealing-with-large-numbers/4074545
  - https://devforum.roblox.com/t/bignumber-scalable-math-system-for-huge-numbers-in-roblox/4039476
  - https://devforum.roblox.com/t/alephnum-calculate-up-to-101e308/4761508
  - https://create.roblox.com/docs/production/configs
---
# Big Numbers in Simulators - Doubles, 2^53 and Number Libraries

Simulators race to absurd numbers (Sextillion, "1e45 coins") because exponential cost curves demand it. Luau has one number type, a 64-bit double. That gives you a huge range but limited precision, and two hard walls you must plan for **before** launch, because changing number storage in live saves is painful.

## The two walls

| Wall | Value | What breaks |
|---|---|---|
| Exact integers | 2^53 = 9,007,199,254,740,992 (~9e15) | Above this, adding small amounts does nothing (`1e17 + 1 == 1e17`) |
| Max double | ~1.797e308 | Beyond this you get `inf`; `inf - inf` is `nan` and saves break |

Roblox's own docs repeat the same limits for config numbers: ±1.797e308, exact integers only to ±2^53.

## Decide your number strategy by design scope

1. **Stay under ~1e15 (most games).** Keep plain numbers. Use `math.floor` on currency, abbreviate in UI (K, M, B, T). Lowest cost, fastest.
2. **Go up to ~1e300 with doubles.** Fine for display-only "big" currencies if you accept that small gains vanish at the top (they are irrelevant there anyway). Keep costs and rewards proportional (multiplicative), not additive.
3. **Beyond 1e308.** Use a mantissa-exponent library (store `{m, e}` such that value = m x 10^e). Community options found on DevForum include **BigNumber**, **InfiniteMath**, **EternityNum**-style ports and **AlephNum** (claims up to 10^^1e308). Check each one's license and maintenance before adopting (licenses not verified here).
4. **Change units instead.** A DevForum reply suggests: if accuracy does not matter, rescale (e.g. "1 Gold = 1e12 Coins") and adjust rates. A second currency tier is also a natural rebirth reward.

## Mantissa-exponent in 20 lines

```lua
-- Own minimal example: value = m * 10^e, 1 <= m < 10
local Big = {}
function Big.new(m: number, e: number) 
	if m == 0 then return { m = 0, e = 0 } end
	local shift = math.floor(math.log10(math.abs(m)))
	return { m = m / 10 ^ shift, e = e + shift }
end
function Big.mul(a, b) return Big.new(a.m * b.m, a.e + b.e) end
function Big.add(a, b)
	if a.e < b.e then a, b = b, a end
	if a.e - b.e > 15 then return a end   -- b too small to matter
	return Big.new(a.m + b.m / 10 ^ (a.e - b.e), a.e)
end
function Big.lt(a, b) return a.e < b.e or (a.e == b.e and a.m < b.m) end
```

## Saving and leaderboards

- DataStores serialize to JSON: `inf` and `nan` are not valid JSON numbers. Clamp before saving.
- Save big values as `{m, e}` tables or as a string; keep a version field so you can migrate.
- **OrderedDataStore only sorts integers.** For leaderboards on huge values, store a sortable integer such as `floor(log10(value) * 1000)` (or exponent x 1000 + first digits).

## Pitfalls

- Mixing big-number tables and plain numbers in one formula silently coerces or errors. Wrap all currency math in one module.
- Library operations are much slower than native math; avoid per-frame big-number math on hundreds of entities.
- UI abbreviation tables need to cover your whole range; the community note on number abbreviation has suffix lists.

## Related
[[Inventory Economy - Hub]] - [[Incremental Cost Curves - Exponential Costs and Bulk Buy Math]] - [[Number Abbreviation for Simulator UIs]] - [[Rebirth and Prestige Formulas - Pacing Resets That Feel Good]]

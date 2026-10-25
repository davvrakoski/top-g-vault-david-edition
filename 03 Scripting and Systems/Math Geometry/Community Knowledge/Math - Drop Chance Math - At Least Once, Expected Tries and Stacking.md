---
area: "03 Scripting and Systems"
cluster: "Math Geometry"
title: "Math - Drop Chance Math - At Least Once, Expected Tries and Stacking"
tags: [roblox, community-knowledge, math, probability, loot, economy]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://en.wikipedia.org/wiki/Geometric_distribution
  - https://create.roblox.com/docs/reference/engine/datatypes/Random
---
# Math - Drop Chance Math - At Least Once, Expected Tries and Stacking

"1% drop rate" sounds like "you get it in 100 kills". It is not: after 100 kills about a third of players still have nothing. Designers who get this wrong ship grinds that feel broken for a big slice of players. This note gives the handful of formulas you need to set drop rates on purpose and explain them in the UI.

## The core formulas

For an independent chance `p` per try:

| Question | Formula |
| --- | --- |
| Chance of at least one drop in `n` tries | `1 - (1 - p)^n` |
| Average tries until the first drop | `1 / p` |
| Tries needed for a target confidence `c` | `ceil( log(1 - c) / log(1 - p) )` |
| Chance of zero drops in `n` tries | `(1 - p)^n` |

## Worked numbers for p = 1%

| Tries | Chance you have it |
| --- | --- |
| 50 | 39.5% |
| 69 | 50.0% (the median) |
| 100 | 63.4% |
| 230 | 90.1% |
| 299 | 95.0% |
| 459 | 99.0% |

So at 1% the unlucky 5% of players need about 3x the "expected" 100 tries. That tail is where quitting happens; it is the argument for pity timers.

## Luau helpers (own code)

```lua
local Odds = {}
function Odds.atLeastOnce(p: number, n: number): number
	return 1 - (1 - p) ^ n
end
function Odds.triesFor(p: number, confidence: number): number
	return math.ceil(math.log(1 - confidence) / math.log(1 - p))
end
function Odds.roll(p: number, rng: Random): boolean
	return rng:NextNumber() < p
end
return Odds
```

`Odds.triesFor(0.01, 0.95)` returns 299.

## Stacking chances

- **Two separate rolls** (a 5% bonus roll on top of a 10% base) combine as `1 - (1 - 0.10)(1 - 0.05) = 14.5%`, not 15%.
- **Luck multipliers** usually multiply `p`, then cap: `math.min(p * luck, 1)`. On a weighted table, multiplying only the rare weights also lowers the common items' share, so recompute and display the new percentages.
- **Multiple drops per kill**: decide whether the roll is per item (independent) or one roll on a weighted table (exactly one result). They feel very different at high luck.

## Setting a rate from a target time

Want the median player to get the item in 2 hours at 3 kills per minute? That is 360 kills, and the median is `ln 2 / p` tries, so `p = 0.693 / 360 = 0.19%`. Then check the 95% tail (`~3 / p` = about 1,560 kills, 8.7 hours) and decide if that is acceptable or needs pity.

## Showing odds

- Round displayed odds sensibly (2 significant figures) and make sure the displayed table sums to 100% after any luck changes.
- Paid random items have Roblox policy requirements for disclosed odds; see the policy notes linked below before shipping.

## Pitfalls

- `NextNumber() < p` is correct; `<=` adds a tiny bias only at the edges, but keep one convention everywhere.
- Never roll rare drops on the client; roll on the server and send the result.
- "Bad luck protection" that silently changes odds must still match the odds you display.

## Related
[[Math Geometry - Hub]] · [[Pity Timers and Pseudo-Random Distribution]] · [[Luck Multipliers - How Boosts Change the Odds You Must Show]] · [[Weighted Loot Table]]

---
area: "02 Game Design and Economy"
cluster: "Inventory Economy"
title: "Incremental Cost Curves - Exponential Costs and Bulk Buy Math"
tags: [roblox, community-knowledge, economy, simulator, tycoon, idle, balancing]
cssclasses: [tg-a02]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://www.gamedeveloper.com/design/the-math-of-idle-games-part-i
  - https://www.gamedeveloper.com/disciplines/the-math-of-idle-games-part-ii
  - https://www.slideshare.net/slideshow/quest-for-progress-gdc-europe-2016/65405507
  - https://create.roblox.com/docs/production/game-design/balance-virtual-economies
---
# Incremental Cost Curves - Exponential Costs and Bulk Buy Math

Simulators, tycoons and idle games on Roblox all run on the same engine: the player buys "generators" (droppers, pets, workers, upgrades) whose price climbs faster than their output. If you get this curve wrong the game either stalls in the first ten minutes or is "finished" in an hour. Anthony Pecorella (Kongregate, producer of AdVenture Capitalist) published the clearest public write-up of this math; this note turns it into Roblox-ready rules.

## The two formulas

- **Next cost:** `cost = baseCost * growth ^ owned`
- **Production:** `income = baseIncome * owned * multipliers`

Cost grows **exponentially**, production grows **linearly** (or polynomially). Early on income outruns cost, so buying feels great; later cost catches up, and the player needs a multiplier, a new generator tier or a rebirth to break the wall. That catch-up moment *is* your pacing tool.

Pecorella's worked example is AdVenture Capitalist's Lemonade Stand: base cost about 4, growth rate **1.07**, base income 1.67/sec. With 10 owned, the next one costs about 4 x 1.07^10 = 7.87.

Typical growth rates seen in idle games sit between roughly 1.07 and 1.15 per unit (Pecorella's examples). Higher growth makes each tier's wall arrive sooner.

## Bulk buy ("Buy x10", "Buy Max")

Roblox simulator UIs almost always offer x1 / x10 / Max buttons. Do not loop the single-buy price on the server for "Max"; use the closed forms:

- Cost of buying `n` when you own `k`: `base * growth^k * (growth^n - 1) / (growth - 1)`
- Max affordable with currency `c`: `floor( log( c*(growth-1) / (base*growth^k) + 1 ) / log(growth) )`

```lua
-- Server-side, pure math (own example)
local function bulkCost(base: number, r: number, owned: number, n: number): number
	return base * r ^ owned * (r ^ n - 1) / (r - 1)
end

local function maxAffordable(base: number, r: number, owned: number, cash: number): number
	local n = math.floor(math.log(cash * (r - 1) / (base * r ^ owned) + 1) / math.log(r))
	return math.max(n, 0)
end
```

These only hold for a plain exponential. If you add price "steps" (e.g. cost x2 every 25 levels) compute in segments.

## Multipliers and milestones

Multipliers are the release valve: they temporarily pull production back above cost. AdVenture Capitalist doubles a generator's output at 25 and 50 owned, which is why players happily chase round numbers. On Roblox this maps to:

- milestone badges or "x2 at level 25" upgrades per generator,
- area unlocks (new zone = new generator tier with a higher base),
- game passes such as "2x Cash" (a permanent multiplier: balance the free curve first, then check the pass does not trivialise it).

## Balancing workflow

1. Pick a target session: e.g. first area wall at ~8-12 minutes, first rebirth at ~45-60 minutes (choose and measure, these are design targets, not platform rules).
2. Build the curve in a spreadsheet: one row per purchase, columns for cost, income/sec, seconds to afford.
3. Plot "seconds to next purchase". It should saw-tooth: rise to a wall, drop when a multiplier/tier lands.
4. Ship, then compare with Roblox's **Economy events** (sources and sinks by item) and funnel steps per area.

## Pitfalls

- Doubles lose integer precision above 2^53; at very high counts `growth ^ owned` overflows to `inf` near 1.8e308. Plan number handling early (see Big Numbers note).
- Never trust the client's price. The server recomputes cost from saved `owned`.
- A paid 2x multiplier on top of an already generous curve shortens the whole game for payers; that hurts retention of your best players.

## Related
[[Inventory Economy - Hub]] - [[Economy - Inflation, Sources and Sinks]] - [[Economy Sources and Sinks Spreadsheet Model]] - [[Simulator Tycoon Starter Architecture]]

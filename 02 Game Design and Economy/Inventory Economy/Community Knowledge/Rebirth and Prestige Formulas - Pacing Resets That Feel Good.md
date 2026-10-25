---
area: "02 Game Design and Economy"
cluster: "Inventory Economy"
title: "Rebirth and Prestige Formulas - Pacing Resets That Feel Good"
tags: [roblox, community-knowledge, economy, rebirth, prestige, simulator, idle]
cssclasses: [tg-a02]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://www.gamedeveloper.com/design/the-math-of-idle-games-part-iii
  - https://www.gamedeveloper.com/design/the-math-of-idle-games-part-i
  - https://create.roblox.com/docs/production/game-design/core-loops
  - https://create.roblox.com/docs/production/analytics/funnel-events
---
# Rebirth and Prestige Formulas - Pacing Resets That Feel Good

"Rebirth" is the signature Roblox simulator mechanic: wipe your cash and upgrades, keep a permanent multiplier, go again faster. Done well it turns a 2-hour game into a 200-hour game. Done badly, players feel robbed or never reset at all. The math below comes from the published prestige formulas of commercial idle games (Pecorella, *The Math of Idle Games* part III) adapted to Roblox.

## How a prestige formula works

You award a prestige currency `p` (Rebirths, Tokens, Gems) from what the player earned, then give a multiplier per point. The key design choice is the **root**: a square root means the player must earn about 4x more to double their prestige gain; a cube root needs about 8x.

| Game (from the article) | Formula | Based on | To double prestige |
|---|---|---|---|
| AdVenture Capitalist | `150 * sqrt(lifetime / 1e15)` | lifetime earnings | ~3-4x more earnings |
| Cookie Clicker | `cbrt(lifetime / 1e12)` | lifetime earnings | ~8x |
| Realm Grinder | triangular-number inverse of max earnings | best run | ~4x |
| Egg, Inc. | `(runEarnings / 1e6) ^ 0.14` | this run only | ~128x |

Lifetime-based formulas still pay a little if the player resets at the same point again; best-run formulas (Realm Grinder style) pay **nothing** unless the player beats their record, which forces forward progress.

## The classic Roblox "rebirth button" variant

Most Roblox simulators use a flat **cost ladder** instead: "Rebirth costs 1M coins, each rebirth = +50% coins". That is simpler to read for young players but needs a rising cost or the loop collapses:

```lua
-- Own example: rebirth price rises each time, reward is a stacking multiplier
local REBIRTH_BASE = 1_000_000
local REBIRTH_GROWTH = 2.5   -- tune with a spreadsheet

local function rebirthCost(rebirths: number): number
	return REBIRTH_BASE * REBIRTH_GROWTH ^ rebirths
end

local function cashMultiplier(rebirths: number): number
	return 1 + 0.5 * rebirths   -- linear reward vs exponential cost
end
```

Linear reward against exponential cost means each rebirth takes a bit longer than the last, which is what you want; add a second-layer reset ("Ultra Rebirth") when cycles get too long.

## Pacing rules

1. **First rebirth early and guided.** Put it inside the first or second session and explain it with a popup or NPC; many players fear losing progress. Track it as a funnel step.
2. **Vary cycle length.** Pecorella's advice: resets should not be uniform; mix fast and slow stretches via multiplier milestones and upgrade timing.
3. **Keep something visible.** Pets, cosmetics, badges and area unlocks that survive rebirth make the reset feel like a gain, not a loss.
4. **Show the preview.** "Rebirth now: +3 tokens (x1.8 cash)". Players optimise when they can see the number.
5. **Model it, then watch real players.** Players often keep going past the "optimal" reset point; a spreadsheet only gives intuition.

## Pitfalls

- A paid "x2 Rebirths" pass stacks with everything; balance the free curve first.
- Multipliers stack multiplicatively across systems (rebirth x pets x passes x boosts). Write the full product into the sheet.
- Save the rebirth atomically: wipe and grant in the same `UpdateAsync`/session-locked write so a crash cannot leave a wiped player with no reward.

## Related
[[Inventory Economy - Hub]] - [[Incremental Cost Curves - Exponential Costs and Bulk Buy Math]] - [[Progression, XP, and Skill Tree Blueprint]] - [[Simulator Tycoon Starter Architecture]]

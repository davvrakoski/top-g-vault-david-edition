---
area: "02 Game Design and Economy"
cluster: "Inventory Economy"
title: "XP Curve Formulas - Time-to-Level Targets and Level Caps"
tags: [roblox, community-knowledge, progression, xp, leveling, balancing]
cssclasses: [tg-a02]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://www.gamedeveloper.com/design/the-math-of-idle-games-part-i
  - https://www.slideshare.net/slideshow/quest-for-progress-gdc-europe-2016/65405507
  - https://create.roblox.com/docs/production/game-design/core-loops
  - https://create.roblox.com/docs/production/analytics/funnel-events
---
# XP Curve Formulas - Time-to-Level Targets and Level Caps

A level system is a promise about time: "Level 10 takes about an hour". Most broken progression comes from picking a formula first and discovering its time-to-level later. Design backwards: decide how long levels should take, then fit the formula. This note gives the common curve shapes, how to convert them into minutes, and a Luau helper.

## Step 1: target time per level, not XP

Write a table of the minutes you want each level to take for an *average* player. A shape that works for many Roblox games:

| Levels | Target per level | Why |
|---|---|---|
| 1-5 | 1-3 min | Fast early wins inside the first session |
| 6-20 | 5-15 min | Each session ends with a level-up |
| 21-50 | 20-60 min | Long-term goal, unlocks spaced out |
| 50+ | hours | Prestige / mastery territory |

These are design targets (not Roblox rules). Measure your real XP/min per activity in playtests, then multiply.

## Step 2: pick a curve shape

`xpToNext(L)` = XP needed to go from level L to L+1.

| Shape | Formula | Feel |
|---|---|---|
| Linear | `a + b*L` | Gentle, never walls; good for casual |
| Polynomial | `a * L^p` (p 1.5-2.5) | Most RPG-like; smooth growth |
| Exponential | `a * r^L` (r 1.05-1.2) | Hard walls; pairs with idle/sim income that also grows exponentially |
| Piecewise | different formula per band | Lets you hit the table above exactly |

Important: **time-to-level = xpToNext / xpPerMinute**. If XP income also grows (better quests, higher-level mobs), a polynomial XP curve can feel flat in time. In idle/simulator games where income grows exponentially, XP or cost must grow exponentially too, the same logic as the idle-game cost curves (Pecorella).

## Step 3: helper module

```lua
-- Own example: polynomial curve + total XP lookup
local Curve = {}
local A, P = 100, 1.8

function Curve.xpToNext(level: number): number
	return math.floor(A * level ^ P)
end

-- Precompute cumulative XP so level-from-XP is a fast lookup
local cumulative = { [1] = 0 }
for L = 1, 200 do
	cumulative[L + 1] = cumulative[L] + Curve.xpToNext(L)
end

function Curve.levelFromTotal(totalXp: number): number
	local lo, hi = 1, 201
	while lo < hi do
		local mid = (lo + hi + 1) // 2
		if cumulative[mid] <= totalXp then lo = mid else hi = mid - 1 end
	end
	return lo
end

return Curve
```

Save **total XP** (one number), derive level. Changing the curve later then re-levels everyone consistently instead of corrupting saves.

## Level caps and post-cap

- A cap gives a finish line for balance (gear, zones) and a clean place for prestige.
- After the cap, convert XP into something: mastery points, prestige stars or cosmetic tiers. Dead XP bars kill motivation.

## Validate with analytics

- Add a funnel or custom event per level-up (`AnalyticsService:LogProgressionEvent` or custom events).
- Plot median minutes-to-level from real data against your target table. A sudden spike in time or a drop-off at one level marks a wall.

## Pitfalls

- Big early XP from paid boosts can skip your tutorial unlocks; gate key unlocks by quest completion, not only level.
- Different activities with very different XP/min make players grind one thing. Normalise XP per minute across activities, then add small bonuses for variety.

## Related
[[Inventory Economy - Hub]] - [[Progression, XP, and Skill Tree Blueprint]] - [[Rebirth and Prestige Formulas - Pacing Resets That Feel Good]] - [[Core Loop and Session Design for D1 and D7 Retention]]

---
area: "07 AI and Combat"
cluster: "AI"
title: "Credit-Based Spawn Director and Player-Count Scaling"
tags: [roblox, community-knowledge, ai, spawn-director, difficulty-scaling, waves, co-op]
cssclasses: [tg-a07]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://riskofrain2.wiki.gg/wiki/Directors
  - https://www.readkong.com/page/the-ai-systems-of-left-4-dead-michael-booth-valve-9664541
  - https://create.roblox.com/docs/reference/engine/classes/Players#GetPlayers
---
# Credit-Based Spawn Director and Player-Count Scaling

Roblox co-op servers swing from 1 player to 12 and back within minutes. A wave script tuned for 4 players is boring for 12 and impossible for 1. Risk of Rain 2 solves this with a **credit director**: the director earns "credits" over time, scaled by difficulty and player count, and buys enemies from a weighted catalog. The Risk of Rain 2 wiki documents the formulas, which makes it an ideal reference to copy.

## How Risk of Rain 2's combat director works (per the wiki)

- **Income**: credits per second = creditMultiplier × (1 + 0.4 × difficultyCoeff) × (playerCount + 1) / 2.
- The player factor (players + 1) / 2 gives **1.0x for 1 player, 1.5x for 2, 2.0x for 3, 2.5x for 4**: more players means more enemies, but less than linearly.
- **Spawn cards** have a cost (Beetle 8, Lemurian 11, Imp 28; a Scavenger 2000).
- **Elites** multiply cost (tier 1 is 6x, tier 2 is 36x); the director buys the best elite tier it can afford.
- **Picking**: weighted lottery, first by category, then by card within the category.
- **Limits**: a wave spawns at most a few monsters, it will not buy something "too cheap" when rich, and spawns fail when 40+ monsters are alive.
- **Deactivation**: when a director stops, it passes 40% of leftover credits to another active director.

## A Roblox version

```lua
local Director = { credits = 0, mult = 1.0 }

local CATALOG = {
	{ id = "Walker", cost = 8,  weight = 10 },
	{ id = "Runner", cost = 14, weight = 5 },
	{ id = "Spitter",cost = 25, weight = 3, maxAlive = 4 },
	{ id = "Brute",  cost = 90, weight = 1, maxAlive = 1 },
}

local function income(dt, players, coeff)
	return Director.mult * (1 + 0.4 * coeff) * (players + 1) / 2 * dt
end

local function pick(affordable)
	local total = 0
	for _, c in affordable do total += c.weight end
	local r = math.random() * total
	for _, c in affordable do r -= c.weight; if r <= 0 then return c end end
end

-- every 0.5-2 s: add income; filter catalog by cost <= credits and maxAlive; pick; spawn; subtract cost
```

The "+1 over 2" curve is a good default for Roblox: start there, then tune with playtests. If players are spread across the map, run one director per area or per player cluster.

## Difficulty coefficient over time

Risk of Rain 2 raises the coefficient with elapsed time (and difficulty choice). In Roblox wave games use wave number or match time: `coeff = 1 + wave * 0.15`. Increase **income** (more and richer spawns) instead of enemy HP alone; HP inflation makes fights longer, not more interesting.

## Scaling more than spawn count

| Knob | Scales with players? | Note |
|---|---|---|
| Spawn income | Yes (sub-linear) | Main knob |
| Boss HP | Yes, roughly linear per extra player | Otherwise 12 players delete it |
| Enemy damage | No | Keeps each player's danger readable |
| Max alive cap | Yes, with a server hard cap | Protects performance |
| Loot/rewards | Per player | So nobody feels punished for a full server |

## Fairness rules borrowed from Left 4 Dead

Valve's AI Director spawns in the **Active Area Set** around the team and places special infected in areas the survivors cannot see; 75% of mobs come from behind. Combine with credits: credits decide **what and how much**, the spawn locator decides **where** (out of sight, not too close, on the navmesh).

## Pitfalls

- Recomputing player count from `#Players:GetPlayers()` including AFK or dead players; count active, alive players in the area.
- Banking credits forever during a lull, then dumping a huge wave: cap stored credits.
- A catalog with only cheap cards when the director is rich: either add expensive cards or let it buy elite versions (the RoR2 cost-multiplier trick).

## Related
[[AI - Hub]] - [[Encounter Director and Pacing]] - [[Crowd and Encounter Director]] - [[Zombie Crowd Director Blueprint]] - [[NPC Tick Budgeter]]

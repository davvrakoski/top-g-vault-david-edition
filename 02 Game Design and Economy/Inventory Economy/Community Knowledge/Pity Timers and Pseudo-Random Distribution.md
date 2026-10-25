---
area: "02 Game Design and Economy"
cluster: "Inventory Economy"
title: "Pity Timers and Pseudo-Random Distribution"
tags: [roblox, community-knowledge, loot, rng, pity, drop-rates]
cssclasses: [tg-a02]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://liquipedia.net/dota2/Random_Distribution
  - https://dota2.fandom.com/wiki/Pseudo-random_distribution
  - https://create.roblox.com/docs/production/monetization/paid-random-items
  - https://create.roblox.com/docs/reference/engine/datatypes/Random
---
# Pity Timers and Pseudo-Random Distribution

True randomness feels unfair. With a 1% drop, about 37% of players still have nothing after 100 tries ((0.99)^100 = 0.366), and those are the players who post angry reviews and quit. Two well-known tools fix this without changing the advertised average: **pity counters** (guarantee after N misses) and **pseudo-random distribution** (PRD, chance grows after each miss). Both are standard in shipped games and easy to build in Luau.

## Option 1: Hard pity (guarantee at N)

Keep a per-player miss counter for a rarity tier. When it reaches N, the next roll is forced to that tier and the counter resets.

```lua
-- Own example: hard pity for "Legendary" egg drops
local PITY_LIMIT = 120

local function roll(profile, rng: Random, table)
	profile.Pity.Legendary += 1
	local result
	if profile.Pity.Legendary >= PITY_LIMIT then
		result = table:pickFromTier("Legendary", rng)
	else
		result = table:pick(rng)
	end
	if result.Tier == "Legendary" then
		profile.Pity.Legendary = 0
	end
	return result
end
```

Soft pity is a variant: from roll 90 onward, raise the Legendary weight a little each roll.

## Option 2: PRD (Warcraft III / Dota 2 style)

Chance on the Nth attempt since the last success is `P(N) = C * N`. C is chosen so the long-run average still equals the nominal chance. Example from Liquipedia: a nominal 25% effect starts at about 8.5% and climbs 8.5% per miss.

C values (we computed these numerically from the formula; they match the published Dota values for 25%):

| Nominal | C | Guaranteed by attempt |
|---|---|---|
| 5% | 0.00380 | 264 |
| 10% | 0.01475 | 68 |
| 20% | 0.05570 | 18 |
| 25% | 0.08474 | 12 |
| 30% | 0.11895 | 9 |
| 50% | 0.30210 | 4 |

PRD suits frequent procs (crits, double drops, "lucky hit"). For rare loot, hard pity is easier to explain.

## Disclosure and honesty

- Roblox's **paid random items** policy requires showing all outcomes and numerical odds before purchase for items bought with Robux (directly or through a currency bought with Robux). The policy lists **pity systems** by name as "probability modifier items", and says modifiers must be explained numerically before purchase and the shown odds updated while they are active. So on a paid egg, show the pity rule ("Guaranteed Legendary within 120 opens") and the current odds for this player.
- Store pity per tier in the player's save so it survives rejoin; a pity that resets on leave feels like a trick.
- Never let the client roll. Use a server `Random` object.
- If `PolicyService:GetPolicyInfoForPlayerAsync` reports `ArePaidRandomItemsRestricted`, the paid version must be hidden or swapped for that player regardless of pity.

## Testing checklist

- [ ] Simulate 1,000,000 rolls offline and check the observed rate matches the displayed rate (with pity included in your "effective rate" text if you show one).
- [ ] Longest dry streak in the simulation equals the pity limit.
- [ ] Pity counter persists across servers and rebirths (decide and document).

## Related
[[Inventory Economy - Hub]] - [[Weighted Loot Table]] - [[Paid Random Items, Odds Disclosure and PolicyService]] - [[Inventory Equipment and Loot Framework]]

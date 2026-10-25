---
area: "02 Game Design and Economy"
cluster: "Inventory Economy"
title: "Luck Multipliers - How Boosts Change the Odds You Must Show"
tags: [roblox, community-knowledge, loot, luck, rng, odds-disclosure, policy]
cssclasses: [tg-a02]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/monetization/paid-random-items
  - https://create.roblox.com/docs/reference/engine/classes/PolicyService
  - https://create.roblox.com/docs/production/monetization/developer-products
---
# Luck Multipliers - How Boosts Change the Odds You Must Show

"2x Luck" potions, lucky gamepasses and server-wide luck events are everywhere in egg, RNG-aura and fishing games. Most implementations quietly break two things: the math (a "2x luck" that doesn't actually double anything) and Roblox's paid random items policy, which says paid odds modifiers must be explained with numbers before purchase and the displayed odds must update while the boost is active. This note shows a clean model.

## Pick one definition of "luck" and say it

There are three common models. Choose one, document it in the item description, and use the same function for rolling and for the odds UI.

1. **Weight multiplier on rare tiers (most common).** Multiply the weight of every outcome at or above a rarity threshold by `luck`, then renormalise. Commons get rarer automatically.
2. **"1 in N" divisor (RNG aura games).** Each outcome has a "1 in N" rarity; with luck L the effective chance is `L/N` capped below 1, with the base outcome absorbing the remainder.
3. **Re-roll luck.** Roll L times, keep the best. Easy to explain ("rolls 2 times, keeps the rarest") but the gain is not a clean multiplier.

## Model 1 in Luau

```lua
-- Own example: one function drives both the roll and the odds display
type Entry = { id: string, weight: number, rare: boolean }

local function effectiveOdds(entries: {Entry}, luck: number): {[string]: number}
	local total = 0
	local w = {}
	for _, e in entries do
		local weight = if e.rare then e.weight * luck else e.weight
		w[e.id] = weight
		total += weight
	end
	for id, weight in w do
		w[id] = weight / total   -- probabilities, sum to 1
	end
	return w
end
```

Worked example: Common 90, Rare 9, Legendary 1 (rare = Rare and Legendary). At luck 2: weights 90 / 18 / 2, total 110. Legendary goes from 1.00% to 1.818%, not 2.00%. If you sell "2x luck" but show "Legendary 2%", the display is wrong. Show the real number.

## Stacking

Players will stack a pass, a potion, a friend boost and a server event. Decide:

- **Multiplicative** (2 x 2 x 1.5 = 6x) explodes fast, cap it.
- **Additive** (+100% +100% +50% = 3.5x) is easier to balance and to explain.

Whatever you choose, compute one final `luck` on the server and pass it to the same `effectiveOdds` function the UI uses.

## Policy checklist (paid random items)

- [ ] Odds shown as percentages for all final outcomes, summing to 100% (rounding disclaimer allowed per the policy).
- [ ] A worded "Odds" or "Details" button, not only an (i) icon, if the list does not fit on screen.
- [ ] A paid luck item explains its numerical effect **before** purchase.
- [ ] While a boost is active, the egg or roll UI shows the boosted odds.
- [ ] For players where `ArePaidRandomItemsRestricted` is true, paid luck items and paid rolls are hidden, replaced or blocked using one of the treatments listed in the policy.
- [ ] Free luck sources (earned by playing, not paid) can still use the same math, but disclosure rules for odds apply when any Robux path leads into the roll.

## Pitfalls

- Luck applied on the client is an exploit. The client only *displays* the odds the server sent.
- Server luck events that end mid-roll: snapshot luck at roll time.
- Do not change base weights silently after launch; players compare screenshots.

## Related
[[Inventory Economy - Hub]] - [[Pity Timers and Pseudo-Random Distribution]] - [[Paid Random Items, Odds Disclosure and PolicyService]] - [[Weighted Loot Table]]

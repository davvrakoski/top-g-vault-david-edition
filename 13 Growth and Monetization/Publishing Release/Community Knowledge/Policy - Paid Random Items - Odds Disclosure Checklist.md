---
area: "13 Growth and Monetization"
cluster: "Publishing Release"
title: "Paid Random Items - Odds Disclosure Checklist"
tags: [roblox, community-knowledge, publishing, policy, loot-boxes, odds, monetization]
cssclasses: [tg-a13]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/monetization/paid-random-items
  - https://about.roblox.com/community-standards
  - https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use
---
# Paid Random Items - Odds Disclosure Checklist

> Not legal advice. Summary of the Creator Hub "Paid random items policy guidelines" and the related Terms and Community Standards rules, checked 2026-10-25.

Eggs, crates, spins and gacha rolls are some of the best earners on Roblox, and also one of the most regulated. Roblox requires exact odds disclosure for anything random that is paid for directly or indirectly with Robux. This is a release-blocker checklist; run it on every new egg, banner or luck item.

## Does the rule apply?

It applies when the player spends **Robux** or **anything bought with Robux** (gems, spin tickets, keys, rerolls) to get a random result. Roblox's examples of paid random item types:

- **Capsule items:** wheel spins, egg hatches, chests.
- **Enhancement items:** potion with random duration, upgrade with a chance to fail.
- **Combination items:** fusing two eggs for a better roll.
- **Probability modifiers:** luck boosts, pity systems, better drop rates, rate-up scrolls.

It does **not** apply when the random reward comes from an action that costs no Robux or Robux-bought currency, for example a chest opened with a key found in the world. If your soft currency can be bought with Robux at all, treat it as paid.

## Disclosure format (all must be true)

- [ ] Every possible outcome and its **numerical odds** are shown **before** the purchase.
- [ ] Odds are percentages, and the final outcomes sum to exactly **100%**.
- [ ] If you round long decimals, you round to at least four places below the first non-zero digit and show a rounding disclaimer.
- [ ] Large tables can live in a pop-up opened by a button with a **descriptive word** ("Info", "Details"). A bare (i) icon is **not** enough.
- [ ] Items sharing odds may use one line: "Odds for each item listed below: X%".
- [ ] If a player can only own one copy of an outcome, the shown odds **update** for that player once they own it.
- [ ] Luck items explain their effect **numerically** before purchase, and the displayed odds update **while the boost is active**.
- [ ] Indirect purchases (tickets, keys) show odds before the player spends the ticket.

## Content rules from the Community Standards

- Every outcome must give the player **some benefit** (no "nothing" results).
- Ineligible users must be blocked and trading of results gated (see the PolicyService note).

## A disclosure model you can reuse

Keep odds data in one ModuleScript used by both the roll code and the UI, so the display can never drift from the real weights.

```lua
-- ReplicatedStorage/EggOdds.lua (shared by server roll and client UI)
local EggOdds = {}

EggOdds.Basic = {
	{ id = "Cat", weight = 60 },
	{ id = "Dog", weight = 30 },
	{ id = "Dragon", weight = 9.5 },
	{ id = "GoldenDragon", weight = 0.5 },
}

function EggOdds.percentages(egg, luckMultiplier: number?)
	local mult = luckMultiplier or 1
	local total, adjusted = 0, {}
	for _, entry in egg do
		-- example luck rule: boost only the two rarest outcomes
		local w = entry.weight
		if entry.weight < 10 then w *= mult end
		adjusted[entry.id] = w
		total += w
	end
	for id, w in adjusted do
		adjusted[id] = w / total * 100
	end
	return adjusted
end

return EggOdds
```

The server rolls with the same table; the UI calls `percentages(egg, activeLuck)` so boosted odds are shown live.

## Pitfalls seen in real games

- Showing rarity tiers ("Legendary 1%") but not per-item odds inside a tier.
- Hard-coding odds text in a TextLabel and forgetting to update it after a balance patch.
- Pity counters that silently change the odds without showing the new numbers.
- Treating free daily spins as exempt while also selling extra spins for Robux; the paid spins need disclosure.

## Related
[[Publishing Release - Hub]] · [[Policy - PolicyService Compliance - Loot Boxes, Trading, Ads and Regions]] · [[Shop UX, Pricing and Player Trust]] · [[Paid random items policy guidelines]]

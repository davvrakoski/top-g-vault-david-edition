---
area: "14 Testing and QA"
cluster: "Testing"
title: "QA Pass - Pet and Egg Games - Odds Display vs Real Odds, Hatch Dupes and Inventories"
tags: [roblox, community-knowledge, testing, qa, genre-qa, pets, eggs, paid-random-items, policy]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/monetization/paid-random-items
  - https://create.roblox.com/docs/reference/engine/classes/PolicyService
  - https://create.roblox.com/docs/reference/engine/datatypes/Random
  - https://devforum.roblox.com/t/server-sided-debounce/1072908
  - https://devforum.roblox.com/t/remoteevent-debounce/266723
  - https://devforum.roblox.com/t/egg-hatching-system-problems/2128683
---
# QA Pass - Pet and Egg Games - Odds Display vs Real Odds, Hatch Dupes and Inventories

Egg hatching is a paid random item whenever Robux, or currency bought with Robux, pays for it. Roblox's paid random items policy then requires the shown odds to be real numerical percentages covering every outcome, summing to 100%, and updated live when a luck boost is active. So "the odds UI matches the roll code" is not a polish item; it is a compliance test. Hatching is also the busiest remote in the game, which makes it the first place dupes and double-spends appear.

## Bugs this genre always ships with
- **Two odds tables.** The UI reads a display table, the server rolls from another; they drift the first time a designer edits one.
- **Boost not shown.** A luck potion or gamepass changes the server weights, but the egg's odds board still shows base odds. The policy says enhanced odds must be shown while the boost is active.
- **Percentages that do not sum.** Rounding makes the visible list total 99.98%. The policy allows rounding only with a disclaimer that totals may not equal 100%.
- **Multi-hatch charging.** Triple hatch rolls three times but charges once, or charges three and grants two when the inventory fills mid-hatch.
- **Full inventory.** Currency spent, pet discarded, no message.
- **Hatch spam.** The hatch remote fires many times per frame; a DevForum report describes a purchase firing repeatedly despite a client cooldown, because only the server can enforce the limit.
- **Animation-time dupes.** The pet is granted when the client finishes the hatch animation; leaving or resetting during it grants twice or never.
- **Craft and fuse holes.** "Make golden" consumes fewer pets than required, or consumes equipped pets that are also in a pending trade.

## Test checklist
1. Export the server's weight table and the UI's displayed list for every egg; diff them (helper below).
2. Activate each luck boost and combination of boosts. The odds board must change to the boosted numbers.
3. Run 100,000 server-side rolls per egg with a seeded `Random` in a test place. Each outcome's frequency must be close to its stated odds.
4. Fire the hatch remote 20 times in one frame with enough currency for 3. Exactly 3 hatches.
5. Fill the inventory to one free slot, then triple hatch. The game must block, refund or overflow to storage, as designed.
6. Leave, reset and teleport during the hatch animation. Pet count before and after must match the hatches paid for.
7. Test the policy path: force `ArePaidRandomItemsRestricted = true` in your code path (inject the policy result) and confirm the paid egg is replaced by one of the allowed treatments.

## Exploit angles
- The roll happens on the server, after the charge succeeds, in one function; the client only plays the animation for a result it is told.
- Per-player cooldown on the server, plus a queue so that two calls arriving together cannot both pass the money check.
- Trade lock on pets involved in a fuse or hatch until the operation completes.

## Balance checks
- Expected hatches to get each rarity = 1 / odds. Compare that with currency income per hour to get "hours to a legendary" for free players.
- Check that pity or luck systems are counted in the shown odds (pity systems count as probability modifiers in the policy).

## Data and save checks
- Each pet gets a unique id at hatch; inventory saves list ids, so a dupe shows up as two entries with one id.
- When `IsPaidItemTradingAllowed` is false for a player, pets that came from paid random items must not be tradeable for them.

## Debug helper: compare stated odds with real rolls
```lua
-- Server or Command Bar. weights: {name = weight}; shown: {name = percent shown in UI}
local function checkOdds(weights: {[string]: number}, shown: {[string]: number}, rolls: number)
	local total = 0
	for _, w in weights do total += w end
	local rng, counts = Random.new(12345), {}
	for _ = 1, rolls do
		local pick, acc = rng:NextNumber() * total, 0
		for name, w in weights do
			acc += w
			if pick <= acc then counts[name] = (counts[name] or 0) + 1 break end
		end
	end
	for name, w in weights do
		local real = w / total * 100
		local seen = (counts[name] or 0) / rolls * 100
		local ui = shown[name]
		if not ui or math.abs(ui - real) > 0.01 then
			warn(("%s: UI %s%% vs weight %.4f%%"):format(name, tostring(ui), real))
		end
		print(("%s: weight %.4f%%, rolled %.4f%%"):format(name, real, seen))
	end
end
```
A UI mismatch is a bug every time; a rolled-vs-weight gap only matters if it stays large as you raise `rolls` (rare outcomes need millions of rolls to settle).

## Related
[[Testing - Hub]] - [[Paid Random Items, Odds Disclosure and PolicyService]] - [[Luck Multipliers - How Boosts Change the Odds You Must Show]] - [[Weighted Loot Table]] - [[Case Study - Pet Simulator 99]] - [[Seeded Randomness and Deterministic Tests]]

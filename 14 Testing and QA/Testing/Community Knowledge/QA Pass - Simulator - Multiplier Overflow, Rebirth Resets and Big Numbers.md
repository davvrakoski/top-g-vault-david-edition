---
area: "14 Testing and QA"
cluster: "Testing"
title: "QA Pass - Simulator - Multiplier Overflow, Rebirth Resets and Big Numbers"
tags: [roblox, community-knowledge, testing, qa, genre-qa, simulator, big-numbers]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/luau/numbers
  - https://create.roblox.com/docs/reference/engine/classes/IntValue
  - https://create.roblox.com/docs/reference/engine/classes/OrderedDataStore
  - https://create.roblox.com/docs/cloud-services/data-stores/best-practices
  - https://devforum.roblox.com/t/how-to-use-eternitynum/2853584
  - https://devforum.roblox.com/t/eternitynum-issues/3925172
---
# QA Pass - Simulator - Multiplier Overflow, Rebirth Resets and Big Numbers

Simulators live on multiplication: click power x pet multiplier x gamepass x rebirth x event boost. Every term is a place where the shown number and the real number can drift apart, and late-game numbers outgrow what a Luau double or an `IntValue` can hold. Rebirths add a second failure family: a reset that forgets to reset something, or resets something it should have kept. This pass tests both.

## Bugs this genre always ships with
- **Display vs real multiplier.** The UI adds boosts (2x + 2x = "4x") while the server multiplies (2 x 2 = 4x) or the reverse; fine at two boosts, wrong at five.
- **Double-applied gamepass.** Ownership cached at join plus `PromptGamePassPurchaseFinished` both add the 2x, so a buyer gets 4x until rejoin.
- **Overflow to `inf` and `NaN`.** A double tops out near 1.8e308; past that the value becomes `math.huge`, and `0 * math.huge` gives `NaN`. `NaN` then spreads to every number it touches and fails every comparison, so purchases silently stop working.
- **Precision loss.** Whole numbers above 2^53 are not exact in Luau, so "cost minus balance" can be off and a player who has "exactly enough" cannot buy.
- **`IntValue` limits.** `IntValue` stores a signed 64-bit integer (max about 9.2e18); leaderstats built on it overflow long before your big-number library does.
- **Abbreviation table runs out.** The suffix list ends at "Qd" and the next tier shows `nil` or a raw `1e+21`.
- **Leaderboards.** `OrderedDataStore` values must be integers, so a raw big number cannot be ranked without a transform (a log-scaled integer is a common approach).
- **Rebirth holes.** Upgrades kept that should reset, pets lost that should be kept, rebirth remote fired twice on one requirement, or a rebirth that lands between two autosaves and saves half-reset.

## Test checklist
1. With a test command, set currency to 1e15, 2^53, 1e18, 9.3e18, 1e300 and `math.huge`. At each: buy, sell, rebirth, check UI text and leaderstats.
2. Stack every boost at once (all gamepasses, max pets, event, potion). Compare the server's computed multiplier with the shown one.
3. Buy the 2x pass in-game, then check the multiplier before and after a rejoin; they must match.
4. Fire the rebirth remote 10 times in one frame. Exactly one rebirth.
5. Rebirth, then immediately leave. Rejoin: the save must be fully pre- or fully post-rebirth, never mixed.
6. Save a profile with a huge value and read it back in a test place. Confirm the round trip (do not assume `inf` survives JSON encoding: test it).
7. If you use a big-number module (EternityNum, InfiniteMath and others on the DevForum), test rounding at small values too: one DevForum report describes a value of 1 rounding to 0.99 and blocking an upgrade.

## Exploit angles
- Click remotes: rate-limit per player on the server (clicks per second cap) and compute the reward server-side from the server's own multiplier, never from an amount the client sends.
- Auto-farm zones: rewards per minute cap stops a script from farming faster than a human.

## Balance checks
- Plot time-to-next-upgrade for each tier with and without the paid boosts. A paid boost that turns hours into seconds collapses progression.
- Check the first rebirth happens after a time you chose (write the target down, then measure with a fresh account).
- Verify rebirth multiplier growth does not outpace cost growth forever; somewhere the curve must bend or the economy runs away.

## Data and save checks
- Store the base values and recompute multipliers on load, rather than saving the final multiplied number.
- Version the save and migrate old number formats when switching to a big-number library (see the Save Migration note).
- Rebirth writes one atomic update (`UpdateAsync` on the whole profile), not several separate keys.

## Debug helper: audit every multiplier source
```lua
-- Server-side: list each boost and the result, flag bad values.
local function auditMultiplier(sources: {[string]: number}): number
	local total, count = 1, 0
	for name, value in sources do
		count += 1
		if value ~= value or value == math.huge or value <= 0 then
			warn(("bad multiplier '%s' = %s"):format(name, tostring(value)))
		end
		total *= value
	end
	print(("total = %.4g from %d sources"):format(total, count))
	return total
end

auditMultiplier({ pets = 12.5, gamepass2x = 2, rebirth = 40, event = 1.5 })
```
Compare the printed total with the number the UI shows for the same player.

## Related
[[Testing - Hub]] - [[Big Numbers in Simulators - Doubles, 2^53 and Number Libraries]] - [[Rebirth and Prestige Formulas - Pacing Resets That Feel Good]] - [[Simulator Genre Breakdown - Click, Upgrade, Zone, Rebirth]] - [[Test - Save Migration Tests - Fixture Saves, Golden Files and Mixed-Version Servers]]

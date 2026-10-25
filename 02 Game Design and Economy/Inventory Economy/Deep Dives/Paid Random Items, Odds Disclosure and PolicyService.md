---
area: "02 Game Design and Economy"
cluster: "Inventory Economy"
tags: [deep-dive, roblox, loot-boxes, policy, compliance, policyservice]
verified: 2026-10-25
cssclasses: [tg-a02]
---

# Paid Random Items, Odds Disclosure and PolicyService

## Why this matters
Eggs, crates, spins and "luck boosts" are among the most common Roblox monetization patterns, and they fall under a specific Roblox policy: every outcome and its exact odds must be shown before purchase, and players in restricted regions must get a non-random alternative.
Getting this wrong is not a balancing issue. It is a Terms of Use and Community Standards issue that can affect your game's standing, and it is easy to get right if you design for it from the start.

> [!warning] Not legal advice
> This note summarizes Roblox's published policy pages as of the date above. Local laws vary and change. If your game depends heavily on paid random items, read the current Roblox policy pages yourself and get qualified advice.

---

## 1. What counts as a "paid random item"

Roblox's policy covers random outcomes obtained **directly with Robux or indirectly with anything bought with Robux**, including in-game currency, keys, tickets and tokens that can be bought.

| Type (Roblox's categories) | Examples |
|---|---|
| Capsule items | Spin a wheel, hatch an egg, open a chest |
| Enhancement items | Potion with a random duration, upgrade with a chance to succeed |
| Combination items | Fusing two rare eggs for a better chance at a higher-quality result |
| Probability modifier items | Luck boosts, **pity systems**, enhanced drop rates, rate-up scrolls |

**Not covered:** random rewards for actions that involve no Robux or Robux-bought currency. The docs' example is a key the player *finds* in the world that opens a chest; no disclosure is required for that.

The tricky middle ground: if Gems can be earned **and** bought with Robux, an egg priced in Gems is a paid random item. Classify by whether the currency *can* be bought, not by how a particular player got it.

---

## 2. Disclosure rules (what the UI must show)

From the *Paid random items policy guidelines*:

1. **All possible outcomes and their actual numerical odds** must be shown before purchase.
2. Odds are shown as **percentages** that **sum to exactly 100%**. With long decimals you may round to four or more decimal places below the first non-zero digit, and add a disclaimer such as *"Probabilities are rounded; total of displayed individual probabilities may not equal 100%."*
3. If there are too many outcomes for the 3D view, put an itemized list in a pop-up opened by a visible **"Info" or "Details"** label. **A standalone (i) icon without a word is not sufficient.**
4. Many items with identical odds can share a header: *"Odds for each item listed below: X%"*.
5. If a player can only obtain one copy of an outcome, the remaining odds **must update for that player**.
6. Items that change odds (lucky potion, magic fishing rod) must explain their effect **numerically before purchase**, and the displayed odds must **update while the effect is active**.

### Odds formatter that always sums correctly

```lua
-- ReplicatedStorage/Shared/OddsDisplay.luau
-- weights: { {id = "Common", weight = 700}, {id = "Rare", weight = 250}, ... }
local OddsDisplay = {}

function OddsDisplay.toPercentages(weights, decimals: number?)
	decimals = decimals or 2
	local total = 0
	for _, w in weights do
		total += w.weight
	end
	assert(total > 0, "no obtainable outcomes")

	local scale = 10 ^ decimals
	local rows, shown = {}, 0
	for _, w in weights do
		local pct = w.weight / total * 100
		local rounded = math.floor(pct * scale + 0.5) / scale
		shown += rounded
		table.insert(rows, { id = w.id, percent = rounded, exact = pct })
	end
	-- If rounding drifts from 100, show the documented disclaimer.
	local needsDisclaimer = math.abs(shown - 100) > (0.5 / scale)
	return rows, needsDisclaimer
end

-- Remove outcomes the player can no longer receive (one-copy items),
-- then recompute, so the displayed odds are the player's real odds.
function OddsDisplay.forPlayer(weights, ownedIds: {[string]: boolean}, uniqueIds: {[string]: boolean})
	local filtered = {}
	for _, w in weights do
		if not (uniqueIds[w.id] and ownedIds[w.id]) then
			table.insert(filtered, w)
		end
	end
	return OddsDisplay.toPercentages(filtered)
end

return OddsDisplay
```

Run the **same weight table** on the server for the actual roll. Never keep a "display table" and a separate "real table"; that is how disclosed odds stop matching real odds.

### Rolling on the server

```lua
-- Server only. Random.new() per server is fine; never roll on the client.
local rng = Random.new()

local function roll(weights)
	local total = 0
	for _, w in weights do total += w.weight end
	local pick = rng:NextNumber(0, total)
	local acc = 0
	for _, w in weights do
		acc += w.weight
		if pick <= acc then
			return w.id
		end
	end
	return weights[#weights].id
end
```

---

## 3. Per-player eligibility with PolicyService

`PolicyService:GetPolicyInfoForPlayerAsync(player)` returns a dictionary based on the player's location, age group and platform. The fields that matter for economy design:

| Field | Meaning when the value shown is returned |
|---|---|
| `ArePaidRandomItemsRestricted` | `true`: the player **cannot** use paid random item generators (Robux or Robux-bought currency) |
| `IsPaidItemTradingAllowed` | `true`: the player **may** trade items bought with Robux or in-game currency |
| `AreAdsAllowed` | `true`: the player may see immersive ads |
| `IsEligibleToPurchaseSubscription` | `true`: the player can buy subscriptions |

It is an async call that can fail, so wrap it in `pcall`. Choose a **safe default** on failure: treat the player as restricted until a later retry succeeds.

```lua
-- ServerScriptService/Policy.server.luau
local PolicyService = game:GetService("PolicyService")
local Players = game:GetService("Players")

local SAFE_DEFAULT = {
	ArePaidRandomItemsRestricted = true,
	IsPaidItemTradingAllowed = false,
	AreAdsAllowed = false,
}

local cache: {[Player]: any} = {}

local function fetch(player: Player)
	for attempt = 1, 3 do
		local ok, info = pcall(PolicyService.GetPolicyInfoForPlayerAsync, PolicyService, player)
		if ok and info then
			cache[player] = info
			player:SetAttribute("RandomItemsRestricted", info.ArePaidRandomItemsRestricted)
			player:SetAttribute("PaidTradingAllowed", info.IsPaidItemTradingAllowed)
			return
		end
		task.wait(2 * attempt)
	end
	cache[player] = SAFE_DEFAULT
	player:SetAttribute("RandomItemsRestricted", true)
	player:SetAttribute("PaidTradingAllowed", false)
end

Players.PlayerAdded:Connect(fetch)
Players.PlayerRemoving:Connect(function(p) cache[p] = nil end)

return function(player: Player)
	return cache[player] or SAFE_DEFAULT
end
```

The client reads the attributes only to **show or hide UI**. The server re-checks the policy on every purchase and roll request.

---

## 4. Treatments for restricted players (choose at design time)

Roblox lists the acceptable treatments when `ArePaidRandomItemsRestricted` is true. Pick one per system **before** you build it:

| Treatment | Example from the docs | Design cost |
|---|---|---|
| Unpaid, earnable path | Mystery eggs granted free at gameplay milestones | Low; often good for everyone |
| Pre-determined, disclosed order | Spin 1 always gives 5 gems, spin 2 gives 10, spin 3 gives 20 | Medium; needs separate UI |
| Direct purchase priced at expected value | 10 Robux crate with 5% odds → sell the sword for 200 Robux | Medium; needs a direct-buy shop |
| Remove or hide the feature | Replace the prize wheel with a direct shop | Low, but lose the feature |
| Block with an error message | "Sorry, this item is unavailable for users in your region" | Lowest effort, worst experience |
| Remove the player from that area | Teleport them away | Only for zones built around rolls |

Expected-value pricing formula for the direct-buy option:

```
DirectPrice = CrateCost / P(item)          e.g. 10 / 0.05 = 200 Robux
```

### Trading

If `IsPaidItemTradingAllowed` is **false**, the player **must not** be able to trade outcomes of paid random items or other paid items. Mark items with an `acquiredVia` field (`"Robux"`, `"PaidCurrency"`, `"Earned"`) when granted, and have the trade server reject offers containing paid-origin items from or to restricted players. Combine this with regional price-arbitrage checks (`MarketplaceService:GetUsersPriceLevelsAsync`, see [[Managed Pricing, Price Tests and Regional Pricing]]).

---

## 5. Related rules you will hit at the same time
- **Rewarded video ads cannot reward randomized items** (Rewarded video ads eligibility).
- **Promoted passes** on the Buy Robux page cannot grant paid random items.
- The **Maturity & Compliance Questionnaire** has dedicated *Paid random items* and *Paid item trading* categories. Answer them accurately and re-answer when you add the feature.
- Roblox's monetization guidelines ban false urgency ("almost out of stock", restarting countdown timers) and recommend neutral button copy such as "View Item" or "Open Shop" over "BUY BEFORE IT'S GONE!". This applies to crate shops too.

---

## Common mistakes
- Treating an egg priced in a Robux-buyable currency as "free-to-play random" and skipping disclosure.
- Showing odds from a UI table that differs from the server roll table.
- Using a bare (i) icon for the odds pop-up; the docs say a descriptive word ("Info", "Details") is required.
- Selling a luck potion without numerically stating its effect, or not updating the displayed odds while it is active.
- Not removing already-owned unique items from the displayed odds.
- Pity counters treated as "just a bonus"; Roblox lists pity systems as probability modifier items.
- Calling `GetPolicyInfoForPlayerAsync` without `pcall` and defaulting to *unrestricted* on failure.
- Gating only the UI on the client; the server must refuse restricted purchases and trades.

## Checklist
- [ ] Every random system is classified: paid (Robux or Robux-buyable currency) or unpaid
- [ ] One weight table per system, shared by display and server roll
- [ ] Odds shown as percentages that sum to 100% (or the rounding disclaimer is shown)
- [ ] Odds pop-up opened by a labeled "Info"/"Details" control, visible before purchase
- [ ] Unique-item odds recomputed per player
- [ ] Luck modifiers explained numerically; live odds update while active
- [ ] PolicyService fetched at join with `pcall`, retries and a restrictive default
- [ ] A documented treatment exists for restricted players for each system
- [ ] Trading blocks paid-origin items when `IsPaidItemTradingAllowed` is false
- [ ] Maturity questionnaire answers updated

---

**Sources checked (2026-10-25):** Creator Docs: Monetization › Paid random items policy guidelines; Monetization (Guidelines › Promoting to global audiences); Engine API › PolicyService.GetPolicyInfoForPlayerAsync; Promotion › Rewarded video ads; Monetization › Passes (promotion rules); Promotion › Content maturity.

**Related:** [[Inventory Economy - Hub]] · [[Weighted Loot Table]] · [[Monetization - Hub]] · [[Shop UX, Pricing and Player Trust]] · [[Secure Shop and Currency Blueprint]] · [[Text Chat, Moderation and Player Safety]]

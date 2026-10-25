---
area: "13 Growth and Monetization"
cluster: "Monetization"
tags: [deep-dive, roblox, pricing, managed-pricing, price-optimization, regional-pricing]
verified: 2026-10-25
cssclasses: [tg-a13]
---

# Managed Pricing, Price Tests and Regional Pricing

## Why this matters
Roblox now runs price testing and regional pricing for you under one opt-in, **Managed Pricing**, and new games and items are enrolled **by default**. If your UI hard-codes prices, players can be charged one price while seeing another, and price tests can't run on those items at all.
Knowing how the tests work (thresholds, durations, holdouts) and what they can't do (subscriptions, hard-coded prices, trading arbitrage) lets you use the system safely instead of guessing prices or fighting it.

> [!note] No revenue promises
> Roblox applies optimized prices only when its test shows positive incremental revenue, but nothing guarantees a gain for your game. Figures below are documented rules, not expected outcomes.

---

## 1. What Managed Pricing is

From Creator Docs › Managed pricing:
- One system in **Monetization › Managed Pricing** that combines **price optimization** (A/B price tests) and **regional pricing** (prices adjusted by economic location).
- **One-time opt-in** for existing games. If hard-coded prices are detected, you are prompted to fix them first.
- After opt-in it **replaces the old Price Optimization tab**. Existing regional-pricing items transition automatically.
- **New games and newly created items are enrolled by default**, with item-level opt-out at any time and bulk enable/disable.
- **Subscriptions, Private Servers and Developer Servers** are regionalized automatically and need no opt-in. Subscriptions are **not** part of price tests.
- The tab shows past tests, upcoming tests and revenue-impact reports, and lets you reschedule tests.

---

## 2. Price optimization tests: how they work

| Rule | Documented value |
|---|---|
| Traffic needed | "In most cases" at least **60,000 transactions over the previous 30 days** (sum of product sales) |
| Groups | Users are automatically split into test groups; the system picks the smallest cohort that works |
| Duration | About **3 weeks**, then an email; results show optimized prices, % change and approximate long-term revenue impact |
| Apply rule | Optimized prices are applied only if the result is **positive incremental total revenue** |
| Cadence | Tests run automatically **at least every 90 days**, or sooner when prices may no longer be optimal |
| Review period | **Four weeks** after applying; reports compare tested products shown to **98%** of users against a **2%** holdout seeing original prices |
| Scope | Developer products and passes only |
| Locks | You **can't change prices** of products in a running test. Stopping a test reverts prices |
| When users see prices | On **re-joining** the game after the test starts |

### Read the report correctly
The glossary defines *Paying users*, *Sales*, *Total playtime*, *DAU*, *Revenue* (the four-week review), *ARPPU* and *Approximate revenue impact* (projected). Look at **playtime and DAU next to revenue**. A price increase that lifts revenue but lowers playtime can hurt discovery signals over time. The test optimizes revenue, so you decide whether the trade-off fits your game.

---

## 3. Regional pricing: how it works

- You set a **default global price**; Roblox sets per-region prices using purchasing power, exchange rates and local spending behaviour.
- **Bounds:** never less than **30%** and never more than **100%** of your default price (100 Robux → 30–100 Robux).
- **Economic location ≠ account location.** Roblox uses signals including **VPN usage, billing history and account history**; if it can't determine it, the user sees the default price.
- **Passes:** managed pricing is **on by default**; disable per pass with *Disable Managed Pricing*.
- **Developer products:** require dynamically scripted prices **and** that you implement `GetUsersPriceLevelsAsync` checks for transfers before enabling.
- **Robux subscriptions:** always regional (can't be turned off). Local-currency subscriptions: not available.
- You can see prices by country on each item's Sales / Basic Settings page (*View all countries*).

---

## 4. Make every price dynamic (required for both features)

Price tests and regional prices only show correctly if your UI reads the price from `MarketplaceService` **on the client** (the docs specifically say the script must run on the client so users see *their* personalized price). Roblox Plus discounts have the same requirement.

```lua
-- LocalScript: price labels that always match the purchase prompt
local MarketplaceService = game:GetService("MarketplaceService")

local cache: {[string]: number} = {}

local function priceFor(id: number, infoType: Enum.InfoType): number?
	local key = infoType.Name .. id
	if cache[key] then return cache[key] end
	local ok, info = pcall(MarketplaceService.GetProductInfoAsync, MarketplaceService, id, infoType)
	if ok and info and info.PriceInRobux then
		cache[key] = info.PriceInRobux
		return info.PriceInRobux
	end
	return nil
end

local function bindPriceLabel(label: TextLabel, id: number, infoType: Enum.InfoType)
	label.Text = "…"
	task.spawn(function()
		local price = priceFor(id, infoType)
		label.Text = if price then ("%d R$"):format(price) else "View"
	end)
end

-- bindPriceLabel(shop.CoinsButton.Price, 111111, Enum.InfoType.Product)
-- bindPriceLabel(shop.VipButton.Price, 222222, Enum.InfoType.GamePass)
```

For a full store, `MarketplaceService:GetDeveloperProductsAsync()` returns a `Pages` object of all your products and prices in one go.

### Verify with the Dynamic Price Check tool
*Monetization › Managed Pricing › Dynamic Price Check* (also under the ⋯ menu on Passes and Developer Products):
1. Add **up to five** test accounts.
2. Choose **Price pinned** (every dynamic price becomes a fake fixed amount) or **Location pinned** (prices for a fake economic location).
3. Enable, wait a few minutes, join with a test account. **Any price that didn't change is hard-coded.**
4. Disable the tool when done.

Add this check to every release that touches the shop (see [[Release Readiness Runbook 2026]]).

---

## 5. Protect trading and gifting from price arbitrage

If players can gift or trade items bought with Robux, a player in a low-price region could buy cheaply and pass items to a full-price region. Roblox provides `MarketplaceService:GetUsersPriceLevelsAsync(userIds)` to compare users' price levels.

> [!warning] The docs describe the value two ways
> The Regional pricing guide says the price level is **1–1000**, roughly the per-mille share of the global price (1000 = full price, 500 = half). The Engine API page describes it as the suggested price (a level of 100 ≈ 100 Robux). **Compare levels relatively (ratios and differences between users) rather than relying on an absolute meaning,** and re-read both pages before shipping.

```lua
-- Server: allow a gift only from an equal-or-higher price level to a lower one
local MarketplaceService = game:GetService("MarketplaceService")

local function priceLevels(userIds: {number}): {[number]: number}?
	local ok, result = pcall(MarketplaceService.GetUsersPriceLevelsAsync, MarketplaceService, userIds)
	if not ok or type(result) ~= "table" then return nil end
	local map = {}
	for _, info in result do
		map[info.UserId] = info.PriceLevel -- PriceLevelInfo = { UserId, PriceLevel } per the docs
	end
	return map
end

local function canGift(senderId: number, recipientId: number): boolean
	local levels = priceLevels({ senderId, recipientId })
	if not levels then return false end -- fail closed
	return (levels[senderId] or 0) >= (levels[recipientId] or math.huge)
end
```

Docs guidance: **don't cache price levels beyond a session**, because levels change; fetch at player join. A common policy from the docs' examples is to allow gifting downward (higher level to lower) and allow trading only between equal levels. Combine this with the `PolicyService` trading checks (see [[Paid Random Items, Odds Disclosure and PolicyService]]).

---

## 6. How to work with the system, not against it

1. **Opt in early** (it is the default for new games), but fix hard-coded prices first.
2. **Choose defaults deliberately.** Regional prices only go *down* from your default, and price tests explore around it.
3. **Don't run your own price A/B tests on the same items** during a Managed Pricing test; you can't change prices anyway. Use Experiments for *non-price* shop changes (layout, bundles, starter packs) (see [[Experiments and Configs - In-Game A-B Testing]]).
4. **Keep the price ladder coherent.** Tests may move individual items; check that the 1,000-coin pack doesn't end up costing more per coin than the 500-coin pack. Review after every applied test.
5. **Log the price actually paid** (`CurrencySpent` / receipt Robux amount) in your economy analytics so dashboards stay correct during tests.

---

## Common mistakes
- Hard-coded "99 R$" labels while regional or test prices differ.
- Fetching prices on the server and sending them to clients (players see someone else's price).
- Expecting price tests on a small game; below ~60k transactions per 30 days results may not be significant.
- Trying to change a price mid-test.
- Assuming regional prices can exceed your default (they can't).
- Enabling regional pricing on tradable dev-product items without arbitrage checks.
- Caching price levels across sessions.
- Ignoring playtime and DAU in the test report.

## Checklist
- [ ] Every price label reads `GetProductInfoAsync` / `GetDeveloperProductsAsync` on the client
- [ ] Dynamic Price Check (Price pinned and Location pinned) passes
- [ ] Managed Pricing enrolment reviewed item by item; opt-outs justified
- [ ] Tradable/giftable paid items gated with `GetUsersPriceLevelsAsync` (fail closed)
- [ ] Price ladder per-unit value checked after each applied test
- [ ] Receipts log the actual Robux paid
- [ ] Test reports reviewed for playtime/DAU side effects

---

**Sources checked (2026-10-25):** Creator Docs: Monetization › Managed pricing; Price optimization; Regional pricing; Passes and Developer products (price-optimization notes); Roblox Plus (hard-coded price warning); Engine API: MarketplaceService.GetProductInfoAsync, GetDeveloperProductsAsync, GetUsersPriceLevelsAsync; InfoType enum.

**Related:** [[Monetization - Hub]] · [[Shop UX, Pricing and Player Trust]] · [[Monetization Analytics and Segmentation]] · [[Secure Shop and Currency Blueprint]] · [[Passes vs Developer Products vs Subscriptions - 2026 Decision Guide]]

---
area: "13 Growth and Monetization"
cluster: "Monetization"
tags: [deep-dive, roblox, monetization, passes, developer-products, subscriptions, roblox-plus]
verified: 2026-10-25
cssclasses: [tg-a13]
---

# Passes vs Developer Products vs Subscriptions - 2026 Decision Guide

## Why this matters
Roblox's monetization toolbox changed a lot through 2025–2026: Managed Pricing, an in-game Shop with external "Listed" sales, `BindReceiptHandler`, Roblox Plus incentives, Robux transfers, and the end of cross-game pass and product sales on **May 30, 2026**. Advice written before that is often wrong now.
Choosing the wrong primitive (a pass for something consumable, a subscription for a one-off unlock) causes refunds, angry reviews and broken fulfillment. This guide maps each thing you want to sell to the right product type, with the current documented rules.

> [!note] No revenue promises
> Nothing here predicts earnings. Revenue shares and thresholds below are quoted from Roblox's docs as of the verified date and can change. Re-check the linked pages before you set prices.

---

## 1. The decision table

| You want to sell… | Use | Why |
|---|---|---|
| A permanent perk (VIP area, 2× speed forever, a tool) | **Pass** | One-time Robux fee, owned forever, no receipt handling needed |
| Something bought repeatedly (currency packs, potions, revives, ammo) | **Developer product** | Repeatable; fulfilled through receipts |
| Ongoing value every month (daily gems, VIP lounge, monthly cosmetics) | **Subscription** | Auto-renewing; benefits must continue for the full term |
| Access to the game itself (closed beta) | **Paid access** (Robux or local currency) | One-time fee to enter the game |
| Friends-only play | **Private servers** (free or monthly Robux fee) | Monthly server subscription |
| A season / battle pass | Developer product or pass per season, or a **subscription** | Docs explicitly allow battle passes to be marketed as a subscription purchase |
| Avatar items | Marketplace items + in-game avatar inspect / AvatarEditorService | Game owner earns a commission on in-game catalog sales |

---

## 2. Passes: key facts (Creator Docs › Passes)

- One-time purchase; you assign the privileges yourself (check ownership on join).
- Icon: up to 512×512, keep details inside the circle crop; `.jpg`, `.png` or `.bmp`.
- Each pass has a **category** that organizes it in the in-game **Shop**.
- **Passes are always Listed** in the Shop and can appear outside your game (Home, search, the post-Robux-purchase page). A player can buy the pass outside and join with it already granted.
- **Promote a pass on the Buy Robux page:** opt in under *Promotions › Include this item in the bonus pool*. Promoted passes are given **free** to users buying eligible Robux packages. If on sale, the price must be **greater than 49 and less than 801 Robux**. A thumbnail is required, and the pass can't grant paid random items. The docs recommend making a **unique** pass for this.
- **Cross-game pass sales stopped on May 30, 2026.** Games that relied on selling other games' passes should use **Robux transfers** instead.
- Roblox doesn't record per-user pass purchase history for you. Store it yourself if you need it.

```lua
-- Server: grant pass perks on join and on purchase
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")

local VIP_PASS_ID = 0 -- your pass ID

local function grantVip(player: Player)
	player:SetAttribute("VIP", true) -- your perk logic reads this
end

local function checkPass(player: Player)
	local ok, owns = pcall(MarketplaceService.UserOwnsGamePassAsync, MarketplaceService, player.UserId, VIP_PASS_ID)
	if ok and owns then grantVip(player) end
end

Players.PlayerAdded:Connect(checkPass)

MarketplaceService.PromptGamePassPurchaseFinished:Connect(function(player, passId, purchased)
	if purchased and passId == VIP_PASS_ID then
		grantVip(player)
	end
end)
```

`UserOwnsGamePassAsync` results are cached. The cache refreshes when `PromptGamePassPurchaseFinished` fires; outside purchases made mid-session can take minutes to show up. It always returns true on the first server join after a purchase.

---

## 3. Developer products: key facts (Creator Docs › Developer products)

- Price **1 to 1,000,000,000 Robux**. Same icon rules as passes.
- **Fulfillment must go through receipts.** Use `MarketplaceService.ProcessReceipt` or the newer `MarketplaceService:BindReceiptHandler(Enum.ReceiptType.DeveloperProduct, handler[, filter])`. A bound handler takes precedence and falls through to `ProcessReceipt` if none matches, so you can migrate gradually.
- **Never** grant from `PromptProductPurchaseFinished`; the docs say it firing doesn't mean the purchase succeeded.
- Products can be **Listed** (Shop and external surfaces) or **Unlisted** (only your own flows). External surfacing requires a correct receipt implementation. Roblox **checks this continuously** and shows a banner plus report in *Monetization › Shop* for flagged products, which lose external eligibility until you fix them and click **Mark as fixed**.
- **Cross-game developer product sales also stopped on May 30, 2026.**
- The receipt contains the exact Robux paid, even during price tests.

### Idempotent fulfillment with BindReceiptHandler

```lua
-- Server: one catch-all handler; Profiles is your session-locked data module
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")

local GRANTS = {
	[111111] = function(profile) profile.Data.Coins += 1000 end, -- 1000 coins
	[222222] = function(profile) profile.Data.Revives += 1 end,
}

MarketplaceService:BindReceiptHandler(Enum.ReceiptType.DeveloperProduct, function(receipt)
	local player = Players:GetPlayerByUserId(receipt.PlayerId)
	local profile = player and Profiles.get(player)
	if not profile then
		return Enum.ReceiptDecision.NotProcessedYet -- redelivered later / on rejoin
	end
	local purchases = profile.Data.PurchaseIds -- set of processed PurchaseIds
	if purchases[receipt.PurchaseId] then
		return Enum.ReceiptDecision.Processed -- already granted: don't double-grant
	end
	local grant = GRANTS[receipt.ProductId]
	if not grant then
		warn("Unknown product", receipt.ProductId)
		return Enum.ReceiptDecision.NotProcessedYet
	end
	grant(profile)
	purchases[receipt.PurchaseId] = os.time()
	if not Profiles.saveNow(player) then -- only report success once the grant is durably saved
		return Enum.ReceiptDecision.NotProcessedYet
	end
	return Enum.ReceiptDecision.Processed
end)
```

Trim old `PurchaseIds` entries by age so the profile doesn't grow forever. See [[Purchase Fulfillment and Receipt Reliability]] and [[Idempotent Transaction Ledger]] for the full ledger pattern.

---

## 4. Subscriptions: key facts (Creator Docs › Subscriptions)

| Rule | Robux-priced | Local-currency-priced |
|---|---|---|
| Who can create | All creators | Account **verified by ID or phone** |
| Platforms | All | Web, App Store, Google Play |
| Countries | All supported | Not available in Argentina, China, Colombia, India, Indonesia, Japan, Russia, Taiwan, Türkiye, UAE, Ukraine, Vietnam |
| Price | **≥ 49 Robux** (custom) | **$2.99, $4.99, $7.99, $9.99 or $14.99** |
| Regional pricing | **On by default, can't be disabled** | Not available |
| Payout | **70% every month** | **70% first month, then 100%** |
| Hold | About 5 days (like passes and products) | 30-day hold, paid after the term is delivered |
| Price changes | Once every **60 days**; increases need **30 days' notice** | Can't change; delete and recreate |
| Refunds | Robux subscriptions are **not refundable** | Bank or app-store refunds inside the hold cancel the payout; later refunds are deducted |

Other rules:
- Up to **50 subscriptions** per game (active + inactive). All subscriptions can be owned at once; **mutually exclusive tiers (Bronze/Silver/Gold) are not supported**.
- Guidelines: clear names, price and duration in-game; **same benefits on every platform**; honour benefits for the full term; **don't send users to buy on another platform**; don't gate paid benefits behind extra tasks (such as social posts).
- Before first activation you must set a **shortened game name**, which is **permanent**.
- Prefer **Take Off Sale** (let existing subscribers run out) over **Delete**. Deleting an active subscription refunds subscribers and pays you zero.
- Subscriptions are **not** included in price-optimization tests, can't be cross-sold, and aren't eligible for affiliate fees.

```lua
-- Server: check subscription status (must be server-side) and react to changes
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local SUB_ID = "EXP-0000000000000000000" -- your subscription ID string

local function refresh(player: Player)
	local ok, status = pcall(MarketplaceService.GetUserSubscriptionStatusAsync, MarketplaceService, player, SUB_ID)
	player:SetAttribute("SubActive", ok and status and status.IsSubscribed or false)
end

Players.PlayerAdded:Connect(refresh)
Players.UserSubscriptionStatusChanged:Connect(function(player, subscriptionId)
	if subscriptionId == SUB_ID then refresh(player) end
end)
```

`IsSubscribed` only becomes true once payment succeeds; a pending initial payment returns false. Subscription webhooks (purchased, renewed, cancelled, refunded) are available through Cloud API webhooks for your own analytics.

**Replacing a pass with a subscription:** take the pass off sale, keep honouring existing pass owners, and remember subscriptions can lapse, so persistent benefits must be revocable.

---

## 5. Platform programs worth knowing (not product types, but they change the math)

| Program | Creator-side summary (docs) |
|---|---|
| **Roblox Plus** | Subscribers get 10% off eligible purchases (20% from month 3), **subsidized by Roblox**, so your earnings per purchase are unchanged. Prompt sign-ups in-game with `MarketplaceService:PromptRobloxSubscriptionPurchase` and earn **250 Robux/month for 3 months (up to 750)** per new subscriber, with a 60-day hold. Plus subscribers spending ≥60 minutes in a paid private server they created in your game can earn you up to 100 Robux per subscriber per cycle. |
| **Robux transfers** | Plus subscribers can send 10–500 Robux per transfer through `PromptRobuxTransferAsync` (server-side); your game earns **10%**, which is DevEx-eligible. Handle receipts with `BindReceiptHandler(Enum.ReceiptType.RobuxTransferSender / RobuxTransferReceiver, …)`. |
| **Shop** | A Roblox-managed, personalized store showing all passes and Listed products, with a global Shop button you can enable in *Monetization › Shop*. It doesn't change economics. |
| **Product intelligence** | `RankProductsAsync` (strict rate limit, call once at join) and `RecommendTopProductsAsync` (needs at least one sale in 28 days; up to 50 items; wrap in `task.spawn`). |
| **Engagement-based payouts** | **Deprecated July 24, 2025**, replaced by the Creator Rewards program. Ignore old guides built around Premium Playtime. |

**Hard-coded prices break all of this.** Plus discounts, regional prices and price tests only display correctly if your UI reads prices from `GetProductInfoAsync` / `GetDeveloperProductsAsync` on the **client** (see [[Managed Pricing, Price Tests and Regional Pricing]]).

---

## 6. Presentation rules (apply to every product type)
From the Monetization guidelines:
- Discounts must be **genuine** (not "always on sale") and **fair** (not ultra-short pressure windows).
- No false scarcity, no countdown timers that restart.
- Use neutral calls to action for a young audience: "View Item", "See Price", "Open Shop", not "BUY BEFORE IT'S GONE!".
- Use `PolicyService` to hide subscriptions or commerce from ineligible users (`IsEligibleToPurchaseSubscription`, `IsEligibleToPurchaseCommerceProduct`).

---

## Common mistakes
- Selling currency as a pass, or a permanent perk as a developer product.
- Granting dev products from `PromptProductPurchaseFinished`.
- Returning `Processed` before the grant is saved, which loses purchases on server crashes.
- No duplicate-receipt protection.
- Building "Bronze/Silver/Gold" exclusive subscription tiers (not supported).
- Telling players to buy cheaper on another platform (prohibited for subscriptions).
- Still depending on cross-game pass or product sales after May 30, 2026.
- Hard-coded Robux prices in UI.
- Planning around engagement-based payouts (deprecated).

## Checklist
- [ ] Every sellable item mapped to the right product type
- [ ] Pass perks granted on join and on `PromptGamePassPurchaseFinished`
- [ ] Dev products fulfilled via `BindReceiptHandler`/`ProcessReceipt`, idempotent, save-before-ack
- [ ] No "Mark as fixed" banners in *Monetization › Shop*
- [ ] Subscriptions: names, price, duration and benefits shown in-game; status checked server-side
- [ ] Prices read dynamically on the client
- [ ] PolicyService eligibility checks for subscriptions, commerce and random items
- [ ] Promotion/discount copy reviewed against the guidelines
- [ ] Cross-game sales replaced (if you used them)

---

**Sources checked (2026-10-25):** Creator Docs: Monetization (overview and guidelines); Passes; Developer products; Subscriptions; Shop; Roblox Plus; Robux transfers; Engagement-based payouts (deprecation notice); Engine API: MarketplaceService (BindReceiptHandler, ProcessReceipt, UserOwnsGamePassAsync, GetUserSubscriptionStatusAsync), Players.UserSubscriptionStatusChanged, PolicyService.

**Related:** [[Monetization - Hub]] · [[Developer Products, Passes and Subscriptions]] · [[Purchase Fulfillment and Receipt Reliability]] · [[Secure Shop and Currency Blueprint]] · [[Shop UX, Pricing and Player Trust]] · [[Economy and Monetization Architecture]]

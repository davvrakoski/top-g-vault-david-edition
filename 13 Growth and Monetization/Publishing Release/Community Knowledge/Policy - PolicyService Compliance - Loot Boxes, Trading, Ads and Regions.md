---
area: "13 Growth and Monetization"
cluster: "Publishing Release"
title: "PolicyService Compliance - Loot Boxes, Trading, Ads and Regions"
tags: [roblox, community-knowledge, publishing, policy, policyservice, luau, loot-boxes, trading]
cssclasses: [tg-a13]
verified: 2026-10-25
license: "summary in our own words; sources linked; code is original"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/PolicyService
  - https://create.roblox.com/docs/production/monetization/paid-random-items
  - https://en.help.roblox.com/hc/en-us/articles/47965190783892-Promoting-Items-to-Younger-Audiences
  - https://devforum.roblox.com/t/policyservice-guidelines/773321
---
# PolicyService Compliance - Loot Boxes, Trading, Ads and Regions

> Not legal advice. Based on the PolicyService API reference, the paid random items guidelines and the Help Center article "Promoting Items to Younger Audiences", checked 2026-10-25.

`PolicyService:GetPolicyInfoForPlayerAsync(player)` is how Roblox tells your game what each player is legally allowed to do, based on **location, age group and platform**. The Community Standards list "skipping required PolicyService APIs" as misuse of Roblox systems, and the Help Center says you **must** integrate it to meet your compliance obligations. You never need to know *why* a player is restricted (Belgium, Brazil under-18, a console store rule); you only obey the flags.

## The flags that matter most

| Key | Gate this feature |
| --- | --- |
| `ArePaidRandomItemsRestricted` | When true, the player may not use any Robux-funded random generator |
| `IsPaidItemTradingAllowed` | When false, the player may not trade items bought with Robux or Robux-bought currency, including loot-box results |
| `AreAdsAllowed` | Immersive ads exposure |
| `IsEligibleToPurchaseSubscription` | Showing and selling subscriptions |
| `IsEligibleToPurchaseCommerceProduct` | Physical commerce products |
| `IsContentSharingAllowed` | Features where players create content others see, or share content |
| `IsEndlessContentLoadAllowed` / `IsEndlessContentAutoplayAllowed` | Infinite-scroll feeds and autoplaying media |
| `IsSubjectToChinaPolicies` | China-specific compliance |

`AllowedExternalLinkReferences` is legacy and always empty.

## Required treatments for restricted loot boxes

For a player with `ArePaidRandomItemsRestricted = true`, Roblox lists acceptable treatments. Pick one per feature:

1. Give an **unpaid, earnable** path to the same random item.
2. Make outcomes a **fixed, disclosed sequence** (first spin 5 gems, second 10...).
3. Sell the outcome **directly**, priced by expected value (5% sword in a 10 Robux box becomes a 200 Robux direct buy).
4. **Hide or remove** the paid random item.
5. **Block the purchase** with a clear message such as "unavailable in your region".
6. **Move the player** away from areas with paid random items.

## A server-side policy cache

Call the API once per player on the server, wrap it in `pcall`, and fail **closed** (treat the player as restricted if the call fails).

```lua
-- ServerScriptService/PolicyCache.server.lua
local Players = game:GetService("Players")
local PolicyService = game:GetService("PolicyService")

local RESTRICTIVE_DEFAULT = {
	ArePaidRandomItemsRestricted = true,
	IsPaidItemTradingAllowed = false,
	AreAdsAllowed = false,
	IsEligibleToPurchaseSubscription = false,
}

local function loadPolicy(player: Player)
	local ok, info = pcall(PolicyService.GetPolicyInfoForPlayerAsync, PolicyService, player)
	local policy = if ok and info then info else RESTRICTIVE_DEFAULT
	player:SetAttribute("LootBoxesBlocked", policy.ArePaidRandomItemsRestricted == true)
	player:SetAttribute("PaidTradingAllowed", policy.IsPaidItemTradingAllowed == true)
	player:SetAttribute("PolicyLoaded", ok)
end

Players.PlayerAdded:Connect(loadPolicy)
for _, p in Players:GetPlayers() do
	task.spawn(loadPolicy, p)
end
```

Then check `player:GetAttribute("LootBoxesBlocked")` on the **server** before every roll that costs Robux-bought currency, and in the UI to swap the "Open" button for the direct-buy or "unavailable" variant. Trading code checks `PaidTradingAllowed` for **both** parties before an offer is created.

## Pitfalls

- Checking only in the client UI. An exploiter can fire the remote anyway; the server must refuse.
- Calling the API every time a shop opens. Roblox errors if more than 100 calls are pending; cache per session.
- Gating the egg but not the "buy gems" product that feeds it. If gems are only for eggs, consider hiding that product too.
- Gating trading of the loot item but not of items fused from it.
- Answering "Yes, we respect the API" in the maturity questionnaire without actually doing it. Roblox says it audits games for inaccurate declarations, and in Brazil games that declare paid random items but say they do not use PolicyService are no longer playable by under-18 users (see the regional note).

## Related
[[Publishing Release - Hub]] · [[Policy - Paid Random Items - Odds Disclosure Checklist]] · [[Policy - Regional Rules - Belgium, Brazil, Korea and Country Blocks]] · [[Secure Shop and Currency Blueprint]] · [[PolicyService]]

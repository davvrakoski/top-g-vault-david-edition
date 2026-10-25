---
area: "40 Community Resources"
cluster: "Characters Avatars and UGC"
source_note: "community/characters-ugc/ugc-limiteds"
title: "UGC Limiteds - Per-Unit Fees, Resale Split and Purchase Limits"
tags: [roblox, community, "cluster/characters-avatars-and-ugc", ugc, limiteds, marketplace]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/marketplace/marketplace-fees-and-commissions
  - https://create.roblox.com/docs/marketplace/publish-to-marketplace
  - https://create.roblox.com/docs/marketplace/marketplace-policy
  - https://create.roblox.com/docs/reference/engine/classes/MarketplaceService
---
# UGC Limiteds - Per-Unit Fees, Resale Split and Purchase Limits

A **Limited** is an avatar item with a fixed quantity. Community Limiteds are a big part of "free UGC" games and of item hype. Here is how the money and limits work.

## Free vs paid Limiteds

| | Free Limited | Paid Limited |
| --- | --- | --- |
| Price | 0 | At or above the Limiteds price floor |
| Upfront cost | Per-unit fee for every copy (market-based; the FAQ quoted 100 Robux per unit). Roblox keeps all of it. | Paid Limited publishing advance (5,000 to 20,000 depending on type), refundable through rebates |
| Example | 200 hats at a 100 per-unit fee costs 20,000 Robux | Body bundle advance 20,000 |
| Publish limit | 50 per day (publishing page table) | No limit (publishing page table) |

The older Marketplace FAQ still mentions one Limited per day; check the dashboard when you publish.

## Resale

- Only Roblox-created Limiteds are **tradeable**. Community Limiteds can be **resold** if the creator enabled reselling.
- Reselling requires Roblox Plus or Premium; there is a holding period of up to 30 days after purchase.
- Resale split: **50% reseller, 10% original creator, 10% seller or affiliate (game), 30% Roblox**.
- Not available for accounts based in Japan.
- Robux from reselling items you did not create is not DevEx-eligible.

## Anti-bot purchase limits (all Limited sales)

- 9 successful purchases per minute per user.
- 1 purchase request every 2 seconds per item per user.
- At most 3 successful purchases per user per item.
- **In-game purchases require the player to have been in the game for 60 seconds.**

That last rule matters for "free UGC" games: a buy button in the first minute will fail. Show a timer or a short task before the claim button unlocks.

## Policy traps

- Re-publishing an item you already sold as a Limited (or re-publishing a Limited) counts as a near-duplicate and can be removed.
- "Free UGC" games that make players do tasks for a Limited are still bound by general game rules; never promise an item you cannot deliver once stock runs out.

## Game-side code idea (original)

```lua
-- Server: only allow a Limited purchase prompt after 60 seconds in the server.
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")

local joinedAt: {[Player]: number} = {}
Players.PlayerAdded:Connect(function(player)
	joinedAt[player] = os.clock()
end)
Players.PlayerRemoving:Connect(function(player)
	joinedAt[player] = nil
end)

local function tryPromptLimited(player: Player, assetId: number): (boolean, number?)
	local waited = os.clock() - (joinedAt[player] or os.clock())
	if waited < 60 then
		return false, math.ceil(60 - waited) -- seconds left, show in UI
	end
	MarketplaceService:PromptPurchase(player, assetId)
	return true
end
```

Server time since join is an approximation of the platform's own check; keep a few seconds of margin.

## Credits

- Roblox Creator Docs: *Marketplace fees and commissions* (Limiteds, reselling, rate limits), *Publish to Marketplace*, *Marketplace policy*, MarketplaceService reference (CC BY 4.0). Code is original.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Characters Avatars and UGC - Hub]]

**Related notes:** [[UGC Money Math - Upload Fee, Publishing Advance and Revenue Share]] · [[Marketplace fees and commissions]] · [[UGC Publishing Requirements 2026 - Who Can Sell Avatar Items]] · [[Selling Avatar Items Inside Your Game - Commissions, Homestore and Creation Tokens]]

<!-- TDOD_GRAPH_END -->

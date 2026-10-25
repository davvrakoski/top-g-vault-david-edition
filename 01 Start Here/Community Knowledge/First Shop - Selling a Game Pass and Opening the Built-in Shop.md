---
area: "01 Start Here"
cluster: "Start Here"
title: "First Shop - Selling a Game Pass and Opening the Built-in Shop"
tags: [roblox, community-knowledge, start-here, monetization, game-pass, shop]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/monetization/passes
  - https://create.roblox.com/docs/reference/engine/classes/MarketplaceService
  - https://create.roblox.com/docs/production/monetization/developer-products
---
# First Shop - Selling a Game Pass and Opening the Built-in Shop

A **pass** (game pass) is a one-time Robux purchase that unlocks something permanently: VIP area, double coins, a special tool. It is the simplest thing to sell and the right first monetization feature. This note covers creating a pass, a buy button, granting the perk safely on the server, and the 2026 built-in in-game **Shop** you can open with one line.

## Pass or developer product?

| Sell... | Use |
| --- | --- |
| Permanent perk (VIP, 2x cash, a gamepass tool) | **Pass** |
| Repeatable item (coins pack, revive, skip stage) | **Developer product** (needs a receipt handler) |

Decision help: [[Passes vs Developer Products vs Subscriptions - 2026 Decision Guide]].

## 1. Create the pass (Creator Dashboard)

1. Publish the game first.
2. Creations > your game > **Monetization > Passes > Create pass**.
3. Icon: up to 512x512, `.jpg/.png/.bmp`, important details inside the circle (it is cropped round).
4. Name, description, **category** (used to organise items in the in-game Shop). Create.
5. Set it on sale with a price, then copy its ID: hover the thumbnail > **...** > **Copy Asset ID**.

## 2. Buy button (LocalScript inside a TextButton)

```lua
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local PASS_ID = 0000000 -- your pass ID

script.Parent.Activated:Connect(function()
	local player = Players.LocalPlayer
	local ok, owns = pcall(MarketplaceService.UserOwnsGamePassAsync, MarketplaceService, player.UserId, PASS_ID)
	if ok and owns then
		script.Parent.Text = "Owned"
		return
	end
	MarketplaceService:PromptGamePassPurchase(player, PASS_ID)
end)
```

To show the live name and price, call `MarketplaceService:GetProductInfoAsync(PASS_ID, Enum.InfoType.GamePass)` in a `pcall` (`GetProductInfo` without "Async" is deprecated) and read `Name`, `PriceInRobux`, `IsForSale`.

## 3. Grant the perk on the server (Script in ServerScriptService)

```lua
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local PASS_ID = 0000000

local function grantVip(player)
	player:SetAttribute("VIP", true)
	-- e.g. give a tool, unlock a door, double rewards
end

local function checkOwnership(player)
	local ok, owns = pcall(MarketplaceService.UserOwnsGamePassAsync, MarketplaceService, player.UserId, PASS_ID)
	if ok and owns then grantVip(player) end
end

Players.PlayerAdded:Connect(checkOwnership) -- owners get it every join

MarketplaceService.PromptGamePassPurchaseFinished:Connect(function(player, passId, purchased)
	if purchased and passId == PASS_ID then
		grantVip(player) -- bought right now, in this session
	end
end)
```

Two paths matter: **join** (already owns) and **purchase finished** (just bought). Forgetting the join check is the classic "I paid and lost my VIP after rejoining" bug. Your game code then checks `player:GetAttribute("VIP")` on the server before giving the perk.

## 4. The built-in Shop (2026)

Every game now gets an automatic in-game **Shop**: a personalised overlay listing your passes and developer products, ranked for each player. Open it from a button:

```lua
game:GetService("MarketplaceService"):OpenShop(game:GetService("Players").LocalPlayer)
```

`OpenShop` works from a LocalScript (for the local player) or a server Script. You choose which items appear in Creator Hub. It is a quick way to get a professional shop UI on day one; build your own shop UI later if your style needs it.

## Policy and trust

- If you price-optimise, prompt prices from the client so players see personalised prices (per the docs).
- Paid random items need odds disclosure: see [[Paid Random Items, Odds Disclosure and PolicyService]].
- From **May 30, 2026**, selling passes across games is disabled; sell each game's passes inside that game.
- Never decide ownership on the client; a LocalScript can be edited by exploiters.

## Pitfalls

- Using the asset ID of the pass **image** instead of the pass ID.
- Testing in Studio: purchase prompts in Studio playtests are test purchases that do not spend Robux (long-standing community experience; not stated on the pages we checked, so treat as unverified and confirm the prompt text says it is a test).
- Pass works only after rejoin: you forgot `PromptGamePassPurchaseFinished`.

## Related
[[00 START HERE - Top G Vault]] · [[Passes vs Developer Products vs Subscriptions - 2026 Decision Guide]] · [[Purchase Fulfillment and Receipt Reliability]] · [[Shop UX, Pricing and Player Trust]] · [[30 Official Roblox Docs/Production/Monetization/Passes|Passes (official)]]

---
area: "40 Community Resources"
cluster: "Characters Avatars and UGC"
source_note: "community/characters-ugc/avatareditorservice-build-order"
title: "AvatarEditorService In-Game Editor - Build Order"
tags: [roblox, community, "cluster/characters-avatars-and-ugc", avatar-editor, monetization, luau]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/players/avatar-editor
  - https://create.roblox.com/docs/reference/engine/classes/AvatarEditorService
  - https://create.roblox.com/docs/reference/engine/classes/MarketplaceService
  - https://create.roblox.com/docs/marketplace/marketplace-fees-and-commissions
  - https://devforum.roblox.com/t/release-notes-for-454/856884
---
# AvatarEditorService In-Game Editor - Build Order

`AvatarEditorService` (AES) lets a game read a player's inventory, search the Marketplace, save avatars and outfits, and pair with `MarketplaceService` for purchases. In-game sales of other creators' items pay the **game owner 40%** of the price (creator 30%, Roblox 30%), which is why catalog and dress-up games exist.

## Build it in this order

1. **Preview first, no permissions.** A try-on rig in a ViewportFrame with a few hardcoded items. See [[Character Preview in a ViewportFrame - WorldModel Pattern]].
2. **Catalog search.** `AvatarEditorService:SearchCatalogAsync(CatalogSearchParams)` returns `CatalogPages`. Filter with `AssetTypes`, `BundleTypes`, `CategoryFilter`, `MinPrice`/`MaxPrice`, `SearchKeyword`, `SortType`, `IncludeOffSale`, `CreatorId` or `CreatorName`.
3. **Details on demand.** `GetItemDetailsAsync(id, Enum.AvatarItemType.Asset)` or `GetBatchItemDetailsAsync(ids, itemType)` for price and info.
4. **Inventory (optional).** `PromptAllowInventoryReadAccess()` once per session, wait for `PromptAllowInventoryReadAccessCompleted`, then `GetInventoryAsync({asset types})`. Handle "denied" gracefully; most players will not need it.
5. **Ownership and purchase (server).** `MarketplaceService:PlayerOwnsAssetAsync`, then `PromptPurchase` for one item or `PromptBulkPurchase` (server only, up to 20 line items) for a full outfit.
6. **Conform before saving.** `ConformToAvatarRulesAsync(description)` returns a description that follows platform avatar rules and remaps classic faces and heads to their dynamic head versions.
7. **Save.** `PromptSaveAvatar(description, rigType)` overwrites the current avatar; `PromptCreateOutfit(description, rigType)` saves a new outfit. Both are prompts and do not yield; listen for the matching `...Completed` event. Items the player does not own are **not** granted by saving.
8. **Favorite instead of buy.** `PromptSetFavorite` for players who are not ready to purchase.

## Throttling

These AES calls share an **experience-wide** budget of 100 requests per second across all servers: `GetItemDetailsAsync`, `GetBatchItemDetailsAsync`, `GetRecommendedAssetsAsync`, `GetRecommendedBundlesAsync`, `SearchCatalogAsync`, `PromptSetFavorite`, `GetFavoriteAsync`. Going over returns HTTP 429. So cache, debounce typing, and page lazily.

## Original client search helper with cache and debounce

```lua
local AvatarEditorService = game:GetService("AvatarEditorService")

local cache: {[string]: {any}} = {}
local pending = 0

local function search(keyword: string, assetTypes: {Enum.AvatarAssetType}, onResult: ({any}) -> ())
	pending += 1
	local myTicket = pending
	task.delay(0.4, function() -- wait for the player to stop typing
		if myTicket ~= pending then return end
		local key = keyword .. "|" .. #assetTypes
		if cache[key] then
			onResult(cache[key])
			return
		end
		local params = CatalogSearchParams.new()
		params.SearchKeyword = keyword
		params.AssetTypes = assetTypes
		local ok, pages = pcall(function()
			return AvatarEditorService:SearchCatalogAsync(params)
		end)
		if ok then
			local items = pages:GetCurrentPage()
			cache[key] = items
			onResult(items)
		else
			warn("Catalog search failed:", pages)
		end
	end)
end
```

## Original server bulk-buy handler

```lua
local MarketplaceService = game:GetService("MarketplaceService")

local MAX_LINES = 20

local function promptOutfitPurchase(player: Player, assetIds: {number})
	local lines = {}
	for i, id in assetIds do
		if i > MAX_LINES then break end
		if typeof(id) == "number" then
			table.insert(lines, { Type = Enum.MarketplaceProductType.AvatarAsset, Id = tostring(id) })
		end
	end
	if #lines > 0 then
		MarketplaceService:PromptBulkPurchase(player, lines, {})
	end
end

MarketplaceService.PromptBulkPurchaseFinished:Connect(function(player, status, results)
	-- Not a trusted signal: re-check ownership before granting anything in-game.
end)
```

The docs say the bulk-purchase finished event is not trusted; verify with `PlayerOwnsAssetAsync` or `PlayerOwnsBundleAsync` before giving in-game rewards. Timed (rental) purchase options must come from item details, never hardcoded durations.

## Credits

- Roblox Creator Docs: *Avatar Editor Service* guide, AvatarEditorService and MarketplaceService references, *Marketplace fees and commissions* (CC BY 4.0, code samples MIT). Our code is original.
- DevForum *Release Notes for 454* (where the save and outfit prompts first appeared).

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Characters Avatars and UGC - Hub]]

**Related notes:** [[Avatar Editor Service]] · [[AvatarEditorService]] · [[Catalog and Try-On Games - Limits Developers Hit in 2026]] · [[Character Customization UI Patterns - Slots, Outfits and Buy Flow]] · [[Selling Avatar Items Inside Your Game - Commissions, Homestore and Creation Tokens]]

<!-- TDOD_GRAPH_END -->

---
title: "ProductLocationRestriction"
description: "Specifies the purchase locations permitted for an avatar item."
api_type: enum
aliases: ["Enum.ProductLocationRestriction"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ProductLocationRestriction"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Specifies the purchase locations permitted for an avatar item.*

## Description

Specifies the purchase locations permitted for an avatar item, as returned in the `AllowedSaleLocations` field of the product info table from [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#GetProductInfo|MarketplaceService:GetProductInfo()]]. The item creator sets the restriction on the Marketplace; it controls whether the item can be sold in-experience and in which experiences. See [[30 Official Roblox Docs/API Reference/Enums/ProductLocationRestriction|Enum.ProductLocationRestriction]] items for each restriction.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `AvatarShop` | 0 | Item is purchasable only in the Marketplace. |
| `AllowedGames` | 1 | Item is purchasable in the Marketplace and experiences owned by the item creator. |
| `AllGames` | 2 | (Default) Item is purchasable in the Marketplace and all experiences. |

---
*Source: [ProductLocationRestriction](https://create.roblox.com/docs/reference/engine/enums/ProductLocationRestriction) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

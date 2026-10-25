---
title: "MarketplaceItemPurchaseStatus"
description: "The status of the item purchase through MarketplaceService."
api_type: enum
aliases: ["Enum.MarketplaceItemPurchaseStatus"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/MarketplaceItemPurchaseStatus"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*The status of the item purchase through MarketplaceService.*

## Description

The status of the item purchase through MarketplaceService.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Success` | 1 | The item is purchased successfully. |
| `SystemError` | 2 | Unable to purchase item due to Roblox system error. |
| `AlreadyOwned` | 3 | Unable to purchase item because user already owns the item. Users can only own one copy of non-limited item. |
| `InsufficientRobux` | 4 | Unable to purchase item because of insufficient Robux. |
| `QuantityLimitExceeded` | 5 | User has reached the max quantity allowed per user set by the creator for limited items. |
| `QuotaExceeded` | 6 | The user has exceeded our [[30 Official Roblox Docs/Marketplace/Marketplace fees and commissions#Rate limits\|purchase request limit]]. |
| `NotForSale` | 7 | Item is not for sale. |
| `NotAvailableForPurchaser` | 8 | This item is restricted to a group of users and the purchaser is not in this group. |
| `PriceMismatch` | 9 | The provided price does not match the item price. Most likely the price changed since displayed to the user. |
| `SoldOut` | 10 | The item is sold out. |
| `PurchaserIsSeller` | 11 | The purchaser is the same user as the seller, for a resale purchase. |
| `InsufficientMembership` | 12 | The user does not have sufficient premium membership to purchase this item. |
| `PlaceInvalid` | 13 | The item is not allowed to be sold in the place. |

---
*Source: [MarketplaceItemPurchaseStatus](https://create.roblox.com/docs/reference/engine/enums/MarketplaceItemPurchaseStatus) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

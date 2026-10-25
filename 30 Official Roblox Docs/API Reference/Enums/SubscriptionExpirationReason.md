---
title: "SubscriptionExpirationReason"
description: "Describes the reason a user's subscription has expired."
api_type: enum
aliases: ["Enum.SubscriptionExpirationReason"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/SubscriptionExpirationReason"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes the reason a user's subscription has expired.*

## Description

[[30 Official Roblox Docs/API Reference/Enums/SubscriptionExpirationReason|Enum.SubscriptionExpirationReason]] describes why a subscription entered the [[30 Official Roblox Docs/API Reference/Enums/SubscriptionState|Expired]] state. It appears under the `ExpirationReason` key in the `ExpirationDetails` table returned by [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#GetUserSubscriptionDetailsAsync|MarketplaceService:GetUserSubscriptionDetailsAsync()]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `ProductInactive` | 0 | The subscription product is inactive. |
| `ProductDeleted` | 1 | The subscription product was deleted. |
| `SubscriberCancelled` | 2 | The subscriber cancelled the subscription. |
| `SubscriberRefunded` | 3 | The subscriber received a refund that ended the subscription. |
| `Lapsed` | 4 | The subscription expired because payment lapsed. |

---
*Source: [SubscriptionExpirationReason](https://create.roblox.com/docs/reference/engine/enums/SubscriptionExpirationReason) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

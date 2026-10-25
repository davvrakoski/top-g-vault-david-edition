---
title: "SubscriptionState"
description: "Describes the current subscription state of a user's in-experience subscription product."
api_type: enum
aliases: ["Enum.SubscriptionState"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/SubscriptionState"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes the current subscription state of a user's in-experience subscription product.*

## Description

The `SubscriptionState` enum describes the current subscription state of a user with respect to a specific in-experience subscription product. It is returned in the `SubscriptionState` key of the table from [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#GetUserSubscriptionDetailsAsync|MarketplaceService:GetUserSubscriptionDetailsAsync()]], which must be called from a server-side [[30 Official Roblox Docs/API Reference/Classes/Script|Script]]. See [[30 Official Roblox Docs/API Reference/Enums/SubscriptionState|Enum.SubscriptionState]] for the lifecycle values (never subscribed, active with or without renewal, renewal payment pending, and expired).

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `NeverSubscribed` | 0 | User has never subscribed to the product. |
| `SubscribedWillRenew` | 1 | Subscription is active and will renew. |
| `SubscribedWillNotRenew` | 2 | Subscription is active and will not renew. |
| `SubscribedRenewalPaymentPending` | 3 | Subscription is active and renewal payment is pending. |
| `Expired` | 4 | Subscription has expired. |

---
*Source: [SubscriptionState](https://create.roblox.com/docs/reference/engine/enums/SubscriptionState) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

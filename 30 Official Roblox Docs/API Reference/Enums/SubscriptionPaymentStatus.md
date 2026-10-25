---
title: "SubscriptionPaymentStatus"
description: "Describes the payment outcome for a single entry in a user's subscription payment history."
api_type: enum
aliases: ["Enum.SubscriptionPaymentStatus"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/SubscriptionPaymentStatus"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes the payment outcome for a single entry in a user's subscription payment history.*

## Description

The `SubscriptionPaymentStatus` enum describes whether a billing cycle for a [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService|MarketplaceService]] subscription was successfully charged or subsequently refunded. It appears as the `subscriptionPaymentStatus` field on each record returned by [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#GetUserSubscriptionPaymentHistoryAsync|MarketplaceService:GetUserSubscriptionPaymentHistoryAsync()]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Paid` | 0 | Payment for the subscription has been received. |
| `Refunded` | 1 | Payment for the subscription has been refunded. |

---
*Source: [SubscriptionPaymentStatus](https://create.roblox.com/docs/reference/engine/enums/SubscriptionPaymentStatus) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

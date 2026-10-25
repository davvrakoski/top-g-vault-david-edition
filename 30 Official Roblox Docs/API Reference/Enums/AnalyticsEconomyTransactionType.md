---
title: "AnalyticsEconomyTransactionType"
description: "Categorizes the context of an in-experience economic transaction for use with `AnalyticsService:LogEconomyEvent()`."
api_type: enum
aliases: ["Enum.AnalyticsEconomyTransactionType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AnalyticsEconomyTransactionType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Categorizes the context of an in-experience economic transaction for use with [[30 Official Roblox Docs/API Reference/Classes/AnalyticsService#LogEconomyEvent|AnalyticsService:LogEconomyEvent()]].*

## Description

This enum provides recommended values for the `transactionType` parameter of [[30 Official Roblox Docs/API Reference/Classes/AnalyticsService#LogEconomyEvent|AnalyticsService:LogEconomyEvent()]]. Because `transactionType` is typed as a string, pass the `Name` property of the enum item (for example, [[30 Official Roblox Docs/API Reference/Enums/AnalyticsEconomyTransactionType|Enum.AnalyticsEconomyTransactionType.IAP.Name]]). Using these standard values enables Roblox-provided analytics charts to break down economy data by transaction context. Custom strings are also accepted; the experience is limited to 20 unique transaction types total.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `IAP` | 0 | Represents a source of currency purchased via Robux, for example in-experience "gold" purchased for Robux. |
| `Shop` | 1 | Purchases within a shop, for example in-experience "coins" used to buy an item within the experience. |
| `Gameplay` | 2 | Currency earned or paid through gameplay, for example in-experience "gold" earned from winning a match. |
| `ContextualPurchase` | 3 | Purchase with direct context to a reward, for example in-experience "gold" used to purchase an extra life. |
| `TimedReward` | 4 | Time-based reward, for example in-experience "gold" rewarded for logging in daily. |
| `Onboarding` | 5 | Transaction related to onboarding, for example in-experience "gold" rewarded for completing the tutorial. |

---
*Source: [AnalyticsEconomyTransactionType](https://create.roblox.com/docs/reference/engine/enums/AnalyticsEconomyTransactionType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

---
title: "CurrencyType"
description: "The CurrencyType Enum is used with `MarketplaceService` to set the currency used."
api_type: enum
aliases: ["Enum.CurrencyType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/CurrencyType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*The CurrencyType Enum is used with [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService|MarketplaceService]] to set the currency used.*

> [!warning] Deprecated
> Tickets have been removed, so this Enum shouldn't need to be used.

## Description

The CurrencyType Enum is used with [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService|MarketplaceService]] to set the currency used. As tickets no longer exist on the Roblox platform, this enum is **ignored** in most API that previously used it, such as [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptPurchase|PromptPurchase]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Default` | 0 | Use the default currency (Robux), equivalent to not specifying a currency. |
| `Robux` | 1 | Use Robux. |
| `Tix` | 2 | Use Tickets. |

---
*Source: [CurrencyType](https://create.roblox.com/docs/reference/engine/enums/CurrencyType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

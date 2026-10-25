---
title: "PurchaseOption"
description: "Specifies the type of purchase option in a bulk purchase prompt."
api_type: enum
aliases: ["Enum.PurchaseOption"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/PurchaseOption"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Specifies the type of purchase option in a bulk purchase prompt.*

## Description

The [[30 Official Roblox Docs/API Reference/Enums/PurchaseOption|Enum.PurchaseOption]] enum specifies the type of purchase option when building the `PurchaseOptions` array for [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptBulkPurchase|MarketplaceService:PromptBulkPurchase()]].

Use `TimedOption` for timed option durations and `Permanent` for standard full-price purchase. Only one entry is allowed in `PurchaseOptions`; providing more than one throws an error.

Do not hardcode duration values when using `TimedOption`. Always retrieve available durations from the backend APIs and pass them through, as they may change at any time.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `TimedOption` | 1 | A timed ownership option. The `Value` field specifies the duration in seconds. |
| `Permanent` | 2 | A permanent ownership purchase option. |

---
*Source: [PurchaseOption](https://create.roblox.com/docs/reference/engine/enums/PurchaseOption) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

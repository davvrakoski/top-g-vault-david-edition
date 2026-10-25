---
title: "ReceiptDecision"
description: "`ReceiptDecision` works with `MarketplaceService` to indicate the acknowledgement of receipts."
api_type: enum
aliases: ["Enum.ReceiptDecision"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ReceiptDecision"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*`ReceiptDecision` works with [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService|MarketplaceService]] to indicate the acknowledgement of receipts.*

## Description

`ReceiptDecision` is the required return type for callbacks registered with [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#BindReceiptHandler|MarketplaceService:BindReceiptHandler()]]. The value you return determines whether the receipt is marked as complete or remains unresolved for future processing.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `NotProcessedYet` | 0 | The receipt has not been processed yet. Returning this value keeps the receipt unresolved so it will be redelivered to the user's handler later, either during their existing session or the next time they join a server if they have disconnected. |
| `Processed` | 1 | The receipt has been processed and all benefits have been granted. The receipt is marked as complete and will not be delivered again. |

---
*Source: [ReceiptDecision](https://create.roblox.com/docs/reference/engine/enums/ReceiptDecision) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

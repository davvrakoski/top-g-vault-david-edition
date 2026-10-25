---
title: "ReceiptType"
description: "`ReceiptType` is used to work with server-sided receipt processing."
api_type: enum
aliases: ["Enum.ReceiptType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ReceiptType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*`ReceiptType` is used to work with server-sided receipt processing.*

## Description

`ReceiptType` works with [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#BindReceiptHandler|MarketplaceService:BindReceiptHandler()]] to indicate the different type of receipts a developer can bind to for processing. When you call [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#BindReceiptHandler|BindReceiptHandler]], you pass a `ReceiptType` to specify which kind of receipt your handler should process.

`DeveloperProduct` is used for developer product purchases and provides a `BindReceiptHandler`-based alternative to the legacy [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#ProcessReceipt|ProcessReceipt]] callback. `RobuxTransferSender` and `RobuxTransferReceiver` are used for Robux transfers, described below.

For Robux transfers initiated with [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptRobuxTransferAsync|PromptRobuxTransferAsync]], two receipts are generated: one for the sender (`RobuxTransferSender`) and one for the receiver (`RobuxTransferReceiver`). You should register handlers for both types to fully process a transfer.

Transfer receipts are delivered to whichever server the user is currently in once the transfer settles (the user does not need to rejoin). If the user is offline when the transfer settles, the receipt is delivered the next time they join a server. See [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#BindReceiptHandler|BindReceiptHandler]] for details.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `DeveloperProduct` | 0 | Used for processing receipts from developer product purchases made with [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptProductPurchase\|PromptProductPurchase]]. The receipt includes `ProductId`, `CurrencyType`, and `CurrencySpent` fields. A handler bound for this type processes developer product receipts in place of the legacy [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#ProcessReceipt\|ProcessReceipt]] callback; receipts with no matching bound handler fall through to `ProcessReceipt`. |
| `RobuxTransferSender` | 1 | Used for processing receipts for the user who initiated a Robux transfer. The receipt's `PlayerId` is the sender's user ID and includes a `TransferRequestId` field. Delivered immediately if the transfer settles synchronously. If receiver approval is required, delivered to the server the sender is currently in once the receiver accepts, or on the sender's next session join if they are offline. |
| `RobuxTransferReceiver` | 2 | Used for processing receipts for the user who received Robux via a transfer. The receipt's `PlayerId` is the receiver's user ID and includes a `TransferRequestId` field. Delivered to the server the receiver is currently in once the transfer settles, or on their next session join if they are offline. |

---
*Source: [ReceiptType](https://create.roblox.com/docs/reference/engine/enums/ReceiptType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

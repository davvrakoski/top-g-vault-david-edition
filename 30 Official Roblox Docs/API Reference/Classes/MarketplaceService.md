---
title: "MarketplaceService"
description: "The service responsible for in-experience transactions."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/MarketplaceService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*The service responsible for in-experience transactions.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

[[30 Official Roblox Docs/API Reference/Classes/MarketplaceService|MarketplaceService]] is responsible for in-experience transactions. The most notable methods are [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptProductPurchase|PromptProductPurchase]] and [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptPurchase|PromptPurchase]], as well as the callback [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#ProcessReceipt|ProcessReceipt]] which must be defined so that developer product transactions do not fail. [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#BindReceiptHandler|BindReceiptHandler]] is a newer alternative that processes developer product receipts (and Robux transfer receipts) through one or more bound handlers instead of the single `ProcessReceipt` callback.

[[30 Official Roblox Docs/API Reference/Classes/MarketplaceService|MarketplaceService]] also has methods that fetch information about [[30 Official Roblox Docs/Production/Monetization/Developer Products|developer products]] ([[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#GetProductInfoAsync|GetProductInfoAsync]] and [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#GetDeveloperProductsAsync|GetDeveloperProductsAsync]]), [[30 Official Roblox Docs/Production/Monetization/Passes|passes]] ([[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#UserOwnsGamePassAsync|UserOwnsGamePassAsync()]]), and other assets ([[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PlayerOwnsAssetAsync|PlayerOwnsAssetAsync]], [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PlayerOwnsBundleAsync|PlayerOwnsBundleAsync]]).

Understanding [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService|MarketplaceService]] is the first step towards learning to [[30 Official Roblox Docs/Production/Monetization/Monetization|monetize]] an experience on Roblox, as well as learning to use [[30 Official Roblox Docs/API Reference/Classes/DataStoreService|DataStoreService]], which is responsible for saving and loading all data related to purchases.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#BindReceiptHandler\|BindReceiptHandler()]] | [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection\|RBXScriptConnection]] | Registers a callback to process receipts of a specific type. |
| [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#GetDeveloperProductsAsync\|GetDeveloperProductsAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Returns a [[30 Official Roblox Docs/API Reference/Classes/Pages\|Pages]] object which contains information for all of the current experience's developer products. |
| [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#GetProductInfo\|GetProductInfo()]] | Dictionary | **Deprecated.** Returns the product information of an asset using its asset ID. |
| [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#GetProductInfoAsync\|GetProductInfoAsync()]] | Dictionary | Returns the product information of an asset using its asset ID. |
| [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#GetRobloxSubscriptionDetailsAsync\|GetRobloxSubscriptionDetailsAsync()]] | Dictionary | Returns the subscription details for the given user for the Roblox Subscription ecosystem. |
| [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#GetSubscriptionProductInfoAsync\|GetSubscriptionProductInfoAsync()]] | Dictionary | Returns the product information of a subscription for the given `subscriptionId`. |
| [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#GetUsersPriceLevelsAsync\|GetUsersPriceLevelsAsync()]] | List<PriceLevelInfo> | Returns the regionalized price levels of users, representing the recommended price for an item in each user's regional market. |
| [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#GetUserSubscriptionDetailsAsync\|GetUserSubscriptionDetailsAsync()]] | Dictionary | Returns a table that contains the details of the user's subscription for a given `subscriptionId`. |
| [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#GetUserSubscriptionPaymentHistoryAsync\|GetUserSubscriptionPaymentHistoryAsync()]] | Array | Returns an [[30 Official Roblox Docs/API Reference/Libraries/table\|Array]] that contains up to one year of the user's subscription payment history for the given `subscriptionId`. |
| [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#GetUserSubscriptionStatusAsync\|GetUserSubscriptionStatusAsync()]] | Dictionary | Returns a [[30 Official Roblox Docs/API Reference/Libraries/table\|table]] that contains the subscription status of the user for the given `subscriptionId`. |
| [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#OpenShop\|OpenShop()]] | () | Opens a personalized in-game Shop for the given player. |
| [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PlayerOwnsAsset\|PlayerOwnsAsset()]] | boolean | **Deprecated.** Returns whether the given user has the given asset. |
| [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PlayerOwnsAssetAsync\|PlayerOwnsAssetAsync()]] | boolean | Returns whether the given user has the given asset. |
| [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PlayerOwnsBundle\|PlayerOwnsBundle()]] | boolean | **Deprecated.** Returns whether the given player owns the given bundle. |
| [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PlayerOwnsBundleAsync\|PlayerOwnsBundleAsync()]] | boolean | Returns whether the given player owns the given bundle. |
| [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptBulkPurchase\|PromptBulkPurchase()]] | () | Prompts a user to purchase multiple avatar items with the given `assetId` or `bundleId`. |
| [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptBundlePurchase\|PromptBundlePurchase()]] | () | Prompts a user to purchase a bundle with the given `bundleId`. |
| [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptCancelSubscription\|PromptCancelSubscription()]] | () | Prompts a user to cancel a subscription for the given `subscriptionId`. |
| [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptGamePassPurchase\|PromptGamePassPurchase()]] | () | Prompts a user to purchase a pass with the given `gamePassId`. |
| [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptPremiumPurchase\|PromptPremiumPurchase()]] | () | **Deprecated.** Prompts a user to purchase Roblox Premium. |
| [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptProductPurchase\|PromptProductPurchase()]] | () | Prompts a user to purchase a developer product with the given `productId`. |
| [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptPurchase\|PromptPurchase()]] | () | Prompts a user to purchase an item with the given `assetId`. Does not work for USD Creator Store purchases. |
| [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptRobloxSubscriptionPurchase\|PromptRobloxSubscriptionPurchase()]] | () | Prompts a user to purchase a Roblox Plus subscription. |
| [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptRobuxTransferAsync\|PromptRobuxTransferAsync()]] | string | Initiates a Robux transfer from the sender to another user. |
| [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptSubscriptionPurchase\|PromptSubscriptionPurchase()]] | () | Prompts a user to purchase a subscription for the given `subscriptionId`. |
| [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#RankProductsAsync\|RankProductsAsync()]] | List<RankedItem> | Takes a list of product IDs and returns a personalized ordered list of those products. |
| [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#RecommendTopProductsAsync\|RecommendTopProductsAsync()]] | List<RankedItem> | - Takes an array of [[30 Official Roblox Docs/API Reference/Enums/InfoType\|Enum.InfoType]] and returns up to 50 items representing the products a user is most likely to engage with and purchase. |
| [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#UserOwnsGamePassAsync\|UserOwnsGamePassAsync()]] | boolean | Returns true if the player with the given [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|UserId]] owns the pass with the given `gamePassId`. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptBulkPurchaseFinished\|PromptBulkPurchaseFinished]] | `player`, `status`, `results` | Fires when a purchase prompt for bulk avatar items is closed. |
| [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptBundlePurchaseFinished\|PromptBundlePurchaseFinished]] | `player`, `bundleId`, `wasPurchased` | Fires when a bundle purchase prompt closes. |
| [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptGamePassPurchaseFinished\|PromptGamePassPurchaseFinished]] | `player`, `gamePassId`, `wasPurchased` | Fires when a purchase prompt for a pass is closed. |
| [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptPremiumPurchaseFinished\|PromptPremiumPurchaseFinished]] |  | Fires when a purchase prompt for Roblox Premium is closed. |
| [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptProductPurchaseFinished\|PromptProductPurchaseFinished]] | `userId`, `productId`, `isPurchased` | Fires when a purchase prompt for a developer product is closed. Do not use this event to process purchases. |
| [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptPurchaseFinished\|PromptPurchaseFinished]] | `player`, `assetId`, `isPurchased` | Fires when a purchase prompt for an affiliate gear sale or other asset is closed. Does **not** fire for developer product or pass prompts. |
| [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptRobloxSubscriptionPurchaseFinished\|PromptRobloxSubscriptionPurchaseFinished]] | `user`, `didTryPurchasing` | Fires when a purchase prompt for Roblox Plus is closed. |
| [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptSubscriptionPurchaseFinished\|PromptSubscriptionPurchaseFinished]] | `user`, `subscriptionId`, `didTryPurchasing` | Fires when a purchase prompt for a subscription is closed. |

### Callbacks

| Callback | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#ProcessReceipt\|ProcessReceipt()]] | [[30 Official Roblox Docs/API Reference/Enums/ProductPurchaseDecision\|ProductPurchaseDecision]] | A callback to process receipts of developer product purchases. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### BindReceiptHandler

```lua
MarketplaceService:BindReceiptHandler(transactionType: ReceiptType, handler: Function, filter: Array?): RBXScriptConnection
```

**Thread safety:** Unsafe · **Capabilities:** Monetization

`BindReceiptHandler` registers a callback to process receipts of a specific [[30 Official Roblox Docs/API Reference/Enums/ReceiptType|Enum.ReceiptType]]. You can use it to handle developer product receipts ([[30 Official Roblox Docs/API Reference/Enums/ReceiptType|Enum.ReceiptType.DeveloperProduct]]) and Robux transfer receipts ([[30 Official Roblox Docs/API Reference/Enums/ReceiptType|Enum.ReceiptType.RobuxTransferSender]] and [[30 Official Roblox Docs/API Reference/Enums/ReceiptType|Enum.ReceiptType.RobuxTransferReceiver]]).

For [[30 Official Roblox Docs/API Reference/Enums/ReceiptType|Enum.ReceiptType.DeveloperProduct]], you can register handlers in two ways:

- **Filtered** — Pass a `filter` array of developer product IDs so the handler only fires for receipts whose `ProductId` is in that array. Use this to route specific products to dedicated handlers.
- **Catch-all** — Omit `filter` so the handler fires for any developer product receipt not already claimed by a filtered handler.

For developer products, `BindReceiptHandler` is an alternative to the legacy [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#ProcessReceipt|ProcessReceipt]] callback. A bound handler takes precedence; if no bound handler matches a developer product receipt, it falls through to `ProcessReceipt`. This lets you adopt `BindReceiptHandler` incrementally without removing an existing `ProcessReceipt` callback.

The `handler` callback receives a receipt info dictionary and must return an [[30 Official Roblox Docs/API Reference/Enums/ReceiptDecision|Enum.ReceiptDecision]] value:

- [[30 Official Roblox Docs/API Reference/Enums/ReceiptDecision|Enum.ReceiptDecision.Processed]] — Indicates the receipt was successfully processed and all benefits have been granted. The receipt is marked as complete.
- [[30 Official Roblox Docs/API Reference/Enums/ReceiptDecision|Enum.ReceiptDecision.NotProcessedYet]] — Indicates the receipt has not been processed yet. The receipt remains unresolved and will be delivered again on the next opportunity.

#### Receipt Info Dictionary

The receipt info dictionary passed to the `handler` contains the following fields:

| Key | Type | Description |
| --- | --- | --- |
| `PurchaseId` | string | A unique identifier for this specific receipt. |
| `PlayerId` | number | The [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|Player.UserId]] of the user associated with this receipt. |
| `PlaceIdWherePurchased` | number | The place ID where the transaction was initiated. |
| `ReceiptType` | [[30 Official Roblox Docs/API Reference/Enums/ReceiptType\|Enum.ReceiptType]] | The type of this receipt. |
| `ProductId` | number | The developer product ID. Only present for [[30 Official Roblox Docs/API Reference/Enums/ReceiptType\|Enum.ReceiptType.DeveloperProduct]] receipts. |
| `CurrencyType` | [[30 Official Roblox Docs/API Reference/Enums/CurrencyType\|Enum.CurrencyType]] | The currency used for the purchase. Only present for [[30 Official Roblox Docs/API Reference/Enums/ReceiptType\|Enum.ReceiptType.DeveloperProduct]] receipts. |
| `CurrencySpent` | number | The amount of Robux involved in the transaction. For [[30 Official Roblox Docs/API Reference/Enums/ReceiptType\|Enum.ReceiptType.DeveloperProduct]] receipts, this is the product's price. For [[30 Official Roblox Docs/API Reference/Enums/ReceiptType\|Enum.ReceiptType.RobuxTransferSender]] receipts, this is the amount sent. For [[30 Official Roblox Docs/API Reference/Enums/ReceiptType\|Enum.ReceiptType.RobuxTransferReceiver]] receipts, this is the amount received. |
| `TransferRequestId` | string | The transfer request ID from [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptRobuxTransferAsync\|MarketplaceService:PromptRobuxTransferAsync()]]. Only present for [[30 Official Roblox Docs/API Reference/Enums/ReceiptType\|Enum.ReceiptType.RobuxTransferSender]] and [[30 Official Roblox Docs/API Reference/Enums/ReceiptType\|Enum.ReceiptType.RobuxTransferReceiver]] receipts. |

#### Receipt Timing

For Robux transfer receipts, `handler` is invoked once the transfer settles. A settled receipt is delivered to whichever server the user is currently in (the user does not need to rejoin).

- [[30 Official Roblox Docs/API Reference/Enums/ReceiptType|Enum.ReceiptType.RobuxTransferReceiver]] — Delivered to the server the receiver is currently in once the transfer settles. If the receiver is offline at that time, delivery happens the next time they join a server.
- [[30 Official Roblox Docs/API Reference/Enums/ReceiptType|Enum.ReceiptType.RobuxTransferSender]] — Delivered immediately if the transfer settles synchronously. If the transfer is gated on receiver approval (for example, parental consent), delivery happens once the receiver accepts, to whichever server the sender is currently in or on their next join if they are offline.

For developer product receipts, `handler` is invoked when the purchase completes while the buyer is on a server. If the handler returns [[30 Official Roblox Docs/API Reference/Enums/ReceiptDecision|Enum.ReceiptDecision.NotProcessedYet]], or the buyer is not reachable, the receipt remains unresolved and is redelivered on a later opportunity or the next time the buyer joins a server.

The user must be on a server for `handler` to fire.

#### Errors

This method throws an error if:

- A handler is already registered for the same [[30 Official Roblox Docs/API Reference/Enums/ReceiptType|Enum.ReceiptType]] and product ID combination.
- A catch-all handler is already registered for the same [[30 Official Roblox Docs/API Reference/Enums/ReceiptType|Enum.ReceiptType]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `transactionType` | [[30 Official Roblox Docs/API Reference/Enums/ReceiptType\|ReceiptType]] |  | The [[30 Official Roblox Docs/API Reference/Enums/ReceiptType\|Enum.ReceiptType]] indicating which kind of receipt to handle. |
| `handler` | Function |  | A callback function that receives a receipt info dictionary and must return an [[30 Official Roblox Docs/API Reference/Enums/ReceiptDecision\|Enum.ReceiptDecision]] value. |
| `filter` | Array? |  | An optional array of product IDs. When provided, the handler only fires for receipts matching those product IDs. Not supported for `RobuxTransferSender` or `RobuxTransferReceiver` receipt types. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection\|RBXScriptConnection]] | A [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection\|RBXScriptConnection]] that can be disconnected to unregister the handler. |

*Code samples for this member (`MarketplaceService-BindReceiptHandler1`, `MarketplaceService-BindReceiptHandler2`) are published on the source page; their code is not part of the open-source repo.*

### GetDeveloperProductsAsync

```lua
MarketplaceService:GetDeveloperProductsAsync(): Instance
```

**Thread safety:** Unsafe · **Capabilities:** AssetRead · **Tags:** `Yields`

Returns a [[30 Official Roblox Docs/API Reference/Classes/Pages|Pages]] object which contains information for all of the current experience's [[30 Official Roblox Docs/Production/Monetization/Developer Products|developer products]].

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | A [[30 Official Roblox Docs/API Reference/Classes/Pages\|Pages]] object whose entries describe the current experience's developer products. |

*Code samples for this member (`MarketplaceService-GetDeveloperProductsAsync1`) are published on the source page; their code is not part of the open-source repo.*

### GetProductInfo

> [!warning] Deprecated
> This method has been superseded by
> `Class.MarketplaceService.GetProductInfoAsync|GetProductInfoAsync()`.

```lua
MarketplaceService:GetProductInfo(assetId: int64, infoType: InfoType = Asset): Dictionary
```

**Thread safety:** Unsafe · **Capabilities:** AssetRead · **Tags:** `Yields`, `Deprecated`

Returns the product information of an asset using its asset ID.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `assetId` | int64 |  | The asset ID of the specified product. |
| `infoType` | [[30 Official Roblox Docs/API Reference/Enums/InfoType\|InfoType]] | `Asset` | An [[30 Official Roblox Docs/API Reference/Enums/InfoType\|Enum.InfoType]] enum value specifying the type of information being retrieved. |

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | A dictionary containing information about the queried item, described in the previous tables. |

*Code samples for this member (`MarketplaceService-GetProductInfo1`) are published on the source page; their code is not part of the open-source repo.*

### GetProductInfoAsync

```lua
MarketplaceService:GetProductInfoAsync(assetId: int64, infoType: InfoType = Asset): Dictionary
```

**Thread safety:** Unsafe · **Capabilities:** AssetRead · **Tags:** `Yields`

This method provides information about an asset, [[30 Official Roblox Docs/Production/Monetization/Developer Products|developer product]], or [[30 Official Roblox Docs/Production/Monetization/Passes|pass]] based on the asset ID and the [[30 Official Roblox Docs/API Reference/Enums/InfoType|Enum.InfoType]]. If an item with the given ID does not exist, this method throws an error.

Information about the queried item is provided in a dictionary with the following keys. Note that not all information is provided or necessarily relevant for the kind of product you're querying.

| Key | Type | Description |
| --- | --- | --- |
| `Name` | string | The name shown on the asset's page. |
| `Description` | string | The description shown on the asset's page; can be `nil` if blank. |
| `PriceInRobux` | number | The cost of purchasing the asset using Robux. |
| `UserBasePriceInRobux` | number | The base price of the asset in Robux before any discounts are applied. |
| `PriceDiscountDetails` | Array | An ordered list of discounts representing the difference between `UserBasePriceInRobux` and `PriceInRobux`. Each entry contains the following keys: |
|  |  | `Type`: The type of discount. `"RobloxPlusSubscription"` indicates that the discount was applied due to the user’s Roblox Plus subscription. |
|  |  | `AmountInRobux`: number — The value of the discount in Robux. |
|  |  | `Percent`: number — The percentage of the discount. |
| `ProductId` | number | The product ID if [[30 Official Roblox Docs/API Reference/Enums/InfoType\|Enum.InfoType]] is `Product`. |
| `ProductType` | string | A string describing what the product is. Not to be confused with [[30 Official Roblox Docs/API Reference/Enums/MarketplaceProductType\|Enum.MarketplaceProductType]]. |
| `Created` | string | Timestamp of when the asset was created, for example `2022-01-02T10:30:45Z`. Formatted using ISO 8601. |
| `Updated` | string | Timestamp of when the asset was last updated by its creator, for example `2022-02-12T11:22:15Z`. Formatted using ISO 8601. |
| `ContentRatingTypeId` | number | Indicates whether the item is marked as 13+ in catalog. |
| `MinimumMembershipLevel` | number | The minimum subscription level necessary to purchase the item. |
| `IsPublicDomain` | boolean | Describes whether the asset can be taken for free. |
| `TargetId` | number | The ID of the product or asset. |

#### Creator Information

| Key | Type | Description |
| --- | --- | --- |
| `Creator` | table | Dictionary table of information describing the creator of the asset, containing the following fields: |
|  |  | `CreatorType`: Either `User` or `Group`. |
|  |  | `CreatorTargetId`: The ID of the creator user or group. |
|  |  | `HasVerifiedBadge`: Boolean of whether the creator has a verified badge. |
|  |  | `Name`: The name/username of the creator. |
|  |  | `Id`: Use `CreatorTargetId` instead. |

#### Asset Information

| Key | Type | Description |
| --- | --- | --- |
| `AssetId` | number | The asset ID if [[30 Official Roblox Docs/API Reference/Enums/InfoType\|Enum.InfoType]] is `Asset`. |
| `AssetTypeId` | number | The type of asset. See [[30 Official Roblox Docs/API Reference/Enums/AssetType\|Enum.AssetType]] for the asset type ID numbers. |
| `IconImageAssetId` | number | The asset ID of the product's icon, or `0` if there isn't one. |
| `IsForSale` | boolean | Describes whether the asset is purchasable. |
| `IsLimited` | boolean | Describes whether the asset is a Roblox Limited that is no longer (if ever) sold. |
| `IsLimitedUnique` | boolean | Describes whether the asset is a unique Roblox Limited ("Limited U") item that only has a fixed number sold. |
| `IsNew` | boolean | Describes whether the asset is marked as "new" in the catalog. |
| `Remaining` | number | The remaining number of times a limited unique item may be sold. |
| `Sales` | number | The number of times the asset has been sold. |

#### Collectibles Information

| Key | Type | Description |
| --- | --- | --- |
| `CollectibleItemId` | string | The unique item ID of the collectible. |
| `CollectibleProductId` | string | The unique product ID of the collectible. |
| `CollectiblesItemDetails` | table | Dictionary table of information describing the collectible, containing the following fields: |
|  |  | `CollectibleLowestAvailableResaleItemInstanceId`: The unique item instance ID of the lowest available resale for the collectible. |
|  |  | `CollectibleLowestAvailableResaleProductId`: The unique product ID of the lowest available resale for the collectible. |
|  |  | `CollectibleLowestResalePrice`: The lowest resale price for the collectible in Robux. |
|  |  | `IsForSale`: Boolean of whether the collectible is available for sale (not resale). |
|  |  | `IsLimited`: Boolean of whether or not the collectible is limited. |
|  |  | `TotalQuantity`: The total quantity of the collectible available for purchase (not resale). |

#### Sale Location Settings

| Key | Type | Description |
| --- | --- | --- |
| `CanBeSoldInThisGame` | boolean | Describes whether the asset is purchasable in the current experience. |
| `SaleLocation` | table | Dictionary table of information describing where the item can be sold, containing the following fields: |
|  |  | `SaleLocationType`: The type of sale location setting. See [[30 Official Roblox Docs/API Reference/Enums/ProductLocationRestriction\|Enum.ProductLocationRestriction]] for the sale location setting ID numbers. |
|  |  | `UniverseIds`: Array table of universes in which the item can be sold (not currently implemented). |

#### Timed Options

| Key | Type | Description |
| --- | --- | --- |
| `TimedOptions` | array | Optional. An array of available timed options with durations and prices. Only present for assets that support timed ownership. Do not hardcode duration values; always retrieve them from this API as they may change. Each entry contains: |
|  |  | `Duration`: number — The duration in seconds (e.g. 259200 for 3 days, 604800 for 7 days). |
|  |  | `Price`: number — The price in Robux for this duration. |

#### Batching behavior

This method is **Transparent Batching capable**. If you spawn multiple calls concurrently using `task.spawn`, the engine automatically combines them into fewer HTTP requests behind the scenes. This is faster and helps you avoid rate limits. See [[30 Official Roblox Docs/Scripting/Transparent batching|Transparent Batching]] for details and a code example.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `assetId` | int64 |  | The asset ID of the specified product. |
| `infoType` | [[30 Official Roblox Docs/API Reference/Enums/InfoType\|InfoType]] | `Asset` | An [[30 Official Roblox Docs/API Reference/Enums/InfoType\|Enum.InfoType]] enum value specifying the type of information being retrieved. |

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | A dictionary containing information about the queried item, described in the previous tables. |

*Code samples for this member (`MarketplaceService-GetProductInfo1`, `MarketplaceService-GetProductInfo2`, `MarketplaceService-GetProductInfo-TimedOptions`, `MarketplaceService-GetProductInfo-TransparentBatching`) are published on the source page; their code is not part of the open-source repo.*

### GetRobloxSubscriptionDetailsAsync

```lua
MarketplaceService:GetRobloxSubscriptionDetailsAsync(user: Player): Dictionary
```

**Thread safety:** Unsafe · **Capabilities:** Monetization · **Tags:** `Yields`

This method is a streamlined endpoint to check for a single, platform-wide Roblox subscription product. By providing `StartTime` (conditionally) and `IsOriginExperience` to reward long-term loyalists without compromising user data across the platform.

The returned dictionary contains the following fields:

| Field | Type | Description |
| --- | --- | --- |
| `IsSubscribed` | bool | Returns true if the user has an active Roblox Subscription membership. |
| `IsOriginExperience` | bool | Returns true if the user originally subscribed to Roblox Subscription while inside the current Experience (Universe). |
| `StartTime` | DateTime? | A [[30 Official Roblox Docs/API Reference/Datatypes/DateTime\|DateTime]] object representing the time when the user’s subscription period first began. Note: For privacy reasons, this field is only returned if `IsOriginExperience` is true. If the user subscribed in a different experience or on the web, this field will be nil. |

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `user` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The user regarding whom to check the subscription status. |

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | A dictionary containing subscription details such as `IsSubscribed`, `IsOriginExperience`, and optionally `StartTime`. |

*Code samples for this member (`MarketplaceService-GetRobloxSubscriptionDetailsAsync1`) are published on the source page; their code is not part of the open-source repo.*

### GetSubscriptionProductInfoAsync

```lua
MarketplaceService:GetSubscriptionProductInfoAsync(subscriptionId: string): Dictionary
```

**Thread safety:** Unsafe · **Capabilities:** AssetRead · **Tags:** `Yields`

Returns the product information of a subscription for the given `subscriptionId`. Because it returns a localized price, you can only call this method from a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] with [[30 Official Roblox Docs/API Reference/Enums/RunContext|Enum.RunContext.Client]].

| Key | Type | Description |
| --- | --- | --- |
| `Name` | string | The name of the subscription product. |
| `Description` | string | The description of the subscription product. |
| `IconImageAssetId` | number | The asset ID of the subscription product icon. |
| `SubscriptionPeriod` | [[30 Official Roblox Docs/API Reference/Enums/SubscriptionPeriod\|Enum.SubscriptionPeriod]] | The duration of the subscription (for example, `Month`, `Year`, etc.). |
| `DisplayPrice` | string | Localized price with the appropriate currency symbol for display (for example, `$4.99`). For users in unsupported countries, `DisplayPrice` returns a string without specific price information. |
| `DisplaySubscriptionPeriod` | string | Localized subscription period text for display (for example, `/month`). Can be used together with `DisplayPrice`. |
| `SubscriptionProviderName` | string | Name of the subscription benefit provider (for example, the name of the associated experience). |
| `IsForSale` | boolean | True if the subscription product is available for sale. |
| `PriceTier` | number | A number that can be used to compare the price of different subscription products. This is not the actual price of the subscription (for example, 499). |
| `PriceInRobux` | number | The equivalent cost of the subscription in Robux. Returns 0 if the subscription product is not available to be purchased in Robux. |

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `subscriptionId` | string |  | The ID of the subscription to check. |

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | A dictionary containing the subscription product information described in the following table. |

### GetUsersPriceLevelsAsync

```lua
MarketplaceService:GetUsersPriceLevelsAsync(userIds: Array): List<PriceLevelInfo>
```

**Thread safety:** Unsafe · **Capabilities:** Monetization · **Tags:** `Yields`

Returns the regionalized price levels of users, representing the recommended price for an item in each user's regional market. For example, a price level of 100 means that the suggested price for that user (based on their region and purchasing power) is 100 Robux.

See [[30 Official Roblox Docs/Production/Monetization/Regional pricing#Protect your trades and gifts|Protect your trades and gifts]] for more information.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userIds` | Array |  | An array of user IDs. |

**Returns**

| Type | Description |
| --- | --- |
| List<PriceLevelInfo> | Returns an array of `PriceLevelInfo` objects with a dictionary where the keys are user IDs (strings) and their values are the corresponding price levels (integers between 1 and 1000). |

*Code samples for this member (`MarketplaceService-GetUsersPriceLevelAsync`) are published on the source page; their code is not part of the open-source repo.*

### GetUserSubscriptionDetailsAsync

```lua
MarketplaceService:GetUserSubscriptionDetailsAsync(user: Player, subscriptionId: string): Dictionary
```

**Thread safety:** Unsafe · **Capabilities:** Monetization · **Tags:** `Yields`

Returns a dictionary table containing the details of the user's subscription for the given `subscriptionId`. The table contains the following keys:

| Key | Type | Description |
| --- | --- | --- |
| `SubscriptionState` | [[30 Official Roblox Docs/API Reference/Enums/SubscriptionState\|Enum.SubscriptionState]] | Current state of this particular subscription. |
| `NextRenewTime` | [[30 Official Roblox Docs/API Reference/Datatypes/DateTime\|DateTime]] | Renewal time for this current subscription. May be in the past if the subscription is in [[30 Official Roblox Docs/API Reference/Enums/SubscriptionState\|SubscribedRenewalPaymentPending]] state. This field is will be `nil` if the subscription will not renew, is [[30 Official Roblox Docs/API Reference/Enums/SubscriptionState\|Expired]], or the user never subscribed. |
| `ExpireTime` | [[30 Official Roblox Docs/API Reference/Datatypes/DateTime\|DateTime]] | When this subscription expires. This field will be `nil` if the subscription is not cancelled or the user never subscribed. |
| `ExpirationDetails` | [[30 Official Roblox Docs/API Reference/Libraries/table\|table]] | Table containing the details of the subscription expiration. This field will be `nil` if the subscription is not in the [[30 Official Roblox Docs/API Reference/Enums/SubscriptionState\|Expired]] state. If populated, the table contains a `ExpirationReason` key of type [[30 Official Roblox Docs/API Reference/Enums/SubscriptionExpirationReason\|Enum.SubscriptionExpirationReason]] describing why the subscription is expired. |

Note that this method can only be called from a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] with [[30 Official Roblox Docs/API Reference/Classes/BaseScript#RunContext|RunContext]] of [[30 Official Roblox Docs/API Reference/Enums/RunContext|Server]]. If you only need to determine the `IsSubscribed` status of a user, it's recommended to use [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#GetUserSubscriptionStatusAsync|GetUserSubscriptionStatusAsync]] as it is faster and more efficient for that particular purpose.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `user` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] object whose subscription details you want to check. |
| `subscriptionId` | string |  | The ID of the subscription to check. |

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | A dictionary containing the user's subscription details described in the following table. |

### GetUserSubscriptionPaymentHistoryAsync

```lua
MarketplaceService:GetUserSubscriptionPaymentHistoryAsync(user: Player, subscriptionId: string): Array
```

**Thread safety:** Unsafe · **Capabilities:** Monetization · **Tags:** `Yields`

Returns an [[30 Official Roblox Docs/API Reference/Libraries/table|Array]] that contains up to one year of the user's subscription payment history for the given `subscriptionId`, sorted from the most recent status to the least recent. You can only call this method from a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] with [[30 Official Roblox Docs/API Reference/Enums/RunContext|Enum.RunContext.Server]].

Each entry in the payment history [[30 Official Roblox Docs/API Reference/Libraries/table|Array]] contains the following keys:

| Key | Type | Description |
| --- | --- | --- |
| `CycleStartTime` | [[30 Official Roblox Docs/API Reference/Datatypes/DateTime\|DateTime]] | [[30 Official Roblox Docs/API Reference/Datatypes/DateTime\|DateTime]] at the start of this particular subscription period. |
| `CycleEndTime` | [[30 Official Roblox Docs/API Reference/Datatypes/DateTime\|DateTime]] | [[30 Official Roblox Docs/API Reference/Datatypes/DateTime\|DateTime]] at the end of this particular subscription period. |
| `PaymentStatus` | [[30 Official Roblox Docs/API Reference/Enums/SubscriptionPaymentStatus\|Enum.SubscriptionPaymentStatus]] | [[30 Official Roblox Docs/API Reference/Enums/SubscriptionPaymentStatus\|Enum.SubscriptionPaymentStatus.Paid]] if the user paid for this particular subscription period. [[30 Official Roblox Docs/API Reference/Enums/SubscriptionPaymentStatus\|Enum.SubscriptionPaymentStatus.Refunded]] if the user refunded this particular subscription period. |

#### Payment History Length

Only creators affiliated with the subscription product can access up to **one year** worth of the user's subscription payment history. Non-associated creators can only get the user's **current** subscription payment status or an empty [[30 Official Roblox Docs/API Reference/Libraries/table|Array]] if the user has no active subscription.

#### Grace Period

Subscription renewal payments can have some processing time. Payment history doesn't return a table for this period. However, in order to preserve a user's subscription experience during the processing period, [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#GetUserSubscriptionStatusAsync|GetUserSubscriptionStatusAsync]] returns `IsSubscribed: true` for the given user. Don't grant durable items or currency type subscription benefits to the user until after payment has been confirmed for the current cycle.

For example, on August 31, 2023, User A's Subscription B is up for renewal. On September 1, 2023, the payment has yet to be processed. If you call [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#GetUserSubscriptionPaymentHistoryAsync|GetUserSubscriptionPaymentHistoryAsync]] on September 1, 2023 on User A for Subscription B, the first entry of the return value is:

| Key | Value |
| --- | --- |
| `CycleStartTime` | ... |
| `CycleEndTime` | August 31, 2023 |
| `PaymentStatus` | [[30 Official Roblox Docs/API Reference/Enums/SubscriptionPaymentStatus\|Enum.SubscriptionPaymentStatus.Paid]] |

Note that since the user is within the grace period, the cycle they have yet to pay for (September 1, 2023) does not appear in the return value at all. This field only populates after the payment has been received and processed.

At the same time, [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#GetUserSubscriptionStatusAsync|GetUserSubscriptionStatusAsync]] returns the following result until the renewal payment process fails or the user cancels:

| Key | Return |
| --- | --- |
| `IsSubscribed` | True |
| `IsRenewing` | True |

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `user` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] whose subscription payment history you want to retrieve. |
| `subscriptionId` | string |  | The ID of the subscription whose payment history you want to retrieve. |

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of payment-history entries, ordered from most recent to least recent, as described in the following table. |

*Code samples for this member (`MarketplaceService-GetUserSubscriptionPaymentHistoryAsync1`) are published on the source page; their code is not part of the open-source repo.*

### GetUserSubscriptionStatusAsync

```lua
MarketplaceService:GetUserSubscriptionStatusAsync(user: Player, subscriptionId: string): Dictionary
```

**Thread safety:** Unsafe · **Capabilities:** Monetization · **Tags:** `Yields`

Returns a [[30 Official Roblox Docs/API Reference/Libraries/table|table]] that contains the subscription status of the user for the given `subscriptionId`. The table contains the following keys:

| Key | Type | Description |
| --- | --- | --- |
| `IsSubscribed` | boolean | True if the user's subscription is active. |
| `IsRenewing` | boolean | True if the user is set to renew this subscription after the current subscription period ends. |

Note that `IsSubscribed` will be `true` only when a user has purchased the subscription and the payment has been successfully processed. If the payment for a user's initial subscription purchase is still processing or has failed, `IsSubscribed` returns `false`. To understand when a user's subscription status has changed, see the [[30 Official Roblox Docs/API Reference/Classes/Players#UserSubscriptionStatusChanged|Players.UserSubscriptionStatusChanged]] event.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `user` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] object whose subscription status you want to check. |
| `subscriptionId` | string |  | The ID of the subscription to check for. |

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | A dictionary containing the user's subscription status described in the following table. |

*Code samples for this member (`MarketplaceService-GetUserSubscriptionStatusAsync1`) are published on the source page; their code is not part of the open-source repo.*

### OpenShop

```lua
MarketplaceService:OpenShop(player: Player): ()
```

**Thread safety:** Unsafe · **Capabilities:** PromptExternalPurchase

Opens an [[30 Official Roblox Docs/Production/Monetization/Shop|in-game Shop]] as an overlay window for the given [[30 Official Roblox Docs/API Reference/Classes/Player|Player]]. Shop displays a personalized list of the experience's [[30 Official Roblox Docs/Production/Monetization/Passes|passes]] and [[30 Official Roblox Docs/Production/Monetization/Developer Products|developer products]] ranked for the user.

A default Shop is generated automatically for every game and requires no additional developer setup. You can customize which items appear in the shop from Creator Hub.

This method can be called from either a server [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] or a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]]. When called from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]], `player` must match the local player.

You can call this method in response to any user action, such as a button click, the player reaching a specific location, or joining the experience.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] for whom to open the shop. If called from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript\|LocalScript]], this must be the local player. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`MarketplaceService-OpenShop`) are published on the source page; their code is not part of the open-source repo.*

### PlayerOwnsAsset

> [!warning] Deprecated
> This method has been superseded by
> `Class.MarketplaceService:PlayerOwnsAssetAsync()|PlayerOwnsAssetAsync()`.

```lua
MarketplaceService:PlayerOwnsAsset(player: Instance, assetId: int64): boolean
```

**Thread safety:** Unsafe · **Capabilities:** AssetRead · **Tags:** `Yields`, `Deprecated`

Returns whether the given user has the given asset.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] whose inventory is tested for ownership of the given asset. |
| `assetId` | int64 |  | The asset ID for which the given player's inventory is tested. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Indicates whether the given player's inventory contains the given asset. |

### PlayerOwnsAssetAsync

```lua
MarketplaceService:PlayerOwnsAssetAsync(player: Instance, assetId: int64): boolean
```

**Thread safety:** Unsafe · **Capabilities:** AssetRead · **Tags:** `Yields`

Returns whether the inventory of a specific user contains an asset, based on the asset ID. This method throws an error if the query fails, so you should wrap calls to this method in `pcall()`.

- This method should **not** be used for [[30 Official Roblox Docs/Production/Monetization/Passes|passes]] since they use a separate ID system. Legacy passes that still depend on an asset ID should use [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#UserOwnsGamePassAsync|UserOwnsGamePassAsync()]] instead of this method.
- This method cannot be used to check for [[30 Official Roblox Docs/Production/Monetization/Developer Products|developer products]] since they can be purchased multiple times but not owned themselves. Instead, use a [[30 Official Roblox Docs/Cloud Services/Data Stores/Data stores|data store]] to save when a user buys a developer product.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] whose inventory is tested for ownership of the given asset. |
| `assetId` | int64 |  | The asset ID for which the given player's inventory is tested. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Indicates whether the given player's inventory contains the given asset. |

*Code samples for this member (`MarketplaceService-PlayerOwnsAsset1`) are published on the source page; their code is not part of the open-source repo.*

### PlayerOwnsBundle

> [!warning] Deprecated
> This method has been superseded by
> `Class.MarketplaceService:PlayerOwnsBundleAsync()|PlayerOwnsBundleAsync()`.

```lua
MarketplaceService:PlayerOwnsBundle(player: Player, bundleId: int64): boolean
```

**Thread safety:** Unsafe · **Capabilities:** AssetRead · **Tags:** `Yields`, `Deprecated`

Returns whether the given player owns the given bundle.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] whose inventory is tested for ownership of the given bundle. |
| `bundleId` | int64 |  | The bundle ID for which the given player's inventory is tested. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Indicates whether the given player's inventory contains the given bundle. |

### PlayerOwnsBundleAsync

```lua
MarketplaceService:PlayerOwnsBundleAsync(player: Player, bundleId: int64): boolean
```

**Thread safety:** Unsafe · **Capabilities:** AssetRead · **Tags:** `Yields`

Returns whether the inventory of a specific user contains a bundle, based on the bundle ID. This method throws an error if the query fails, so you should wrap calls to this method in `pcall()`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] whose inventory is tested for ownership of the given bundle. |
| `bundleId` | int64 |  | The bundle ID for which the given player's inventory is tested. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Indicates whether the given player's inventory contains the given bundle. |

*Code samples for this member (`MarketplaceService-PlayerOwnsBundle1`) are published on the source page; their code is not part of the open-source repo.*

### PromptBulkPurchase

```lua
MarketplaceService:PromptBulkPurchase(player: Player, lineItems: Array, options: Dictionary): ()
```

**Thread safety:** Unsafe · **Capabilities:** PromptExternalPurchase

Prompts a user to purchase multiple avatar items with the given `assetId` or `bundleId`. Does not work with non-avatar items.

`PromptBulkPurchase` only allows prompting from server scripts.

For limited items, original copies are prompted until they run out, regardless of the price. Once original copies are out, resale copies are prompted.

A maximum of 20 items can be added to a single bulk purchase prompt.

#### PurchaseOptions

Each line item can optionally include a `PurchaseOptions` array to control which purchase option appears in the prompt. If omitted, the user is prompted for a permanent purchase only (default behavior).

`PurchaseOptions` currently supports only one entry. If more than one option is provided, the API throws an error.

Each entry in `PurchaseOptions` contains:

| Key | Type | Description |
| --- | --- | --- |
| `Type` | Enum | [[30 Official Roblox Docs/API Reference/Enums/PurchaseOption\|Enum.PurchaseOption.TimedOption]] for a timed option, or [[30 Official Roblox Docs/API Reference/Enums/PurchaseOption\|Enum.PurchaseOption.Permanent]] for standard purchase. |
| `Value` | number | Required for `TimedOption`. The duration in seconds. |

**Do not hardcode duration values.** Available durations and prices are determined by the backend and may change at any time. Always retrieve them from one of the following APIs and pass the values through to `PurchaseOptions`:

- [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#GetProductInfoAsync|MarketplaceService:GetProductInfoAsync()]]
- [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetItemDetailsAsync|AvatarEditorService:GetItemDetailsAsync()]]
- [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetBatchItemDetailsAsync|AvatarEditorService:GetBatchItemDetailsAsync()]]
- [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#SearchCatalogAsync|AvatarEditorService:SearchCatalogAsync()]]

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The user to prompt to purchase items. |
| `lineItems` | Array |  | An array of avatar items to be included in the bulk purchase.<br><br>Each line item contains the following structure:<br><br>`{`<br>`  Type: MarketplaceProductType,`<br>`  Id: string,`<br>`  PurchaseOptions: { {Type: PurchaseOption, Value: number?} }?`<br>`}`<br><br>Each line item contains the following pairs:<br><br>- `Type`: The corresponding [[30 Official Roblox Docs/API Reference/Enums/MarketplaceProductType\|Enum.MarketplaceProductType]] (Enum). - `Id`: The ID of the asset or bundle. - `PurchaseOptions`: Optional. An array containing a single purchase option to display in the prompt. If omitted, the permanent purchase is prompted. See the PurchaseOptions section below for details. |
| `options` | Dictionary |  | Not available at this time. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Prompt-Bulk-Purchase-Local`, `Prompt-Bulk-Purchase-Server`, `MarketplaceService-PromptBulkPurchase-TimedOptions`) are published on the source page; their code is not part of the open-source repo.*

### PromptBundlePurchase

```lua
MarketplaceService:PromptBundlePurchase(player: Instance, bundleId: int64): ()
```

**Thread safety:** Unsafe · **Capabilities:** PromptExternalPurchase

Prompts a user to purchase a bundle with the given `bundleId`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] to prompt. |
| `bundleId` | int64 |  | The ID of the bundle to purchase. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### PromptCancelSubscription

```lua
MarketplaceService:PromptCancelSubscription(user: Player, subscriptionId: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** PromptExternalPurchase

Prompts a user to cancel a subscription for the given `subscriptionId`. Once the user successfully cancels the subscription, the [[30 Official Roblox Docs/API Reference/Classes/Players#UserSubscriptionStatusChanged|Players.UserSubscriptionStatusChanged]] event fires.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `user` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] to prompt. |
| `subscriptionId` | string |  | The ID of the subscription to cancel. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### PromptGamePassPurchase

```lua
MarketplaceService:PromptGamePassPurchase(player: Instance, gamePassId: int64): ()
```

**Thread safety:** Unsafe · **Capabilities:** PromptExternalPurchase

Prompts a user to purchase a [[30 Official Roblox Docs/Production/Monetization/Passes|pass]] with the given `gamePassId`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] to prompt. |
| `gamePassId` | int64 |  | The pass ID to purchase. This is the `TargetId` returned by [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#GetProductInfo\|GetProductInfo()]] when [[30 Official Roblox Docs/API Reference/Enums/InfoType\|Enum.InfoType]] is `GamePass`. It is not the pass's asset ID and not its `ProductId`. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### PromptPremiumPurchase

> [!warning] Deprecated
> This method has been superseded by
> `Class.MarketplaceService:PromptRobloxSubscriptionPurchase()|PromptRobloxSubscriptionPurchase()`.

```lua
MarketplaceService:PromptPremiumPurchase(player: Instance): ()
```

**Thread safety:** Unsafe · **Capabilities:** PromptExternalPurchase · **Tags:** `Deprecated`

Prompts a user to purchase [Roblox Premium](https://www.roblox.com/premium/membership). To learn more about Premium and about incorporating Premium incentives into your experience, see [[30 Official Roblox Docs/Production/Monetization/Engagement-based payouts|Engagement-based payouts]].

#### See Also

- [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptPremiumPurchaseFinished|MarketplaceService.PromptPremiumPurchaseFinished]] which fires when the Premium purchase UI closes.
- [[30 Official Roblox Docs/API Reference/Classes/Players#PlayerMembershipChanged|Players.PlayerMembershipChanged]] which fires when the server recognizes that a user's membership has changed.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The user being prompted to purchase Premium. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`prompt-premium-upsell`) are published on the source page; their code is not part of the open-source repo.*

### PromptProductPurchase

```lua
MarketplaceService:PromptProductPurchase(player: Instance, productId: int64, equipIfPurchased: boolean = True, currencyType: CurrencyType = Default): ()
```

**Thread safety:** Unsafe · **Capabilities:** PromptExternalPurchase

Prompts a user to purchase a [[30 Official Roblox Docs/Production/Monetization/Developer Products|developer product]] with the given `productId`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] to prompt. |
| `productId` | int64 |  | The ID of the developer product to purchase. |
| `equipIfPurchased` | boolean | `True` | Ignored. |
| `currencyType` | [[30 Official Roblox Docs/API Reference/Enums/CurrencyType\|CurrencyType]] | `Default` | Ignored. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`MarketplaceService-PromptProductPurchase1`) are published on the source page; their code is not part of the open-source repo.*

### PromptPurchase

```lua
MarketplaceService:PromptPurchase(player: Instance, assetId: int64, equipIfPurchased: boolean = True, currencyType: CurrencyType = Default): ()
```

**Thread safety:** Unsafe · **Capabilities:** PromptExternalPurchase

Prompts a user to purchase an item with the given `assetId`.

- This does not work for [[30 Official Roblox Docs/Production/Creator Store|USD Creator Store]] purchases.
- If the item has the [[30 Official Roblox Docs/Marketplace/Publish to Marketplace#Sale location|Sale Location]] set as `Experience By Place ID (API Only)`, you must call [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptPurchase|MarketplaceService:PromptPurchase]] from a server script.
- If prompting a purchase of a [[30 Official Roblox Docs/Marketplace/Marketplace fees and commissions#Limiteds|limited]] item:
  - (Recommended) Server requests prompt original copies until they run out, regardless of the price. Once original copies run out, resale copies are prompted.
  - Client requests prompt from the lowest resale price even if original copies are available.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] to prompt. |
| `assetId` | int64 |  | The ID of the asset to purchase. |
| `equipIfPurchased` | boolean | `True` | Ignored. |
| `currencyType` | [[30 Official Roblox Docs/API Reference/Enums/CurrencyType\|CurrencyType]] | `Default` | Ignored. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`MarketplaceService-PromptPurchase1`, `market`) are published on the source page; their code is not part of the open-source repo.*

### PromptRobloxSubscriptionPurchase

```lua
MarketplaceService:PromptRobloxSubscriptionPurchase(user: Player): ()
```

**Thread safety:** Unsafe · **Capabilities:** PromptExternalPurchase

Prompts a user to purchase a Roblox Plus subscription. When the user successfully subscribes, any experience-defined rewards for the upsell are granted automatically through the engine API.

#### See Also

- [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptRobloxSubscriptionPurchaseFinished|MarketplaceService.PromptRobloxSubscriptionPurchaseFinished]] which fires when the Roblox Plus purchase UI closes.
- [[30 Official Roblox Docs/API Reference/Classes/Player#HasRobloxSubscription|Player.HasRobloxSubscription]] which can be observed via [[30 Official Roblox Docs/API Reference/Classes/Object#GetPropertyChangedSignal|Instance:GetPropertyChangedSignal()]] to detect when a user's subscription status changes.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `user` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] to be prompted to purchase Roblox Plus. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`MarketplaceService-PromptRobloxSubscriptionPurchase`) are published on the source page; their code is not part of the open-source repo.*

### PromptRobuxTransferAsync

```lua
MarketplaceService:PromptRobuxTransferAsync(sender: Player, receiverUserId: int64, amount: int64): string
```

**Thread safety:** Unsafe · **Capabilities:** PromptExternalPurchase · **Tags:** `Yields`

`PromptRobuxTransferAsync` initiates a Robux transfer from the `sender` to the user specified by `receiverUserId`. This is a server-only method and must be called from a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] with `RunContext` set to `Server`.

After a successful transfer, both the sender and receiver will have receipts delivered to their respective [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#BindReceiptHandler|BindReceiptHandler]] callbacks:

- The sender's receipt has [[30 Official Roblox Docs/API Reference/Enums/ReceiptType|Enum.ReceiptType.RobuxTransferSender]].
- The receiver's receipt has [[30 Official Roblox Docs/API Reference/Enums/ReceiptType|Enum.ReceiptType.RobuxTransferReceiver]].

Both receipts include a `TransferRequestId` field matching the `transferRequestId` returned by this method, which you can use for logging or to correlate sender and receiver receipts.

#### Receipt Timing

Both receipts are delivered to whichever server the corresponding user is currently in once the transfer settles (neither side needs to rejoin). If a transfer is gated on receiver approval, for example parental consent for the receiver's account, it does not settle until approval lands; receipts are delivered after that point.

- **Receiver receipt** is delivered to the server the receiver is currently in once the transfer settles, or on their next session join if they are offline.
- **Sender receipt** is delivered immediately if the transfer settles synchronously. If approval is required, it is delivered to the server the sender is currently in once the receiver accepts, or on the sender's next session join if they are offline.

#### Errors

This method throws an error if:

- The `sender` is not a valid [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] instance.
- `receiverUserId` is not a positive integer.
- `amount` is not a positive integer.
- The method is called from the client instead of the server.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `sender` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] initiating the transfer. Must be a valid player currently in the server. |
| `receiverUserId` | int64 |  | The [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|UserId]] of the user who will receive the Robux. |
| `amount` | int64 |  | The amount of Robux to transfer. Must be a positive integer. |

**Returns**

| Type | Description |
| --- | --- |
| string | A string `transferRequestId` that uniquely identifies this transfer request. Use this ID to correlate with receipts delivered through [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#BindReceiptHandler\|BindReceiptHandler]]. |

*Code samples for this member (`MarketplaceService-PromptRobuxTransferAsync1`) are published on the source page; their code is not part of the open-source repo.*

### PromptSubscriptionPurchase

```lua
MarketplaceService:PromptSubscriptionPurchase(user: Player, subscriptionId: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** PromptExternalPurchase

Prompts a user to purchase a subscription for the given `subscriptionId`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `user` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] object to be prompted to subscribe. |
| `subscriptionId` | string |  | The ID of the subscription to subscribe to. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### RankProductsAsync

```lua
MarketplaceService:RankProductsAsync(productIdentifiers: Array): List<RankedItem>
```

**Thread safety:** Unsafe · **Tags:** `Yields`

Takes a list of product IDs and returns a personalized ordered list of those products.

This API has a client-side throttling limit of 10 requests per minute. If you exceed this limit, wait 60 seconds and make the request again.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `productIdentifiers` | Array |  | An array of objects identifying the products you want to rank. This array can include up to 50 items.<br><br>Each `ProductIdentifier` has:<br><br>- [[30 Official Roblox Docs/API Reference/Enums/InfoType\|Enum.InfoType]]: Enum.InfoType - Must be either [[30 Official Roblox Docs/API Reference/Enums/InfoType\|Enum.InfoType.GamePass]] or [[30 Official Roblox Docs/API Reference/Enums/InfoType\|Enum.InfoType.Product]]. - `Id`: number - The ID of the game pass or developer product.<br><br>`local ProductIdentifier = {`<br>`	InfoType = Enum.InfoType.GamePass,`<br>`	Id = 123456`<br>`}` |

**Returns**

| Type | Description |
| --- | --- |
| List<RankedItem> | The array of ranked items in a personalized order for the current user.<br><br>Each array has:<br><br>- `ProductIdentifier`: The corresponding ID from the input array. - `ProductInfo`: The standard product info dictionary returned by [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#GetProductInfoAsync\|GetProductInfoAsync]]. |

*Code samples for this member (`MarketplaceService-RankProductsSample`) are published on the source page; their code is not part of the open-source repo.*

### RecommendTopProductsAsync

```lua
MarketplaceService:RecommendTopProductsAsync(infoTypes: Array): List<RankedItem>
```

**Thread safety:** Unsafe · **Tags:** `Yields`

Takes an array of [[30 Official Roblox Docs/API Reference/Enums/InfoType|Enum.InfoType]] and returns up to 50 items representing the products a user is most likely to engage with and purchase. If no recommendations can be determined, the method returns an empty list.

This API has a client-side throttling limit of 5 requests per minute. If you exceed this limit, wait 60 seconds and make the request again.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `infoTypes` | Array |  | An array of [[30 Official Roblox Docs/API Reference/Enums/InfoType\|Enum.InfoType]] values specifying the types of product to retrieve recommendations for.<br><br>Supported `InfoTypes`: [[30 Official Roblox Docs/API Reference/Enums/InfoType\|Enum.InfoType.GamePass]], [[30 Official Roblox Docs/API Reference/Enums/InfoType\|Enum.InfoType.Product]].<br><br>`local infoTypes = {`<br>`	Enum.InfoType.GamePass,`<br>`	Enum.InfoType.Product`<br>`}` |

**Returns**

| Type | Description |
| --- | --- |
| List<RankedItem> | A ranked list of up to 50 items the user is most likely to engage with, based on the provided `InfoTypes`. If no recommendations can be determined, the method returns an empty list. |

*Code samples for this member (`MarketplaceService-RecommendTopProductsSample`) are published on the source page; their code is not part of the open-source repo.*

### UserOwnsGamePassAsync

```lua
MarketplaceService:UserOwnsGamePassAsync(userId: User, gamePassId: int64): boolean
```

**Thread safety:** Unsafe · **Capabilities:** AssetRead · **Tags:** `Yields`

Returns true if the user with the given [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserId]] owns the [[30 Official Roblox Docs/Production/Monetization/Passes|pass]] with the given `gamePassId` (not to be confused with an asset ID). You can use this method on both the client and the server.

#### Caching Behavior

The results of this function are cached so that repeated calls are returned faster. When the [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptGamePassPurchaseFinished|PromptGamePassPurchaseFinished]] event fires, the cache gets updated to reflect the latest ownership state of the associated game pass.

If the user purchases a game pass outside of the experience while remaining in the same session, the cache is eventually updated, but this process might take several minutes to propagate.

When a user first enters a server after purchasing a game pass, this functions always returns true.

#### Batching behavior

This method is **Transparent Batching capable**. If you spawn multiple calls concurrently using `task.spawn`, the engine automatically combines them into fewer HTTP requests behind the scenes. This is faster and helps you avoid rate limits. See [[30 Official Roblox Docs/Scripting/Transparent batching|Transparent Batching]] for details.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userId` | [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|UserId]] of the [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] whose inventory you're checking. |
| `gamePassId` | int64 |  | The pass ID you want to check for. Not to be confused with an asset ID. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the user owns the pass. |

*Code samples for this member (`MarketplaceService-UserOwnsGamePassAsync-TransparentBatching`) are published on the source page; their code is not part of the open-source repo.*

## Events

### PromptBulkPurchaseFinished

```lua
MarketplaceService.PromptBulkPurchaseFinished(player: Instance, status: MarketplaceBulkPurchasePromptStatus, results: Dictionary)
```

**Capabilities:** PromptExternalPurchase

This event fires when a purchase prompt for a bulk avatar items closes. For example, when a user receives the purchase prompt and clicks **Cancel**, or when they receive a success or error message and click **OK**.

Note: This is not a trusted event from the client. To check if the user owns the items purchased, use [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PlayerOwnsAssetAsync|MarketplaceService.PlayerOwnsAssetAsync]] or [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PlayerOwnsBundleAsync|MarketplaceService.PlayerOwnsBundleAsync]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] who received the prompt. |
| `status` | [[30 Official Roblox Docs/API Reference/Enums/MarketplaceBulkPurchasePromptStatus\|MarketplaceBulkPurchasePromptStatus]] |  | The status of the bulk purchase. |
| `results` | Dictionary |  | The table type containing the line items and their status in the following format:<br><br>`{`<br>`  RobuxSpent: number`<br>`  Items: {`<br>`    {`<br>`      type: MarketplaceProductType,`<br>`      id: string,`<br>`      status: MarketplaceItemPurchaseStatus`<br>`    },`<br>`    ...`<br>`  }`<br>`}`<br><br>Each line item contains the following pairs:<br><br>- `type`: The corresponding [[30 Official Roblox Docs/API Reference/Enums/MarketplaceProductType\|Enum.MarketplaceProductType]] (Enum). - `id`: The ID of the asset or bundle (string). - `status`: The [[30 Official Roblox Docs/API Reference/Enums/MarketplaceItemPurchaseStatus\|Enum.MarketplaceItemPurchaseStatus]] of the purchase (Enum) |

### PromptBundlePurchaseFinished

```lua
MarketplaceService.PromptBundlePurchaseFinished(player: Instance, bundleId: int64, wasPurchased: boolean)
```

**Capabilities:** PromptExternalPurchase

This event fires when a purchase prompt for a bundle closes. Use [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PlayerOwnsBundleAsync|PlayerOwnsBundleAsync()]] to verify ownership instead of trusting this client-originated event.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] who received the prompt. |
| `bundleId` | int64 |  | The ID of the bundle shown in the prompt. |
| `wasPurchased` | boolean |  | Whether the bundle was purchased. |

### PromptGamePassPurchaseFinished

```lua
MarketplaceService.PromptGamePassPurchaseFinished(player: Instance, gamePassId: int64, wasPurchased: boolean)
```

**Capabilities:** PromptExternalPurchase

This event fires when a purchase prompt for a [[30 Official Roblox Docs/Production/Monetization/Passes|pass]] closes. For example, when a user receives the purchase prompt and clicks **Cancel**, or when they receive a success or error message and click **OK**.

#### See Also

- For repeatable **developer product** purchase prompts, use [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptProductPurchaseFinished|PromptProductPurchaseFinished]].
- For **affiliate gear sales** or other assets, use [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptPurchaseFinished|PromptPurchaseFinished]].
- For more information on saving and replicating user data like purchases and progress, see [Implementing player data and purchases](https://devforum.roblox.com/t/implementing-player-data-and-purchasing-systems/2839941).

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] who received the prompt. |
| `gamePassId` | int64 |  | The ID number of the pass shown in the prompt. Not to be confused with an asset ID. |
| `wasPurchased` | boolean |  | Indicates if the user pressed **OK** (true), **Cancel** (false) on the purchase prompt, or if the purchase prompt errored (false).<br><br>When `PromptGamePassPurchaseFinished` fires, it updates the cache used by [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#UserOwnsGamePassAsync\|UserOwnsGamePassAsync()]] to reflect the current ownership state.<br><br>`PromptGamePassPurchaseFinished` should only be listened to in a server script. When used on the server, values such as `wasPurchased` reflect the final outcome of the purchase attempt. When used in a local script, these values should not be relied on for validation or game logic. |

*Code samples for this member (`handling-gamepass`) are published on the source page; their code is not part of the open-source repo.*

### PromptPremiumPurchaseFinished

```lua
MarketplaceService.PromptPremiumPurchaseFinished()
```

**Capabilities:** PromptExternalPurchase

This event fires when a purchase prompt for [Roblox Premium](https://www.roblox.com/premium/membership) closes. For example, when a user receives the purchase prompt and clicks **Cancel**, or when they receive a success or error message and click **OK**.

#### See Also

- [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptPremiumPurchase|PromptPremiumPurchase]] to prompt a user to purchase Premium.
- [[30 Official Roblox Docs/API Reference/Classes/Players#PlayerMembershipChanged|PlayerMembershipChanged]], which fires when the server recognizes that a user's membership has changed.

### PromptProductPurchaseFinished

```lua
MarketplaceService.PromptProductPurchaseFinished(userId: int64, productId: int64, isPurchased: boolean)
```

**Capabilities:** PromptExternalPurchase

**IMPORTANT:** Do **not** use the `PromptProductPurchaseFinished` event to process purchases; instead, use the [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#ProcessReceipt|ProcessReceipt]] callback. The firing of `PromptProductPurchaseFinished` does **not** mean that a user has successfully purchased an item.

This event fires when a purchase prompt for a [[30 Official Roblox Docs/Production/Monetization/Developer Products|developer product]] closes. For example, when a user receives the purchase prompt and clicks **Cancel**, or when they receive a success or error message and click **OK**. The firing of this event does **not** mean that a user has successfully purchased an item.

While you can use the `PromptProductPurchaseFinished` event to detect when a user closes a purchase prompt, you should **not** use it to process purchases because those purchases might still fail in the backend for several reasons. For example, if a Roblox system is offline, or if the product price has changed and the user now doesn't have enough Robux to make the purchase. To process purchases, you must use [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#ProcessReceipt|ProcessReceipt]]. Using `ProcessReceipt` allows you to confirm that the purchase has succeeded before you grant the user the item they have purchased.

The `PromptProductPurchaseFinished` event fires with a `Player.UserId` instead of a reference to the `Player` object.

#### See Also

- [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptGamePassPurchaseFinished|PromptGamePassPurchaseFinished]] to prompt a user to purchase a pass.
- [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptPurchaseFinished|PromptPurchaseFinished]] to prompt a user to purchase affiliate gear or other assets.
- For more information on saving and replicating user data like purchases and progress, see [Implementing player data and purchases](https://devforum.roblox.com/t/implementing-player-data-and-purchasing-systems/2839941).

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userId` | int64 |  | The [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|UserId]] of the user who received the developer product prompt. |
| `productId` | int64 |  | The ID number of the developer product shown in the prompt. Not to be confused with an asset ID. |
| `isPurchased` | boolean |  | Indicates if the user pressed **OK** (true), **Cancel** (false) on the purchase prompt, or if the purchase prompt errored (false).<br><br>Do not use this parameter to process developer product purchases. |

### PromptPurchaseFinished

```lua
MarketplaceService.PromptPurchaseFinished(player: Instance, assetId: int64, isPurchased: boolean)
```

**Capabilities:** PromptExternalPurchase

This event fires when a purchase prompt for an affiliate gear sale or other asset closes. For example, when a user receives the purchase prompt and clicks **Cancel**, or when they receive a success or error message and click **OK**.

This event does not fire for [[30 Official Roblox Docs/Production/Monetization/Developer Products|developer product]] or [[30 Official Roblox Docs/Production/Monetization/Passes|pass]] prompts.

#### See Also

- [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptGamePassPurchaseFinished|PromptGamePassPurchaseFinished]] to prompt a user to purchase a pass.
- [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptProductPurchaseFinished|PromptProductPurchaseFinished]] to prompt a user to purchase a developer product.
- For more information on saving and replicating user data like purchases and progress, see [Implementing player data and purchases](https://devforum.roblox.com/t/implementing-player-data-and-purchasing-systems/2839941).

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] who received the prompt. |
| `assetId` | int64 |  | The asset ID of the item shown in the prompt. |
| `isPurchased` | boolean |  | Indicates if the user pressed **OK** (true), **Cancel** (false) on the purchase prompt, or if the purchase prompt errored (false).<br><br>This might not accurately reflect if the purchase itself has been successfully processed. |

*Code samples for this member (`MarketplaceService-PromptPurchaseFinished1`) are published on the source page; their code is not part of the open-source repo.*

### PromptRobloxSubscriptionPurchaseFinished

```lua
MarketplaceService.PromptRobloxSubscriptionPurchaseFinished(user: Player, didTryPurchasing: boolean)
```

**Capabilities:** PromptExternalPurchase

This event fires when a purchase prompt for Roblox Plus closes. For example, when a user receives the purchase prompt and clicks **Cancel**, or when they receive a success or error message and click **OK**.

Note that this event firing does **not** guarantee the subscription was successfully processed. Listen to [[30 Official Roblox Docs/API Reference/Classes/Player#HasRobloxSubscription|Player.HasRobloxSubscription]] via [[30 Official Roblox Docs/API Reference/Classes/Object#GetPropertyChangedSignal|Instance:GetPropertyChangedSignal()]] on the server to confirm a subscription change before granting rewards.

#### See Also

- [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptRobloxSubscriptionPurchase|PromptRobloxSubscriptionPurchase]] to prompt a user to purchase Roblox Plus.
- [[30 Official Roblox Docs/API Reference/Classes/Player#HasRobloxSubscription|Player.HasRobloxSubscription]], which can be observed via [[30 Official Roblox Docs/API Reference/Classes/Object#GetPropertyChangedSignal|Instance:GetPropertyChangedSignal()]] to detect when a user's subscription status changes.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `user` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] who received the prompt. |
| `didTryPurchasing` | boolean |  | Whether the user attempted to purchase Roblox Plus. |

*Code samples for this member (`MarketplaceService-PromptRobloxSubscriptionPurchaseFinished`) are published on the source page; their code is not part of the open-source repo.*

### PromptSubscriptionPurchaseFinished

```lua
MarketplaceService.PromptSubscriptionPurchaseFinished(user: Player, subscriptionId: string, didTryPurchasing: boolean)
```

**Capabilities:** PromptExternalPurchase

This event fires when a purchase prompt for an affiliate gear sale or other asset closes. For example, when a user receives the purchase prompt and clicks **Cancel**, or when they receive a success or error message and click **OK**.

#### See Also

- [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptSubscriptionPurchase|PromptSubscriptionPurchase]] to prompt a user to purchase a subscription.
- [[30 Official Roblox Docs/API Reference/Classes/Players#UserSubscriptionStatusChanged|UserSubscriptionStatusChanged]], which fires when the server recognizes that a user's membership has changed.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `user` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] who received the prompt. |
| `subscriptionId` | string |  | The ID of the subscription with a status change. |
| `didTryPurchasing` | boolean |  | Whether the user attempted to purchase the subscription. |

## Callbacks

### ProcessReceipt

```lua
MarketplaceService.ProcessReceipt(receiptInfo: Dictionary): ProductPurchaseDecision
```

**Thread safety:** Unsafe · **Capabilities:** Monetization

`ProcessReceipt` is a callback to process receipts from [[30 Official Roblox Docs/Production/Monetization/Developer Products|developer product purchases]]. You can sell developer products inside an experience using `MarketplaceService` functions, or outside an experience on the Store tab of your experience details page.

You should only set the `ProcessReceipt` callback one time in a single server-side [[30 Official Roblox Docs/API Reference/Classes/Script|Script]]. This callback must handle the receipts for all developer products you have for sale.

**IMPORTANT:** It's **highly recommended** that you properly implement the `ProcessReceipt` callback in order to sell your developer products. You should use `ProcessReceipt` to grant users their purchased product over any other granting method. If your `ProcessReceipt` implementation isn't correct, you will **not** be able to grant users the products they have purchased on the Store tab of your experience details page.

#### Guarantees

The `ProcessReceipt` callback is called for all unresolved developer product purchases when:

- A user successfully completes the purchase of a developer product.
- A successful developer product purchase prompt appears to the user.
- A user joins the server.

A purchase is considered **successfully initiated** when:

- The purchase is processed on Roblox's backend.
- The funds are placed in escrow.

A purchase is considered **resolved** when:

- The `ProcessReceipt` callback returns a [[30 Official Roblox Docs/API Reference/Enums/ProductPurchaseDecision|Enum.ProductPurchaseDecision]] enum of [[30 Official Roblox Docs/API Reference/Enums/ProductPurchaseDecision|PurchaseGranted]].
- The purchase is successfully recorded on Roblox's backend.

#### Unresolved Developer Product Purchases

An **unresolved developer product purchase** takes place when a user's purchase of a developer product has not yet been acknowledged by the server through the `ProcessReceipt` function.

Unresolved developer product purchases are not removed or refunded after the escrow period expires.

#### Retries and Timeouts

`ProcessReceipt` has no time-based retry mechanism. If a user makes a purchase that returns a [[30 Official Roblox Docs/API Reference/Enums/ProductPurchaseDecision|Enum.ProductPurchaseDecision]] enum of [[30 Official Roblox Docs/API Reference/Enums/ProductPurchaseDecision|NotProcessedYet]], the `ProcessReceipt` callback is only called again on the same server if:

- The user successfully initiates another developer product purchase.
- The user re-joins any server under the same experience.

`ProcessReceipt` also has no timeout for yielded callbacks. A `ProcessReceipt` callback can yield for as long as the server is running, and the callback result is still accepted when the result returns.

#### Limitations

- If you don't implement a `ProcessReceipt` callback, your receipts will be auto-acknowledged. You can't get a receipt back after it has been acknowledged.
- When there are multiple purchases pending for a user, `ProcessReceipt` callbacks are called in a non-deterministic order.
- The user must be on the server for the `ProcessReceipt` callback to be invoked.
- The user does not have to be on the server for the result of the `ProcessReceipt` callback to be recorded on the backend.
- The `ProcessReceipt` callback for a specific purchase might run on two different servers at the same time if the user joins the second server before the callback returns on the first server.
- The `ProcessReceipt` callback might still fail to be recorded on the backend, even if it returns a [[30 Official Roblox Docs/API Reference/Enums/ProductPurchaseDecision|Enum.ProductPurchaseDecision]] enum of [[30 Official Roblox Docs/API Reference/Enums/ProductPurchaseDecision|PurchaseGranted]]. When this happens, the purchase remains unresolved.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `receiptInfo` | Dictionary |  | The `receiptInfo` table passed to this callback contains the following data:<br><br>- `PurchaseId` — A unique identifier for the specific purchase. - `PlayerId` — The user ID of the user who made the purchase. - `ProductId` — The ID of the purchased product. - `PlaceIdWherePurchased` — The place ID in which the purchase was made. Depending on where the user is during gameplay, the purchase place's ID can be the same as or different from the current place's ID. - `CurrencySpent` — The amount of currency spent in the transaction. - `CurrencyType` — The type of currency spent in the purchase; always [[30 Official Roblox Docs/API Reference/Enums/CurrencyType\|Enum.CurrencyType.Robux]]. - `ProductPurchaseChannel` — How the user acquired the developer product. One of [[30 Official Roblox Docs/API Reference/Enums/ProductPurchaseChannel\|Enum.ProductPurchaseChannel]]. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/ProductPurchaseDecision\|ProductPurchaseDecision]] | An enum that represents how the developer product receipt was processed.<br><br>- `PurchaseGranted`: - Indicates that the experience successfully granted the player the developer product. - Indicates to Roblox that the developer product sale was successful. - `NotProcessedYet`: - Indicates that the experience failed to grant the player the developer product. |

*Code samples for this member (`ProcessReceipt-Example`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [MarketplaceService](https://create.roblox.com/docs/reference/engine/classes/MarketplaceService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

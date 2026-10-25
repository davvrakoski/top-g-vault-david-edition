---
title: "AvatarEditorService"
description: "A service to support developer Avatar Editors."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/AvatarEditorService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A service to support developer Avatar Editors.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

AvatarEditorService is a service to support developer Avatar Editors. It provides methods to modify the player's platform avatar, request information about a user's inventory, and request information about the catalog.

For more information regarding the Avatar Editor, see [[30 Official Roblox Docs/Players/Avatar Editor Service|Avatar Editor Service]].

#### Throttling

The following endpoints on `AvatarEditorService` have experience-level throttling:

- [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetItemDetailsAsync|AvatarEditorService.GetItemDetailsAsync]]
- [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetBatchItemDetailsAsync|AvatarEditorService.GetBatchItemDetailsAsync]]
- [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetRecommendedAssetsAsync|AvatarEditorService.GetRecommendedAssetsAsync]]
- [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetRecommendedBundlesAsync|AvatarEditorService.GetRecommendedBundlesAsync]]
- [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#SearchCatalogAsync|AvatarEditorService.SearchCatalogAsync]]
- [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptSetFavorite|AvatarEditorService.PromptSetFavorite]]
- [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetFavoriteAsync|AvatarEditorService.GetFavoriteAsync]]

For each experience, this throttling allows you to send up to 100 requests per second to these `AvatarEditorService` endpoints, regardless of the number of servers or user count. Exceeding these limits returns a `429 Too Many Requests` error.

#### Item Details Response

The following methods return item data in a shared response format:

- [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetItemDetailsAsync|AvatarEditorService:GetItemDetailsAsync()]]
- [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetBatchItemDetailsAsync|AvatarEditorService:GetBatchItemDetailsAsync()]]
- [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetBundlesByAssetIdAsync|AvatarEditorService:GetBundlesByAssetIdAsync()]]
- [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#SearchCatalogAsync|AvatarEditorService:SearchCatalogAsync()]]

```lua
{
  "Id": 0,
  "ItemType": "Asset",
  "AssetType": "Image",
  "BundleType": "BodyParts",
  "Name": "string",
  "Description": "string",
  "ProductId": 0,
  "ItemStatus": ["New"],
  "ItemRestrictions": ["Collectible"],

  "BundledItems": [
    {
      "Id": 0,
      "Name": "string",
      "Type": "Asset",
      "AssetType": "string",
      "SupportsHeadShapes": false,
      "Owned": false
    }
  ],
  "IsRecolorable": false,

  "CollectibleItemId": "string",
  "TotalQuantity": 0,
  "UnitsAvailableForConsumption": 0,
  "QuantityLimitPerUser": 0,
  "HasResellers": false,
  "OffSaleDeadline": null,

  "Price": 0,
  "PremiumPricing": {
    "PremiumDiscountPercentage": 0,
    "PremiumPriceInRobux": 0
  },
  "LowestPrice": 0,
  "LowestResalePrice": 0,
  "PriceStatus": "string",
  "SaleLocationType": "ShopAndAllExperiences",
  "PurchaseCount": 0,
  "FavoriteCount": 0,

  "CreatorType": "User",
  "CreatorTargetId": 0,
  "CreatorName": "string",
  "CreatorHasVerifiedBadge": false,

  "SupportsHeadShapes": false,

  "TimedOptions": [
    { "Duration": 259200, "Price": 30 },
    { "Duration": 604800, "Price": 40 },
    { "Duration": 1209600, "Price": 50 }
  ]
}
```

##### Basic Information

| Field | Type | Description |
| --- | --- | --- |
| `Id` | number | The unique identifier of the item. |
| `ItemType` | string | The type of item: `"Asset"` or `"Bundle"`. Corresponds to [[30 Official Roblox Docs/API Reference/Enums/AvatarItemType\|Enum.AvatarItemType]]. |
| `AssetType` | string | The asset type. Corresponds to [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType\|Enum.AvatarAssetType]] values (e.g., `"Hat"`, `"Shirt"`). Only present if `ItemType` is `"Asset"`. |
| `SupportsHeadShapes` | boolean | Whether the asset supports head shape swapping. Only present if `AssetType` is `"DynamicHead"`. |
| `BundleType` | string | The bundle type. Corresponds to [[30 Official Roblox Docs/API Reference/Enums/BundleType\|Enum.BundleType]] values (e.g., `"BodyParts"`, `"Animations"`). Only present if `ItemType` is `"Bundle"`. |
| `Name` | string | The display name of the item. |
| `Description` | string | The item's description text. |
| `ProductId` | number | The product ID associated with this item. |
| `ItemStatus` | array | An array of status strings (e.g., `"New"`, `"Sale"`, `"XboxExclusive"`, `"AmazonExclusive"`). |
| `ItemRestrictions` | array | An array of restriction strings. See the `itemRestrictions` table below. |

##### Bundle Information

| Field | Type | Description |
| --- | --- | --- |
| `BundledItems` | array | An array of items contained in the bundle. Only present if `ItemType` is `"Bundle"`. Each entry contains: |
|  |  | `Id`: The unique identifier of the bundled item. |
|  |  | `Name`: The display name of the bundled item. |
|  |  | `Type`: The type of the bundled item (e.g., `"Asset"`). |
|  |  | `AssetType`: The asset type as a string. Corresponds to [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType\|Enum.AvatarAssetType]] values (e.g., `"Hat"`, `"DynamicHead"`). |
|  |  | `SupportsHeadShapes`: Whether the asset supports head shape swapping. Only present if `AssetType` is `"DynamicHead"`. |
|  |  | `Owned`: Whether the bundled item is owned by the current user. |
| `IsRecolorable` | boolean | Whether the bundle supports skin tone matching. Only applies to BodyParts and DynamicHead bundles. |

##### Collectible Information

| Field | Type | Description |
| --- | --- | --- |
| `CollectibleItemId` | string | The unique item ID of the collectible. |
| `TotalQuantity` | number | The total quantity of the collectible available for purchase (not resale). |
| `UnitsAvailableForConsumption` | number | The number of units available for purchase. Only applies to Limited items with remaining stock. |
| `QuantityLimitPerUser` | number | Maximum number of the same collectible item a user can own. |
| `HasResellers` | boolean | `true` when item is a Limited collectible and there are copies available for resale. |
| `OffSaleDeadline` | string | The date/time when the item goes off sale. |

##### Pricing and Sale Information

| Field | Type | Description |
| --- | --- | --- |
| `Price` | number | The price in Robux. `0` if free or not for sale. |
| `PremiumPricing` | table | Premium pricing information. Contains the following fields: |
|  |  | `PremiumDiscountPercentage`: The discount percentage for Premium members. |
|  |  | `PremiumPriceInRobux`: The discounted price in Robux for Premium members. |
| `LowestPrice` | number | The lowest resale price for Limited items. |
| `LowestResalePrice` | number | The lowest resale price for the collectible in Robux. |
| `PriceStatus` | string | The price status (e.g., `"Free"`, `"Off Sale"`, `"No Resellers"`). |
| `SaleLocationType` | string | The type of sale location setting. See `SaleLocationType` values below. |
| `PurchaseCount` | number | The total number of times this item has been purchased. |
| `FavoriteCount` | number | The total number of users who have favorited this item. |

##### Creator Information

| Field | Type | Description |
| --- | --- | --- |
| `CreatorType` | string | Either `User` or `Group`. See [[30 Official Roblox Docs/API Reference/Enums/CreatorType\|Enum.CreatorType]]. |
| `CreatorTargetId` | number | The ID of the creator user or group. |
| `CreatorName` | string | The display name of the creator. |
| `CreatorHasVerifiedBadge` | boolean | Boolean of whether the creator has a verified badge. |

##### Timed Options Information

| Field | Type | Description |
| --- | --- | --- |
| `TimedOptions` | array | Optional. An array of available timed options with durations and prices. Only present for assets that support timed ownership. Do not hardcode duration values; always retrieve them from the API as available options may change. Each entry contains: |
|  |  | `Duration`: The duration in seconds (e.g. 259200 for 3 days, 604800 for 7 days). |
|  |  | `Price`: The price in Robux for this duration. |

##### SaleLocationType Values

| Value                    | Description                                                                            |
| :----------------------- | :------------------------------------------------------------------------------------- |
| `NotApplicable`          | Default value, should not occur in practice.                                           |
| `ShopOnly`               | Item can only be purchased in the Roblox catalog shop.                                 |
| `MyExperiencesOnly`      | Item can only be purchased in the creator's experiences.                               |
| `ShopAndMyExperiences`   | Item can be purchased in the Roblox catalog shop or the creator's experiences.         |
| `ExperiencesById`        | Item can only be purchased in a specific list of experiences.                          |
| `ShopAndAllExperiences`  | Item can be purchased in the Roblox catalog shop and all experiences.                  |
| `ExperiencesDevApiOnly`  | Item can only be purchased in experiences via developer APIs.                          |
| `ShopAndExperiencesById` | Item can be purchased in the Roblox catalog shop or a whitelisted list of experiences. |

##### itemRestrictions Values

| itemRestrictions | Limited or Unlimited  |
| :--------------: | :-------------------: |
|     `empty`      |       Unlimited       |
|  `Collectible`   |      UGC Limited      |
|    `Limited`     |    Roblox Limited     |
| `LimitedUnique`  | Roblox Limited Unique |

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#CheckApplyDefaultClothing\|CheckApplyDefaultClothing()]] | [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] | **Deprecated.** Used to apply default clothing to the [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] if necessary. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#CheckApplyDefaultClothingAsync\|CheckApplyDefaultClothingAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] | Used to apply default clothing to the [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] if necessary. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#ConformToAvatarRules\|ConformToAvatarRules()]] | [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] | **Deprecated.** Deprecated. Returns a copy of the given [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] that conforms to the platform Avatar rules. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#ConformToAvatarRulesAsync\|ConformToAvatarRulesAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] | Returns a copy of the given [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] that conforms to the platform Avatar rules. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetAccessoryType\|GetAccessoryType()]] | [[30 Official Roblox Docs/API Reference/Enums/AccessoryType\|AccessoryType]] | Returns the [[30 Official Roblox Docs/API Reference/Enums/AccessoryType\|Enum.AccessoryType]] that corresponds to the given [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType\|Enum.AvatarAssetType]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetAvatarRules\|GetAvatarRules()]] | Dictionary | **Deprecated.** Returns the platform Avatar rules for things such as scaling, default shirts and pants, number of wearable assets. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetAvatarRulesAsync\|GetAvatarRulesAsync()]] | Dictionary | Returns the platform Avatar rules for things such as scaling, default shirts and pants, number of wearable assets. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetBatchItemDetails\|GetBatchItemDetails()]] | Array | **Deprecated.** Gets the item details for a list of items at once. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetBatchItemDetailsAsync\|GetBatchItemDetailsAsync()]] | Array | Gets the item details for a list of items at once. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetBundlesByAssetIdAsync\|GetBundlesByAssetIdAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/CatalogPages\|CatalogPages]] | Returns a [[30 Official Roblox Docs/API Reference/Classes/CatalogPages\|CatalogPages]] object containing bundles that include the given asset. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetFavorite\|GetFavorite()]] | boolean | **Deprecated.** Returns if the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer\|Players.LocalPlayer]] has favorited the given bundle or asset. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetFavoriteAsync\|GetFavoriteAsync()]] | boolean | Returns if the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer\|Players.LocalPlayer]] has favorited the given bundle or asset. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetHeadShapesAsync\|GetHeadShapesAsync()]] | Array | Returns an array of head shape names that the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer\|Players.LocalPlayer]] owns. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetInventory\|GetInventory()]] | [[30 Official Roblox Docs/API Reference/Classes/InventoryPages\|InventoryPages]] | **Deprecated.** Returns an [[30 Official Roblox Docs/API Reference/Classes/InventoryPages\|InventoryPages]] object with information about owned items in the users inventory with the given AvatarAssetTypes. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetInventoryAsync\|GetInventoryAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/InventoryPages\|InventoryPages]] | Returns an [[30 Official Roblox Docs/API Reference/Classes/InventoryPages\|InventoryPages]] object with information about owned items in the users inventory with the given AvatarAssetTypes. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetItemDetails\|GetItemDetails()]] | Dictionary | **Deprecated.** Returns the item details for the given item. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetItemDetailsAsync\|GetItemDetailsAsync()]] | Dictionary | Returns the item details for the given item. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetOutfitDetails\|GetOutfitDetails()]] | Dictionary | **Deprecated.** Returns the outfit details for the given outfit. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetOutfitDetailsAsync\|GetOutfitDetailsAsync()]] | Dictionary | Returns the outfit details for the given outfit. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetOutfits\|GetOutfits()]] | [[30 Official Roblox Docs/API Reference/Classes/OutfitPages\|OutfitPages]] | **Deprecated.** Returns outfit data for the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer\|Players.LocalPlayer]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetOutfitsAsync\|GetOutfitsAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/OutfitPages\|OutfitPages]] | Returns outfit data for the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer\|Players.LocalPlayer]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetRecommendedAssets\|GetRecommendedAssets()]] | Array | **Deprecated.** Returns a list of recommended assets based on a given [[30 Official Roblox Docs/API Reference/Enums/AssetType\|Enum.AssetType]] and asset ID. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetRecommendedAssetsAsync\|GetRecommendedAssetsAsync()]] | Array | Returns a list of recommended assets based on a given [[30 Official Roblox Docs/API Reference/Enums/AssetType\|Enum.AssetType]] and asset ID. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetRecommendedBundles\|GetRecommendedBundles()]] | Array | **Deprecated.** Returns a list of recommended bundles for a given bundle id. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetRecommendedBundlesAsync\|GetRecommendedBundlesAsync()]] | Array | Returns a list of recommended bundles for a given bundle id. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptAllowInventoryReadAccess\|PromptAllowInventoryReadAccess()]] | () | Prompts the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer\|Players.LocalPlayer]] to allow the developer to read what items the user has in their inventory and other avatar editor related information. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptCreateOutfit\|PromptCreateOutfit()]] | () | Prompts the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer\|Players.LocalPlayer]] to save the given [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] as an outfit. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptDeleteOutfit\|PromptDeleteOutfit()]] | () | Prompts the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer\|Players.LocalPlayer]] to delete the given outfit. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptRenameOutfit\|PromptRenameOutfit()]] | () | Prompts the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer\|Players.LocalPlayer]] to rename the given outfit. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptSaveAvatar\|PromptSaveAvatar()]] | () | Prompts the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer\|Players.LocalPlayer]] to update their avatar based on the given [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] and [[30 Official Roblox Docs/API Reference/Enums/HumanoidRigType\|Enum.HumanoidRigType]] of R6 or R15. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptSetFavorite\|PromptSetFavorite()]] | () | Prompts the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer\|Players.LocalPlayer]] to favorite or unfavorite the given asset or bundle. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptUpdateOutfit\|PromptUpdateOutfit()]] | () | Prompts the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer\|Players.LocalPlayer]] to update the given outfit. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#SearchCatalog\|SearchCatalog()]] | [[30 Official Roblox Docs/API Reference/Classes/CatalogPages\|CatalogPages]] | **Deprecated.** Returns a [[30 Official Roblox Docs/API Reference/Classes/CatalogPages\|CatalogPages]] object containing the result of the given search. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#SearchCatalogAsync\|SearchCatalogAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/CatalogPages\|CatalogPages]] | Returns a [[30 Official Roblox Docs/API Reference/Classes/CatalogPages\|CatalogPages]] object containing the result of the given search. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptAllowInventoryReadAccessCompleted\|PromptAllowInventoryReadAccessCompleted]] | `result` | Fires when the [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptAllowInventoryReadAccess\|AvatarEditorService:PromptAllowInventoryReadAccess()]] prompt is responded to by the user. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptCreateOutfitCompleted\|PromptCreateOutfitCompleted]] | `result`, `failureType` | Fires when the PromptSaveOutfit operation is completed. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptDeleteOutfitCompleted\|PromptDeleteOutfitCompleted]] | `result` | Fires when the PromptDeleteOutfit operation is completed. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptRenameOutfitCompleted\|PromptRenameOutfitCompleted]] | `result` | Fires when the PromptRenameOutfit operation is completed. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptSaveAvatarCompleted\|PromptSaveAvatarCompleted]] | `result`, `humanoidDescription` | Fires when the [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptSaveAvatar\|AvatarEditorService:PromptSaveAvatar()]] operation is completed. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptSetFavoriteCompleted\|PromptSetFavoriteCompleted]] | `result` | Fires when the [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptSetFavorite\|AvatarEditorService:PromptSetFavorite()]] operation is completed. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptUpdateOutfitCompleted\|PromptUpdateOutfitCompleted]] | `result` | Fires when the [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptUpdateOutfit\|AvatarEditorService:PromptUpdateOutfit()]] operation is completed. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### CheckApplyDefaultClothing

> [!warning] Deprecated
> This member is deprecated.

```lua
AvatarEditorService:CheckApplyDefaultClothing(humanoidDescription: HumanoidDescription): HumanoidDescription
```

**Thread safety:** Unsafe · **Capabilities:** AvatarAppearance · **Tags:** `Yields`, `Deprecated`

Deprecated in favor of [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#CheckApplyDefaultClothingAsync|AvatarEditorService:CheckApplyDefaultClothingAsync()]]. This method has the same behavior: it returns a new [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] with the Shirt and Pants properties updated if necessary, or `nil` if default clothing was not needed.

Default clothing is necessary if the HumanoidDescription does not currently have Shirt and Pants equipped and the body colors are too similar.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `humanoidDescription` | [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] |  | The HumanoidDescription to check if default clothing is required. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] | Returns a HumanoidDescription if default clothing was necessary. Otherwise returns `nil`. |

### CheckApplyDefaultClothingAsync

```lua
AvatarEditorService:CheckApplyDefaultClothingAsync(humanoidDescription: HumanoidDescription): HumanoidDescription
```

**Thread safety:** Unsafe · **Capabilities:** AvatarAppearance · **Tags:** `Yields`

Returns a new [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] with the Shirt and Pants properties updated if necessary. Returns `nil` if default clothing was not needed.

Default clothing is necessary if the HumanoidDescription does not currently have Shirt and Pants equipped and the body colors are too similar.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `humanoidDescription` | [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] |  | The HumanoidDescription to check if default clothing is required. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] | Returns a HumanoidDescription if default clothing was necessary. Otherwise returns `nil`. |

### ConformToAvatarRules

> [!warning] Deprecated
> This member is deprecated.

```lua
AvatarEditorService:ConformToAvatarRules(humanoidDescription: HumanoidDescription): HumanoidDescription
```

**Thread safety:** Unsafe · **Capabilities:** AvatarAppearance · **Tags:** `Yields`, `Deprecated`

Deprecated in favor of [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#ConformToAvatarRulesAsync|AvatarEditorService:ConformToAvatarRulesAsync()]]. Clones the given description and adjusts scale values, accessory counts, accessory adjustments, default clothing, and layered-clothing limits to comply with the platform Avatar rules. It also remaps classic face and classic head assets to their corresponding Dynamic Head asset IDs.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `humanoidDescription` | [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] |  | The [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] to conform to the platform Avatar rules. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] | A new [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] that conforms to the platform Avatar rules. |

### ConformToAvatarRulesAsync

```lua
AvatarEditorService:ConformToAvatarRulesAsync(humanoidDescription: HumanoidDescription): HumanoidDescription
```

**Thread safety:** Unsafe · **Capabilities:** AvatarAppearance · **Tags:** `Yields`

This method also remaps classic face and classic head assets to their corresponding Dynamic Head asset IDs, with the appropriate [[30 Official Roblox Docs/API Reference/Classes/BodyPartDescription#HeadShape|HeadShape]] pre-applied. This remapping happens automatically and requires no code changes.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `humanoidDescription` | [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] |  | The [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] to conform. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] | A new [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] that conforms to the platform Avatar rules. |

### GetAccessoryType

```lua
AvatarEditorService:GetAccessoryType(avatarAssetType: AvatarAssetType): AccessoryType
```

**Thread safety:** Unsafe

Returns the [[30 Official Roblox Docs/API Reference/Enums/AccessoryType|Enum.AccessoryType]] that corresponds to the given [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType|Enum.AvatarAssetType]], which is useful for grouping avatar assets by the accessory slot they occupy.

The mapping covers accessory asset types — for example, [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType|Enum.AvatarAssetType.HairAccessory]] maps to [[30 Official Roblox Docs/API Reference/Enums/AccessoryType|Enum.AccessoryType.Hair]], and layered-clothing types such as [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType|Enum.AvatarAssetType.ShirtAccessory]] map to [[30 Official Roblox Docs/API Reference/Enums/AccessoryType|Enum.AccessoryType.Shirt]]. An [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType|Enum.AvatarAssetType]] that does not correspond to an accessory (for example, an animation or a body part) returns [[30 Official Roblox Docs/API Reference/Enums/AccessoryType|Enum.AccessoryType.Unknown]].

This method returns immediately; it does not yield or perform a web request.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `avatarAssetType` | [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType\|AvatarAssetType]] |  | The [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType\|Enum.AvatarAssetType]] to convert to its corresponding [[30 Official Roblox Docs/API Reference/Enums/AccessoryType\|Enum.AccessoryType]]. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/AccessoryType\|AccessoryType]] | The [[30 Official Roblox Docs/API Reference/Enums/AccessoryType\|Enum.AccessoryType]] corresponding to the given [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType\|Enum.AvatarAssetType]], or [[30 Official Roblox Docs/API Reference/Enums/AccessoryType\|Enum.AccessoryType.Unknown]] if the asset type has no matching accessory type. |

### GetAvatarRules

> [!warning] Deprecated
> This member is deprecated.

```lua
AvatarEditorService:GetAvatarRules(): Dictionary
```

**Thread safety:** Unsafe · **Tags:** `Yields`, `Deprecated`

Deprecated in favor of [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetAvatarRulesAsync|AvatarEditorService:GetAvatarRulesAsync()]]. This method has the same behavior: it returns a dictionary containing the platform Avatar rules. See [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetAvatarRulesAsync|AvatarEditorService:GetAvatarRulesAsync()]] for the response format.

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | A dictionary containing the platform Avatar rules for things like scaling, default shirts and pants, number of wearable assets, ect. See the example return in the main description above. |

### GetAvatarRulesAsync

```lua
AvatarEditorService:GetAvatarRulesAsync(): Dictionary
```

**Thread safety:** Unsafe · **Tags:** `Yields`

This function returns the platform Avatar rules for things like scaling, default shirts and pants, number of wearable assets, ect.

The returned table includes the following fields:

```lua
{
  "PlayerAvatarTypes": [
    "R6"
  ],
  "Scales": {},
  "WearableAssetTypes": [
    {
      "MaxNumber": 0,
      "Id": 0,
      "Name": "string"
    }
  ],
  "BodyColorsPalette": [
    {
      "BrickColorId": 0,
      "NexColor": "string",
      "Name": "string"
    }
  ],
  "BasicBodyColorsPalette": [
    {
      "BrickColorId": 0,
      "HexColor": "string",
      "Name": "string"
    }
  ],
  "MinimumDeltaEBodyColorDifference": 0,
  "ProportionsAndBodyTypeEnabledForUser": true,
  "DefaultClothingAssetLists": {
    "DefaultShirtAssetIds": [
      0
    ],
    "DefaultPantAssetIds": [
      0
    ]
  },
  "BundlesEnabledForUser": true,
  "EmotesEnabledForUser": true
}
```

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | A dictionary containing the platform Avatar rules for things like scaling, default shirts and pants, number of wearable assets, ect. See the example return in the main description above. |

### GetBatchItemDetails

> [!warning] Deprecated
> This member is deprecated.

```lua
AvatarEditorService:GetBatchItemDetails(itemIds: Array, itemType: AvatarItemType): Array
```

**Thread safety:** Unsafe · **Capabilities:** AssetRead · **Tags:** `Yields`, `Deprecated`

Deprecated in favor of [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetBatchItemDetailsAsync|AvatarEditorService:GetBatchItemDetailsAsync()]]. This method has the same behavior: it gets the item details for a list of items at once and returns an array of item details in the Item Details Response format.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `itemIds` | Array |  | The list of item ids to get details of. |
| `itemType` | [[30 Official Roblox Docs/API Reference/Enums/AvatarItemType\|AvatarItemType]] |  | The type of the item ids provided. |

**Returns**

| Type | Description |
| --- | --- |
| Array | Returns an array of item details. See [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetBatchItemDetailsAsync\|AvatarEditorService:GetBatchItemDetailsAsync()]] for the response format. |

### GetBatchItemDetailsAsync

```lua
AvatarEditorService:GetBatchItemDetailsAsync(itemIds: Array, itemType: AvatarItemType): Array
```

**Thread safety:** Unsafe · **Capabilities:** AssetRead · **Tags:** `Yields`

Gets the item details for a list of items at once. More efficient than [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetItemDetailsAsync|AvatarEditorService:GetItemDetailsAsync()]] if you need to get the item details for multiple items.

Returns an array of items (see Item Details Response above in summary). Each item includes the `TimedOptions` field when the asset supports timed ownership.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `itemIds` | Array |  | The list of item ids to get details of. |
| `itemType` | [[30 Official Roblox Docs/API Reference/Enums/AvatarItemType\|AvatarItemType]] |  | The type of the item ids provided. |

**Returns**

| Type | Description |
| --- | --- |
| Array | Returns an array of item details. |

### GetBundlesByAssetIdAsync

```lua
AvatarEditorService:GetBundlesByAssetIdAsync(assetId: int64, limit: int64 = 10): CatalogPages
```

**Thread safety:** Unsafe · **Capabilities:** AssetRead · **Tags:** `Yields`

Returns a paginated list of bundles that contain the specified asset. Results are returned in ascending order by date created. Each page entry uses the **Item Details Response** format (see service description above).

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `assetId` | int64 |  | The ID of the asset to find bundles for. |
| `limit` | int64 | `10` | The number of results per page. Accepts `10`, `25`, `50`, and `100`. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/CatalogPages\|CatalogPages]] | A [[30 Official Roblox Docs/API Reference/Classes/CatalogPages\|CatalogPages]] object containing bundles that include the given asset. |

### GetFavorite

> [!warning] Deprecated
> This member is deprecated.

```lua
AvatarEditorService:GetFavorite(itemId: int64, itemType: AvatarItemType): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Players, AssetRead · **Tags:** `Yields`, `Deprecated`

Deprecated in favor of [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetFavoriteAsync|AvatarEditorService:GetFavoriteAsync()]]. This method has the same behavior: it returns whether the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer|Players.LocalPlayer]] has favorited the given bundle or asset.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `itemId` | int64 |  | The ID of the specified asset or bundle. |
| `itemType` | [[30 Official Roblox Docs/API Reference/Enums/AvatarItemType\|AvatarItemType]] |  | The [[30 Official Roblox Docs/API Reference/Enums/AvatarItemType\|Enum.AvatarItemType]] of the specified asset or bundle. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the `LocalPlayer` has favorited the given bundle or asset. |

### GetFavoriteAsync

```lua
AvatarEditorService:GetFavoriteAsync(itemId: int64, itemType: AvatarItemType): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Players, AssetRead · **Tags:** `Yields`

This function returns if the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer|Players.LocalPlayer]] has favorited the given bundle or asset.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `itemId` | int64 |  | The ID of the specified asset or bundle. |
| `itemType` | [[30 Official Roblox Docs/API Reference/Enums/AvatarItemType\|AvatarItemType]] |  | The [[30 Official Roblox Docs/API Reference/Enums/AvatarItemType\|Enum.AvatarItemType]] of the specified asset or bundle. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the `LocalPlayer` has favorited the given bundle or asset. |

### GetHeadShapesAsync

```lua
AvatarEditorService:GetHeadShapesAsync(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Players, AssetRead · **Tags:** `Yields`

Each head shape corresponds to a classic head owned by the user and can be applied to any Dynamic Head that supports shape swapping (see [[30 Official Roblox Docs/API Reference/Classes/BodyPartDescription#HeadShape|BodyPartDescription.HeadShape]]).

This method requires the user to have accepted the [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptAllowInventoryReadAccess|AvatarEditorService:PromptAllowInventoryReadAccess()]] prompt.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of strings, each identifying a head shape owned by [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer\|Players.LocalPlayer]]. Possible values include: `"Blockhead"`, `"Cheeks"`, `"Chiseled"`, `"ClassicFemaleV2"`, `"ClassicMaleV2"`, `"CoolThing"`, `"Default"`, `"EraserHead"`, `"FatHead"`, `"FlatTop"`, `"GoldenKorbloxGeneral"`, `"GoldenMrRobot"`, `"KnightOfChivalry"`, `"KnightOfCourage"`, `"ManHead"`, `"MercilessNinja"`, `"MrToilet"`, `"Narrow"`, `"NeoClassicFemaleV2"`, `"NeoClassicMaleV2"`, `"Paragon"`, `"Peabrain"`, `"Perfection"`, `"RobloxClassic"`, `"Roll"`, `"Roundy"`, `"RoxBox"`, `"StrongJaw"`, `"TheEngineer"`, `"Trim"`, `"WomanHead"`. |

*Code samples for this member (`getting-owned-head-shapes`) are published on the source page; their code is not part of the open-source repo.*

### GetInventory

> [!warning] Deprecated
> This member is deprecated.

```lua
AvatarEditorService:GetInventory(assetTypes: Array): InventoryPages
```

**Thread safety:** Unsafe · **Capabilities:** Players, AssetRead · **Tags:** `Yields`, `Deprecated`

Deprecated in favor of [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetInventoryAsync|AvatarEditorService:GetInventoryAsync()]]. This method has the same behavior: it returns an [[30 Official Roblox Docs/API Reference/Classes/InventoryPages|InventoryPages]] object with information about items owned by the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer|Players.LocalPlayer]] that match the given [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType|AvatarAssetTypes]]. See [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetInventoryAsync|AvatarEditorService:GetInventoryAsync()]] for the response format.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `assetTypes` | Array |  | The [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType\|Enum.AvatarAssetType]] that can will be checked for in the player's inventory. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/InventoryPages\|InventoryPages]] | An [[30 Official Roblox Docs/API Reference/Classes/InventoryPages\|InventoryPages]] object containing information about owned items matching the given asset types. |

### GetInventoryAsync

```lua
AvatarEditorService:GetInventoryAsync(assetTypes: Array): InventoryPages
```

**Thread safety:** Unsafe · **Capabilities:** Players, AssetRead · **Tags:** `Yields`

Returns an [[30 Official Roblox Docs/API Reference/Classes/InventoryPages|InventoryPages]] object with information about owned items in the users inventory with the given [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType|AvatarAssetTypes]].

The returned table includes the following fields:

```lua
[
    {
      "AssetId": 0,
      "AssetType": "string",
      "Created": "string",
      "Name": "string",
      "CreatedTime": DateTime,
      "ExpirationTime": DateTime,
    }
]
```

| Field | Type | Description |
| --- | --- | --- |
| `AssetId` | number | The asset ID. |
| `AssetType` | string | The asset type as a string. |
| `Created` | string | ISO 8601 timestamp of when the item was acquired. |
| `Name` | string | The display name of the item. |
| `CreatedTime` | DateTime | When the item was acquired, as a [[30 Official Roblox Docs/API Reference/Datatypes/DateTime\|DateTime]] value. |
| `ExpirationTime` | DateTime | Optional. The absolute time when the item's timed ownership expires. Only present for items acquired via a timed option. Absent for permanently owned items. |

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `assetTypes` | Array |  | The [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType\|Enum.AvatarAssetType]] that can will be checked for in the player's inventory. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/InventoryPages\|InventoryPages]] | An [[30 Official Roblox Docs/API Reference/Classes/InventoryPages\|InventoryPages]] object containing information about owned items matching the given asset types. |

*Code samples for this member (`AvatarEditorService-GetInventoryAsync-TimedOptions`) are published on the source page; their code is not part of the open-source repo.*

### GetItemDetails

> [!warning] Deprecated
> This member is deprecated.

```lua
AvatarEditorService:GetItemDetails(itemId: int64, itemType: AvatarItemType): Dictionary
```

**Thread safety:** Unsafe · **Capabilities:** AssetRead · **Tags:** `Yields`, `Deprecated`

Deprecated in favor of [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetItemDetailsAsync|AvatarEditorService:GetItemDetailsAsync()]]. This method has the same behavior: it returns a table containing the item details for the given item. See [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetItemDetailsAsync|AvatarEditorService:GetItemDetailsAsync()]] for the response format.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `itemId` | int64 |  | The ID of the item whose details are being retrieved. |
| `itemType` | [[30 Official Roblox Docs/API Reference/Enums/AvatarItemType\|AvatarItemType]] |  | An enum value indicating the type of item whose details are being retrieved. |

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | A table containing the item info for the retrieved item. See above for a sample table. |

### GetItemDetailsAsync

```lua
AvatarEditorService:GetItemDetailsAsync(itemId: int64, itemType: AvatarItemType): Dictionary
```

**Thread safety:** Unsafe · **Capabilities:** AssetRead · **Tags:** `Yields`

This function returns the item details for the given item. It accepts two parameters - the first indicating the ID of the item being retrieved and the second indicating its [[30 Official Roblox Docs/API Reference/Enums/AvatarItemType|Enum.AvatarItemType]].

The response includes all fields from Item Details Response (see above in summary), plus the following additional fields specific to single-item queries:

| Field | Type | Description |
| --- | --- | --- |
| `Owned` | boolean | Whether the item is owned by the current user. |
| `IsPurchasable` | boolean | Whether the item can be purchased by the current user. |
| `ExpectedSellerId` | number | The user ID of the lowest private seller if resellable, or the creator's target ID otherwise. Used when calling purchase APIs. |
| `CreatingUniverseId` | number | If this asset was created in an experience via the In-Experience Creation (IEC) pipeline, this is the universe ID of the creating experience. `nil` for standard catalog items. Use this to display attribution (e.g., "Created in [experience]") in your avatar editor UI. |
| `ExpirationTime` | DateTime | Optional. The absolute time when the item's timed ownership expires. Only present when the item is owned by the current user via a timed option. Absent for permanently owned items. |

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `itemId` | int64 |  | The ID of the item whose details are being retrieved. |
| `itemType` | [[30 Official Roblox Docs/API Reference/Enums/AvatarItemType\|AvatarItemType]] |  | An enum value indicating the type of item whose details are being retrieved. |

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | A table containing the item info for the retrieved item. |

*Code samples for this member (`AvatarEditorService-GetItemDetailsAsync-TimedOptions`) are published on the source page; their code is not part of the open-source repo.*

### GetOutfitDetails

> [!warning] Deprecated
> This member is deprecated.

```lua
AvatarEditorService:GetOutfitDetails(outfitId: int64): Dictionary
```

**Thread safety:** Unsafe · **Capabilities:** AssetRead · **Tags:** `Yields`, `Deprecated`

Deprecated in favor of [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetOutfitDetailsAsync|AvatarEditorService:GetOutfitDetailsAsync()]]. This method has the same behavior: it returns a table containing the outfit details for the given outfit. See [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetOutfitDetailsAsync|AvatarEditorService:GetOutfitDetailsAsync()]] for the response format.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `outfitId` | int64 |  | The ID of the outfit whose details are being retrieved. |

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | A table containing the outfit info for the retrieved outfit. See above for a sample table. |

### GetOutfitDetailsAsync

```lua
AvatarEditorService:GetOutfitDetailsAsync(outfitId: int64): Dictionary
```

**Thread safety:** Unsafe · **Capabilities:** AssetRead · **Tags:** `Yields`

This function returns the outfit details for the given outfit. It accepts one parameter: the ID of the outfit.

Data returns in the following format:

```lua
{
  "Assets": [
    {
      "AssetType": {
        "Id": 31,
        "Name": "RightLeg"
      },
      "CurrentVersionId": 16447385805,
      "Id": 11584239464,
      "Name": "Anime Female - Right Leg",
      "SupportsHeadShapes": false
    }
  ],
  "BodyColors": {
    "HeadColor": Color3(204, 142, 105),
    "LeftArmColor": Color3(204, 142, 105),
    "LeftLegColor": Color3(204, 142, 105),
    "RightArmColor": Color3(204, 142, 105),
    "RightLegColor": Color3(204, 142, 105),
    "TorsoColor": Color3(204, 142, 105)
  },
  "Id": 14703770624,
  "IsEditable": true,
  "Name": "Your Costume",
  "OutfitType": "Avatar",
  "PlayerAvatarType": "R15",
  "Scale": {
    "BodyType": 0,
    "Depth": 1,
    "Head": 1,
    "Height": 1,
    "Proportion": 0,
    "Width": 1
  },
}
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `outfitId` | int64 |  | The ID of the outfit whose details are being retrieved. |

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | A table containing the outfit info for the retrieved outfit. See above for a sample table. |

### GetOutfits

> [!warning] Deprecated
> This member is deprecated.

```lua
AvatarEditorService:GetOutfits(outfitSource: OutfitSource = All, outfitType: OutfitType = All): OutfitPages
```

**Thread safety:** Unsafe · **Capabilities:** Players, AssetRead · **Tags:** `Yields`, `Deprecated`

Deprecated in favor of [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetOutfitsAsync|AvatarEditorService:GetOutfitsAsync()]]. This method has the same behavior: it returns outfit data for the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer|Players.LocalPlayer]]. See [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetOutfitsAsync|AvatarEditorService:GetOutfitsAsync()]] for the response format.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `outfitSource` | [[30 Official Roblox Docs/API Reference/Enums/OutfitSource\|OutfitSource]] | `All` | An [[30 Official Roblox Docs/API Reference/Enums/OutfitSource\|Enum.OutfitSource]] filter specifying which outfits to include. Defaults to [[30 Official Roblox Docs/API Reference/Enums/OutfitSource\|Enum.OutfitSource.All]]. |
| `outfitType` | [[30 Official Roblox Docs/API Reference/Enums/OutfitType\|OutfitType]] | `All` | An [[30 Official Roblox Docs/API Reference/Enums/OutfitType\|Enum.OutfitType]] filter specifying the type of outfits to return. Defaults to [[30 Official Roblox Docs/API Reference/Enums/OutfitType\|Enum.OutfitType.All]]. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/OutfitPages\|OutfitPages]] | An [[30 Official Roblox Docs/API Reference/Classes/OutfitPages\|OutfitPages]] object containing the outfit data for the local player. |

### GetOutfitsAsync

```lua
AvatarEditorService:GetOutfitsAsync(outfitSource: OutfitSource = All, outfitType: OutfitType = All): OutfitPages
```

**Thread safety:** Unsafe · **Capabilities:** Players, AssetRead · **Tags:** `Yields`

This function returns outfit data for the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer|Players.LocalPlayer]]. This would be used with [[30 Official Roblox Docs/API Reference/Classes/Players#GetHumanoidDescriptionFromOutfitIdAsync|Players:GetHumanoidDescriptionFromOutfitIdAsync()]] to update the players character to the outfit. Access to this would also depend on [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptAllowInventoryReadAccess|AvatarEditorService:PromptAllowInventoryReadAccess()]] being accepted by the user.

The returned table includes the following fields:

```lua
[
    {
      "Id": 0,
      "Name": "string",
      "IsEditable": true
    }
]
```

| Name | type | Description |
| --- | --- | --- |
| id | int |  |
| name | string |  |
| isEditable | boolean |  |

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `outfitSource` | [[30 Official Roblox Docs/API Reference/Enums/OutfitSource\|OutfitSource]] | `All` | An [[30 Official Roblox Docs/API Reference/Enums/OutfitSource\|Enum.OutfitSource]] filter specifying which outfits to include. Defaults to [[30 Official Roblox Docs/API Reference/Enums/OutfitSource\|Enum.OutfitSource.All]]. |
| `outfitType` | [[30 Official Roblox Docs/API Reference/Enums/OutfitType\|OutfitType]] | `All` | An [[30 Official Roblox Docs/API Reference/Enums/OutfitType\|Enum.OutfitType]] filter specifying the type of outfits to return. Defaults to [[30 Official Roblox Docs/API Reference/Enums/OutfitType\|Enum.OutfitType.All]]. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/OutfitPages\|OutfitPages]] | An [[30 Official Roblox Docs/API Reference/Classes/OutfitPages\|OutfitPages]] object containing the outfit data for the local player. |

### GetRecommendedAssets

> [!warning] Deprecated
> This member is deprecated.

```lua
AvatarEditorService:GetRecommendedAssets(assetType: AvatarAssetType, contextAssetId: int64 = 0): Array
```

**Thread safety:** Unsafe · **Capabilities:** AssetRead · **Tags:** `Yields`, `Deprecated`

Deprecated in favor of [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetRecommendedAssetsAsync|AvatarEditorService:GetRecommendedAssetsAsync()]]. This method has the same behavior: it returns a list of recommended assets based on the given [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType|Enum.AvatarAssetType]] and context asset ID. See [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetRecommendedAssetsAsync|AvatarEditorService:GetRecommendedAssetsAsync()]] for the response format.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `assetType` | [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType\|AvatarAssetType]] |  | The type of asset recommendations to retrieve recommendations for. Only affects the response when item based recommendations don't exist for the given `contextAssetId`. |
| `contextAssetId` | int64 | `0` | The ID of an asset with a type matching the provided assetType used for context when retrieving recommendations. |

**Returns**

| Type | Description |
| --- | --- |
| Array | A list of recommendations based on the given [[30 Official Roblox Docs/API Reference/Enums/AssetType\|Enum.AssetType]]. |

*Code samples for this member (`getting-a-hat-recommendation`) are published on the source page; their code is not part of the open-source repo.*

### GetRecommendedAssetsAsync

```lua
AvatarEditorService:GetRecommendedAssetsAsync(assetType: AvatarAssetType, contextAssetId: int64 = 0): Array
```

**Thread safety:** Unsafe · **Capabilities:** AssetRead · **Tags:** `Yields`

Returns a list of recommended assets based on a given [[30 Official Roblox Docs/API Reference/Enums/AssetType|Enum.AssetType]] and asset ID. Use this to gather a list of similar assets to the asset provided. Take a look at the code sample below for more information on possible usages for this function.

Data is in the format:

```lua
[
    {
      "Item": {
        "AssetId": 0,
        "Name": "string",
        "Price": 0,
        "PremiumPrice": 0
      },
      "Creator": {
        "CreatorId": 0,
        "CreatorType": "string",
        "Name": "string"
      },
      "Product": {
        "Id": 0,
        "PriceInRobux": 0,
        "IsForSale": true,
        "IsResellable": true,
        "IsLimited": true,
        "IsLimitedUnique": true,
        "TotalPrivateSales": 0,
        "OffsaleDeadline": "string",
        "IsFree": true
      }
    }
]
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `assetType` | [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType\|AvatarAssetType]] |  | The type of asset recommendations to retrieve recommendations for. Only affects the response when item based recommendations don't exist for the given `contextAssetId`. |
| `contextAssetId` | int64 | `0` | The ID of an asset with a type matching the provided assetType used for context when retrieving recommendations. |

**Returns**

| Type | Description |
| --- | --- |
| Array | A list of recommendations based on the given [[30 Official Roblox Docs/API Reference/Enums/AssetType\|Enum.AssetType]]. |

*Code samples for this member (`getting-a-hat-recommendation`) are published on the source page; their code is not part of the open-source repo.*

### GetRecommendedBundles

> [!warning] Deprecated
> This member is deprecated.

```lua
AvatarEditorService:GetRecommendedBundles(bundleId: int64): Array
```

**Thread safety:** Unsafe · **Capabilities:** AssetRead · **Tags:** `Yields`, `Deprecated`

Deprecated in favor of [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetRecommendedBundlesAsync|AvatarEditorService:GetRecommendedBundlesAsync()]]. This method has the same behavior: it returns a list of recommended bundles for a given bundle ID. See [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetRecommendedBundlesAsync|AvatarEditorService:GetRecommendedBundlesAsync()]] for the response format.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `bundleId` | int64 |  | A list of recommended bundles. |

**Returns**

| Type | Description |
| --- | --- |
| Array | The bundle ID that the recommended bundles will be returned for. |

### GetRecommendedBundlesAsync

```lua
AvatarEditorService:GetRecommendedBundlesAsync(bundleId: int64): Array
```

**Thread safety:** Unsafe · **Capabilities:** AssetRead · **Tags:** `Yields`

This function returns a list of recommended bundles for a given bundle id.

Data is in the format:

```lua
[
    {
      "Id": 0,
      "Name": "string",
      "Description": "string",
      "BundleType": "string",
      "Items": [
        {
          "Owned": true,
          "Id": 0,
          "Name": "string",
          "Type": "string",
          "AssetType": "string",
          "SupportsHeadShapes": false
        }
      ],
      "Creator": {
        "Id": 0,
        "Name": "string",
        "Type": "string"
      },
      "Product": {
        "Id": 0,
        "Type": "string",
        "IsPublicDomain": true,
        "IsForSale": true,
        "PriceInRobux": 0,
        "PremiumPricing": {
          "PremiumDiscountPercentage": 0,
          "PremiumPriceInRobux": 0
        }
      }
    }
]
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `bundleId` | int64 |  | A list of recommended bundles. |

**Returns**

| Type | Description |
| --- | --- |
| Array | The bundle ID that the recommended bundles will be returned for. |

### PromptAllowInventoryReadAccess

```lua
AvatarEditorService:PromptAllowInventoryReadAccess(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Players, AssetRead

Prompts the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer|Players.LocalPlayer]] to allow the developer to read what items the user has in their inventory and other avatar editor related information. The prompt needs to be confirmed by the user for the developer to use [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetInventoryAsync|AvatarEditorService:GetInventoryAsync()]], [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetOutfitsAsync|AvatarEditorService:GetOutfitsAsync()]] and [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetFavoriteAsync|AvatarEditorService:GetFavoriteAsync()]]. Permission does not persist between sessions.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### PromptCreateOutfit

```lua
AvatarEditorService:PromptCreateOutfit(outfit: HumanoidDescription, rigType: HumanoidRigType, outfitOptions: Dictionary = nil, outfitType: Variant): ()
```

**Thread safety:** Unsafe · **Capabilities:** Players, PlatformAvatarEditing

Prompts the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer|Players.LocalPlayer]] to save the given [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] as an outfit. Does not yield. The result can be retrieved by listening to the [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptCreateOutfitCompleted|AvatarEditorService.PromptCreateOutfitCompleted]] event.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `outfit` | [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] |  | The `Outfit` that the player will be prompted to created. |
| `rigType` | [[30 Official Roblox Docs/API Reference/Enums/HumanoidRigType\|HumanoidRigType]] |  | The [[30 Official Roblox Docs/API Reference/Enums/HumanoidRigType\|Enum.HumanoidRigType]] that the outfit will be created for if the player confirms the prompt. |
| `outfitOptions` | Dictionary | `nil` | Reserved for future options. Must be empty or omitted. |
| `outfitType` | Variant |  | Optional [[30 Official Roblox Docs/API Reference/Enums/OutfitType\|Enum.OutfitType]]. Only `Avatar` and `Makeup` values are accepted. When omitted, the type is inferred from the description. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### PromptDeleteOutfit

```lua
AvatarEditorService:PromptDeleteOutfit(outfitId: int64): ()
```

**Thread safety:** Unsafe · **Capabilities:** Players, PlatformAvatarEditing

Prompts the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer|Players.LocalPlayer]] to delete the given outfit. Does not yield. The result can be retrieved by listening to the [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptDeleteOutfitCompleted|AvatarEditorService.PromptDeleteOutfitCompleted]] event.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `outfitId` | int64 |  | The outfitId of the outfit to delete. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### PromptRenameOutfit

```lua
AvatarEditorService:PromptRenameOutfit(outfitId: int64): ()
```

**Thread safety:** Unsafe · **Capabilities:** Players, PlatformAvatarEditing

Prompts the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer|Players.LocalPlayer]] to rename the given outfit. Does not yield. The result can be retrieved by listening to the [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptRenameOutfitCompleted|AvatarEditorService.PromptRenameOutfitCompleted]] event.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `outfitId` | int64 |  | The outfitId of the outfit to rename. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### PromptSaveAvatar

```lua
AvatarEditorService:PromptSaveAvatar(humanoidDescription: HumanoidDescription, rigType: HumanoidRigType): ()
```

**Thread safety:** Unsafe · **Capabilities:** Players, PlatformAvatarEditing

This function prompts the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer|Players.LocalPlayer]] to update their avatar based on the given [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] and [[30 Official Roblox Docs/API Reference/Enums/HumanoidRigType|Enum.HumanoidRigType]] (R6 or R15). Does not yield and can get the result by listening to the PromptSaveAvatarCompleted event. This is similar to how other prompts such as PromptPurchase work.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `humanoidDescription` | [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] |  | The given [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] being prompted to save. |
| `rigType` | [[30 Official Roblox Docs/API Reference/Enums/HumanoidRigType\|HumanoidRigType]] |  | The [[30 Official Roblox Docs/API Reference/Enums/HumanoidRigType\|Enum.HumanoidRigType]] that the avatar will be saved for if the player confirms the prompt. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### PromptSetFavorite

```lua
AvatarEditorService:PromptSetFavorite(itemId: int64, itemType: AvatarItemType, shouldFavorite: boolean): ()
```

**Thread safety:** Unsafe · **Capabilities:** Players, PlatformAvatarEditing

This function prompts the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer|Players.LocalPlayer]] to favorite or unfavorite the given asset or bundle.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `itemId` | int64 |  | The ItemId of the item being prompted to favorite. |
| `itemType` | [[30 Official Roblox Docs/API Reference/Enums/AvatarItemType\|AvatarItemType]] |  | The type of item being prompted to favorite. |
| `shouldFavorite` | boolean |  | Whether to favorite (`true`) or unfavorite (`false`) the item. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### PromptUpdateOutfit

```lua
AvatarEditorService:PromptUpdateOutfit(outfitId: int64, updatedOutfit: HumanoidDescription, rigType: HumanoidRigType): ()
```

**Thread safety:** Unsafe · **Capabilities:** Players, PlatformAvatarEditing

Prompts the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer|Players.LocalPlayer]] to update the given outfit with the given HumanoidDescription.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `outfitId` | int64 |  | The outfitId of the outfit to update. |
| `updatedOutfit` | [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] |  | A [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] that represents the new outfit data. |
| `rigType` | [[30 Official Roblox Docs/API Reference/Enums/HumanoidRigType\|HumanoidRigType]] |  | The [[30 Official Roblox Docs/API Reference/Enums/HumanoidRigType\|Enum.HumanoidRigType]] to update the outfit to. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SearchCatalog

> [!warning] Deprecated
> This member is deprecated.

```lua
AvatarEditorService:SearchCatalog(searchParameters: CatalogSearchParams): CatalogPages
```

**Thread safety:** Unsafe · **Capabilities:** AssetRead · **Tags:** `Yields`, `Deprecated`

Deprecated in favor of [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#SearchCatalogAsync|AvatarEditorService:SearchCatalogAsync()]]. This method has the same behavior: it returns a [[30 Official Roblox Docs/API Reference/Classes/CatalogPages|CatalogPages]] object containing the result of the given search. See [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#SearchCatalogAsync|AvatarEditorService:SearchCatalogAsync()]] for details on the response format.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `searchParameters` | [[30 Official Roblox Docs/API Reference/Datatypes/CatalogSearchParams\|CatalogSearchParams]] |  | An object containing the parameters used for the search. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/CatalogPages\|CatalogPages]] | A [[30 Official Roblox Docs/API Reference/Classes/CatalogPages\|CatalogPages]] object containing the search results. |

### SearchCatalogAsync

```lua
AvatarEditorService:SearchCatalogAsync(searchParameters: CatalogSearchParams): CatalogPages
```

**Thread safety:** Unsafe · **Capabilities:** AssetRead · **Tags:** `Yields`

This function returns a [[30 Official Roblox Docs/API Reference/Classes/CatalogPages|CatalogPages]] object containing the result of the given search.

Each item in the returned pages uses the Item Details Response format (see above in summary), including the `TimedOptions` field for assets that support timed ownership.

Use [[30 Official Roblox Docs/API Reference/Enums/SalesTypeFilter|Enum.SalesTypeFilter.TimedOptions]] in [[30 Official Roblox Docs/API Reference/Datatypes/CatalogSearchParams|CatalogSearchParams]] to filter results to only items with timed options available.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `searchParameters` | [[30 Official Roblox Docs/API Reference/Datatypes/CatalogSearchParams\|CatalogSearchParams]] |  | An object containing the parameters used for the search. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/CatalogPages\|CatalogPages]] | A [[30 Official Roblox Docs/API Reference/Classes/CatalogPages\|CatalogPages]] object containing the search results. |

*Code samples for this member (`AvatarEditorService-SearchCatalogAsync-TimedOptions`) are published on the source page; their code is not part of the open-source repo.*

## Events

### PromptAllowInventoryReadAccessCompleted

```lua
AvatarEditorService.PromptAllowInventoryReadAccessCompleted(result: AvatarPromptResult)
```

**Capabilities:** Players, AssetRead

This event fires when the [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptAllowInventoryReadAccess|AvatarEditorService:PromptAllowInventoryReadAccess()]] prompt is responded to by the user. It can only return the Success or PermissionDenied [[30 Official Roblox Docs/API Reference/Enums/AvatarPromptResult|enum]] statuses as it does not perform any web requests which could fail.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | [[30 Official Roblox Docs/API Reference/Enums/AvatarPromptResult\|AvatarPromptResult]] |  | The result of the prompt. |

### PromptCreateOutfitCompleted

```lua
AvatarEditorService.PromptCreateOutfitCompleted(result: AvatarPromptResult, failureType: Variant)
```

**Capabilities:** Players, PlatformAvatarEditing

This event fires when the PromptSaveOutfit operation is completed. It gives a status [[30 Official Roblox Docs/API Reference/Enums/AvatarPromptResult|enum]] indicating whether the prompt succeeded, failed or permission was not granted by the user.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | [[30 Official Roblox Docs/API Reference/Enums/AvatarPromptResult\|AvatarPromptResult]] |  | The result of the prompt. |
| `failureType` | Variant |  | An [[30 Official Roblox Docs/API Reference/Enums/CreateOutfitFailure\|Enum.CreateOutfitFailure]] value indicating the reason the outfit creation failed, or `nil` on success. |

*Code samples for this member (`AvatarEditorService-PromptCreateOutfitCompleted`) are published on the source page; their code is not part of the open-source repo.*

### PromptDeleteOutfitCompleted

```lua
AvatarEditorService.PromptDeleteOutfitCompleted(result: AvatarPromptResult)
```

**Capabilities:** Players, PlatformAvatarEditing

Fires when the PromptDeleteOutfit operation is completed. It gives a status [[30 Official Roblox Docs/API Reference/Enums/AvatarPromptResult|enum]] indicating whether the prompt succeeded, failed or permission was not granted by the user.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | [[30 Official Roblox Docs/API Reference/Enums/AvatarPromptResult\|AvatarPromptResult]] |  | The result of the prompt. |

### PromptRenameOutfitCompleted

```lua
AvatarEditorService.PromptRenameOutfitCompleted(result: AvatarPromptResult)
```

**Capabilities:** Players, PlatformAvatarEditing

Fires when the PromptRenameOutfit operation is completed. It gives a status [[30 Official Roblox Docs/API Reference/Enums/AvatarPromptResult|enum]] indicating whether the prompt succeeded, failed or permission was not granted by the user.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | [[30 Official Roblox Docs/API Reference/Enums/AvatarPromptResult\|AvatarPromptResult]] |  | The result of the prompt. |

### PromptSaveAvatarCompleted

```lua
AvatarEditorService.PromptSaveAvatarCompleted(result: AvatarPromptResult, humanoidDescription: HumanoidDescription)
```

**Capabilities:** Players, PlatformAvatarEditing

This event fires when the [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptSaveAvatar|AvatarEditorService:PromptSaveAvatar()]] operation is completed. It gives a status [[30 Official Roblox Docs/API Reference/Enums/AvatarPromptResult|enum]] indicating whether the prompt succeeded, failed or permission was not granted by the user.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | [[30 Official Roblox Docs/API Reference/Enums/AvatarPromptResult\|AvatarPromptResult]] |  | The result of the prompt. |
| `humanoidDescription` | [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] |  | The [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] that was saved (or attempted to be saved) to the platform avatar. |

### PromptSetFavoriteCompleted

```lua
AvatarEditorService.PromptSetFavoriteCompleted(result: AvatarPromptResult)
```

**Capabilities:** Players, PlatformAvatarEditing

Fires when the [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptSetFavorite|AvatarEditorService:PromptSetFavorite()]] operation is completed. It gives a status [[30 Official Roblox Docs/API Reference/Enums/AvatarPromptResult|enum]] indicating whether the prompt succeeded, failed or permission was not granted by the user.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | [[30 Official Roblox Docs/API Reference/Enums/AvatarPromptResult\|AvatarPromptResult]] |  | The result of the prompt. |

### PromptUpdateOutfitCompleted

```lua
AvatarEditorService.PromptUpdateOutfitCompleted(result: AvatarPromptResult)
```

**Capabilities:** Players, PlatformAvatarEditing

Fires when the [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptUpdateOutfit|AvatarEditorService:PromptUpdateOutfit()]] operation is completed. It gives a status [[30 Official Roblox Docs/API Reference/Enums/AvatarPromptResult|enum]] indicating whether the prompt succeeded, failed or permission was not granted by the user.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | [[30 Official Roblox Docs/API Reference/Enums/AvatarPromptResult\|AvatarPromptResult]] |  | The result of the prompt. |

---
*Source: [AvatarEditorService](https://create.roblox.com/docs/reference/engine/classes/AvatarEditorService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

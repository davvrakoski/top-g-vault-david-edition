---
title: "CommerceService"
description: "Supports real-world purchases that you can bundle with digital benefits."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/CommerceService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Supports real-world purchases that you can bundle with digital benefits.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

[[30 Official Roblox Docs/API Reference/Classes/CommerceService|CommerceService]] is a service that supports real-world purchases that you can bundle with virtual items. For information on eligibility and implementation, see [[30 Official Roblox Docs/Production/Monetization/Commerce products|Commerce products]].

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/CommerceService#GetCommerceProductInfoAsync\|GetCommerceProductInfoAsync()]] | Dictionary | Retrieves information about the commerce products you are selling in experience. |
| [[30 Official Roblox Docs/API Reference/Classes/CommerceService#PromptCommerceProductPurchase\|PromptCommerceProductPurchase()]] | () | Prompts a user to purchase a commerce product using the provided `commerceProductId`. Opens a webview that guides the user through the purchasing flow. |
| [[30 Official Roblox Docs/API Reference/Classes/CommerceService#PromptRealWorldCommerceBrowser\|PromptRealWorldCommerceBrowser()]] | () | Legacy endpoint that opens an in-experience browser to a real-world commerce URL for the specified player; superseded by [[30 Official Roblox Docs/API Reference/Classes/CommerceService#PromptCommerceProductPurchase\|CommerceService:PromptCommerceProductPurchase()]]. |
| [[30 Official Roblox Docs/API Reference/Classes/CommerceService#UserEligibleForRealWorldCommerceAsync\|UserEligibleForRealWorldCommerceAsync()]] | boolean | Legacy endpoint that returns whether the current user is eligible for real-world commerce; superseded by [[30 Official Roblox Docs/API Reference/Classes/PolicyService\|PolicyService]]. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/CommerceService#PromptCommerceProductPurchaseFinished\|PromptCommerceProductPurchaseFinished]] | `user`, `productId` | Fires when commerce purchase webview has closed - not an indicator that a purchase was successful. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### GetCommerceProductInfoAsync

```lua
CommerceService:GetCommerceProductInfoAsync(commerceProductId: string): Dictionary
```

**Thread safety:** Unsafe · **Capabilities:** Monetization · **Tags:** `Yields`

Retrieves information about the products that you are selling and surface them within your experience. How you surface products to your users is entirely up to you.

| Name | string | Localized name of of the physical item |
| --- | --- | --- |
| Description | string | Localized description of the physical item |
| IconImageAssetId | number | The image asset ID of main default image of the physical item |
| DisplayPrice | string | Localized price string with currency symbol of the physical item. e.g. “\$4.99“ |
| IsPurchasable | bool | If the item can be added to a merchant checkout session, i.e. item is in stock, or can be backordered |

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `commerceProductId` | string |  | The identifier of the commerce product to look up, either the numeric ID or the full `COM-`-prefixed form. |

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | A dictionary of information about the commerce product, including whether it `IsForSale`, an `Item` sub-table of display details (`Name`, `Description`, `IconImageAssetId`, `DisplayPrice`, and `IsPurchasable`), and the `Benefits` granted by purchasing it. |

### PromptCommerceProductPurchase

```lua
CommerceService:PromptCommerceProductPurchase(user: Player, commerceProductId: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** Monetization

Prompts a user to purchase a commerce product using the provided `commerceProductId`. Opens a webview that guides the user through the purchasing flow.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `user` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] to prompt with the purchase flow. When called from a client script, this must be the local player. |
| `commerceProductId` | string |  | The identifier of the commerce product to purchase, either the numeric ID or the full `COM-`-prefixed form. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### PromptRealWorldCommerceBrowser

```lua
CommerceService:PromptRealWorldCommerceBrowser(player: Player, url: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** Monetization

This is a legacy endpoint that is not meant for use. To open the webview to the purchasing flow for real world commerce, see [[30 Official Roblox Docs/API Reference/Classes/CommerceService#PromptCommerceProductPurchase|CommerceService:PromptCommerceProductPurchase]]. For more information, see [[30 Official Roblox Docs/Production/Monetization/Commerce products|Commerce products]]

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] for whom the browser opens. When called from a client script, this must be the local player. |
| `url` | string |  | The real-world commerce URL to open. The URL must be on the commerce allowlist, or the request is ignored. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### UserEligibleForRealWorldCommerceAsync

```lua
CommerceService:UserEligibleForRealWorldCommerceAsync(): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Monetization · **Tags:** `Yields`

This is a legacy endpoint that is not meant for use. To check if a user is eligible for real world commerce, see [[30 Official Roblox Docs/API Reference/Classes/PolicyService|PolicyService.IsEligibleToPurchaseCommerceProduct]]. For more information, see [[30 Official Roblox Docs/Production/Monetization/Commerce products|Commerce products]]

**Returns**

| Type | Description |
| --- | --- |
| boolean | `true` if the current user is eligible for real-world commerce. |

## Events

### PromptCommerceProductPurchaseFinished

```lua
CommerceService.PromptCommerceProductPurchaseFinished(user: Player, productId: string)
```

**Capabilities:** Monetization

Use this signal to detect when a user has completed the purchasing flow and the webview has closed to resume gameplay within the experience. **This signal does not indicate a successful purchase**, so do not grant virtual items solely from this signal.

While optional, it is recommended to use this signal to reorient your users on Android, as the commerce purchasing flow will have forced them into portrait mode.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `user` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] who was prompted with the purchase flow. |
| `productId` | string |  | The identifier of the commerce product whose purchase flow finished. |

---
*Source: [CommerceService](https://create.roblox.com/docs/reference/engine/classes/CommerceService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

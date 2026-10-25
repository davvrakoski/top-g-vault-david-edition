---
title: "GamePassService"
description: "A service associated with the legacy game pass system. Use `MarketplaceService` for all new work."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/GamePassService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A service associated with the legacy game pass system. Use [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService|MarketplaceService]] for all new work.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

The GamePassService is a service that supports legacy game passes using _Asset IDs_. [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService|MarketplaceService]] should be used for all new game passes.

For more information about game passes, please see [[30 Official Roblox Docs/Production/Monetization/Passes|Game Passes]].

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/GamePassService#PlayerHasPass\|PlayerHasPass()]] | boolean | **Deprecated.** Returns `true` if the [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] has the specified **legacy** game pass. Does not work with new game passes. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### PlayerHasPass

> [!warning] Deprecated
> This member is deprecated.

```lua
GamePassService:PlayerHasPass(player: Player, gamePassId: int64): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Monetization · **Tags:** `Yields`, `Deprecated`

This function will not work with new game passes; use [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#UserOwnsGamePassAsync|MarketplaceService:UserOwnsGamePassAsync()]] instead.

This function returns `true` if the [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] has the specified legacy game pass. The result of this function may be cached, meaning it should not be relied on to give an up to date result.

See [[30 Official Roblox Docs/Production/Monetization/Passes|Passes]] for further information.

#### Legacy Game Passes

Historically, game passes on Roblox had an **asset ID** associated with them. Although such game passes still have an asset ID, they now also have a **pass ID**. All new game passes created **only** have a pass ID.

Whether you are using an **Asset ID** or a **pass ID** determines which API members you can use.

|  | Asset ID (Legacy) | Pass ID (Current) |
| --- | --- | --- |
| Verify Ownership | [[30 Official Roblox Docs/API Reference/Classes/GamePassService#PlayerHasPass\|GamePassService:PlayerHasPass()]] | [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#UserOwnsGamePassAsync\|MarketplaceService:UserOwnsGamePassAsync()]] |
| Prompt a purchase | [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptPurchase\|MarketplaceService:PromptPurchase()]] | [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptGamePassPurchase\|MarketplaceService:PromptGamePassPurchase()]] |
| Prompted purchase finished | [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptPurchaseFinished\|MarketplaceService.PromptPurchaseFinished]] | [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptGamePassPurchaseFinished\|MarketplaceService.PromptGamePassPurchaseFinished]] |

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] for which to check ownership. |
| `gamePassId` | int64 |  | The _Asset ID_ of the game pass. This is **not** the _Game Pass ID_ (see above). |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] owns the game pass. |

*Code samples for this member (`GamePassService-PlayerHasPass1`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [GamePassService](https://create.roblox.com/docs/reference/engine/classes/GamePassService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

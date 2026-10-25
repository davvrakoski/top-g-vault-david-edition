---
title: "Avatar Editor Service"
description: "The Avatar Editor Service allows access to a user's avatar and inventory and Marketplace."
area: "30 Official Roblox Docs"
cluster: "Players"
source: "https://create.roblox.com/docs/players/avatar-editor"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The Avatar Editor Service allows access to a user's avatar and inventory and Marketplace.*

The Avatar Editor Service lets you access and make changes to a user's avatar within a game. The Avatar Editor Service can also access a user's inventory and the [Marketplace](https://www.roblox.com/catalog) to save outfits and purchase avatar items to the user's account.

We recommend implementing the Avatar Editor Service with an in-game avatar editor for a complete character customization experience. See the [Simple Avatar Editor Demo](https://www.roblox.com/games/9376329300/Simple-Avatar-Editor-Demo) reference place for an example of this feature.

To begin using the Avatar Editor Service, you must first [[30 Official Roblox Docs/Players/Avatar Editor Service#Request access|request access]] to the user's inventory. After access is successfully granted, you can perform the following actions:

- [[30 Official Roblox Docs/Players/Avatar Editor Service#Read user inventory|Read user's inventory]] to get a list of items owned by the user.
- [[30 Official Roblox Docs/Players/Avatar Editor Service#Search the Marketplace|Search the Marketplace]], using a variety of properties to filter and sort.
- [[30 Official Roblox Docs/Players/Avatar Editor Service#Save avatars and outfits|Equip avatar items and save outfits]] to the user's avatar.
- [[30 Official Roblox Docs/Players/Avatar Editor Service#Purchase items|Prompt the user to purchase]] an Marketplace item.

## Request access

To begin accessing a user's inventory, you need to prompt the user to allow access through [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptAllowInventoryReadAccess|PromptAllowInventoryReadAccess()]]. You need to perform this request once per session.

Use the following code sample to initiate the access prompt and listen for the user response:

```lua
local AvatarEditorService = game:GetService("AvatarEditorService")

AvatarEditorService:PromptAllowInventoryReadAccess()

local result = AvatarEditorService.PromptAllowInventoryReadAccessCompleted:Wait()

if result == Enum.AvatarPromptResult.Success then
  -- Access granted!
end
```

The user receives the following prompt:

*(image in the full Top G Vault)*

Once the user accepts the prompt, the [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService|AvatarEditorService]] can begin accessing the user's inventory.

## Read user inventory

Once access is granted by the user, you can read their inventory with the [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetInventory|GetInventory()]] function, supplying an array of [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType|AvatarAssetTypes]] to filter by. This function returns an [[30 Official Roblox Docs/API Reference/Classes/InventoryPages|InventoryPages]] object containing the user owned items.

Use the following code sample to print a list of specific accessories in a user's inventory:

```lua
local AvatarEditorService = game:GetService("AvatarEditorService")

AvatarEditorService:PromptAllowInventoryReadAccess()

local result = AvatarEditorService.PromptAllowInventoryReadAccessCompleted:Wait()

if result == Enum.AvatarPromptResult.Success then
  -- Access granted!
  local assetTypes = {
    Enum.AvatarAssetType.BackAccessory,
    Enum.AvatarAssetType.ShoulderAccessory,
    Enum.AvatarAssetType.WaistAccessory
  }
  local pagesObject = AvatarEditorService:GetInventory(assetTypes)
  local currentPage = pagesObject:GetCurrentPage()
  for _, item in currentPage do
    print(item)
  end
end
```

## Search the Marketplace

[[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService|AvatarEditorService]] includes functions and events which let you search the Roblox catalog. To search, supply your query with a [[30 Official Roblox Docs/API Reference/Datatypes/CatalogSearchParams|CatalogSearchParams]] object that includes one or more of the following properties:

| Property | Description |
| --- | --- |
| AssetTypes | An array of [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType\|Enum.AvatarAssetType]] such as Enum.AvatarAssetType.BackAccessory. |
| BundleTypes | An array of [[30 Official Roblox Docs/API Reference/Enums/BundleType\|Enum.BundleType]] such as Enum.BundleType.BodyParts. |
| CategoryFilter | A [[30 Official Roblox Docs/API Reference/Enums/CatalogCategoryFilter\|Enum.CatalogCategoryFilter]] describing the various catalog categories like "Featured" or "Community Creations". By default this is set to [[30 Official Roblox Docs/API Reference/Enums/CatalogCategoryFilter\|Enum.CatalogCategoryFilter.None]] |
| MaxPrice | An integer describing the maximum price to filter. |
| MinPrice | An integer describing the minimum price to filter. By default, MinPrice is **0**. |
| SearchKeyword | A string to query against item descriptions in the catalog. |
| SortType | A [[30 Official Roblox Docs/API Reference/Enums/CatalogSortType\|Enum.CatalogSortType]] that describes how the results are ordered. By default this is set to [[30 Official Roblox Docs/API Reference/Enums/CatalogSortType\|Enum.CatalogSortType.Relevance]]. |
| IncludeOffSale | A boolean describing whether the results of the search include off sale items. By default this is set to false. |
| CreatorId | An integer to specify a given creator. You can use either a UserId or a GroupId. |
| CreatorName | A string used to search by items created by a given creator. You can use either a User Name or a Group Name. |

The following code sample constructs a [[30 Official Roblox Docs/API Reference/Datatypes/CatalogSearchParams|CatalogSearchParams]] object for **Back** and **Shoulder** asset types, and passes that through a [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#SearchCatalog|SearchCatalog()]] call:

```lua
local AvatarEditorService = game:GetService("AvatarEditorService")

local catalogSearchParams = CatalogSearchParams.new()
local assetTypes = {
  Enum.AvatarAssetType.BackAccessory,
  Enum.AvatarAssetType.ShoulderAccessory
}
catalogSearchParams.AssetTypes = assetTypes

local pagesObject =
--This function returns a CatalogPages object containing the results.
AvatarEditorService:SearchCatalog(catalogSearchParams)
local currentPage = pagesObject:GetCurrentPage()
for _, item in currentPage do
  print(item)
end
```

## Save avatars and outfits

When used alongside an in-game avatar editor, [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService|AvatarEditorService]] can save and update avatar items and outfits to the Roblox platform. Users don't receive catalog items they don't own when saving an avatar or outfit.

Any [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] can be saved to the user's current avatar with [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptSaveAvatar|PromptSaveAvatar()]]. This may include:

- Pre-defined avatar configurations that you've built using existing catalog items.
- Any configuration that the user has chosen through an in-game avatar editor.

*(image in the full Top G Vault)*

Since [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptSaveAvatar|AvatarEditorService:PromptSaveAvatar()]] does not yield, you can get the result by listening to the [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptSaveAvatarCompleted|AvatarEditorService.PromptSaveAvatarCompleted]] event.

The following code will save a current [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] using [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptSaveAvatar|PromptSaveAvatar()]] and checks for a successful [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptSaveAvatarCompleted|AvatarEditorService.PromptSaveAvatarCompleted]] event:

```lua
local AvatarEditorService = game:GetService("AvatarEditorService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local currentDescription = humanoid:GetAppliedDescription()
AvatarEditorService:PromptSaveAvatar(currentDescription, humanoid.RigType)

local result = AvatarEditorService.PromptSaveAvatarCompleted:Wait()
if result == Enum.AvatarPromptResult.Success then
  -- Avatar saved!
end
```

To save any [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] as an outfit (without overwriting the user's current avatar), use [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptCreateOutfit|AvatarEditorService:PromptCreateOutfit()]].

*(image in the full Top G Vault)*

Once called, you can get the result of [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptCreateOutfit|AvatarEditorService:PromptCreateOutfit()]] by listening to the [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptCreateOutfitCompleted|AvatarEditorService.PromptCreateOutfitCompleted]] event.

The following code sample creates an outfit with [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptCreateOutfit|AvatarEditorService:PromptCreateOutfit()]] and listens for a successful [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptCreateOutfitCompleted|AvatarEditorService.PromptCreateOutfitCompleted]] event:

```lua
local AvatarEditorService = game:GetService("AvatarEditorService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local currentDescription = humanoid:GetAppliedDescription()
AvatarEditorService:PromptCreateOutfit(currentDescription, humanoid.RigType)

local result = AvatarEditorService.PromptCreateOutfitCompleted:Wait()
if result == Enum.AvatarPromptResult.Success then
  -- Outfit saved!
end
```

## Purchase items

When saving either an avatar or an outfit that uses catalog items, the user doesn't receive any items that they do not own. Before saving an avatar or outfit, check if the user owns the asset with [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PlayerOwnsAsset|MarketplaceService:PlayerOwnsAsset()]] and provide them with an option to purchase the item with [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptPurchase|MarketplaceService:PromptPurchase()]].

If you don't wish to implement item purchases, you can instead allow users to favorite non-owned items with [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#PromptSetFavorite|AvatarEditorService:PromptSetFavorite()]].

> [!info]
> Be aware that you can't earn Robux [[30 Official Roblox Docs/Marketplace/Marketplace fees and commissions#Commissions|commissions]] if the user decides to purchase those items outside of your game.

---
*Source: [Avatar Editor Service](https://create.roblox.com/docs/players/avatar-editor) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

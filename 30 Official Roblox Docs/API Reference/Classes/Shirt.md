---
title: "Shirt"
description: "Displays a shirt texture on a `Humanoid` rig."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Shirt"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Displays a shirt texture on a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] rig.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Clothing|Clothing]] → [[30 Official Roblox Docs/API Reference/Classes/CharacterAppearance|CharacterAppearance]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

The `Shirt` object displays a shirt texture from Roblox on a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] rig. Shirts cover the torso and arms, and will take priority over a [[30 Official Roblox Docs/API Reference/Classes/Pants|Pants]] on the torso. To be visible, a `Shirt` must be a sibling of a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] and have its [[30 Official Roblox Docs/API Reference/Classes/Shirt#ShirtTemplate|ShirtTemplate]] property set to an appropriate texture such as `rbxassetid://86896487`. The shirt texture may be colorized using the [[30 Official Roblox Docs/API Reference/Classes/Clothing#Color3|Clothing.Color3]] property.

Shirts are automatically loaded on [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] characters if their avatar is wearing one.

*Code samples for this API (`Shirt-Pants`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/Shirt); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Shirt#ShirtTemplate\|ShirtTemplate]] | ContentId | Determines the texture of the [[30 Official Roblox Docs/API Reference/Classes/Shirt\|Shirt]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Shirt#ShirtTemplateContent\|ShirtTemplateContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | Specifies the asset URI of the shirt texture. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Clothing|Clothing]], [[30 Official Roblox Docs/API Reference/Classes/CharacterAppearance|CharacterAppearance]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### ShirtTemplate

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

The content ID link pointing to the shirt template hosted on Roblox.

This content ID is different than the website URL of the shirt. It can be found by pasting the website URL of the shirt into the **ShirtTemplate** property in Studio. Alternatively, [[30 Official Roblox Docs/API Reference/Classes/InsertService#LoadAsset|InsertService:LoadAsset()]] can be used to insert the shirt into the workspace, for example:

```
local InsertService = game:GetService("InsertService")
local Workspace = game:GetService("Workspace")

local webURL = "https://www.roblox.com/catalog/1804747/White-Shirt"
local assetId = tonumber(string.match(webURL, "%d+") or 0)  -- Extract the number
local success, model = pcall(function()
	return InsertService:LoadAsset(assetId)
end)
if success then
	model.Parent = Workspace
end
```

See also [[30 Official Roblox Docs/API Reference/Classes/ShirtGraphic#Graphic|ShirtGraphic.Graphic]] for the image applied to T-shirts.

*Code samples for this member (`Shirt-Pants`) are published on the source page; their code is not part of the open-source repo.*

### ShirtTemplateContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

Specifies the shirt texture using an [asset URI](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/index.md). Although this property uses Datatype.Content, it does not support [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]] objects.

Setting `ShirtTemplateContent` updates [[30 Official Roblox Docs/API Reference/Classes/Shirt#ShirtTemplate|Shirt.ShirtTemplate]]; likewise, setting `ShirtTemplate` updates this property. Both share the same clothing texture data.

---
*Source: [Shirt](https://create.roblox.com/docs/reference/engine/classes/Shirt) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

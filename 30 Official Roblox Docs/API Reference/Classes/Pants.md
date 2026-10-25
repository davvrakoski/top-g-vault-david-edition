---
title: "Pants"
description: "Displays a Pants texture from the Roblox website to display on a `Humanoid` rig."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Pants"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Displays a Pants texture from the Roblox website to display on a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] rig.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Clothing|Clothing]] → [[30 Official Roblox Docs/API Reference/Classes/CharacterAppearance|CharacterAppearance]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

The `Pants` object displays a pants texture from Roblox on a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] rig. Pants cover the torso and legs, and will be covered by a [[30 Official Roblox Docs/API Reference/Classes/Shirt|Shirt]] on the torso. To be visible, a `Pants` must be a sibling of a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] and have its [[30 Official Roblox Docs/API Reference/Classes/Pants#PantsTemplate|PantsTemplate]] property set to an appropriate texture such as `rbxassetid://86896501`. The pants texture may be colorized using the [[30 Official Roblox Docs/API Reference/Classes/Clothing#Color3|Clothing.Color3]] property.

Pants are automatically loaded on [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] characters if their avatar is wearing one.

*Code samples for this API (`Shirt-Pants`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/Pants); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Pants#PantsTemplate\|PantsTemplate]] | ContentId | Determines the texture of the [[30 Official Roblox Docs/API Reference/Classes/Pants\|Pants]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Pants#PantsTemplateContent\|PantsTemplateContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | Specifies the asset URI of the pants texture. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Clothing|Clothing]], [[30 Official Roblox Docs/API Reference/Classes/CharacterAppearance|CharacterAppearance]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### PantsTemplate

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

The content ID link pointing to the pants template hosted on Roblox.

This content ID is different than the website URL of the pants. It can be found by pasting the website URL of the pants into the **PantsTemplate** property in Studio. Alternatively, [[30 Official Roblox Docs/API Reference/Classes/InsertService#LoadAsset|InsertService:LoadAsset()]] can be used to insert the pants into the workspace, for example:

```
local InsertService = game:GetService("InsertService")
local Workspace = game:GetService("Workspace")

local webURL = "https://www.roblox.com/catalog/1804739/Jeans"
local assetId = tonumber(string.match(webURL, "%d+") or 0)  -- Extract the number
local success, model = pcall(function()
	return InsertService:LoadAsset(assetId)
end)
if success then
	model.Parent = Workspace
end
```

For a [[30 Official Roblox Docs/API Reference/Classes/Shirt|Shirt]] object's template, see [[30 Official Roblox Docs/API Reference/Classes/Shirt#ShirtTemplate|Shirt.ShirtTemplate]].

*Code samples for this member (`Shirt-Pants`) are published on the source page; their code is not part of the open-source repo.*

### PantsTemplateContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

Specifies the pants texture using an [asset URI](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/index.md). Although this property uses Datatype.Content, it does not support [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]] objects.

Setting either `PantsTemplateContent` or [[30 Official Roblox Docs/API Reference/Classes/Pants#PantsTemplate|Pants.PantsTemplate]] updates the other; both reflect the same texture.

---
*Source: [Pants](https://create.roblox.com/docs/reference/engine/classes/Pants) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

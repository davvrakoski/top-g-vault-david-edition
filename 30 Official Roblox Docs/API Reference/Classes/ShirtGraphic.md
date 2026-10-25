---
title: "ShirtGraphic"
description: "Applies a texture to the front surface of a character's torso, used to display t-shirts."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ShirtGraphic"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Applies a texture to the front surface of a character's torso, used to display t-shirts.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/CharacterAppearance|CharacterAppearance]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

The **ShirtGraphic** object applies a texture to the front surface of a character's torso. It is used to display t-shirts.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ShirtGraphic#Color3\|Color3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Determines the colorization to be applied to the [[30 Official Roblox Docs/API Reference/Classes/ShirtGraphic\|ShirtGraphic]] texture. |
| [[30 Official Roblox Docs/API Reference/Classes/ShirtGraphic#Graphic\|Graphic]] | ContentId | The content ID link pointing to the [[30 Official Roblox Docs/API Reference/Classes/ShirtGraphic\|ShirtGraphic]] texture hosted on the Roblox website. This property sets the texture associated with a t-shirt. |
| [[30 Official Roblox Docs/API Reference/Classes/ShirtGraphic#TextureContent\|TextureContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | Specifies the asset URI of the t-shirt texture. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/CharacterAppearance|CharacterAppearance]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Color3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

This property determines the colorization to be applied to the [[30 Official Roblox Docs/API Reference/Classes/ShirtGraphic|ShirtGraphic]] texture. It functions similarly to [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#ImageColor3|ImageLabel.ImageColor3]] except that it is applied to [[30 Official Roblox Docs/API Reference/Classes/ShirtGraphic|ShirtGraphic]] textures. This is useful for creating shirt graphics that have many different color variations but share the same basic look.

See also:

- [[30 Official Roblox Docs/API Reference/Classes/Clothing#Color3|Clothing.Color3]] which determines the colorization to be applied to the [[30 Official Roblox Docs/API Reference/Classes/Clothing|Clothing]] texture

### Graphic

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

The content ID link pointing to the [[30 Official Roblox Docs/API Reference/Classes/ShirtGraphic|ShirtGraphic]] texture hosted on the Roblox website. This property sets the texture associated with a t-shirt.

#### Finding the ID

This content ID is different than the website URL of the t-shirt. It can be found by pasting the website URL of the t-shirt into the **Graphic** property of the [[30 Official Roblox Docs/API Reference/Classes/ShirtGraphic|ShirtGraphic]] in Roblox Studio, as Studio will correct it. Alternatively [[30 Official Roblox Docs/API Reference/Classes/InsertService#LoadAsset|InsertService:LoadAsset()]] can be used to insert the t-shirt into the workspace, for example:

*Code samples for this member (`ShirtGraphic-Graphic`) are published on the source page; their code is not part of the open-source repo.*

### TextureContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

Specifies the t-shirt texture using an [asset URI](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/index.md). Although this property uses Datatype.Content, it does not support [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]] objects.

Setting either `TextureContent` or [[30 Official Roblox Docs/API Reference/Classes/ShirtGraphic#Graphic|ShirtGraphic.Graphic]] updates the other; both share the same texture data.

---
*Source: [ShirtGraphic](https://create.roblox.com/docs/reference/engine/classes/ShirtGraphic) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

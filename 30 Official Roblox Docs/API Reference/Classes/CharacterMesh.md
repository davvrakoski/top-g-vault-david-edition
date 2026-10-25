---
title: "CharacterMesh"
description: "Modifies the appearance of an R6 body part."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/CharacterMesh"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Modifies the appearance of an R6 body part.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/CharacterAppearance|CharacterAppearance]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

This property modifies the appearance of an R6 body part. It has no effect in R15 characters.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/CharacterMesh#BaseTextureContent\|BaseTextureContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | The base texture applied to the mesh, as a [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] value. |
| [[30 Official Roblox Docs/API Reference/Classes/CharacterMesh#BaseTextureId\|BaseTextureId]] | int64 | The texture of a CharacterMesh. It can be overridden by Shirts, Pants, T-Shirts, and the [[30 Official Roblox Docs/API Reference/Classes/CharacterMesh#OverlayTextureId\|CharacterMesh.OverlayTextureId]] property. |
| [[30 Official Roblox Docs/API Reference/Classes/CharacterMesh#BodyPart\|BodyPart]] | [[30 Official Roblox Docs/API Reference/Enums/BodyPart\|BodyPart]] | The part of the Character's body that is affected. |
| [[30 Official Roblox Docs/API Reference/Classes/CharacterMesh#MeshContent\|MeshContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | The mesh applied to the body part given by [[30 Official Roblox Docs/API Reference/Classes/CharacterMesh#BodyPart\|CharacterMesh.BodyPart]], as a [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] value. |
| [[30 Official Roblox Docs/API Reference/Classes/CharacterMesh#MeshId\|MeshId]] | int64 | Used to load a mesh file, and apply it to the given BodyPart. |
| [[30 Official Roblox Docs/API Reference/Classes/CharacterMesh#OverlayTextureContent\|OverlayTextureContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | The overlay texture that covers Shirts, Pants, T-Shirts, and the base texture, as a [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] value. |
| [[30 Official Roblox Docs/API Reference/Classes/CharacterMesh#OverlayTextureId\|OverlayTextureId]] | int64 | The assetId of the overlay texture. The overlay covers Shirts, Pants, T-Shirts, and the [[30 Official Roblox Docs/API Reference/Classes/CharacterMesh#BaseTextureId\|CharacterMesh.BaseTextureId]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/CharacterAppearance|CharacterAppearance]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### BaseTextureContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

The [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]-typed equivalent of [[30 Official Roblox Docs/API Reference/Classes/CharacterMesh#BaseTextureId|CharacterMesh.BaseTextureId]], holding the base texture applied to the R6 body part's mesh. Supports [asset URIs](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/index.md). Can be overridden by Shirts, Pants, T-Shirts, and [[30 Official Roblox Docs/API Reference/Classes/CharacterMesh#OverlayTextureContent|CharacterMesh.OverlayTextureContent]]. Defaults to empty [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]].

Underlying storage for legacy [[30 Official Roblox Docs/API Reference/Classes/CharacterMesh#BaseTextureId|CharacterMesh.BaseTextureId]]: the two stay in sync. Like the rest of [[30 Official Roblox Docs/API Reference/Classes/CharacterMesh|CharacterMesh]], it only affects R6 characters.

### BaseTextureId

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

The texture of a CharacterMesh. It can be overridden by Shirts, Pants, T-Shirts, and the [[30 Official Roblox Docs/API Reference/Classes/CharacterMesh#OverlayTextureId|CharacterMesh.OverlayTextureId]] property.

### BodyPart

**Type:** [[30 Official Roblox Docs/API Reference/Enums/BodyPart|BodyPart]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

The part of the Character's body that is affected.

### MeshContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

The [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]-typed equivalent of [[30 Official Roblox Docs/API Reference/Classes/CharacterMesh#MeshId|CharacterMesh.MeshId]]. Loads a mesh and applies it to the body part given by [[30 Official Roblox Docs/API Reference/Classes/CharacterMesh#BodyPart|CharacterMesh.BodyPart]]. Supports [asset URIs](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/index.md). Defaults to empty [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]].

Underlying storage for legacy [[30 Official Roblox Docs/API Reference/Classes/CharacterMesh#MeshId|CharacterMesh.MeshId]]: the two stay in sync. Like the rest of [[30 Official Roblox Docs/API Reference/Classes/CharacterMesh|CharacterMesh]], it only affects R6 characters.

### MeshId

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

Used to load a mesh file, and apply it to the given BodyPart.

### OverlayTextureContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

The [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]-typed equivalent of [[30 Official Roblox Docs/API Reference/Classes/CharacterMesh#OverlayTextureId|CharacterMesh.OverlayTextureId]]. The overlay covers Shirts, Pants, T-Shirts, and [[30 Official Roblox Docs/API Reference/Classes/CharacterMesh#BaseTextureContent|CharacterMesh.BaseTextureContent]]. Supports [asset URIs](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/index.md). Defaults to empty [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]].

Setting either `OverlayTextureContent` or [[30 Official Roblox Docs/API Reference/Classes/CharacterMesh#OverlayTextureId|CharacterMesh.OverlayTextureId]] updates the other; both reflect the same texture. Like the rest of [[30 Official Roblox Docs/API Reference/Classes/CharacterMesh|CharacterMesh]], it only affects R6 characters.

### OverlayTextureId

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

The assetId of the overlay texture. The overlay covers Shirts, Pants, T-Shirts, and the [[30 Official Roblox Docs/API Reference/Classes/CharacterMesh#BaseTextureId|CharacterMesh.BaseTextureId]].

---
*Source: [CharacterMesh](https://create.roblox.com/docs/reference/engine/classes/CharacterMesh) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

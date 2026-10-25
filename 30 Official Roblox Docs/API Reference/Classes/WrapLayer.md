---
title: "WrapLayer"
description: "The WrapLayer object defines a 3D accessory's inner and outer surfaces and other properties related to layering accessories. These surfaces, or the Inner Cage and Outer Cage, are similar to collision boxes, and describe the surfaces of which other 3D accessories can be placed without clipping or breaking."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/WrapLayer"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*The WrapLayer object defines a 3D accessory's inner and outer surfaces and other properties related to layering accessories. These surfaces, or the Inner Cage and Outer Cage, are similar to collision boxes, and describe the surfaces of which other 3D accessories can be placed without clipping or breaking.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/BaseWrap|BaseWrap]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

The WrapLayer object defines a 3D accessory's inner and outer surfaces and other properties related to layering accessories. These surfaces, or the Inner Cage and Outer Cage, are similar to collision boxes, and describe the surfaces of which other 3D accessories can be placed without clipping or breaking.

Internally, WrapLayer also uses the UV layout of the Inner and Outer cages to match coordinates to another 3D object's cage. This powers the deformation of objects around differently shaped avatars and underlying accessories.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/WrapLayer#AutoSkin\|AutoSkin]] | [[30 Official Roblox Docs/API Reference/Enums/WrapLayerAutoSkin\|WrapLayerAutoSkin]] | Determines whether this WrapLayer automatically transfers skinning data from the underlying body mesh to the clothing mesh. |
| [[30 Official Roblox Docs/API Reference/Classes/WrapLayer#BindOffset\|BindOffset]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] is used to adjust a binding point for clothing item mesh. Could be used to move and rotate clothing items. This property is intended for fine-tuning only and it is heavily optional. |
| [[30 Official Roblox Docs/API Reference/Classes/WrapLayer#Color\|Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets color used for the debug rendering. See [[30 Official Roblox Docs/API Reference/Classes/WrapTarget#DebugMode\|WrapTarget.DebugMode]]. |
| [[30 Official Roblox Docs/API Reference/Classes/WrapLayer#DebugMode\|DebugMode]] | [[30 Official Roblox Docs/API Reference/Enums/WrapLayerDebugMode\|WrapLayerDebugMode]] | Allows switching between different debugging visualization modes for cage meshes. |
| [[30 Official Roblox Docs/API Reference/Classes/WrapLayer#Enabled\|Enabled]] | boolean | Allows for disabling of the [[30 Official Roblox Docs/API Reference/Classes/WrapLayer\|WrapLayer]] object as if it does not exist. |
| [[30 Official Roblox Docs/API Reference/Classes/WrapLayer#Order\|Order]] | int | Controls the composition order for layered clothing. |
| [[30 Official Roblox Docs/API Reference/Classes/WrapLayer#Puffiness\|Puffiness]] | float | **Deprecated.** Controls how much underlying clothing items inflate the current clothing item. |
| [[30 Official Roblox Docs/API Reference/Classes/WrapLayer#ReferenceMeshContent\|ReferenceMeshContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | The reference mesh that defines the Inner Cage of the [[30 Official Roblox Docs/API Reference/Classes/WrapLayer\|WrapLayer]], stored as a [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] value. |
| [[30 Official Roblox Docs/API Reference/Classes/WrapLayer#ReferenceMeshId\|ReferenceMeshId]] | ContentId | AssetID for reference mesh used to define Inner Cage of a 3D object. |
| [[30 Official Roblox Docs/API Reference/Classes/WrapLayer#ReferenceOrigin\|ReferenceOrigin]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | Reference mesh offset relative to parent MeshPart (in the parent MeshPart space)<br><br>Note: this property is set up automatically by the FBX importer. |
| [[30 Official Roblox Docs/API Reference/Classes/WrapLayer#ReferenceOriginWorld\|ReferenceOriginWorld]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | Reference mesh offset relative to parent MeshPart (in the world space)<br><br>Note: this property is set up automatically by the FBX importer. |
| [[30 Official Roblox Docs/API Reference/Classes/WrapLayer#ShrinkFactor\|ShrinkFactor]] | float | **Deprecated.** Allows slight shrinking/expanding of the resulting render mesh, without affecting any other layers. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/BaseWrap|BaseWrap]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AutoSkin

**Type:** [[30 Official Roblox Docs/API Reference/Enums/WrapLayerAutoSkin|WrapLayerAutoSkin]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

Determines whether this WrapLayer automatically transfers skinning data from the underlying body mesh to the clothing mesh. When set to [[30 Official Roblox Docs/API Reference/Enums/WrapLayerAutoSkin|EnabledOverride]], skinning is applied regardless of whether the clothing mesh already has skinning data. When set to [[30 Official Roblox Docs/API Reference/Enums/WrapLayerAutoSkin|EnabledPreserve]], skinning is only applied if the mesh does not already have skinning data.

This property requires [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#LoadCharacterLayeredClothing|StarterPlayer.LoadCharacterLayeredClothing]] to be set to `Enabled` (or `Default`) in order to function. When layered clothing is disabled, the auto-skinning pipeline does not run and this property has no effect.

For more information, see [[30 Official Roblox Docs/Avatar/Automatic Skinning Transfer|Automatic Skinning Transfer]].

### BindOffset

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Security:** read None / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Tuning · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

This property is intended for fine-tuning purposes and is highly optional.

[[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] to adjust a binding point for a clothing item mesh. Allows for fine-tuning of clothing items (slight adjustment of position/rotation to get a unique look) in contexts such as community-made avatar editors.

### Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Debug · **Loaded/Saved:** false/false · **Capabilities:** AvatarAppearance · **Tags:** `NotReplicated`, `NotScriptable`

Sets color used for the debug rendering. See [[30 Official Roblox Docs/API Reference/Classes/WrapTarget#DebugMode|WrapTarget.DebugMode]]

### DebugMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/WrapLayerDebugMode|WrapLayerDebugMode]]

**Thread safety:** ReadSafe · **Category:** Debug · **Loaded/Saved:** false/false · **Capabilities:** AvatarAppearance · **Tags:** `NotReplicated`, `NotScriptable`

Allows switching between different debugging visualization modes for cage meshes.

### Enabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

Allows for disabling of the [[30 Official Roblox Docs/API Reference/Classes/WrapLayer|WrapLayer]] object as if it does not exist.

### Order

**Type:** int

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

Controls the composition order for layered clothing. Clothing items with higher order will appear on top of clothing items with lower order. If two items have the same order, the deformer composition order is ambiguous and depends on serialization order. Default value is 1.

### Puffiness

> [!warning] Deprecated
> This member is deprecated.

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance · **Tags:** `Deprecated`

Controls how much underlying clothing items inflate the current clothing item.

Valid range is -1 to 1. A value of -1 compresses the clothing, body, and all underlying layers such that the clothing itself takes the shape of the body. A value of 0 makes the clothing item fit as if it was the only piece of clothing being worn, compressing all underlying layers. A value of 1 (default) never compresses anything and infinitely inflates over underlying clothing items.

### ReferenceMeshContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Security:** read None / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

The reference mesh that defines the inner cage of a [[30 Official Roblox Docs/API Reference/Classes/WrapLayer|WrapLayer]], stored as a [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] value. Together with the outer cage from [[30 Official Roblox Docs/API Reference/Classes/BaseWrap#CageMeshContent|CageMeshContent]], the inner cage describes the surfaces used to fit and deform the accessory around an avatar and underlying accessories without clipping. A [[30 Official Roblox Docs/API Reference/Classes/WrapLayer|WrapLayer]] is only considered valid once both its cage mesh and its reference mesh are set.

The reference mesh establishes the standard topology and UV coordinates used for index matching. It is expected that for all catalog avatars this points to one of the 15 standard reference meshes provided by Roblox, but for some NPCs or a custom avatar system it might point to a different mesh. This property is normally set up automatically by the Importer.

This [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]-typed property is the successor to [[30 Official Roblox Docs/API Reference/Classes/WrapLayer#ReferenceMeshId|WrapLayer.ReferenceMeshId]] and reads and writes the same underlying storage. Defaults to an empty [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]].

### ReferenceMeshId

**Type:** ContentId

**Security:** read None / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

AssetID for reference mesh used to define Inner Cage of a 3D object

Reference mesh is used to define standard topology and UV coordinates for index matching. It is expected that for all catalog avatars, this will point to one of 15 standard reference meshes provided by Roblox. But for some NPCs or a custom avatar system, this might point to other meshes.

Note: this property is set up automatically by the FBX importer

### ReferenceOrigin

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Security:** read None / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

Reference mesh offset relative to parent MeshPart (in the parent MeshPart space)

Note: this property is set up automatically by the FBX importer

### ReferenceOriginWorld

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** AvatarAppearance · **Tags:** `ReadOnly`, `NotReplicated`

Reference mesh offset relative to parent MeshPart (in the world space)

Note: this property is set up automatically by the FBX importer

### ShrinkFactor

> [!warning] Deprecated
> This member is deprecated.

**Type:** float

**Security:** read None / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Tuning · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance · **Tags:** `Deprecated`

This property is intended for fine-tuning purposes and is highly optional.

Allows slight shrinking/expanding of the resulting render mesh, without affecting any other layers. This is useful in rare cases when the clothing mesh does not precisely fit the underlying clothing layers (the cage is usually slightly overestimated atop the real shape to avoid layer interpenetration). Even slight overestimation has the tendency to accumulate, especially when there are a lot of layers. While this is usually not critical, some items like backpacks may be problematic.

Valid range is -1 to 1. A value of -1 will maximally expand while a value of 1 will maximally shrink. A value of 0 (default) has no effect.

---
*Source: [WrapLayer](https://create.roblox.com/docs/reference/engine/classes/WrapLayer) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

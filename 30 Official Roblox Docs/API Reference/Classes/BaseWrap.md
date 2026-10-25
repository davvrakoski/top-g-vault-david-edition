---
title: "BaseWrap"
description: "Abstract base class for `WrapTarget` and `WrapLayer` that stores cage mesh data for layered clothing deformation."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/BaseWrap"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Abstract base class for [[30 Official Roblox Docs/API Reference/Classes/WrapTarget|WrapTarget]] and [[30 Official Roblox Docs/API Reference/Classes/WrapLayer|WrapLayer]] that stores cage mesh data for layered clothing deformation.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/WrapDeformer|WrapDeformer]], [[30 Official Roblox Docs/API Reference/Classes/WrapLayer|WrapLayer]], [[30 Official Roblox Docs/API Reference/Classes/WrapTarget|WrapTarget]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`

## Description

The base class for [[30 Official Roblox Docs/API Reference/Classes/WrapTarget|WrapTarget]] and [[30 Official Roblox Docs/API Reference/Classes/WrapLayer|WrapLayer]] objects. Note that [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] is the only valid parent type for [[30 Official Roblox Docs/API Reference/Classes/BaseWrap|BaseWrap]] and that it behaves more like a component of [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] than an independent object.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/BaseWrap#CageMeshContent\|CageMeshContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | The cage mesh this wrap uses to deform geometry, stored as a [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] value. |
| [[30 Official Roblox Docs/API Reference/Classes/BaseWrap#CageMeshId\|CageMeshId]] | ContentId | Asset ID for cage mesh. |
| [[30 Official Roblox Docs/API Reference/Classes/BaseWrap#CageOrigin\|CageOrigin]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | Cage mesh offset relative to parent [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]]. |
| [[30 Official Roblox Docs/API Reference/Classes/BaseWrap#CageOriginWorld\|CageOriginWorld]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | Cage mesh offset in world space. |
| [[30 Official Roblox Docs/API Reference/Classes/BaseWrap#HSRAssetId\|HSRAssetId]] | ContentId | Asset ID for the hidden surface removal (HSR) data used by layered clothing. |
| [[30 Official Roblox Docs/API Reference/Classes/BaseWrap#HSRContent\|HSRContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | The hidden surface removal data for this wrap, stored as a [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] value. |
| [[30 Official Roblox Docs/API Reference/Classes/BaseWrap#ImportOrigin\|ImportOrigin]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | Describes where a global zero was while authoring the cage mesh in an asset creation tool. |
| [[30 Official Roblox Docs/API Reference/Classes/BaseWrap#ImportOriginWorld\|ImportOriginWorld]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | Describes where the origin (in world space) was while authoring the cage mesh in an asset creation tool. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### CageMeshContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Security:** read None / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

The cage mesh this wrap uses to deform geometry, stored as a [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] value that can reference an uploaded mesh asset or an in-memory [[30 Official Roblox Docs/API Reference/Classes/EditableMesh|EditableMesh]]. Set automatically by the Importer. It is the backing store for [[30 Official Roblox Docs/API Reference/Classes/BaseWrap#CageMeshId|BaseWrap.CageMeshId]]: that property reads the mesh ID from this content, and setting either keeps both in sync and raises a change on both.

Defaults to an empty [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]. Without a valid cage, the wrap cannot contribute to layered clothing deformation for [[30 Official Roblox Docs/API Reference/Classes/WrapLayer|WrapLayer]] or [[30 Official Roblox Docs/API Reference/Classes/WrapTarget|WrapTarget]].

### CageMeshId

**Type:** ContentId

**Security:** read None / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

This property is set up automatically by the 3D Importer.

Asset ID for cage mesh.

### CageOrigin

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Security:** read None / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

This property is set up automatically by the 3D Importer.

Cage mesh offset relative to parent [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]].

### CageOriginWorld

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** AvatarAppearance · **Tags:** `ReadOnly`, `NotReplicated`

Cage mesh offset in world space.

### HSRAssetId

**Type:** ContentId

**Security:** read RobloxScriptSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

This property is not accessible through scripts but is viewable in the Properties window for any [[30 Official Roblox Docs/API Reference/Classes/BaseWrap|BaseWrap]] object. It references precomputed data that determines which mesh triangles are hidden when clothing layers overlap.

### HSRContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Security:** read RobloxScriptSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

Hidden surface removal (HSR) data for this wrap, stored as a [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] value that references a precomputed mesh asset. It is the backing store for [[30 Official Roblox Docs/API Reference/Classes/BaseWrap#HSRAssetId|BaseWrap.HSRAssetId]]: that property reads the asset ID from this content, and setting either keeps both in sync.

The content determines which mesh triangles are hidden when clothing layers overlap so occluded geometry can be culled during layered clothing deformation. Generated automatically when a [[30 Official Roblox Docs/API Reference/Classes/BaseWrap|BaseWrap]] is published; you do not need to set it manually.

### ImportOrigin

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Security:** read None / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

This property is set up automatically by the 3D Importer.

Describes where a global zero was while authoring the cage mesh in an asset creation tool such as Blender or Maya. This property is not used by the deformer but it is useful for tools/aligning scripts, for example aligning two parts by matching their pivots as follows:

*Code samples for this member (`BaseWrap-ImportOrigin`) are published on the source page; their code is not part of the open-source repo.*

### ImportOriginWorld

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** AvatarAppearance · **Tags:** `ReadOnly`, `NotReplicated`

Describes where the origin (in world space) was while authoring the cage mesh in an asset creation tool such as Blender or Maya.

---
*Source: [BaseWrap](https://create.roblox.com/docs/reference/engine/classes/BaseWrap) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

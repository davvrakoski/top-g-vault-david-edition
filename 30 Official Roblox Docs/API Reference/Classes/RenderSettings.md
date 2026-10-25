---
title: "RenderSettings"
description: "A singleton settings class that exposes rendering configuration for graphics quality, framerate management, and debug visualization in Roblox Studio."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/RenderSettings"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A singleton settings class that exposes rendering configuration for graphics quality, framerate management, and debug visualization in Roblox Studio.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`, `NotBrowsable`

## Description

`RenderSettings` is a singleton class which lets developers debug components of Roblox's graphics engine. It can be found in Roblox Studio's settings under the **Rendering** tab.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/RenderSettings#AutoFRMLevel\|AutoFRMLevel]] | int | Sets the starting quality level of the framerate manager. |
| [[30 Official Roblox Docs/API Reference/Classes/RenderSettings#EagerBulkExecution\|EagerBulkExecution]] | boolean | Whether all scene updates will be given an unlimited budget, regardless of how computationally expensive it may be. |
| [[30 Official Roblox Docs/API Reference/Classes/RenderSettings#EditQualityLevel\|EditQualityLevel]] | [[30 Official Roblox Docs/API Reference/Enums/QualityLevel\|QualityLevel]] | Sets the graphics quality level in Roblox Studio. |
| [[30 Official Roblox Docs/API Reference/Classes/RenderSettings#Enable VR Mode\|Enable VR Mode]] | boolean | Toggles whether virtual reality (VR) mode is enabled. |
| [[30 Official Roblox Docs/API Reference/Classes/RenderSettings#EnableFRM\|EnableFRM]] | boolean | Toggles the enabled state of the framerate manager. |
| [[30 Official Roblox Docs/API Reference/Classes/RenderSettings#ExportMergeByMaterial\|ExportMergeByMaterial]] | boolean | Sets whether materials should be generated per part, or per unique appearance in Roblox's exporter. |
| [[30 Official Roblox Docs/API Reference/Classes/RenderSettings#FrameRateManager\|FrameRateManager]] | [[30 Official Roblox Docs/API Reference/Enums/FramerateManagerMode\|FramerateManagerMode]] | Specifies the behavior of the framerate manager. |
| [[30 Official Roblox Docs/API Reference/Classes/RenderSettings#GraphicsMode\|GraphicsMode]] | [[30 Official Roblox Docs/API Reference/Enums/GraphicsMode\|GraphicsMode]] | The graphics API that Roblox will use on startup. |
| [[30 Official Roblox Docs/API Reference/Classes/RenderSettings#MeshCacheSize\|MeshCacheSize]] | int | The size in bytes of the mesh cache. |
| [[30 Official Roblox Docs/API Reference/Classes/RenderSettings#MeshPartDetailLevel\|MeshPartDetailLevel]] | [[30 Official Roblox Docs/API Reference/Enums/MeshPartDetailLevel\|MeshPartDetailLevel]] | Studio only. Used to visually verify the quality of [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshParts]] at lower level of detail at close range. |
| [[30 Official Roblox Docs/API Reference/Classes/RenderSettings#QualityLevel\|QualityLevel]] | [[30 Official Roblox Docs/API Reference/Enums/QualityLevel\|QualityLevel]] | Controls the quality level in Roblox Studio. |
| [[30 Official Roblox Docs/API Reference/Classes/RenderSettings#ReloadAssets\|ReloadAssets]] | boolean | Whether Roblox Studio will automatically reload changes that are made to files in Roblox's `content` folder. |
| [[30 Official Roblox Docs/API Reference/Classes/RenderSettings#RenderCSGTrianglesDebug\|RenderCSGTrianglesDebug]] | boolean | Whether a wireframe of polygons will be shown on all [[30 Official Roblox Docs/API Reference/Classes/PartOperation\|PartOperation]] objects. |
| [[30 Official Roblox Docs/API Reference/Classes/RenderSettings#ShowBoundingBoxes\|ShowBoundingBoxes]] | boolean | Whether bounding boxes are rendered around each individual rendered entity in the scene. |
| [[30 Official Roblox Docs/API Reference/Classes/RenderSettings#ViewMode\|ViewMode]] | [[30 Official Roblox Docs/API Reference/Enums/ViewMode\|ViewMode]] | Studio only. Selects a debug rendering visualization overlay for the viewport. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/RenderSettings#GetMaxQualityLevel\|GetMaxQualityLevel()]] | int | Returns the maximum quality level. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AutoFRMLevel

**Type:** int

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Debug · **Loaded/Saved:** true/true

Sets the starting quality level of the framerate manager when [[30 Official Roblox Docs/API Reference/Classes/RenderSettings#EnableFRM|EnableFRM]] is set to `true`.

### EagerBulkExecution

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Performance · **Loaded/Saved:** true/true

When set to `true`, all scene updates will be given an unlimited budget, regardless of how computationally expensive it may be. This ensures each frame will look as it should, at the cost of a more unstable frame rate.

### EditQualityLevel

**Type:** [[30 Official Roblox Docs/API Reference/Enums/QualityLevel|QualityLevel]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Performance · **Loaded/Saved:** true/true

Sets the graphics quality level in Roblox Studio when [[30 Official Roblox Docs/API Reference/Classes/RenderSettings#EnableFRM|EnableFRM]] is set to `false`.

### Enable VR Mode

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** General · **Loaded/Saved:** true/true

When set to `true`, virtual reality (VR) mode is enabled. This property reflects the same underlying setting as [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#VREnabled|UserGameSettings.VREnabled]], so reading or writing it reads or writes that shared value. Defaults to `false`.

### EnableFRM

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Debug · **Loaded/Saved:** true/false · **Tags:** `Hidden`, `NotReplicated`

When set to `true`, the framerate manager (FRM) dynamically adjusts the rendering quality level during gameplay to maintain a stable framerate. When set to `false`, the quality level is fixed at [[30 Official Roblox Docs/API Reference/Classes/RenderSettings#EditQualityLevel|RenderSettings.EditQualityLevel]] and no automatic adjustment occurs. Defaults to `true`.

The [[30 Official Roblox Docs/API Reference/Classes/RenderSettings#AutoFRMLevel|AutoFRMLevel]] property reports the current quality level that the FRM has assigned when this property is enabled.

### ExportMergeByMaterial

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** General · **Loaded/Saved:** true/true

Controls how materials are written during `.obj` export from Studio. When set to `true`, parts that share the same material appearance are merged into shared material definitions in the exported `.obj` file, reducing material count. When set to `false`, each part receives its own independent material definition. Defaults to `false`.

### FrameRateManager

**Type:** [[30 Official Roblox Docs/API Reference/Enums/FramerateManagerMode|FramerateManagerMode]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** General · **Loaded/Saved:** true/true

Determines how the framerate manager (FRM) manages rendering quality using a [[30 Official Roblox Docs/API Reference/Enums/FramerateManagerMode|Enum.FramerateManagerMode]] value. When set to [[30 Official Roblox Docs/API Reference/Enums/FramerateManagerMode|Enum.FramerateManagerMode.Automatic]], the engine decides whether to enable FRM quality adjustment based on context (typically enabled during gameplay). When set to [[30 Official Roblox Docs/API Reference/Enums/FramerateManagerMode|Enum.FramerateManagerMode.On]], the FRM is always active. When set to [[30 Official Roblox Docs/API Reference/Enums/FramerateManagerMode|Enum.FramerateManagerMode.Off]], the FRM does not adjust quality and block culling is forced to the lowest-quality distance setting. Defaults to [[30 Official Roblox Docs/API Reference/Enums/FramerateManagerMode|Enum.FramerateManagerMode.Automatic]].

### GraphicsMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/GraphicsMode|GraphicsMode]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** General · **Loaded/Saved:** true/true

Determines which graphics rendering API Roblox uses on startup, specified as a [[30 Official Roblox Docs/API Reference/Enums/GraphicsMode|Enum.GraphicsMode]] value. When set to [[30 Official Roblox Docs/API Reference/Enums/GraphicsMode|Enum.GraphicsMode.Automatic]], the engine selects the best available backend for the current platform. Available options are platform-dependent; for example, [[30 Official Roblox Docs/API Reference/Enums/GraphicsMode|Enum.GraphicsMode.Metal]] is only available on macOS and [[30 Official Roblox Docs/API Reference/Enums/GraphicsMode|Enum.GraphicsMode.Direct3D11]] is only available on Windows. If an unsupported mode is selected, the engine silently falls back to [[30 Official Roblox Docs/API Reference/Enums/GraphicsMode|Enum.GraphicsMode.Automatic]]. Defaults to [[30 Official Roblox Docs/API Reference/Enums/GraphicsMode|Enum.GraphicsMode.Automatic]].

Because the graphics API is initialized at startup, changing this property only takes effect after restarting Roblox Studio.

### MeshCacheSize

**Type:** int

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Cache · **Loaded/Saved:** true/true

The size in bytes of the mesh cache. Defaults to 32 MiB.

### MeshPartDetailLevel

**Type:** [[30 Official Roblox Docs/API Reference/Enums/MeshPartDetailLevel|MeshPartDetailLevel]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Debug · **Loaded/Saved:** true/true

Determines the mode for the selection of detail levels for mesh parts. For a good balance between performance and fidelity, this should be set to [[30 Official Roblox Docs/API Reference/Enums/MeshPartDetailLevel|Enum.MeshPartDetailLevel.DistanceBased]] (default), which is what the client uses.

Note that the [[30 Official Roblox Docs/API Reference/Classes/MeshPart#RenderFidelity|MeshPart.RenderFidelity]] needs to be set to [[30 Official Roblox Docs/API Reference/Enums/RenderFidelity|Enum.RenderFidelity.Automatic]] for this to work. If you set it to [[30 Official Roblox Docs/API Reference/Enums/RenderFidelity|Enum.RenderFidelity.Precise]], you will always see the higher resolution version and the [[30 Official Roblox Docs/API Reference/Enums/MeshPartDetailLevel|Enum.MeshPartDetailLevel]] value will be ignored for that [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]].

### QualityLevel

**Type:** [[30 Official Roblox Docs/API Reference/Enums/QualityLevel|QualityLevel]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Performance · **Loaded/Saved:** true/true

If [[30 Official Roblox Docs/API Reference/Classes/RenderSettings#EnableFRM|EnableFRM]] is set to `true`, this property controls the quality level in Roblox Studio.

### ReloadAssets

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Debug · **Loaded/Saved:** true/true

When set to `true`, Roblox Studio will automatically reload changes that are made to files in Roblox's `content` folder.

### RenderCSGTrianglesDebug

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Debug · **Loaded/Saved:** true/true

When set to `true`, a wireframe of polygons will be shown on all [[30 Official Roblox Docs/API Reference/Classes/PartOperation|PartOperation]] objects.

### ShowBoundingBoxes

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Debug · **Loaded/Saved:** true/true

If set to `true`, renders bounding boxes around each individual rendered entity in the scene.

### ViewMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ViewMode|ViewMode]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Debug · **Loaded/Saved:** true/true

Studio only. Determines which debug rendering visualization is drawn over the viewport, using a value of [[30 Official Roblox Docs/API Reference/Enums/ViewMode|Enum.ViewMode]]. Defaults to [[30 Official Roblox Docs/API Reference/Enums/ViewMode|Enum.ViewMode.None]], which disables the overlay. Other values enable overdraw visualizations for geometry complexity, transparency, or decals.

## Methods

### GetMaxQualityLevel

```lua
RenderSettings:GetMaxQualityLevel(): int
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Returns the total number of quality levels available in the rendering quality system. Quality levels are numbered from [[30 Official Roblox Docs/API Reference/Enums/QualityLevel|Enum.QualityLevel.Automatic]] (0) through [[30 Official Roblox Docs/API Reference/Enums/QualityLevel|Enum.QualityLevel.Level21]] (21), so this method returns 22. Use `GetMaxQualityLevel() - 1` to obtain the highest numeric quality level.

**Returns**

| Type | Description |
| --- | --- |
| int | The total number of quality levels available in the rendering system. |

---
*Source: [RenderSettings](https://create.roblox.com/docs/reference/engine/classes/RenderSettings) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

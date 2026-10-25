---
title: "WireframeHandleAdornment"
description: "Renders a wireframe adornment consisting of one or more lines onto a `BasePart` (including `Terrain`) or into the `Workspace`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/WireframeHandleAdornment"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Renders a wireframe adornment consisting of one or more lines onto a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] (including [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]]) or into the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment|HandleAdornment]] → [[30 Official Roblox Docs/API Reference/Classes/PVAdornment|PVAdornment]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d|GuiBase3d]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

`WireframeHandleAdornment` renders a wireframe adornment consisting of one or more lines onto a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] (including [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]]) or into the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]]. If parented to a player's [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]] or the [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]], this adornment can listen to input events for purposes such as making dragger tools.

Note that a `WireframeHandleAdornment` instance **begins empty** and you must add lines or paths to it through methods like [[30 Official Roblox Docs/API Reference/Classes/WireframeHandleAdornment#AddLines|AddLines()]] or [[30 Official Roblox Docs/API Reference/Classes/WireframeHandleAdornment#AddPath|AddPath()]].

The rendered wireframe can be customized visually through its [[30 Official Roblox Docs/API Reference/Classes/WireframeHandleAdornment#Thickness|Thickness]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d#Color3|Color3]], and [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d#Transparency|Transparency]] properties, although these properties only affect subsequent draws and do not update lines already drawn into the adornment.

*Code samples for this API (`WireframeHandleAdornment-Basic-Path`, `WireframeHandleAdornment-Multicolor`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/WireframeHandleAdornment); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/WireframeHandleAdornment#Scale\|Scale]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The **XYZ** scale of the wireframe adornment. |
| [[30 Official Roblox Docs/API Reference/Classes/WireframeHandleAdornment#Thickness\|Thickness]] | float | Thickness of the wireframe adornment's lines in pixels. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/WireframeHandleAdornment#AddLine\|AddLine()]] | () | Adds a line to the wireframe adornment from a starting point to an ending point relative to the center of the [[30 Official Roblox Docs/API Reference/Classes/PVAdornment#Adornee\|Adornee]]. |
| [[30 Official Roblox Docs/API Reference/Classes/WireframeHandleAdornment#AddLines\|AddLines()]] | () | Adds one or more lines to the wireframe adornment using an array. |
| [[30 Official Roblox Docs/API Reference/Classes/WireframeHandleAdornment#AddPath\|AddPath()]] | () | Adds multiple line segments to the wireframe adornment in a sequence from point to point. |
| [[30 Official Roblox Docs/API Reference/Classes/WireframeHandleAdornment#AddText\|AddText()]] | () | Adds a text label to the wireframe adornment. |
| [[30 Official Roblox Docs/API Reference/Classes/WireframeHandleAdornment#Clear\|Clear()]] | () | Instantly clears all lines and text in the wireframe adornment. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment|HandleAdornment]], [[30 Official Roblox Docs/API Reference/Classes/PVAdornment|PVAdornment]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d|GuiBase3d]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Scale

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI

This property specifies the **XYZ** scale of the wireframe adornment as a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]. For example, a scale of `Datatype.Vector3.new(1, 2, 1)` will scale the adornment twice its normal size on the **Y** axis while keeping the **X** and **Z** axes unchanged.

### Thickness

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI

This property determines the thickness of the wireframe adornment's lines in pixels. Note that this visual thickness does not change relative to the adornment's distance from the viewer's camera.

## Methods

### AddLine

```lua
WireframeHandleAdornment:AddLine(from: Vector3, to: Vector3): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic, UI

This method adds a line to the wireframe adornment from a starting point to an ending point, both defined as a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] relative to the center of the [[30 Official Roblox Docs/API Reference/Classes/PVAdornment#Adornee|Adornee]].

Note that you can make a multicolor wireframe by changing the adornment's [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d#Color3|Color3]] property before new lines are drawn via [[30 Official Roblox Docs/API Reference/Classes/WireframeHandleAdornment#AddLine|AddLine()]], as demonstrated in the following code sample.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `from` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | Starting point of the line. |
| `to` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | Ending point of the line. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`WireframeHandleAdornment-Multicolor`) are published on the source page; their code is not part of the open-source repo.*

### AddLines

```lua
WireframeHandleAdornment:AddLines(points: Array): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic, UI

This method adds one or more lines of the current [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d#Color3|Color3]] color to the wireframe adornment using an array. Each pair of [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] points in the array acts as a starting point and ending point for a line, relative to the center of the [[30 Official Roblox Docs/API Reference/Classes/PVAdornment#Adornee|Adornee]].

Note that lines are rendered independently and their ending points are not connected to the starting point of any other line. To connect multiple line segments in a sequence from point to point, see [[30 Official Roblox Docs/API Reference/Classes/WireframeHandleAdornment#AddPath|AddPath()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | Array |  | Array of [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] points in which each pair acts as a starting point and ending point for a line. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`WireframeHandleAdornment-Lines-Array`) are published on the source page; their code is not part of the open-source repo.*

### AddPath

```lua
WireframeHandleAdornment:AddPath(points: Array, loop: boolean): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic, UI

This method adds multiple line segments of the current [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d#Color3|Color3]] color to the wireframe adornment in a sequence from point to point. The path can be closed (ending point connected to starting point) by setting the `loop` parameter to `true`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | Array |  | Array of [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] points to connect in sequence with line segments. |
| `loop` | boolean |  | Whether the path is closed by connecting its ending point to its starting point with an additional line. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`WireframeHandleAdornment-Basic-Path`) are published on the source page; their code is not part of the open-source repo.*

### AddText

```lua
WireframeHandleAdornment:AddText(point: Vector3, text: string, size: int = 12): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic, UI

Adds a text label to the wireframe adornment at a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] point relative to the center of the [[30 Official Roblox Docs/API Reference/Classes/PVAdornment#Adornee|Adornee]]. You can adjust the size of the text through the `size` parameter, and the label renders in the current [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d#Color3|Color3]] color.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | Position of the text in the adornment. |
| `text` | string |  | String to display. |
| `size` | int | `12` | Size of the text. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### Clear

```lua
WireframeHandleAdornment:Clear(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic, UI

Instantly clears all lines and text in the wireframe adornment.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [WireframeHandleAdornment](https://create.roblox.com/docs/reference/engine/classes/WireframeHandleAdornment) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

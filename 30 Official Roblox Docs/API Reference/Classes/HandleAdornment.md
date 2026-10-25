---
title: "HandleAdornment"
description: "An abstract class inherited by 3D handle adornments."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/HandleAdornment"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An abstract class inherited by 3D handle adornments.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/PVAdornment|PVAdornment]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d|GuiBase3d]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/BoxHandleAdornment|BoxHandleAdornment]], [[30 Official Roblox Docs/API Reference/Classes/ConeHandleAdornment|ConeHandleAdornment]], [[30 Official Roblox Docs/API Reference/Classes/CylinderHandleAdornment|CylinderHandleAdornment]], [[30 Official Roblox Docs/API Reference/Classes/ImageHandleAdornment|ImageHandleAdornment]], [[30 Official Roblox Docs/API Reference/Classes/LineHandleAdornment|LineHandleAdornment]], [[30 Official Roblox Docs/API Reference/Classes/PyramidHandleAdornment|PyramidHandleAdornment]], [[30 Official Roblox Docs/API Reference/Classes/SphereHandleAdornment|SphereHandleAdornment]], [[30 Official Roblox Docs/API Reference/Classes/WireframeHandleAdornment|WireframeHandleAdornment]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`

## Description

`HandleAdornment` is an abstract class inherited by 3D handle adornments. If parented to a player's [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]] or the [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]], handles can listen to input events for purposes such as making dragger tools.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment#AdornCullingMode\|AdornCullingMode]] | [[30 Official Roblox Docs/API Reference/Enums/AdornCullingMode\|AdornCullingMode]] | Determines whether to automatically cull the adornment. |
| [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment#AlwaysOnTop\|AlwaysOnTop]] | boolean | Forces this adornment to render on top of all 3D objects in the workspace. |
| [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment#CFrame\|CFrame]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | The position and rotation of the object relative to its [[30 Official Roblox Docs/API Reference/Classes/PVAdornment#Adornee\|PVAdornment.Adornee]]. |
| [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment#SizeRelativeOffset\|SizeRelativeOffset]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The positional offset of the adornment based on the adornee's [[30 Official Roblox Docs/API Reference/Classes/BasePart#Size\|BasePart.Size]]. |
| [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment#ZIndex\|ZIndex]] | int | Determines the draw order of this [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment\|HandleAdornment]] when [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment#AlwaysOnTop\|AlwaysOnTop]] is `true`. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment#MouseButton1Down\|MouseButton1Down]] |  | Fires when a player presses down on their left mouse button while hovering over the adornment. |
| [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment#MouseButton1Up\|MouseButton1Up]] |  | Fires when a player releases their left mouse button while hovering over the adornment. |
| [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment#MouseEnter\|MouseEnter]] |  | Fires when a player moves their mouse over the adornment. |
| [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment#MouseLeave\|MouseLeave]] |  | Fires when a player moves their mouse out of the adornment. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/PVAdornment|PVAdornment]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d|GuiBase3d]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AdornCullingMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/AdornCullingMode|AdornCullingMode]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI

This property determines whether to automatically cull the adornment based on distance from the camera.

### AlwaysOnTop

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI

If `true`, forces this adornment to render on top of all 3D objects in the workspace. As an exception, setting [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment#ZIndex|ZIndex]] to `-1` will override an [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment#AlwaysOnTop|AlwaysOnTop]] value of `true` and cause the adornment to appear either in front of or behind other adornments and objects based on their relative position in the 3D space.

### CFrame

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI

[[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] position and rotation relative to its [[30 Official Roblox Docs/API Reference/Classes/PVAdornment#Adornee|PVAdornment.Adornee]], applied after any translations due to [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment#SizeRelativeOffset|SizeRelativeOffset]].

### SizeRelativeOffset

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI

By default, an adornment draws in the center of its [[30 Official Roblox Docs/API Reference/Classes/PVAdornment#Adornee|Adornee]], but this property shifts the adornment's relative position based on the adornee's [[30 Official Roblox Docs/API Reference/Classes/BasePart#Size|BasePart.Size]].

Note that the units of [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment#SizeRelativeOffset|SizeRelativeOffset]] are a **scale** based on the size of the adornee itself, such that a value of `1` will move the adornment to the corresponding edge of the adornee. For example, a value of `Datatype.Vector3.new(0, 1, 0)` will shift the adornment to the exact top of its adornee.

### ZIndex

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI

Only applies if [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment#AlwaysOnTop|AlwaysOnTop]] is `true` and determines the draw order of this [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment|HandleAdornment]] relative to other adornments. It does not relate to the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#ZIndex|ZIndex]] property for [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]].

Valid values are from `-1` to `10` with higher values drawing on top (in front) of lesser values. This drawing order will be respected even if an adornment is in front of or behind another adornment in the 3D space.

As an exception, setting [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment#ZIndex|ZIndex]] to `-1` or [[30 Official Roblox Docs/API Reference/Classes/HandleAdornment#AlwaysOnTop|AlwaysOnTop]] to `false` will cause the adornment to appear either in front of or behind other adornments and objects based on their relative position in the 3D space.

## Events

### MouseButton1Down

```lua
HandleAdornment.MouseButton1Down()
```

**Capabilities:** Basic, UI

This event fires when a player presses down their left mouse button while hovering over the adornment. Only fires if the adornment is parented to a player's [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]] or the [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]].

### MouseButton1Up

```lua
HandleAdornment.MouseButton1Up()
```

**Capabilities:** Basic, UI

This event fires when a player releases their left mouse button while hovering over the adornment. Only fires if the adornment is parented to a player's [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]] or the [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]].

### MouseEnter

```lua
HandleAdornment.MouseEnter()
```

**Capabilities:** Basic, UI

This event fires when a player moves their mouse over the adornment. Only fires if the adornment is parented to a player's [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]] or the [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]].

### MouseLeave

```lua
HandleAdornment.MouseLeave()
```

**Capabilities:** Basic, UI

This event fires when a player moves their mouse out of the adornment. Only fires if the adornment is parented to a player's [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]] or the [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]].

---
*Source: [HandleAdornment](https://create.roblox.com/docs/reference/engine/classes/HandleAdornment) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

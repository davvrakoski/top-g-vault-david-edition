---
title: "ArcHandles"
description: "The `ArcHandles` object places 3D arc handles around any 3D object that its `Adornee` is set to."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ArcHandles"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*The [[30 Official Roblox Docs/API Reference/Classes/ArcHandles|ArcHandles]] object places 3D arc handles around any 3D object that its [[30 Official Roblox Docs/API Reference/Classes/PartAdornment#Adornee|Adornee]] is set to.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/HandlesBase|HandlesBase]] → [[30 Official Roblox Docs/API Reference/Classes/PartAdornment|PartAdornment]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d|GuiBase3d]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

The **ArcHandles** object places 3D arc handles around any 3D object that its [[30 Official Roblox Docs/API Reference/Classes/PartAdornment#Adornee|Adornee]] is set to. For handles to be interactive, it must be parented to a player's [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]] or the [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]].

*(image in the full Top G Vault)*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ArcHandles#Axes\|Axes]] | [[30 Official Roblox Docs/API Reference/Datatypes/Axes\|Axes]] | Sets the current Axes ArcHandles will show. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ArcHandles#MouseButton1Down\|MouseButton1Down]] | `axis` | Fired when the left mouse button goes down on one of the GUI handles. |
| [[30 Official Roblox Docs/API Reference/Classes/ArcHandles#MouseButton1Up\|MouseButton1Up]] | `axis` | Fired when the left mouse button is released on one of the GUI handles. |
| [[30 Official Roblox Docs/API Reference/Classes/ArcHandles#MouseDrag\|MouseDrag]] | `axis`, `relativeAngle`, `deltaRadius` | Fired when the mouse moves while the MouseButton1Down event has fired, but the left mouse button has not been released yet. |
| [[30 Official Roblox Docs/API Reference/Classes/ArcHandles#MouseEnter\|MouseEnter]] | `axis` | Fired when a mouse "enters" the GUI handle. |
| [[30 Official Roblox Docs/API Reference/Classes/ArcHandles#MouseLeave\|MouseLeave]] | `axis` | Fired when the mouse leaves the GUI handle. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/HandlesBase|HandlesBase]], [[30 Official Roblox Docs/API Reference/Classes/PartAdornment|PartAdornment]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d|GuiBase3d]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Axes

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Axes|Axes]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI, Input

Sets the current Axes ArcHandles will show.

## Events

### MouseButton1Down

```lua
ArcHandles.MouseButton1Down(axis: Axis)
```

**Capabilities:** Basic, UI, Input

Fired when the left mouse button goes down on one of the GUI handles.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `axis` | [[30 Official Roblox Docs/API Reference/Enums/Axis\|Axis]] |  | The [[30 Official Roblox Docs/API Reference/Enums/Axis\|Enum.Axis]] (`X`, `Y`, or `Z`) of the arc handle on which the left mouse button was pressed. |

### MouseButton1Up

```lua
ArcHandles.MouseButton1Up(axis: Axis)
```

**Capabilities:** Basic, UI, Input

Fired when the left mouse button is released on one of the GUI handles.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `axis` | [[30 Official Roblox Docs/API Reference/Enums/Axis\|Axis]] |  | The [[30 Official Roblox Docs/API Reference/Enums/Axis\|Enum.Axis]] (`X`, `Y`, or `Z`) of the arc handle on which the left mouse button was released. |

### MouseDrag

```lua
ArcHandles.MouseDrag(axis: Axis, relativeAngle: float, deltaRadius: float)
```

**Capabilities:** Basic, UI, Input

Fired when the mouse moves while the MouseButton1Down event has fired, but the left mouse button has not been released yet.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `axis` | [[30 Official Roblox Docs/API Reference/Enums/Axis\|Axis]] |  | The [[30 Official Roblox Docs/API Reference/Enums/Axis\|Enum.Axis]] (`X`, `Y`, or `Z`) of the arc handle being dragged. |
| `relativeAngle` | float |  | The angle, in radians, that the handle has rotated around its axis relative to the start of the drag. |
| `deltaRadius` | float |  | The change in radius (the cursor's distance from the handle's center) relative to the start of the drag. |

### MouseEnter

```lua
ArcHandles.MouseEnter(axis: Axis)
```

**Capabilities:** Basic, UI, Input

Fired when a mouse "enters" the GUI handle.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `axis` | [[30 Official Roblox Docs/API Reference/Enums/Axis\|Axis]] |  | The [[30 Official Roblox Docs/API Reference/Enums/Axis\|Enum.Axis]] (`X`, `Y`, or `Z`) of the arc handle the mouse entered. |

### MouseLeave

```lua
ArcHandles.MouseLeave(axis: Axis)
```

**Capabilities:** Basic, UI, Input

Fired when the mouse leaves the GUI handle.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `axis` | [[30 Official Roblox Docs/API Reference/Enums/Axis\|Axis]] |  | The [[30 Official Roblox Docs/API Reference/Enums/Axis\|Enum.Axis]] (`X`, `Y`, or `Z`) of the arc handle the mouse left. |

---
*Source: [ArcHandles](https://create.roblox.com/docs/reference/engine/classes/ArcHandles) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

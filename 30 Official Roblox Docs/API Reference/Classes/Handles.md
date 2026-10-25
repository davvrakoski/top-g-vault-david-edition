---
title: "Handles"
description: "Places 3D handles around any object that its `Adornee` is set to."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Handles"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Places 3D handles around any object that its [[30 Official Roblox Docs/API Reference/Classes/PartAdornment#Adornee|Adornee]] is set to.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/HandlesBase|HandlesBase]] → [[30 Official Roblox Docs/API Reference/Classes/PartAdornment|PartAdornment]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d|GuiBase3d]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

The `Handles` object places 3D handles around any object that its [[30 Official Roblox Docs/API Reference/Classes/PartAdornment#Adornee|Adornee]] is set to; this property must be set to a 3D object for the handles to appear. The color can be changed and the shape of the handles can be set to either arrows or spheres.

For handles to be interactive, they must be parented to a player's [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]] or the [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Handles#Faces\|Faces]] | [[30 Official Roblox Docs/API Reference/Datatypes/Faces\|Faces]] | Sets which sides the GUI handles will appear. |
| [[30 Official Roblox Docs/API Reference/Classes/Handles#Style\|Style]] | [[30 Official Roblox Docs/API Reference/Enums/HandlesStyle\|HandlesStyle]] | Sets the GUI style of the handles. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Handles#MouseButton1Down\|MouseButton1Down]] | `face` | Fired when the left mouse button goes down on one of the GUI handles. |
| [[30 Official Roblox Docs/API Reference/Classes/Handles#MouseButton1Up\|MouseButton1Up]] | `face` | Fired when the left mouse button is released on one of the GUI handles. |
| [[30 Official Roblox Docs/API Reference/Classes/Handles#MouseDrag\|MouseDrag]] | `face`, `distance` | Fired when the mouse moves while the MouseButton1Down event has fired, but the left mouse button has not been released yet. |
| [[30 Official Roblox Docs/API Reference/Classes/Handles#MouseEnter\|MouseEnter]] | `face` | Fired when a mouse "enters" the GUI handle. |
| [[30 Official Roblox Docs/API Reference/Classes/Handles#MouseLeave\|MouseLeave]] | `face` | Fired when the mouse leaves the GUI handle. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/HandlesBase|HandlesBase]], [[30 Official Roblox Docs/API Reference/Classes/PartAdornment|PartAdornment]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase3d|GuiBase3d]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Faces

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Faces|Faces]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI, Input

Sets which sides the GUI handles will appear.

### Style

**Type:** [[30 Official Roblox Docs/API Reference/Enums/HandlesStyle|HandlesStyle]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic, UI, Input

Sets the GUI style of the handles. Currently there are only two types: [[30 Official Roblox Docs/API Reference/Enums/HandlesStyle|Resize]] and [[30 Official Roblox Docs/API Reference/Enums/HandlesStyle|Movement]].

## Events

### MouseButton1Down

```lua
Handles.MouseButton1Down(face: NormalId)
```

**Capabilities:** Basic, UI, Input

Fired when the left mouse button goes down on one of the GUI handles.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `face` | [[30 Official Roblox Docs/API Reference/Enums/NormalId\|NormalId]] |  | The [[30 Official Roblox Docs/API Reference/Enums/NormalId\|Enum.NormalId]] of the face whose handle was pressed. |

### MouseButton1Up

```lua
Handles.MouseButton1Up(face: NormalId)
```

**Capabilities:** Basic, UI, Input

Fired when the left mouse button is released on one of the GUI handles.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `face` | [[30 Official Roblox Docs/API Reference/Enums/NormalId\|NormalId]] |  | The [[30 Official Roblox Docs/API Reference/Enums/NormalId\|Enum.NormalId]] of the face whose handle was pressed when the interaction began. |

### MouseDrag

```lua
Handles.MouseDrag(face: NormalId, distance: float)
```

**Capabilities:** Basic, UI, Input

Fired when the mouse moves while the MouseButton1Down event has fired, but the left mouse button has not been released yet.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `face` | [[30 Official Roblox Docs/API Reference/Enums/NormalId\|NormalId]] |  | The [[30 Official Roblox Docs/API Reference/Enums/NormalId\|Enum.NormalId]] of the face whose handle is being dragged. |
| `distance` | float |  | The signed distance, in studs, that the mouse has been dragged along the handle's axis since [[30 Official Roblox Docs/API Reference/Classes/Handles#MouseButton1Down\|Handles.MouseButton1Down]] fired. |

### MouseEnter

```lua
Handles.MouseEnter(face: NormalId)
```

**Capabilities:** Basic, UI, Input

Fired when a mouse "enters" the GUI handle.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `face` | [[30 Official Roblox Docs/API Reference/Enums/NormalId\|NormalId]] |  | The [[30 Official Roblox Docs/API Reference/Enums/NormalId\|Enum.NormalId]] of the face whose handle the mouse moved onto. |

### MouseLeave

```lua
Handles.MouseLeave(face: NormalId)
```

**Capabilities:** Basic, UI, Input

Fired when the mouse leaves the GUI handle.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `face` | [[30 Official Roblox Docs/API Reference/Enums/NormalId\|NormalId]] |  | The [[30 Official Roblox Docs/API Reference/Enums/NormalId\|Enum.NormalId]] of the face whose handle the mouse moved off of. |

---
*Source: [Handles](https://create.roblox.com/docs/reference/engine/classes/Handles) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

---
title: "Dragger"
description: "A helper object used to create tools that can drag parts."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Dragger"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A helper object used to create tools that can drag parts.*

> [!warning] Deprecated
> This class has been deprecated, as it does not work well with
> `Class.Workspace.FilteringEnabled|FilteringEnabled`, and should not be used in
> new work.

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

The **Dragger** object is a helper object used to create tools that can drag parts. It is expected (but not required) to be used with [[30 Official Roblox Docs/API Reference/Classes/Mouse|Mouse]] events.

Primarily used with the RbxStamper library.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Dragger#AxisRotate\|AxisRotate()]] | () | Rotates the currently dragged part(s) by 90 degrees on the given axis. |
| [[30 Official Roblox Docs/API Reference/Classes/Dragger#MouseDown\|MouseDown()]] | () | Initializes a dragging action, specifying which parts to use when dragging. |
| [[30 Official Roblox Docs/API Reference/Classes/Dragger#MouseMove\|MouseMove()]] | () | Tries to move the currently dragged part to the point where MouseRay hits another part. |
| [[30 Official Roblox Docs/API Reference/Classes/Dragger#MouseUp\|MouseUp()]] | () | Stops the current dragging action (made by [[30 Official Roblox Docs/API Reference/Classes/Dragger#MouseDown\|Dragger:MouseDown()]]). |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### AxisRotate

```lua
Dragger:AxisRotate(axis: Axis = X): ()
```

**Thread safety:** Unsafe · **Capabilities:** Physics

Rotates the currently dragged part(s) by 90 degrees around the specified world axis. This method can only be called while a drag is actively in progress (after [[30 Official Roblox Docs/API Reference/Classes/Dragger#MouseDown|Dragger:MouseDown()]] has been called and [[30 Official Roblox Docs/API Reference/Classes/Dragger#MouseMove|Dragger:MouseMove()]] has initiated movement). The `axis` parameter defaults to [[30 Official Roblox Docs/API Reference/Enums/Axis|Enum.Axis.X]].

For single-part drags the rotation is performed about the snap face axis. For multi-part drags the rotation is applied around the computed center of the part group using a collision-aware routine that prevents overlap with surrounding geometry.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `axis` | [[30 Official Roblox Docs/API Reference/Enums/Axis\|Axis]] | `X` | The [[30 Official Roblox Docs/API Reference/Enums/Axis\|Enum.Axis]] (`X`, `Y`, or `Z`) around which to rotate. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### MouseDown

```lua
Dragger:MouseDown(mousePart: Instance, pointOnMousePart: Vector3, parts: Instances): ()
```

**Thread safety:** Unsafe · **Capabilities:** Physics

Initializes a dragging action by registering the parts to drag and the point on the mouse part where the interaction began. This method does not immediately begin moving parts; actual movement starts on a subsequent [[30 Official Roblox Docs/API Reference/Classes/Dragger#MouseMove|Dragger:MouseMove()]] call once the mouse has moved beyond a break-free threshold (half the current grid snap distance).

`mousePart` must be a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] that is both a member of `parts` and a descendant of [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]]. Calling this method while a drag is already active (before [[30 Official Roblox Docs/API Reference/Classes/Dragger#MouseUp|Dragger:MouseUp()]]) throws an error. While a drag is pending, camera mouse-pan is disabled so that mouse movement applies to the drag instead of the viewport.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `mousePart` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] under the mouse that serves as the drag handle. Must be a member of `parts` and must be in the [[30 Official Roblox Docs/API Reference/Classes/Workspace\|Workspace]]. |
| `pointOnMousePart` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] in the local coordinate space of `mousePart` indicating where the mouse initially contacted the part. |
| `parts` | Instances |  | An array of [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] to move together during the drag. Must include `mousePart` and contain at least one element. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### MouseMove

```lua
Dragger:MouseMove(mouseRay: Ray): ()
```

**Thread safety:** Unsafe · **Capabilities:** Physics

Attempts to move the currently dragged parts to the location indicated by `mouseRay`. Must be called after [[30 Official Roblox Docs/API Reference/Classes/Dragger#MouseDown|Dragger:MouseDown()]].

On the first call that detects sufficient mouse movement (exceeding half the grid snap distance), the method transitions into active dragging: it un-joins the dragged parts from surrounding geometry, aligns them to the grid, and begins tracking movement. On each subsequent call, the ray is cast against other parts in the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] (or against the world ground plane at Y = 0 if nothing is hit), and the dragged parts are moved toward that snap point using a collision-aware algorithm that prevents them from overlapping existing geometry. Single-part drags use surface snapping; multi-part drags use grid-aligned displacement with Y-drop collision avoidance.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `mouseRay` | [[30 Official Roblox Docs/API Reference/Datatypes/Ray\|Ray]] |  | A [[30 Official Roblox Docs/API Reference/Datatypes/Ray\|Ray]] representing the current mouse position in world space (origin at the camera, direction toward the pointer). |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### MouseUp

```lua
Dragger:MouseUp(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Physics

Stops the current dragging action initiated by [[30 Official Roblox Docs/API Reference/Classes/Dragger#MouseDown|Dragger:MouseDown()]]. If parts were actively being dragged, this method re-joins them to adjacent geometry and finalizes their position. If `MouseDown` was called but the mouse never moved far enough to begin actual dragging, the state is simply reset. In both cases camera mouse-pan is re-enabled.

Calling this method without a prior [[30 Official Roblox Docs/API Reference/Classes/Dragger#MouseDown|Dragger:MouseDown()]] throws an error.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [Dragger](https://create.roblox.com/docs/reference/engine/classes/Dragger) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

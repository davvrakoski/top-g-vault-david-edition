---
title: "DraggerService"
description: "A service that centralizes the global dragger settings that Studio's dragging tools read so they move, snap, and highlight objects consistently."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/DraggerService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A service that centralizes the global dragger settings that Studio's dragging tools read so they move, snap, and highlight objects consistently.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

`DraggerService` is a central hub for dragger-related settings that Studio's dragging tools (and other dragger-like editing UX) read when deciding how to move, snap, and highlight objects. Because the Move, Scale, and Rotate tools all consult the same service, changing a setting here keeps their snapping, collision, joint, and hover behavior in sync. Each property reflects the corresponding Studio editing preference or global editing state.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DraggerService#AlignDraggedObjects\|AlignDraggedObjects]] | boolean | Whether a dragged object is re-aligned to the surface it is dropped onto. |
| [[30 Official Roblox Docs/API Reference/Classes/DraggerService#AngleSnapEnabled\|AngleSnapEnabled]] | boolean | Whether rotation drags snap to multiples of [[30 Official Roblox Docs/API Reference/Classes/DraggerService#AngleSnapIncrement\|DraggerService.AngleSnapIncrement]]. |
| [[30 Official Roblox Docs/API Reference/Classes/DraggerService#AngleSnapIncrement\|AngleSnapIncrement]] | float | The angle, in degrees, that rotation drags snap to. |
| [[30 Official Roblox Docs/API Reference/Classes/DraggerService#AnimateHover\|AnimateHover]] | boolean | Whether the hover highlight pulses instead of staying static. |
| [[30 Official Roblox Docs/API Reference/Classes/DraggerService#CollisionsEnabled\|CollisionsEnabled]] | boolean | Whether draggers prevent a moved object from overlapping other geometry. |
| [[30 Official Roblox Docs/API Reference/Classes/DraggerService#DraggerCoordinateSpace\|DraggerCoordinateSpace]] | [[30 Official Roblox Docs/API Reference/Enums/DraggerCoordinateSpace\|DraggerCoordinateSpace]] | Whether drag transforms are applied in the object's local space or in world space. |
| [[30 Official Roblox Docs/API Reference/Classes/DraggerService#DraggerMovementMode\|DraggerMovementMode]] | [[30 Official Roblox Docs/API Reference/Enums/DraggerMovementMode\|DraggerMovementMode]] | Whether dragging moves objects geometrically or by respecting physical constraints. |
| [[30 Official Roblox Docs/API Reference/Classes/DraggerService#GeometrySnapColor\|GeometrySnapColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | The color of the on-screen indicators drawn when a drag snaps to geometry. |
| [[30 Official Roblox Docs/API Reference/Classes/DraggerService#HoverAnimateFrequency\|HoverAnimateFrequency]] | float | The frequency, in hertz, at which the hover highlight animates. |
| [[30 Official Roblox Docs/API Reference/Classes/DraggerService#HoverThickness\|HoverThickness]] | float | The thickness of the highlight outline drawn around the object under the cursor. |
| [[30 Official Roblox Docs/API Reference/Classes/DraggerService#JointsEnabled\|JointsEnabled]] | boolean | Whether draggers create surface joints between touching parts when a drag ends. |
| [[30 Official Roblox Docs/API Reference/Classes/DraggerService#LinearSnapEnabled\|LinearSnapEnabled]] | boolean | Whether positional drags snap to a grid of [[30 Official Roblox Docs/API Reference/Classes/DraggerService#LinearSnapIncrement\|DraggerService.LinearSnapIncrement]]. |
| [[30 Official Roblox Docs/API Reference/Classes/DraggerService#LinearSnapIncrement\|LinearSnapIncrement]] | float | The grid size, in studs, that positional drags snap to. |
| [[30 Official Roblox Docs/API Reference/Classes/DraggerService#PartSnapEnabled\|PartSnapEnabled]] | boolean | Whether draggers snap to alignment points on nearby parts. |
| [[30 Official Roblox Docs/API Reference/Classes/DraggerService#PivotSnapToGeometry\|PivotSnapToGeometry]] | boolean | Whether an object's pivot snaps to points on nearby geometry while it is being edited. |
| [[30 Official Roblox Docs/API Reference/Classes/DraggerService#ShowHover\|ShowHover]] | boolean | Whether a highlight is drawn over the object currently under the cursor. |
| [[30 Official Roblox Docs/API Reference/Classes/DraggerService#ShowPivotIndicator\|ShowPivotIndicator]] | boolean | Whether to show the pivot indicator for a selected object as it's being dragged. |
| [[30 Official Roblox Docs/API Reference/Classes/DraggerService#UseBoundingBoxes\|UseBoundingBoxes]] | boolean | Whether draggers use axis-aligned bounding boxes rather than precise geometry for snapping calculations. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AlignDraggedObjects

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

When `true`, a dragged object is rotated to align with the surface it is dropped on instead of keeping its original orientation. This reflects Studio's "Align Dragged Objects" editing preference and is read by the dragging tools.

### AngleSnapEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

When `true`, rotating an object with a dragger snaps the rotation to multiples of [[30 Official Roblox Docs/API Reference/Classes/DraggerService#AngleSnapIncrement|DraggerService.AngleSnapIncrement]]. When `false`, rotation is continuous and the increment has no effect.

### AngleSnapIncrement

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

The rotation snapping step, in degrees, applied while [[30 Official Roblox Docs/API Reference/Classes/DraggerService#AngleSnapEnabled|DraggerService.AngleSnapEnabled]] is `true`; it has no effect when angle snapping is disabled. The value is clamped to a small positive minimum, so it can never be set to `0` or a negative number.

### AnimateHover

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

When `true`, the highlight drawn over the object under the cursor animates (pulses) at [[30 Official Roblox Docs/API Reference/Classes/DraggerService#HoverAnimateFrequency|DraggerService.HoverAnimateFrequency]]. It only has a visible effect when [[30 Official Roblox Docs/API Reference/Classes/DraggerService#ShowHover|DraggerService.ShowHover]] is `true`.

### CollisionsEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

When `true`, dragging performs collision checking so that a moved object stops against other parts instead of passing through them. When `false`, objects can be dragged freely through existing geometry.

### DraggerCoordinateSpace

**Type:** [[30 Official Roblox Docs/API Reference/Enums/DraggerCoordinateSpace|DraggerCoordinateSpace]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Controls the coordinate space draggers operate in: [[30 Official Roblox Docs/API Reference/Enums/DraggerCoordinateSpace|Enum.DraggerCoordinateSpace.Object]] moves and rotates relative to the object's own orientation, while [[30 Official Roblox Docs/API Reference/Enums/DraggerCoordinateSpace|Enum.DraggerCoordinateSpace.World]] uses the global axes. Defaults to [[30 Official Roblox Docs/API Reference/Enums/DraggerCoordinateSpace|Enum.DraggerCoordinateSpace.Object]].

### DraggerMovementMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/DraggerMovementMode|DraggerMovementMode]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Selects how draggers compute movement: [[30 Official Roblox Docs/API Reference/Enums/DraggerMovementMode|Enum.DraggerMovementMode.Geometric]] applies transforms directly, while [[30 Official Roblox Docs/API Reference/Enums/DraggerMovementMode|Enum.DraggerMovementMode.Physical]] respects physical constraints while dragging. Defaults to [[30 Official Roblox Docs/API Reference/Enums/DraggerMovementMode|Enum.DraggerMovementMode.Geometric]].

### GeometrySnapColor

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

The [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]] used to draw the snapping indicators (such as pivot-to-geometry snap points) shown while dragging. It reflects the corresponding Studio color preference.

### HoverAnimateFrequency

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

How fast the hover highlight pulses, in cycles per second, when [[30 Official Roblox Docs/API Reference/Classes/DraggerService#AnimateHover|DraggerService.AnimateHover]] is `true`. The value corresponds to Studio's hover-animation speed preference, which ranges from `0.5` (very slow) to `10` (very fast).

### HoverThickness

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

The thickness of the outline drawn around the object beneath the cursor. It is only visible when [[30 Official Roblox Docs/API Reference/Classes/DraggerService#ShowHover|DraggerService.ShowHover]] is `true`, and reflects Studio's hover-outline thickness preference.

### JointsEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

When `true`, parts that come to rest against other surfaces during a drag are joined to them (for example, surface welds) when the drag finishes. When `false`, dragging does not create joints.

### LinearSnapEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

When `true`, moving an object with a dragger snaps its position to a grid whose spacing is [[30 Official Roblox Docs/API Reference/Classes/DraggerService#LinearSnapIncrement|DraggerService.LinearSnapIncrement]]. When `false`, movement is continuous and the increment has no effect.

### LinearSnapIncrement

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

The spacing, in studs, of the movement grid applied while [[30 Official Roblox Docs/API Reference/Classes/DraggerService#LinearSnapEnabled|DraggerService.LinearSnapEnabled]] is `true`; it has no effect when linear snapping is disabled. The value is clamped to a small positive minimum, so it can never be set to `0` or a negative number.

### PartSnapEnabled

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

When `true`, dragging snaps the moved object to salient points (such as edges and corners) on nearby parts, in addition to any grid snapping. When `false`, part-to-part snapping is off.

### PivotSnapToGeometry

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

When `true`, dragging an object's pivot snaps it to points on surrounding geometry (for example vertices, edges, and face centers). When `false`, the pivot moves freely.

### ShowHover

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

When `true`, draggers draw a highlight over the object beneath the cursor to indicate what a drag would affect. When `false`, no hover highlight is shown and [[30 Official Roblox Docs/API Reference/Classes/DraggerService#AnimateHover|DraggerService.AnimateHover]], [[30 Official Roblox Docs/API Reference/Classes/DraggerService#HoverThickness|DraggerService.HoverThickness]], and [[30 Official Roblox Docs/API Reference/Classes/DraggerService#HoverAnimateFrequency|DraggerService.HoverAnimateFrequency]] have no visible effect.

### ShowPivotIndicator

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

When `true`, the pivot indicator (the marker showing an object's pivot point) is shown while dragging. Defaults to `false`.

### UseBoundingBoxes

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

When `true`, the dragging tools use the axis-aligned bounding box of an object for snapping instead of its precise geometric shape. This can simplify placement when objects have complex geometry. The setting corresponds to Studio's "Use Bounding Boxes" option in the dragger-settings ribbon dropdown. Defaults to `false`.

---
*Source: [DraggerService](https://create.roblox.com/docs/reference/engine/classes/DraggerService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

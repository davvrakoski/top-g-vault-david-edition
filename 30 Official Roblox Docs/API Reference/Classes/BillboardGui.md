---
title: "BillboardGui"
description: "A container for `GuiObjects` that renders in 3D space facing the camera."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/BillboardGui"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A container for [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] that renders in 3D space facing the camera.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/LayerCollector|LayerCollector]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

[[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] is a container for UI objects to appear in the 3D space but always face the camera. The container's position is relative to the parent [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] (or the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#Adornee|Adornee]]). For [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]], the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Position|Position]] property is used, while for [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]], the [[30 Official Roblox Docs/API Reference/Classes/Attachment#WorldPosition|WorldPosition]] property is used.

*(image in the full Top G Vault)*

A billboard's [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#Size|Size]] property works slightly differently than [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size|GuiObject.Size]]. While the **offset** components work the same, the **scale** components are used as stud sizes in 3D space.

When creating a size-scaled [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] that contains a [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]], it's useful to enable the label's [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextScaled|TextScaled]] property so that its text scales along with the billboard canvas as the camera distance changes.

Note that interactive UI elements like [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButtons]] and [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButtons]] inside a [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] will only receive user input if they are parented to the [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]], typically via placing the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] inside [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]]. The [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#Adornee|Adornee]] property can be used to target a part or attachment in the 3D world while the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] itself remains in the [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]].

See [[30 Official Roblox Docs/UI/In-game UI containers#Billboard UI|In-Experience UI]] for a guide on working with [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] containers.

##### Caching Behavior

To help improve performance, the appearance of a [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] is cached until one of the following occurs, after which its appearance will be recomputed on the next rendering frame.

- A descendant is added to or removed from the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]].
- A property of a descendant of the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] changes.
- A property of the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] itself changes.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#Active\|Active]] | boolean | Controls whether the descendants will receive input events. |
| [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#Adornee\|Adornee]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Sets the target part or attachment that the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui\|BillboardGui]] is positioned relative to. |
| [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#AlwaysOnTop\|AlwaysOnTop]] | boolean | Determines whether the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui\|BillboardGui]] will always be rendered on top of other 3D objects. |
| [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#Brightness\|Brightness]] | float | Determines the factor by which the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui\|BillboardGui]] container's light is scaled when [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#LightInfluence\|LightInfluence]] is `0`. |
| [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#ClipsDescendants\|ClipsDescendants]] | boolean | Whether portions of [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObjects]] that fall outside of the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui\|BillboardGui]] canvas borders will be drawn. |
| [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#CurrentDistance\|CurrentDistance]] | float | The current distance in studs that the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui\|BillboardGui]] is from the player's camera. |
| [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#DistanceLowerLimit\|DistanceLowerLimit]] | float | **Deprecated.** Determines the distance in studs at which the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui\|BillboardGui]] will stop scaling larger in size. |
| [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#DistanceStep\|DistanceStep]] | float | Determines the size [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#CurrentDistance\|CurrentDistance]] increments and decrements in studs as the player's camera moves closer and further from the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui\|BillboardGui]]. |
| [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#DistanceUpperLimit\|DistanceUpperLimit]] | float | **Deprecated.** Determines the distance in studs at which the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui\|BillboardGui]] will stop scaling smaller in size. |
| [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#ExtentsOffset\|ExtentsOffset]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Determines how the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui\|BillboardGui]] is offset from its [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#Adornee\|Adornee]], relative to the [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]] orientation, in units half the dimensions of the model's [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]]-aligned bounding box. |
| [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#ExtentsOffsetWorldSpace\|ExtentsOffsetWorldSpace]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Determines how the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui\|BillboardGui]] is offset from its [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#Adornee\|Adornee]], relative to the global axes, in units half the dimensions of the model's axis-aligned bounding box. |
| [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#LightInfluence\|LightInfluence]] | float | Controls how much the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui\|BillboardGui]] is influenced by environmental lighting. |
| [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#MaxDistance\|MaxDistance]] | float | Controls how far away the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui\|BillboardGui]] can be displayed before it stops rendering. |
| [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#PlayerToHideFrom\|PlayerToHideFrom]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Used by scripts to hide the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui\|BillboardGui]] from a specific player. |
| [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#Size\|Size]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] | Controls the size that the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui\|BillboardGui]] will have on screen. |
| [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#SizeOffset\|SizeOffset]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | A 2D offset in size-relative units that acts like an anchor point. |
| [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#StudsOffset\|StudsOffset]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Determines how the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui\|BillboardGui]] is offset from its [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#Adornee\|Adornee]] in studs, relative to the [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]] orientation. |
| [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#StudsOffsetWorldSpace\|StudsOffsetWorldSpace]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Determines how the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui\|BillboardGui]] is offset from its [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#Adornee\|Adornee]] in studs, relative to the global axes. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/LayerCollector|LayerCollector]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Active

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

Controls whether the descendants will receive input events. If the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] contains a [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]], that button will become clickable only if [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#Active|Active]] is set to `true` on both the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] **and** the button.

Note that interactive UI elements like [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButtons]] and [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButtons]] inside a [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] will only receive user input if they are parented to the [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]], typically via placing the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] inside [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]]. The [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#Adornee|Adornee]] property can be used to target a part or attachment in the 3D world while the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] itself remains in the [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]].

### Adornee

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

Sets the target [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] that the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] is positioned relative to, overriding the parent part or attachment.

### AlwaysOnTop

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines whether the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] will always render on top of other 3D objects.

When set to `false` (default), the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] renders like other 3D content and is occluded by other 3D objects. When set to `true`, the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] always renders on top of 3D content and the appearance changes significantly:

- Colors match how they appear inside a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]].
- Text may appear sharper on high DPI devices.
- [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#LightInfluence|LightInfluence]] is treated as though it's `0`.
- [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#Brightness|Brightness]] has no effect.

### Brightness

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines the factor by which the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] container's light is scaled when [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#LightInfluence|LightInfluence]] is `0`. By default, this property is `1` and can be set to any number between `0` and `1000`. By modifying this property, the apparent brightness of a [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] can be better matched to its environment. For instance, a video billboard can be brightened inside a dark room by increasing [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#Brightness|Brightness]] to `10`.

Note that [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#Brightness|Brightness]] is inaccessible in Studio and has no effect when either [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#LightInfluence|LightInfluence]] is `1` or [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#AlwaysOnTop|AlwaysOnTop]] is `true`.

### ClipsDescendants

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** UI

When set to `true` (default), portions of [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] that fall outside of the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] canvas borders will not be drawn.

Even when this property is `false`, [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] that are **completely** outside of the canvas will not render.

### CurrentDistance

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** UI · **Tags:** `ReadOnly`, `NotReplicated`

The current distance in studs that the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] is from the player's camera. A changed event does not fire for this property unless [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#DistanceStep|DistanceStep]] is more than `0`.

### DistanceLowerLimit

> [!warning] Deprecated
> This member is deprecated.

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI · **Tags:** `Deprecated`

Determines the distance in studs at which the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] will stop scaling larger in size relative to the player's current camera, with a default of `0`. If the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#CurrentDistance|CurrentDistance]] of the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] is below this value, it will not scale any larger than it would at this distance.

### DistanceStep

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/false · **Capabilities:** UI · **Tags:** `NotReplicated`

Determines the size [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#CurrentDistance|CurrentDistance]] increments and decrements in studs as the player's camera moves closer and further from the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]]. The property defaults to `0`.

### DistanceUpperLimit

> [!warning] Deprecated
> This member is deprecated.

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI · **Tags:** `Deprecated`

Determines the distance in studs at which the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] will stop scaling smaller in size relative to the player's current camera. If the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#CurrentDistance|CurrentDistance]] of the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] is above this value, it will not scale any smaller than it would at this distance.

This property is ignored if the value is less than `0`. The default value is `-1`, meaning the property is ignored by default.

### ExtentsOffset

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines how the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] is offset from its [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#Adornee|Adornee]], relative to the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] orientation, in units half the dimensions of the model's [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]]-aligned bounding box.

See also [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#StudsOffset|StudsOffset]] which works similarly but uses stud units, or [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#ExtentsOffsetWorldSpace|ExtentsOffsetWorldSpace]] which works similarly except the offset orientation is relative to the global axes.

### ExtentsOffsetWorldSpace

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines how the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] is offset from its [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#Adornee|Adornee]], relative to the global axes, in units half the dimensions of the model's axis-aligned bounding box.

See also [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#StudsOffset|StudsOffset]] which works similarly but uses stud units, or [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#ExtentsOffset|ExtentsOffset]] which works similarly except the offset orientation is relative to the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]].

### LightInfluence

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

Controls how much the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] is influenced by environmental lighting, in a range from `0` to `1`. Setting this to `1` means that surrounding lighting has complete control over the appearance, while setting it to `0` means that the lighting has no effect.

### MaxDistance

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

This property controls how far from the camera the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] will be displayed before it stops rendering. A value of `0` or `inf` (default) means there is no limit and it will render infinitely far away.

For [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGuis]] that appear outdoors, it's recommended that [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#MaxDistance|MaxDistance]] is high enough to ensure that the container's UI is sufficiently small on the screen when it appears or disappears, minimizing the sudden pop‑in/out effect.

### PlayerToHideFrom

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

Used by scripts to hide the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] from a specific player.

To hide a [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] from more than one player, place it into [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]] and use a script to set the [[30 Official Roblox Docs/API Reference/Classes/LayerCollector#Enabled|Enabled]] property according to whether the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer|LocalPlayer]] should be able to see it. The [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#Adornee|Adornee]] property can be used to attach the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] in the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]], instead of parenting it.

### Size

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

Controls the size that the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] will have on screen. Unlike [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size|GuiObject.Size]], the [[30 Official Roblox Docs/UI/Position and size UI objects#Size|scale]] components of this property set the billboard's stud size in 3D space.

### SizeOffset

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

A 2D offset in size-relative units that acts like an anchor point. This can be used similarly to the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AnchorPoint|GuiObject.AnchorPoint]] property, but the values are different.

| | |
| --- | --- |
| `0, 0` | The default in which UI will be anchored at its center. |
| `0.5, 0.5` | UI will anchor at the bottom left. |
| `0.5, -0.5` | UI will anchor at the top left. |
| `-0.5, 0.5` | UI will anchor at the top right. |
| `-0.5, -0.5` | UI will anchor at the bottom right. |

See also [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#StudsOffset|StudsOffset]], [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#StudsOffsetWorldSpace|StudsOffsetWorldSpace]], [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#ExtentsOffset|ExtentsOffset]], and [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#ExtentsOffsetWorldSpace|ExtentsOffsetWorldSpace]] which are offset properties that work in 3D space instead.

### StudsOffset

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines how the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] is offset from its [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#Adornee|Adornee]] in studs, relative to the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] orientation.

See also [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#StudsOffsetWorldSpace|StudsOffsetWorldSpace]] which works similarly except the offset orientation is relative to the global axes.

### StudsOffsetWorldSpace

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines how the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] is offset from its [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#Adornee|Adornee]] in studs, relative to the global axes.

See also [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#StudsOffset|StudsOffset]] which works similarly except the offset orientation is relative to the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]].

---
*Source: [BillboardGui](https://create.roblox.com/docs/reference/engine/classes/BillboardGui) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

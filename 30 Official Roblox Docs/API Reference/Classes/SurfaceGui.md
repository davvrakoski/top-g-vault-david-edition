---
title: "SurfaceGui"
description: "Container for GuiObjects that are rendered on the surface of a part."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/SurfaceGui"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Container for GuiObjects that are rendered on the surface of a part.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/SurfaceGuiBase|SurfaceGuiBase]] → [[30 Official Roblox Docs/API Reference/Classes/LayerCollector|LayerCollector]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

[[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] allows for the rendering of UI objects onto a part's surface in the 3D world while also allowing for basic user interaction to occur. Similar to [[30 Official Roblox Docs/API Reference/Classes/Decal|Decals]] and [[30 Official Roblox Docs/API Reference/Classes/Texture|Textures]], UI objects such as [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabels]] and [[30 Official Roblox Docs/API Reference/Classes/ImageLabel|ImageLabels]] parented to a [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] face the same direction as the surface they're on, editable through the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGuiBase#Face|Face]] property.

*(image in the full Top G Vault)*

Note that interactive UI elements like [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButtons]] and [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButtons]] inside a [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] will only receive user input if they are parented to the [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]], typically via placing the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] inside [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]] (the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGuiBase#Adornee|Adornee]] property can be used to target a part in the 3D world while the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] itself remains in the [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]]). Additionally, the part's [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanQuery|CanQuery]] property must be `true` for the interactive UI element to receive input.

See [[30 Official Roblox Docs/UI/In-game UI containers#Surface UI|In-Experience UI]] for a guide on working with [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] containers.

##### Caching Behavior

To help improve performance, the appearance of a [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] is cached until one of the following occurs, after which its appearance will be recomputed on the next rendering frame.

- A descendant is added to or removed from the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]].
- A property of a descendant of the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] changes.
- A property of the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] itself changes.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui#AlwaysOnTop\|AlwaysOnTop]] | boolean | Determines whether the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui\|SurfaceGui]] will always be rendered on top of other 3D objects. |
| [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui#Brightness\|Brightness]] | float | Determines the factor by which the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui\|SurfaceGui]] container's light is scaled when [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui#LightInfluence\|LightInfluence]] is `0`. |
| [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui#CanvasSize\|CanvasSize]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | The size of a "virtual screen" in "virtual pixels" which makes [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui\|SurfaceGuis]] pixel-to-pixel compatible with [[30 Official Roblox Docs/API Reference/Classes/ScreenGui\|ScreenGuis]]. |
| [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui#ClipsDescendants\|ClipsDescendants]] | boolean | Whether portions of [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObjects]] that fall outside of the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui\|SurfaceGui]] canvas borders will be drawn. |
| [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui#LightInfluence\|LightInfluence]] | float | Controls how much the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui\|SurfaceGui]] is influenced by environmental lighting. |
| [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui#MaxDistance\|MaxDistance]] | float | Controls how far away the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui\|SurfaceGui]] can be displayed before it stops rendering. |
| [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui#PixelsPerStud\|PixelsPerStud]] | float | Determines the density of pixels used for each world-space stud to render the contents of the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui\|SurfaceGui]]. |
| [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui#SizingMode\|SizingMode]] | [[30 Official Roblox Docs/API Reference/Enums/SurfaceGuiSizingMode\|SurfaceGuiSizingMode]] | Determines whether the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui\|SurfaceGui]] will render at a fixed size or scale with its size in studs. |
| [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui#ToolPunchThroughDistance\|ToolPunchThroughDistance]] | float | Sets the distance in which left clicking starts acting on the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui\|SurfaceGui]] instead of for the held [[30 Official Roblox Docs/API Reference/Classes/Tool\|Tool]]. |
| [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui#ZOffset\|ZOffset]] | float | Layers this [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui\|SurfaceGui]] in relation to other [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui\|SurfaceGuis]] on the same face. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/SurfaceGuiBase|SurfaceGuiBase]], [[30 Official Roblox Docs/API Reference/Classes/LayerCollector|LayerCollector]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AlwaysOnTop

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines whether the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] will always render on top of other 3D objects.

When set to `false` (default), the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] renders like other 3D content and is occluded by other 3D objects. When set to `true`, the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] always renders on top of 3D content and the appearance changes significantly:

- Colors match how they appear inside a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]].
- Text may appear sharper on high DPI devices.
- [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui#LightInfluence|LightInfluence]] is treated as though it's `0`.
- [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui#Brightness|Brightness]] has no effect.

### Brightness

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines the factor by which the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] container's light is scaled when [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui#LightInfluence|LightInfluence]] is `0`. By default, this property is `1` and can be set to any number between `0` and `1000`. By modifying this property, the apparent brightness of a [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] can be better matched to its environment. For instance, a video billboard can be brightened inside a dark room by increasing [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui#Brightness|Brightness]] to `10`.

Note that [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui#Brightness|Brightness]] is inaccessible in Studio and has no effect when either [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui#LightInfluence|LightInfluence]] is `1` or [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui#AlwaysOnTop|AlwaysOnTop]] is `true`.

### CanvasSize

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** ReadSafe · **Category:** Sizing · **Loaded/Saved:** true/true · **Capabilities:** UI

The size of a "virtual screen" in "virtual pixels" which makes [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGuis]] pixel-to-pixel compatible with [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGuis]].

### ClipsDescendants

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** UI

When set to `true` (default), portions of [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] that fall outside of the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] canvas borders will not be drawn.

Even when this property is `false`, [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] that are **completely** outside of the canvas will not render.

### LightInfluence

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

Controls how much the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] is influenced by environmental lighting, in a range from `0` to `1`. Setting this to `1` means that surrounding lighting has complete control over the appearance, while setting it to `0` means that the lighting has no effect.

### MaxDistance

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

This property controls how far from the camera the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] will be displayed before it stops rendering. A value of `0` means there is no limit and it will render infinitely far away. The default value of `1000` works fine for most cases.

For [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGuis]] that appear outdoors, it's recommended that [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui#MaxDistance|MaxDistance]] is high enough to ensure that the container's UI is sufficiently small on the screen when it appears or disappears, minimizing the sudden pop‑in/out effect.

### PixelsPerStud

**Type:** float

**Thread safety:** ReadSafe · **Category:** Sizing · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines the density of pixels used for each world-space stud to render the contents of the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]]. Higher values will cause the various [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] within to appear smaller if they are kept the same size. Conversely, lower values will cause objects to appear larger. However, if the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] are scaled proportionally through use of [[30 Official Roblox Docs/API Reference/Classes/UIScale|UIScale]], [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size|GuiObject.Size]], [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextSize|TextLabel.TextSize]], or similar, this property allows for higher definition to be used.

It's important to select a value based on how far away you expect a player to view the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]]. Also be mindful that a large pixel density could negatively affect performance if the face of the adorned part is large enough.

### SizingMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/SurfaceGuiSizingMode|SurfaceGuiSizingMode]]

**Thread safety:** ReadSafe · **Category:** Sizing · **Loaded/Saved:** true/true · **Capabilities:** UI

When set to [[30 Official Roblox Docs/API Reference/Enums/SurfaceGuiSizingMode|Enum.SurfaceGuiSizingMode.PixelsPerStud]] (default), the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] renders with a variable size based on [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui#PixelsPerStud|PixelsPerStud]] and the surface's size in studs.

When set to [[30 Official Roblox Docs/API Reference/Enums/SurfaceGuiSizingMode|Enum.SurfaceGuiSizingMode.FixedSize]], the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] renders with a fixed size set through [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui#CanvasSize|CanvasSize]].

### ToolPunchThroughDistance

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

Sets the distance in which left clicking starts acting on the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] instead of for the held [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]]. If a character is within this distance of the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]], the [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]] will not activate on click.

### ZOffset

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

Layers this [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] in relation to others on the same face (changing this does not visually "lift" or "sink" a [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] from the surface).

---
*Source: [SurfaceGui](https://create.roblox.com/docs/reference/engine/classes/SurfaceGui) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

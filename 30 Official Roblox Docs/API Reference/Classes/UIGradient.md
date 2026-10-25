---
title: "UIGradient"
description: "Applies a color and transparency gradient to the parent `GuiObject`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/UIGradient"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Applies a color and transparency gradient to the parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/UIComponent|UIComponent]] → [[30 Official Roblox Docs/API Reference/Classes/UIBase|UIBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

`UIGradient` applies a color and transparency gradient to the parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]]. The appearance of the gradient is configurable through its [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Color|Color]], [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Transparency|Transparency]], [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Offset|Offset]], [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Rotation|Rotation]], [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Scale|Scale]], [[30 Official Roblox Docs/API Reference/Classes/UIGradient#TileMode|TileMode]], and [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Type|Type]].

`UIGradient` will not apply to child or descendant [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]]. In order to apply the same gradient to multiple objects, you will need multiple gradient instances.

See also [[30 Official Roblox Docs/UI/UI appearance modifiers#Gradient|appearance modifiers]] for more information on the `UIGradient` modifier and how it works.

#### Supported Objects

You can apply `UIGradient` modifiers to [[30 Official Roblox Docs/API Reference/Classes/Frame|Frame]], [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]], [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]], [[30 Official Roblox Docs/API Reference/Classes/ImageLabel|ImageLabel]], [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]], [[30 Official Roblox Docs/API Reference/Classes/Path2D|Path2D]], and [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame|ViewportFrame]]. However, [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame|ScrollingFrame]] and [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]] are not currently supported.

#### Performance Considerations

In order to efficiently use a `UIGradient`, follow these principles:

- Avoid using more than 6 color stops on the [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Color|Color]] sequence.

- Avoid using a `UIGradient` on any object that applies a text stroke ([[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextStrokeColor3|TextStrokeColor3]]), as the gradient will try to blend with strokes and borders, and may cause performance issues.

- Avoid setting [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Color|Color]] and [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Transparency|Transparency]] frequently: this causes the sequence of colors to rebuild often, which is expensive. If possible, set these properties only once and try to animate the [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Offset|Offset]] or [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Rotation|Rotation]] properties to achieve a similar effect. Alternatively, you can change the color of the parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] using such properties as [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundColor3|BackgroundColor3]], [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#ImageColor3|ImageColor3]], or [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextColor3|TextColor3]].

- When applying an unchanging gradient on a UI element whose state changes a lot, there is a tradeoff between using a `UIGradient` (processing time) and a static gradient image (memory).

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Color\|Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence\|ColorSequence]] | Determines the color blended with the parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] along the length of the gradient. |
| [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Enabled\|Enabled]] | boolean | Whether the gradient is enabled or not. |
| [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Offset\|Offset]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Determines the scalar translation of the gradient from the center of the parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]]. |
| [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Rotation\|Rotation]] | float | Determines the clockwise rotation in degrees of the gradient starting from left to right. |
| [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Scale\|Scale]] | float | Multiplies the extent of the gradient, controlling how much of the color/transparency sequence is visible within the element. |
| [[30 Official Roblox Docs/API Reference/Classes/UIGradient#TileMode\|TileMode]] | [[30 Official Roblox Docs/API Reference/Enums/GradientTileMode\|GradientTileMode]] | Determines how the gradient repeats. |
| [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Transparency\|Transparency]] | [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence\|NumberSequence]] | Determines how much the parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] can be seen through along the length of the gradient. |
| [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Type\|Type]] | [[30 Official Roblox Docs/API Reference/Enums/GradientType\|GradientType]] | Determines the shape of the gradient as linear, radial, elliptical, or conical. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/UIComponent|UIComponent]], [[30 Official Roblox Docs/API Reference/Classes/UIBase|UIBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence|ColorSequence]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

This property describes the color to blend with the parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] along the provided [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence|ColorSequence]]. This property works in a similar manner to [[30 Official Roblox Docs/API Reference/Classes/Beam#Color|Beam.Color]] or [[30 Official Roblox Docs/API Reference/Classes/Trail#Color|Trail.Color]], except that it applies over a distance determined by the [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Offset|Offset]] and [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Rotation|Rotation]].

### Enabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

Whether the gradient is enabled or not.

### Offset

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines the scalar translation of the gradient from the center of the parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]]. It is a scalar translation, meaning that the actual pixel offset is determined by the [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsoluteSize|AbsoluteSize]] of the parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]]. For example, a value of `(1, 0)` shifts the gradient horizontally to the right by a distance equal to the parent object's size. Depending on the [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Rotation|Rotation]], this may cause the gradient to be partially visible or not visible at all.

Also see [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Rotation|Rotation]] which also affects the geometry of the applied gradient.

### Rotation

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines the **clockwise** rotation in degrees of the `UIGradient` starting from left to right. The beginning and end control points snap to the edges of the parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]], but maintain the provided rotation.

Also see [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Offset|Offset]] which also affects the geometry of the applied gradient.

### Scale

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI · **Tags:** `NotBrowsable`

This property multiplies the extent of the gradient, controlling how much of the color/transparency sequence is visible within the parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]].

- A value of `1` (default) means the full sequence spans the element exactly once.

- Values **less** than `1` compress the gradient so that the full sequence fits in a smaller region. The remaining area is determined by [[30 Official Roblox Docs/API Reference/Classes/UIGradient#TileMode|TileMode]]. Note that `Scale` is clamped to a minimum of `0.001` to avoid degenerate gradients.

- Values **greater** than `1` stretch the gradient beyond the element bounds so that only a portion of the sequence is visible.

The effect of `Scale` also depends on the gradient's [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Type|Type]]:

- [[30 Official Roblox Docs/API Reference/Enums/GradientType|Enum.GradientType.Linear]] — `Scale` affects the distance between the start and end control points.

- [[30 Official Roblox Docs/API Reference/Enums/GradientType|Enum.GradientType.Radial]] — `Scale` affects the radius of the radial gradient.

- [[30 Official Roblox Docs/API Reference/Enums/GradientType|Enum.GradientType.Elliptical]] — `Scale` affects both radii of the elliptical gradient.

- [[30 Official Roblox Docs/API Reference/Enums/GradientType|Enum.GradientType.Conical]] — `Scale` affects the angular sweep, clamped so that the sweep does not exceed a full revolution.

See also [[30 Official Roblox Docs/API Reference/Classes/UIGradient#TileMode|TileMode]] which determines how the gradient repeats when `Scale` causes it to not fill the entire element.

### TileMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/GradientTileMode|GradientTileMode]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI · **Tags:** `NotBrowsable`

This property determines what happens when the gradient [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Scale|Scale]] is less than `1` or when [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Offset|Offset]] shifts the gradient so that it does not fully cover the element. See [[30 Official Roblox Docs/API Reference/Enums/GradientTileMode|Enum.GradientTileMode]] for possible values and their effect.

See also [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Scale|Scale]] which controls how much of the color/transparency sequence is visible.

### Transparency

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence|NumberSequence]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

This property describes how opaque the parent UI element will be along the provided [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence|NumberSequence]]. This property works in a similar manner to [[30 Official Roblox Docs/API Reference/Classes/Beam#Transparency|Beam.Transparency]] or [[30 Official Roblox Docs/API Reference/Classes/Trail#Transparency|Trail.Transparency]], except that it applies over a distance determined by the [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Offset|Offset]] and [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Rotation|Rotation]].

Note that the envelope values of the [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequenceKeypoint|NumberSequenceKeypoints]] are ignored.

### Type

**Type:** [[30 Official Roblox Docs/API Reference/Enums/GradientType|GradientType]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI · **Tags:** `NotBrowsable`

This property determines how the gradient varies across the parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]]. See [[30 Official Roblox Docs/API Reference/Enums/GradientType|Enum.GradientType]] for possible values and their effect.

See also [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Scale|Scale]] which controls how much of the color/transparency sequence is visible, and [[30 Official Roblox Docs/API Reference/Classes/UIGradient#TileMode|TileMode]] which determines repetition behavior.

---
*Source: [UIGradient](https://create.roblox.com/docs/reference/engine/classes/UIGradient) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

---
title: "UIShadow"
description: "Renders configurable shape or text shadows for the parent UI instance."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/UIShadow"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Renders configurable shape or text shadows for the parent UI instance.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/UIComponent|UIComponent]] → [[30 Official Roblox Docs/API Reference/Classes/UIBase|UIBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

`UIShadow` renders a shadow for its parent UI instance. Key features include:

- Adjust the shadow's blurriness with [[30 Official Roblox Docs/API Reference/Classes/UIShadow#BlurRadius|BlurRadius]].
- Adjust the shadow's color and transparency with [[30 Official Roblox Docs/API Reference/Classes/UIShadow#Color|Color]] and [[30 Official Roblox Docs/API Reference/Classes/UIShadow#Transparency|Transparency]].
- Adjust the shadow's position and size relative to the parent with [[30 Official Roblox Docs/API Reference/Classes/UIShadow#Offset|Offset]] and [[30 Official Roblox Docs/API Reference/Classes/UIShadow#Spread|Spread]].
- Add multiple shadows under the same parent and adjust their render order with [[30 Official Roblox Docs/API Reference/Classes/UIShadow#ZIndex|ZIndex]].
- Add a shadow to the text in [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]], [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]], or [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]] with [[30 Official Roblox Docs/API Reference/Classes/UIShadow#Mode|Mode]].
- Add an inset shadow with [[30 Official Roblox Docs/API Reference/Classes/UIShadow#Inset|Inset]].
- Hide the part of the shadow directly behind the parent with [[30 Official Roblox Docs/API Reference/Classes/UIShadow#ShowBehindParent|ShowBehindParent]].
- Apply a gradient to a shadow's color with a child [[30 Official Roblox Docs/API Reference/Classes/UIGradient|UIGradient]].
- If the parent is rotated with [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Rotation|GuiObject.Rotation]], the shadow will also be rotated.
- If the parent has round corners with [[30 Official Roblox Docs/API Reference/Classes/UICorner|UICorner]], the shadow will also have round corners.

#### Limitations

- `UIShadow` does not support [[30 Official Roblox Docs/API Reference/Classes/Path2D|Path2D]].
- You cannot apply textures to a `UIShadow`.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UIShadow#BlurRadius\|BlurRadius]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] | Determines the shadow's blurriness. |
| [[30 Official Roblox Docs/API Reference/Classes/UIShadow#Color\|Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Determines the shadow's color. |
| [[30 Official Roblox Docs/API Reference/Classes/UIShadow#Enabled\|Enabled]] | boolean | Determines whether the `UIShadow` is visible. |
| [[30 Official Roblox Docs/API Reference/Classes/UIShadow#Inset\|Inset]] | boolean | Determines whether the `UIShadow` is an inset shadow. |
| [[30 Official Roblox Docs/API Reference/Classes/UIShadow#Mode\|Mode]] | [[30 Official Roblox Docs/API Reference/Enums/ApplyShadowMode\|ApplyShadowMode]] | Determines whether the `UIShadow` applies to the parent's shape or text. |
| [[30 Official Roblox Docs/API Reference/Classes/UIShadow#Offset\|Offset]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] | Moves the shadow relative to the parent's position. |
| [[30 Official Roblox Docs/API Reference/Classes/UIShadow#ShowBehindParent\|ShowBehindParent]] | boolean | Determines whether the shadow renders directly behind the parent. |
| [[30 Official Roblox Docs/API Reference/Classes/UIShadow#Spread\|Spread]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] | Expands or shrinks the shadow relative to the parent's size. |
| [[30 Official Roblox Docs/API Reference/Classes/UIShadow#Transparency\|Transparency]] | float | Sets the shadow's transparency. |
| [[30 Official Roblox Docs/API Reference/Classes/UIShadow#ZIndex\|ZIndex]] | int | Determines the shadow's render order relative to sibling `UIShadow` instances. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/UIComponent|UIComponent]], [[30 Official Roblox Docs/API Reference/Classes/UIBase|UIBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### BlurRadius

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/UDim|UDim]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines the shadow's blurriness. A larger value makes the shadow's edges appear softer.

Note that the scale factor of this [[30 Official Roblox Docs/API Reference/Datatypes/UDim|UDim]] property is relative to the parent's width or height, whichever is shorter. This property must also be non-negative; a negative value will be treated as `0`.

### Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines the shadow's color.

### Enabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines whether the `UIShadow` is visible. Default is `true`.

### Inset

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

When `true`, the shadow appears on top of and inside the parent. When `false`, the shadow appears behind the parent.

Defaults to `false`. This property has no effect when [[30 Official Roblox Docs/API Reference/Classes/UIShadow#Mode|Mode]] is [[30 Official Roblox Docs/API Reference/Enums/ApplyShadowMode|Enum.ApplyShadowMode.Text]].

### Mode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ApplyShadowMode|ApplyShadowMode]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

Determines whether the shadow applies to the parent's shape or text. Defaults to [[30 Official Roblox Docs/API Reference/Enums/ApplyShadowMode|Enum.ApplyShadowMode.Shape]], which renders a shadow for the parent's rectangular area.

[[30 Official Roblox Docs/API Reference/Enums/ApplyShadowMode|Enum.ApplyShadowMode.Text]] renders a shadow for text in a [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]], [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]], or [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]]. On other classes, text mode renders no shadow.

[[30 Official Roblox Docs/API Reference/Enums/ApplyShadowMode|Shape]] mode and [[30 Official Roblox Docs/API Reference/Enums/ApplyShadowMode|Text]] mode shadows can coexist under the same parent.

The following properties have no effect in text mode:

- [[30 Official Roblox Docs/API Reference/Classes/UIShadow#Spread|Spread]]
- [[30 Official Roblox Docs/API Reference/Classes/UIShadow#Inset|Inset]]
- [[30 Official Roblox Docs/API Reference/Classes/UIShadow#ShowBehindParent|ShowBehindParent]]

### Offset

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

This property moves the shadow relative to the parent's position. The X scale factor is relative to the parent's width, and the Y scale factor is relative to the parent's height.

### ShowBehindParent

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

When `true`, the entire shadow is rendered. When `false`, the parent's shape masks the portion of the shadow directly behind it. Disabling this property prevents a shadow from obscuring content behind a transparent parent.

Defaults to `true`. This property has no effect when [[30 Official Roblox Docs/API Reference/Classes/UIShadow#Mode|Mode]] is [[30 Official Roblox Docs/API Reference/Enums/ApplyShadowMode|Enum.ApplyShadowMode.Text]] or [[30 Official Roblox Docs/API Reference/Classes/UIShadow#Inset|Inset]] is `true`.

### Spread

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

This property expands or shrinks the shadow relative to the parent's size. The X scale factor is relative to the parent's width, and the Y scale factor is relative to the parent's height. Properties that are relative to the parent's size, such as the scale factors of [[30 Official Roblox Docs/API Reference/Classes/UIShadow#BlurRadius|BlurRadius]] and [[30 Official Roblox Docs/API Reference/Classes/UIShadow#Offset|Offset]], are not affected by `Spread`.

This property has no effect when [[30 Official Roblox Docs/API Reference/Classes/UIShadow#Mode|Mode]] is [[30 Official Roblox Docs/API Reference/Enums/ApplyShadowMode|Enum.ApplyShadowMode.Text]].

When [[30 Official Roblox Docs/API Reference/Classes/UIShadow#Inset|Inset]] is `true`, positive `Spread` values expand the shadow toward the center of the parent instead of outward.

### Transparency

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

This property sets the shadow's transparency, with `0` being fully opaque and `1` being fully transparent.

### ZIndex

**Type:** int

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

If a UI instance has multiple shadows, they are rendered in order of increasing `ZIndex`. Since all shadows are rendered below the parent instance, `ZIndex` can only be negative.

---
*Source: [UIShadow](https://create.roblox.com/docs/reference/engine/classes/UIShadow) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

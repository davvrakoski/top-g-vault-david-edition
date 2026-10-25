---
title: "UIStroke"
description: "Applies an outline to text or a UI border."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/UIStroke"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Applies an outline to text or a UI border.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/UIComponent|UIComponent]] → [[30 Official Roblox Docs/API Reference/Classes/UIBase|UIBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

[[30 Official Roblox Docs/API Reference/Classes/UIStroke|UIStroke]] applies an outline to text or a UI border. Some properties may require enabling the [Improved UIStrokes beta](https://devforum.roblox.com/t/studio-beta-uistroke-improvements-scaling-offsets-and-more/3958036).

Key features include:

- Adjust the [[30 Official Roblox Docs/API Reference/Classes/UIStroke#Color|Color]] and [[30 Official Roblox Docs/API Reference/Classes/UIStroke#Thickness|Thickness]] of the stroke outline.
- Change the stroke [[30 Official Roblox Docs/API Reference/Classes/UIStroke#Transparency|Transparency]] independently from the text or UI object.
- Choose the [[30 Official Roblox Docs/API Reference/Classes/UIStroke#LineJoinMode|LineJoinMode]] of the stroke (round, bevel, or miter).
- Specify the [[30 Official Roblox Docs/API Reference/Classes/UIStroke#BorderStrokePosition|BorderStrokePosition]] on its parent's border and/or an additional [[30 Official Roblox Docs/API Reference/Classes/UIStroke#BorderOffset|BorderOffset]] to the stroke's position.
- Add a gradient to the stroke via the [[30 Official Roblox Docs/API Reference/Classes/UIGradient|UIGradient]] instance.
- Use [[30 Official Roblox Docs/UI/Rich text markup|rich text]] tags to add stroke to inline text segments.

For more details on the [[30 Official Roblox Docs/API Reference/Classes/UIStroke|UIStroke]] object, see [[30 Official Roblox Docs/UI/UI appearance modifiers|Appearance Modifiers]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UIStroke#ApplyStrokeMode\|ApplyStrokeMode]] | [[30 Official Roblox Docs/API Reference/Enums/ApplyStrokeMode\|ApplyStrokeMode]] | Determines whether to apply the stroke to the object's border instead of the text itself. |
| [[30 Official Roblox Docs/API Reference/Classes/UIStroke#BorderOffset\|BorderOffset]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] | Specifies an additional offset to the stroke's position, relative to the parent's minimum height or width. |
| [[30 Official Roblox Docs/API Reference/Classes/UIStroke#BorderStrokePosition\|BorderStrokePosition]] | [[30 Official Roblox Docs/API Reference/Enums/BorderStrokePosition\|BorderStrokePosition]] | Determines the stroke's position on its parent's border. |
| [[30 Official Roblox Docs/API Reference/Classes/UIStroke#Color\|Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Determines the stroke color. |
| [[30 Official Roblox Docs/API Reference/Classes/UIStroke#Enabled\|Enabled]] | boolean | Determines whether the stroke in visible. |
| [[30 Official Roblox Docs/API Reference/Classes/UIStroke#LineJoinMode\|LineJoinMode]] | [[30 Official Roblox Docs/API Reference/Enums/LineJoinMode\|LineJoinMode]] | Determines how corners are interpreted. |
| [[30 Official Roblox Docs/API Reference/Classes/UIStroke#StrokeSizingMode\|StrokeSizingMode]] | [[30 Official Roblox Docs/API Reference/Enums/StrokeSizingMode\|StrokeSizingMode]] | Determines whether the stroke's [[30 Official Roblox Docs/API Reference/Classes/UIStroke#Thickness\|Thickness]] will be measured in pixels or be relative to the parent. |
| [[30 Official Roblox Docs/API Reference/Classes/UIStroke#Thickness\|Thickness]] | float | Determines the stroke's thickness. |
| [[30 Official Roblox Docs/API Reference/Classes/UIStroke#Transparency\|Transparency]] | float | Sets the stroke opacity independently of the parent object's [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundTransparency\|BackgroundTransparency]] or [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextTransparency\|TextTransparency]]. |
| [[30 Official Roblox Docs/API Reference/Classes/UIStroke#ZIndex\|ZIndex]] | int | Determines the order in which the stroke renders relative to sibling [[30 Official Roblox Docs/API Reference/Classes/UIStroke\|UIStroke]] instances. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/UIComponent|UIComponent]], [[30 Official Roblox Docs/API Reference/Classes/UIBase|UIBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### ApplyStrokeMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ApplyStrokeMode|ApplyStrokeMode]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

When a [[30 Official Roblox Docs/API Reference/Classes/UIStroke|UIStroke]] instance is applied to a text object, this property determines whether to apply the stroke to the object's border instead of the text itself.

*(image in the full Top G Vault)*

*`ApplyStrokeMode` = [[30 Official Roblox Docs/API Reference/Enums/ApplyStrokeMode|Contextual]]*

*(image in the full Top G Vault)*

*`ApplyStrokeMode` = [[30 Official Roblox Docs/API Reference/Enums/ApplyStrokeMode|Border]]*

### BorderOffset

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/UDim|UDim]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

This property specifies an additional offset ([[30 Official Roblox Docs/API Reference/Datatypes/UDim|UDim]]) to the stroke's position, relative to the parent's minimum height or width.

*(image in the full Top G Vault)*

*`BorderOffset` = `(0.15, 0)`*

*(image in the full Top G Vault)*

*`BorderOffset` = `(0, -16)`*

### BorderStrokePosition

**Type:** [[30 Official Roblox Docs/API Reference/Enums/BorderStrokePosition|BorderStrokePosition]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines the stroke's position on its parent's border as an [[30 Official Roblox Docs/API Reference/Enums/BorderStrokePosition|Enum.BorderStrokePosition]] value.

*(image in the full Top G Vault)*

*`BorderStrokePosition` = [[30 Official Roblox Docs/API Reference/Enums/BorderStrokePosition|Center]]*

*(image in the full Top G Vault)*

*`BorderStrokePosition` = [[30 Official Roblox Docs/API Reference/Enums/BorderStrokePosition|Inner]]*

*(image in the full Top G Vault)*

*`BorderStrokePosition` = [[30 Official Roblox Docs/API Reference/Enums/BorderStrokePosition|Outer]]*

### Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

Determines the [[30 Official Roblox Docs/API Reference/Classes/UIStroke|UIStroke]] color. You can also insert a [[30 Official Roblox Docs/API Reference/Classes/UIGradient|UIGradient]] instance as a child to create gradient strokes.

*(image in the full Top G Vault)*

*`Color` = `(0, 95, 225)`*

*(image in the full Top G Vault)*

*`UIStroke` with [[30 Official Roblox Docs/API Reference/Classes/UIGradient|UIGradient]] child*

### Enabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines whether the [[30 Official Roblox Docs/API Reference/Classes/UIStroke|UIStroke]] is visible. When set to `false`, the stroke will not be rendered. Defaults to `true`.

### LineJoinMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/LineJoinMode|LineJoinMode]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines how corners are interpreted. It accepts an [[30 Official Roblox Docs/API Reference/Enums/LineJoinMode|Enum.LineJoinMode]] value of either [[30 Official Roblox Docs/API Reference/Enums/LineJoinMode|Round]] (default), [[30 Official Roblox Docs/API Reference/Enums/LineJoinMode|Bevel]], or [[30 Official Roblox Docs/API Reference/Enums/LineJoinMode|Miter]].

*(image in the full Top G Vault)*

*`LineJoinMode` = [[30 Official Roblox Docs/API Reference/Enums/LineJoinMode|Round]]*

*(image in the full Top G Vault)*

*`LineJoinMode` = [[30 Official Roblox Docs/API Reference/Enums/LineJoinMode|Bevel]]*

*(image in the full Top G Vault)*

*`LineJoinMode` = [[30 Official Roblox Docs/API Reference/Enums/LineJoinMode|Miter]]*

### StrokeSizingMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/StrokeSizingMode|StrokeSizingMode]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines whether the stroke's [[30 Official Roblox Docs/API Reference/Classes/UIStroke#Thickness|Thickness]] will be measured in pixels or be scaled relative to the parent. See [[30 Official Roblox Docs/API Reference/Enums/StrokeSizingMode|Enum.StrokeSizingMode]] for further details.

### Thickness

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines the stroke's thickness, measured in pixels (default) or scaled relative to the parent, depending on [[30 Official Roblox Docs/API Reference/Classes/UIStroke#StrokeSizingMode|StrokeSizingMode]].

*(image in the full Top G Vault)*

*`Thickness` = `4`*

*(image in the full Top G Vault)*

*`Thickness` = `12`*

Be mindful of [[30 Official Roblox Docs/UI/UI animation-tweens|tweening]] this [[30 Official Roblox Docs/API Reference/Classes/UIStroke|UIStroke]] property when applied to text objects. This renders and stores many glyph sizes each frame, potentially causing performance issues or text flickering.

### Transparency

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

This property sets the stroke opacity independently of the parent object's [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundTransparency|BackgroundTransparency]] or [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextTransparency|TextTransparency]]. This allows you to render text and borders that are "hollow" (consisting of only an outline).

*(image in the full Top G Vault)*

*`Transparency` = `0.5`  ·  [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextTransparency|TextLabel.TextTransparency]] = `0`*

*(image in the full Top G Vault)*

*`Transparency` = `0`  ·  [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextTransparency|TextLabel.TextTransparency]] = `1`*

### ZIndex

**Type:** int

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines the order in which the stroke renders relative to sibling [[30 Official Roblox Docs/API Reference/Classes/UIStroke|UIStroke]] instances. Those with a lower `ZIndex` render under (behind) those with a higher `ZIndex`.

Note that the rendering order for [[30 Official Roblox Docs/API Reference/Classes/UIStroke|UIStroke]] instances with the same `ZIndex` is undefined. Do not apply multiple [[30 Official Roblox Docs/API Reference/Classes/UIStroke|UIStroke]] instances with the same `ZIndex` if their rendering order matters.

---
*Source: [UIStroke](https://create.roblox.com/docs/reference/engine/classes/UIStroke) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

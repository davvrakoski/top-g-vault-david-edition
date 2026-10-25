---
title: "InputActionLabel"
description: "A `GuiObject` that automatically displays the keybinding for an action as text or an image."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/InputActionLabel"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] that automatically displays the keybinding for an action as text or an image.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Gui

## Description

`InputActionLabel` is a drag-and-drop [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] that automatically shows the appropriate key or icon for an [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]] based on the player's current input device (keyboard/mouse, gamepad, touch, VR). When the player switches devices or the binding is rebound, the label updates instantly without scripting.

Rendering of the `InputActionLabel` depends on the [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]] (linked through [[30 Official Roblox Docs/API Reference/Classes/InputActionLabel#InputAction|InputActionLabel.InputAction]]) and that action's child [[30 Official Roblox Docs/API Reference/Classes/InputBinding|InputBindings]]. As the label resolves what to show, it follows this order:

1. **Custom Images** — If child [[30 Official Roblox Docs/API Reference/Classes/InputBinding|InputBindings]] have their [[30 Official Roblox Docs/API Reference/Classes/InputBinding#DisplayImage|DisplayImage]] property set, the label renders those images directly, optionally modified by [[30 Official Roblox Docs/API Reference/Classes/InputActionLabel#ImageColor3|ImageColor3]] and [[30 Official Roblox Docs/API Reference/Classes/InputActionLabel#ImageTransparency|ImageTransparency]].

2. **Platform Key Images** — Lacking custom images, the label renders platform-provided images for child [[30 Official Roblox Docs/API Reference/Classes/InputBinding|InputBindings]] through [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetImageForKeyCode|UserInputService:GetImageForKeyCode()]], if such images are available. Composite bindings with modifiers show multiple icons with `+` separators.

3. **Custom Names** — Lacking available images, if child [[30 Official Roblox Docs/API Reference/Classes/InputBinding|InputBindings]] have their [[30 Official Roblox Docs/API Reference/Classes/InputBinding#DisplayName|DisplayName]] property set, the label renders that text in a style defined by [[30 Official Roblox Docs/API Reference/Classes/InputActionLabel#FontFace|FontFace]], [[30 Official Roblox Docs/API Reference/Classes/InputActionLabel#TextColor3|TextColor3]], [[30 Official Roblox Docs/API Reference/Classes/InputActionLabel#TextSize|TextSize]], [[30 Official Roblox Docs/API Reference/Classes/InputActionLabel#TextTransparency|TextTransparency]], [[30 Official Roblox Docs/API Reference/Classes/InputActionLabel#TextWrapped|TextWrapped]], [[30 Official Roblox Docs/API Reference/Classes/InputActionLabel#TextXAlignment|TextXAlignment]], and [[30 Official Roblox Docs/API Reference/Classes/InputActionLabel#TextYAlignment|TextYAlignment]].

4. **Platform Key Strings** — Lacking all of the above, the label renders platform-provided strings through [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetStringForKeyCode|UserInputService:GetStringForKeyCode()]].

5. If no [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]] is assigned or no child [[30 Official Roblox Docs/API Reference/Classes/InputBinding|InputBinding]] exists, the label renders a placeholder icon.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/InputActionLabel#FontFace\|FontFace]] | [[30 Official Roblox Docs/API Reference/Datatypes/Font\|Font]] | Determines the font used to render text. |
| [[30 Official Roblox Docs/API Reference/Classes/InputActionLabel#ImageColor3\|ImageColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Determines how rendered label images will be colorized. |
| [[30 Official Roblox Docs/API Reference/Classes/InputActionLabel#ImageTransparency\|ImageTransparency]] | float | Determines the transparency of rendered label images. |
| [[30 Official Roblox Docs/API Reference/Classes/InputActionLabel#InputAction\|InputAction]] | [[30 Official Roblox Docs/API Reference/Classes/InputAction\|InputAction]] | The [[30 Official Roblox Docs/API Reference/Classes/InputAction\|InputAction]] whose preferred binding this label displays. |
| [[30 Official Roblox Docs/API Reference/Classes/InputActionLabel#ResolvedImageContent\|ResolvedImageContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | Read-only. The resolved image content currently being displayed. |
| [[30 Official Roblox Docs/API Reference/Classes/InputActionLabel#ResolvedText\|ResolvedText]] | string | The resolved key name string currently being displayed. |
| [[30 Official Roblox Docs/API Reference/Classes/InputActionLabel#TextColor3\|TextColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Determines the color of rendered text. |
| [[30 Official Roblox Docs/API Reference/Classes/InputActionLabel#TextSize\|TextSize]] | float | Determines the line height of text in offsets. |
| [[30 Official Roblox Docs/API Reference/Classes/InputActionLabel#TextTransparency\|TextTransparency]] | float | Determines the transparency of rendered text. |
| [[30 Official Roblox Docs/API Reference/Classes/InputActionLabel#TextWrapped\|TextWrapped]] | boolean | Determines if text wraps to multiple lines within the label's space. |
| [[30 Official Roblox Docs/API Reference/Classes/InputActionLabel#TextXAlignment\|TextXAlignment]] | [[30 Official Roblox Docs/API Reference/Enums/TextXAlignment\|TextXAlignment]] | Determines the horizontal alignment of rendered text. |
| [[30 Official Roblox Docs/API Reference/Classes/InputActionLabel#TextYAlignment\|TextYAlignment]] | [[30 Official Roblox Docs/API Reference/Enums/TextYAlignment\|TextYAlignment]] | Determines the vertical alignment of rendered text. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### FontFace

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Font|Font]]

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/true · **Capabilities:** UI

This property is similar to [[30 Official Roblox Docs/API Reference/Classes/TextLabel#FontFace|TextLabel.FontFace]] and determines the font family, weight, and style used when the label renders in a text mode.

### ImageColor3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Image · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines how label images are colorized. When set to white, no colorization occurs. This property is useful for reusing image assets; if the source images are completely white with transparency, you can set the entire label color at once with this property.

### ImageTransparency

**Type:** float

**Thread safety:** ReadSafe · **Category:** Image · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines the alpha of rendered label images. A value of `0` is completely opaque and a value of `1` is completely transparent (invisible).

### InputAction

**Type:** [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

The [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]] instance for which to have the label automatically resolve and display its preferred binding. When the binding changes (due to rebinding or input device switching), the label updates automatically.

Setting this to `nil` clears the display and shows the placeholder.

### ResolvedImageContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** UI · **Tags:** `ReadOnly`, `NotReplicated`

Contains the [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] of the first resolved image when the label renders in an image mode. Empty when in text or placeholder mode. This is a read-only property set by the engine when the binding resolves.

### ResolvedText

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** UI · **Tags:** `ReadOnly`, `NotReplicated`

Contains the composed key name string such as `Ctrl + Shift + Space` when the label renders in text mode. Empty when the label renders in image or placeholder mode. This is a read-only property set by the engine when the binding resolves.

### TextColor3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines the color of all text rendered by the label.

### TextSize

**Type:** float

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/true · **Capabilities:** UI

Controls the font size in pixels for text mode rendering. Value is clamped between `1` and `200`.

### TextTransparency

**Type:** float

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines the transparency of all text rendered by the label.

### TextWrapped

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/true · **Capabilities:** UI

When `true`, text renders on multiple lines within the label's space so that [[30 Official Roblox Docs/API Reference/Classes/InputActionLabel#TextSize|TextSize]] lines never exceed the [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsoluteSize|GuiBase2d.AbsoluteSize]] of the object. This is achieved by breaking long lines of text into multiple lines.

### TextXAlignment

**Type:** [[30 Official Roblox Docs/API Reference/Enums/TextXAlignment|TextXAlignment]]

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines the horizontal alignment of text rendered within the label's space.

### TextYAlignment

**Type:** [[30 Official Roblox Docs/API Reference/Enums/TextYAlignment|TextYAlignment]]

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines the vertical alignment of text rendered within the label's space.

---
*Source: [InputActionLabel](https://create.roblox.com/docs/reference/engine/classes/InputActionLabel) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

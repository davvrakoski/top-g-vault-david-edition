---
title: "CanvasGroup"
description: "Blends descendants as a flattened group with an optional color/transparency modification."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/CanvasGroup"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Blends descendants as a flattened group with an optional color/transparency modification.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Gui

## Description

`CanvasGroup` renders its descendants as a flattened group with [[30 Official Roblox Docs/API Reference/Classes/CanvasGroup#GroupColor3|GroupColor3]] and [[30 Official Roblox Docs/API Reference/Classes/CanvasGroup#GroupTransparency|GroupTransparency]] optionally applied to the rendered result. [[30 Official Roblox Docs/API Reference/Classes/UIComponent|UIComponent]] visual modifiers such as [[30 Official Roblox Docs/API Reference/Classes/UICorner|UICorner]] and [[30 Official Roblox Docs/API Reference/Classes/UIGradient|UIGradient]] under a `CanvasGroup` will also apply to the whole group. Note that `CanvasGroup` always has [[30 Official Roblox Docs/API Reference/Classes/GuiObject#ClipsDescendants|ClipsDescendants]] set to `true` and all descendants will be clipped outside the group's bounds.

#### Important Notes

- Descendants of `CanvasGroup` will be rendered as a flattened texture only when the ancestor [[30 Official Roblox Docs/API Reference/Classes/LayerCollector|LayerCollector]] has its [[30 Official Roblox Docs/API Reference/Classes/LayerCollector#ZIndexBehavior|ZIndexBehavior]] set to [[30 Official Roblox Docs/API Reference/Enums/ZIndexBehavior|Enum.ZIndexBehavior.Sibling]].
- `CanvasGroup` consumes extra texture memory. The quality of the texture and total memory usage is limited by the [[30 Official Roblox Docs/API Reference/Enums/QualityLevel|Enum.QualityLevel]] of the client. When exceeding the memory cap, `CanvasGroup` will render as a blank texture.
- It's recommended to use `CanvasGroup` with static sizes, otherwise a new texture would need to be created to accommodate new sizes.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/CanvasGroup#GroupColor3\|GroupColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Color tint that applies to the rendered group. |
| [[30 Official Roblox Docs/API Reference/Classes/CanvasGroup#GroupTransparency\|GroupTransparency]] | float | Transparency that applies to the rendered group. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### GroupColor3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

Color tint that applies to the rendered group.

### GroupTransparency

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

Transparency that applies to the rendered group.

---
*Source: [CanvasGroup](https://create.roblox.com/docs/reference/engine/classes/CanvasGroup) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

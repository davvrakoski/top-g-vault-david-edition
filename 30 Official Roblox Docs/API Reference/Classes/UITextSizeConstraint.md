---
title: "UITextSizeConstraint"
description: "Ensures that the size of text rendered by certain `GuiObject` classes lies within the range described by `MaxTextSize` and `MinTextSize`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/UITextSizeConstraint"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Ensures that the size of text rendered by certain [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] classes lies within the range described by [[30 Official Roblox Docs/API Reference/Classes/UITextSizeConstraint#MaxTextSize|MaxTextSize]] and [[30 Official Roblox Docs/API Reference/Classes/UITextSizeConstraint#MinTextSize|MinTextSize]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/UIConstraint|UIConstraint]] → [[30 Official Roblox Docs/API Reference/Classes/UIComponent|UIComponent]] → [[30 Official Roblox Docs/API Reference/Classes/UIBase|UIBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

A **UITextSizeConstraint** ensures that the size of text rendered by certain [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] classes ([[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]], [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]], or [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]]) lies within the range described by [[30 Official Roblox Docs/API Reference/Classes/UITextSizeConstraint#MaxTextSize|MaxTextSize]] and [[30 Official Roblox Docs/API Reference/Classes/UITextSizeConstraint#MinTextSize|MinTextSize]]. It is meant to be used alongside [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextScaled|TextLabel.TextScaled]], which automatically scales text to fill its containing object. Like other UI constraints, it is applied when parented to the object to be constrained.

It's recommended that no values lower than 9 be used for [[30 Official Roblox Docs/API Reference/Classes/UITextSizeConstraint#MinTextSize|MinTextSize]] property, otherwise text may not be readable to most users.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UITextSizeConstraint#MaxTextSize\|MaxTextSize]] | int | The largest size in pixels the font is allowed to be. |
| [[30 Official Roblox Docs/API Reference/Classes/UITextSizeConstraint#MinTextSize\|MinTextSize]] | int | The smallest size in pixels the font is allowed to be. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/UIConstraint|UIConstraint]], [[30 Official Roblox Docs/API Reference/Classes/UIComponent|UIComponent]], [[30 Official Roblox Docs/API Reference/Classes/UIBase|UIBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### MaxTextSize

**Type:** int

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** UI

This property indicates the largest size in pixels the font is allowed to be. It defaults to 1000 pixels and must be set larger than or equal to the [[30 Official Roblox Docs/API Reference/Classes/UITextSizeConstraint#MinTextSize|MinTextSize]] property.

If the affected [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] has its [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextScaled|TextScaled]] property set to true the text size constrained by this property will scale dynamically with the container's size. It will scale upwards with the GuiObject's size until the max size is reached, at which point it will stay constant if the UI element continues to grow.

### MinTextSize

**Type:** int

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** UI

This property indicated the smallest size in pixels the font is allowed to be. This value defaults to 1 pixel and must be set less than or equal to [[30 Official Roblox Docs/API Reference/Classes/UITextSizeConstraint#MaxTextSize|UITextSizeConstraint.MaxTextSize]].

If the affected [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] has its [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextScaled|TextScaled]] property set to true the text size constrained by this property will scale dynamically with the container's size. It will scale downwards with the GuiObject's size until the min size is reached, at which point it will stay constant if the UI element continues to shrink.

---
*Source: [UITextSizeConstraint](https://create.roblox.com/docs/reference/engine/classes/UITextSizeConstraint) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

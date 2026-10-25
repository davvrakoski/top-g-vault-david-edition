---
title: "UISizeConstraint"
description: "Ensures a `GuiObject` does not become larger or smaller than the constraint's maximum size or minimum size."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/UISizeConstraint"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Ensures a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] does not become larger or smaller than the constraint's maximum size or minimum size.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/UIConstraint|UIConstraint]] → [[30 Official Roblox Docs/API Reference/Classes/UIComponent|UIComponent]] → [[30 Official Roblox Docs/API Reference/Classes/UIBase|UIBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

The [[30 Official Roblox Docs/API Reference/Classes/UISizeConstraint|UISizeConstraint]] ensures a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] does not become larger or smaller than the [[30 Official Roblox Docs/API Reference/Classes/UISizeConstraint#MaxSize|MaxSize]] and [[30 Official Roblox Docs/API Reference/Classes/UISizeConstraint#MinSize|MinSize]]. For example, if [[30 Official Roblox Docs/API Reference/Classes/UISizeConstraint#MaxSize|MaxSize]] is set to

`(200, 200)`

 and
[[30 Official Roblox Docs/API Reference/Classes/UISizeConstraint#MinSize|MinSize]] to

`(100, 100)`

, the constrained object cannot scale to be larger than 200×200 pixels or smaller than 100×100 pixels.

Note that if the object with this constraint is also under the control of a [[30 Official Roblox Docs/API Reference/Classes/UILayout|UILayout]] such as [[30 Official Roblox Docs/API Reference/Classes/UIGridLayout|UIGridLayout]], the **constraint** determines the object's minimum/maximum size and overwrites any size the layout would apply.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UISizeConstraint#MaxSize\|MaxSize]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | The largest size, in pixels, the parent object is allowed to be. |
| [[30 Official Roblox Docs/API Reference/Classes/UISizeConstraint#MinSize\|MinSize]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | The smallest size, in pixels, the object is allowed to be. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/UIConstraint|UIConstraint]], [[30 Official Roblox Docs/API Reference/Classes/UIComponent|UIComponent]], [[30 Official Roblox Docs/API Reference/Classes/UIBase|UIBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### MaxSize

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** UI

The largest size, in pixels, the parent object is allowed to be. The **X** and **Y** of this value must be greater than or equal to the corresponding components of [[30 Official Roblox Docs/API Reference/Classes/UISizeConstraint#MinSize|MinSize]].

### MinSize

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** UI

The smallest size, in pixels, the object is allowed to be. The **X** and **Y** of this value must be less than or equal to the corresponding components of [[30 Official Roblox Docs/API Reference/Classes/UISizeConstraint#MaxSize|MaxSize]].

---
*Source: [UISizeConstraint](https://create.roblox.com/docs/reference/engine/classes/UISizeConstraint) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

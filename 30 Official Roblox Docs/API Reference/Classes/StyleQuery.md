---
title: "StyleQuery"
description: "Instance used to set conditions such as `\"MaxSize\"` and `\"PreferredInput\"` for a `StyleRule`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/StyleQuery"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Instance used to set conditions such as `"MaxSize"` and `"PreferredInput"` for a [[30 Official Roblox Docs/API Reference/Classes/StyleRule|StyleRule]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

`StyleQuery` is an instance used to set conditions like `"MaxSize"` and `"PreferredInput"` for a [[30 Official Roblox Docs/API Reference/Classes/StyleRule|StyleRule]]. If the conditions are `true`, the rule's `@` selector is enabled. This is helpful to author styling with dynamic container sizes and cross-platform UI.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/StyleQuery#IsActive\|IsActive]] | boolean | A boolean that determines whether a [[30 Official Roblox Docs/API Reference/Classes/StyleRule#Selector\|StyleRule.Selector]] of `@` will match the [[30 Official Roblox Docs/API Reference/Classes/StyleQuery\|StyleQuery]] name. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/StyleQuery#GetCondition\|GetCondition()]] | Variant | Returns the value of a specific condition in the `StyleQuery`. |
| [[30 Official Roblox Docs/API Reference/Classes/StyleQuery#GetConditions\|GetConditions()]] | Dictionary | Returns a dictionary of key-value pairs describing the conditoins set on the `StyleQuery`. |
| [[30 Official Roblox Docs/API Reference/Classes/StyleQuery#SetCondition\|SetCondition()]] | () |  |
| [[30 Official Roblox Docs/API Reference/Classes/StyleQuery#SetConditions\|SetConditions()]] | () | Lets you declare and set multiple conditions of the `StyleQuery` at once. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### IsActive

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** false/true · **Capabilities:** UI · **Tags:** `ReadOnly`, `NotReplicated`

A boolean that determines whether a [[30 Official Roblox Docs/API Reference/Classes/StyleRule#Selector|StyleRule.Selector]] of `@` will match the `StyleQuery` name. For example, if a `StyleQuery` named `SmGamepad` has conditions set for [[30 Official Roblox Docs/API Reference/Classes/UserInputService#PreferredInput|UserInputService.PreferredInput]] of [[30 Official Roblox Docs/API Reference/Enums/PreferredInput|Gamepad]] and [[30 Official Roblox Docs/API Reference/Classes/GuiService#ViewportDisplaySize|GuiService.ViewportDisplaySize]] of [[30 Official Roblox Docs/API Reference/Enums/DisplaySize|Small]] and both of these conditions are `true` (player is playing on a small display size and using a gamepad), the parent of the `StyleQuery` will match any [[30 Official Roblox Docs/API Reference/Classes/StyleRule#Selector|StyleRule.Selector]] `@SmGamepad`.

#### Conditions

| Condition | Type | Description |
| --- | --- | --- |
| `AspectRatioRange` | [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange\|NumberRange]] | Evaluates to `true` if the parent width-to-height ratio of [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsoluteSize\|GuiBase2d.AbsoluteSize]] is greater than or equal to `AspectRatioRange.Min` and less than `AspectRatioRange.Max`. |
| `MaxSize` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Evaluates to `true` if the parent [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsoluteSize\|GuiBase2d.AbsoluteSize]] is less than `MaxSize`. |
| `MinSize` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Evaluates to `true` if the parent [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsoluteSize\|GuiBase2d.AbsoluteSize]] is greater than or equal to `MinSize`. |
| `PreferredInput` | [[30 Official Roblox Docs/API Reference/Enums/PreferredInput\|Enum.PreferredInput]] | Evaluates to `true` if `PreferredInput` matches [[30 Official Roblox Docs/API Reference/Classes/UserInputService#PreferredInput\|UserInputService.PreferredInput]]. |
| `PreferredTextSize` | [[30 Official Roblox Docs/API Reference/Enums/PreferredTextSize\|Enum.PreferredTextSize]] | Evaluates to `true` if `PreferredTextSize` matches [[30 Official Roblox Docs/API Reference/Classes/GuiService#PreferredTextSize\|GuiService.PreferredTextSize]]. |
| `ReducedMotionEnabled` | boolean | Evaluates to `true` if `ReducedMotionEnabled` matches [[30 Official Roblox Docs/API Reference/Classes/GuiService#ReducedMotionEnabled\|GuiService.ReducedMotionEnabled]]. |
| `ViewportDisplaySize` | [[30 Official Roblox Docs/API Reference/Enums/DisplaySize\|Enum.DisplaySize]] | Evaluates to `true` if `ViewportDisplaySize` matches [[30 Official Roblox Docs/API Reference/Classes/GuiService#ViewportDisplaySize\|GuiService.ViewportDisplaySize]]. |

## Methods

### GetCondition

```lua
StyleQuery:GetCondition(name: string): Variant
```

**Thread safety:** Unsafe · **Capabilities:** UI

Returns the value of a specific condition in the `StyleQuery`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | String name of the condition, for example `"MaxSize"` or `"ViewportDisplaySize"`. |

**Returns**

| Type | Description |
| --- | --- |
| Variant | Value of the condition. |

### GetConditions

```lua
StyleQuery:GetConditions(): Dictionary
```

**Thread safety:** Unsafe · **Capabilities:** UI

Returns a dictionary of key-value pairs describing the conditoins set on the `StyleQuery`.

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | Dictionary of key-value pairs describing the conditions set on the `StyleQuery`. |

### SetCondition

```lua
StyleQuery:SetCondition(name: string, value: Variant): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI

Sets a new condition (or modifies an existing condition) for the `StyleQuery`. The `name` parameter should be a valid condition of `StyleQuery`, and the assigned value should match the condition's value type, for example [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] for `MaxSize` or [[30 Official Roblox Docs/API Reference/Enums/PreferredInput|Enum.PreferredInput]] for `PreferredInput`.

Attempts to assign invalid condition names such as `"Size"` or `"Input"` will silently fail. Type mismatches such as [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] for `MaxSize` or `string` for `ReducedMotionEnabled` will also fail.

To set multiple conditions for a `StyleQuery` at once, see [[30 Official Roblox Docs/API Reference/Classes/StyleQuery#SetConditions|SetConditions()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | Condition name to set, for example `"MinSize"`. |
| `value` | Variant |  | Condition value to set, for example `Datatype.Vector2.new(100, 0)`. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`StyleQuery-SetCondition`) are published on the source page; their code is not part of the open-source repo.*

### SetConditions

```lua
StyleQuery:SetConditions(conditions: Dictionary): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI

Similar to [[30 Official Roblox Docs/API Reference/Classes/StyleQuery#SetCondition|SetCondition()]] but lets you declare and set multiple conditions of the `StyleQuery` at once. Each `name` parameter should be a valid condition of `StyleQuery`, and the assigned value should match the condition's value type, for example [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] for `MaxSize` or [[30 Official Roblox Docs/API Reference/Enums/PreferredInput|Enum.PreferredInput]] for `PreferredInput`.

Attempts to assign invalid condition names such as `"Size"` or `"Input"` will silently fail. Type mismatches such as [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] for `MaxSize` or `string` for `ReducedMotionEnabled` will also fail.

To set/update just one condition of a `StyleQuery`, see [[30 Official Roblox Docs/API Reference/Classes/StyleQuery#SetCondition|SetCondition()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `conditions` | Dictionary |  | Dictionary of key-value pairs defining the conditions to set. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`StyleQuery-SetConditions`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [StyleQuery](https://create.roblox.com/docs/reference/engine/classes/StyleQuery) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

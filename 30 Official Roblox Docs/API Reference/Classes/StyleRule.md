---
title: "StyleRule"
description: "Defines style properties which override properties on the instances affected by the `Selector` property."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/StyleRule"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Defines style properties which override properties on the instances affected by the [[30 Official Roblox Docs/API Reference/Classes/StyleRule#Selector|Selector]] property.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/StyleBase|StyleBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Gui

## Description

Defines style properties which override properties on the instances affected by the [[30 Official Roblox Docs/API Reference/Classes/StyleRule#Selector|Selector]] property.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/StyleRule#Priority\|Priority]] | int | A number that determines how properties of the `StyleRule` apply relative to the same properties in other `StyleRules`. Higher priority values take precedence over lower. |
| [[30 Official Roblox Docs/API Reference/Classes/StyleRule#Selector\|Selector]] | string | A string specifying which instances the `StyleRule` should affect. |
| [[30 Official Roblox Docs/API Reference/Classes/StyleRule#SelectorError\|SelectorError]] | string | A read-only string that displays errors from the [[30 Official Roblox Docs/API Reference/Classes/StyleRule#Selector\|Selector]] property. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/StyleRule#GetDefaultPropertyTransition\|GetDefaultPropertyTransition()]] | Variant | Returns the default transition applied to all properties of the `StyleRule` that don't have an explicit transition set. |
| [[30 Official Roblox Docs/API Reference/Classes/StyleRule#GetProperties\|GetProperties()]] | Dictionary | Returns a dictionary of key-value pairs describing the properties of the `StyleRule`. |
| [[30 Official Roblox Docs/API Reference/Classes/StyleRule#GetProperty\|GetProperty()]] | Variant | Returns the value of a specific property in the `StyleRule`. |
| [[30 Official Roblox Docs/API Reference/Classes/StyleRule#GetPropertyTransitions\|GetPropertyTransitions()]] | Dictionary | Returns a dictionary of all property transitions set on the `StyleRule`. |
| [[30 Official Roblox Docs/API Reference/Classes/StyleRule#SetDefaultPropertyTransition\|SetDefaultPropertyTransition()]] | () | Sets or clears a default transition that applies to all properties of the `StyleRule` that don't have an explicit transition set. |
| [[30 Official Roblox Docs/API Reference/Classes/StyleRule#SetProperties\|SetProperties()]] | () | Lets you declare and set multiple properties of the `StyleRule` at once. |
| [[30 Official Roblox Docs/API Reference/Classes/StyleRule#SetProperty\|SetProperty()]] | () | Sets or updates a single property of the `StyleRule`. |
| [[30 Official Roblox Docs/API Reference/Classes/StyleRule#SetPropertyTransition\|SetPropertyTransition()]] | () | Sets or clears the transition for a single property on the `StyleRule`. |
| [[30 Official Roblox Docs/API Reference/Classes/StyleRule#SetPropertyTransitions\|SetPropertyTransitions()]] | () | Lets you declare and set transitions for multiple properties of the `StyleRule` at once. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/StyleBase|StyleBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Priority

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

A number that determines how properties of the `StyleRule` apply relative to the same properties in other [[30 Official Roblox Docs/API Reference/Classes/StyleRule|StyleRules]]. Higher priority values take precedence over lower. For example, if a `StyleRule` with a priority of `10` has an `AnchorPoint` property of

`1, 0`

, it will take precedence over lower-priority [[30 Official Roblox Docs/API Reference/Classes/StyleRule|StyleRules]] with `AnchorPoint` properties.

### Selector

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

A string specifying which instances the `StyleRule` should affect. This can be a mix of selectors and combinators to match characteristics such as the class name, instance name, and hierarchy relationships.

For example, `".Container > ImageLabel.BlueOnHover:Hover"` effectively means the style rule overrides every [[30 Official Roblox Docs/API Reference/Classes/ImageLabel|ImageLabel]] that's a child of an instance tagged with `Container` (`.Container > ImageLabel`) **and** is tagged with `BlueOnHover` (`.BlueOnHover`) **and** is in the [[30 Official Roblox Docs/API Reference/Enums/GuiState|Enum.GuiState.Hover]] state (`:Hover`).

#### Selectors

| Selector | Description | Examples |
| --- | --- | --- |
| `[class]` | Matches instances of a [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] or [[30 Official Roblox Docs/API Reference/Classes/UIComponent\|UIComponent]] class. | `"Frame"`<br>`"ImageButton"`<br>`"UICorner"` |
| `.[tag]` | Matches instances [[30 Official Roblox Docs/Studio/Properties window#Instance tags\|tagged]] with a [[30 Official Roblox Docs/API Reference/Classes/CollectionService\|CollectionService]] tag. | `".Container"`<br>`".BlueOnHover"` |
| `#[name]` | Matches instances of a specific [[30 Official Roblox Docs/API Reference/Classes/Instance#Name\|Instance.Name]]. | `"#ModalFrame"`<br>`"#CloseButton"` |
| `:[state]` | Matches instances currently in a [[30 Official Roblox Docs/API Reference/Enums/GuiState\|Enum.GuiState]]. | `":Hover"` |
| `@[StyleQuery name]` | Matches instances with child [[30 Official Roblox Docs/API Reference/Classes/StyleQuery\|StyleQuery]] that has [[30 Official Roblox Docs/API Reference/Classes/StyleQuery#IsActive\|IsActive]] set to `true`.<br><br> There are also built-in selectors for `"@ReducedMotionEnabledFalse"`, `"@ReducedMotionEnabledTrue"`, `"@PreferredInputGamepad"`, `"@PreferredInputKeyboardAndMouse"`, `"@PreferredInputTouch"`, `"@PreferredTextSizeMedium"`, `"@PreferredTextSizeLarge"`, `"@PreferredTextSizeLarger"`, `"@PreferredTextSizeLargest"`, `"@ViewportDisplaySizeSmall"`, `"@ViewportDisplaySizeMedium"`, and `"@ViewportDisplaySizeLarge"` that can match an instance without a [[30 Official Roblox Docs/API Reference/Classes/StyleQuery\|StyleQuery]] instance. | `"@StyleQuerySmall"` |

#### Combinators

| Combinator | Description | Examples |
| --- | --- | --- |
| `>` | Matches instances that are **direct children** of the previous filter matches. | `"Frame > .Inventory"` |
| `>>` | Matches instances that are **descendants** of the previous filter matches. | `"ImageButton >> .BlueOnHover"` |
| `,` | Specifies a list of multiple independent selectors for the style rule. | `"Frame.TagA, TextLabel.TagA"` |
| `::` | Creates a phantom [[30 Official Roblox Docs/API Reference/Classes/UIComponent\|UIComponent]] instance under the previous filter matches and applies the style rule's properties to it.<br><br> Multiple instances can be created for [[30 Official Roblox Docs/API Reference/Classes/StyleQuery\|StyleQuery]] and [[30 Official Roblox Docs/API Reference/Classes/UIStroke\|UIStroke]] by aliasing the instance with a name selector. Some nested instances are supported, including [[30 Official Roblox Docs/API Reference/Classes/UIGradient\|UIGradient]] under [[30 Official Roblox Docs/API Reference/Classes/UIStroke\|UIStroke]] or [[30 Official Roblox Docs/API Reference/Classes/UIConstraint\|UIConstraint]] under a [[30 Official Roblox Docs/API Reference/Classes/UIGridLayout\|UIGridLayout]]. | `"Frame::UICorner" "::UIStroke #Outer"` |

*Code samples for this member (`UI-Styling-Class`, `UI-Styling-Tag`, `UI-Styling-Modifier`, `UI-Styling-StyleQuery`) are published on the source page; their code is not part of the open-source repo.*

### SelectorError

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** UI · **Tags:** `ReadOnly`, `NotReplicated`

A read-only string that displays errors from the [[30 Official Roblox Docs/API Reference/Classes/StyleRule#Selector|Selector]] property such as syntax errors, unsupported class types, etc.

## Methods

### GetDefaultPropertyTransition

```lua
StyleRule:GetDefaultPropertyTransition(): Variant
```

**Thread safety:** Unsafe · **Capabilities:** UI

Returns the default transition applied to all properties of the `StyleRule` that don't have an explicit transition set. This is equivalent to calling [[30 Official Roblox Docs/API Reference/Classes/StyleRule#GetPropertyTransitions|GetPropertyTransitions()]] and reading the value at key `"*"`.

**Returns**

| Type | Description |
| --- | --- |
| Variant | The default transition as a [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo\|TweenInfo]] or string token, or `nil` if no default transition is set. |

### GetProperties

```lua
StyleRule:GetProperties(): Dictionary
```

**Thread safety:** Unsafe · **Capabilities:** UI

Returns a dictionary of key-value pairs describing the properties of the `StyleRule`, for example:

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | Dictionary of key-value pairs describing the properties of the `StyleRule`. |

*Code samples for this member (`StyleRule-GetProperties`) are published on the source page; their code is not part of the open-source repo.*

### GetProperty

```lua
StyleRule:GetProperty(name: string): Variant
```

**Thread safety:** Unsafe · **Capabilities:** UI

Returns the value of a specific property in the `StyleRule`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | String name of the property, for example `"AnchorPoint"` or `"BackgroundColor3"`. |

**Returns**

| Type | Description |
| --- | --- |
| Variant | Value of the property. |

*Code samples for this member (`StyleRule-GetProperty`) are published on the source page; their code is not part of the open-source repo.*

### GetPropertyTransitions

```lua
StyleRule:GetPropertyTransitions(): Dictionary
```

**Thread safety:** Unsafe · **Capabilities:** UI

Returns a dictionary of all property transitions set on the `StyleRule`. Each key is a property name (string) and each value is a [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo|TweenInfo]] or a string token that defines the transition's timing for that property.

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | Dictionary of key-value pairs mapping property names to their transition parameters. |

*Code samples for this member (`StyleRule-GetPropertyTransitions`) are published on the source page; their code is not part of the open-source repo.*

### SetDefaultPropertyTransition

```lua
StyleRule:SetDefaultPropertyTransition(transitionParams: Variant): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI

Sets or clears a default transition that applies to all properties of the `StyleRule` that don't have an explicit transition set. This is equivalent to calling [[30 Official Roblox Docs/API Reference/Classes/StyleRule#SetPropertyTransition|SetPropertyTransition()]] with `"*"` as the property name.

The `transitionParams` parameter accepts a [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo|TweenInfo]] that configures the transition's timing. The following [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo|TweenInfo]] properties are used:

- [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo#Time|Time]] — Duration of the transition in seconds.
- [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo#EasingStyle|EasingStyle]] — The easing function used for interpolation.
- [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo#EasingDirection|EasingDirection]] — The direction of the easing function.
- [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo#DelayTime|DelayTime]] — Delay in seconds before the transition starts.

Note that the [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo#RepeatCount|RepeatCount]] and [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo#Reverses|Reverses]] fields of [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo|TweenInfo]] are ignored, as style transitions cannot repeat or reverse automatically.

A per-property transition set via [[30 Official Roblox Docs/API Reference/Classes/StyleRule#SetPropertyTransition|SetPropertyTransition()]] takes precedence over the default transition for that property.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `transitionParams` | Variant |  | Either a [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo\|TweenInfo]], a token string defining the default transition timing, or `nil` to remove the default transition. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetProperties

```lua
StyleRule:SetProperties(styleProperties: Dictionary): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI

Similar to [[30 Official Roblox Docs/API Reference/Classes/StyleRule#SetProperty|SetProperty()]] but lets you declare and set multiple properties of the `StyleRule` at once. Each assignment should be a valid property of the affected [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] or [[30 Official Roblox Docs/API Reference/Classes/UIComponent|UIComponent]] ([[30 Official Roblox Docs/API Reference/Classes/UICorner|UICorner]], [[30 Official Roblox Docs/API Reference/Classes/UIGradient|UIGradient]], etc.), and each assigned value should match its property's value type, for example [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] for [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AnchorPoint|AnchorPoint]] or [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]] for [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundColor3|BackgroundColor3]].

Attempts to assign invalid property names such as `"AnchorPt"` or `"BkColor"` will silently fail. Type mismatches such as [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] for [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AnchorPoint|AnchorPoint]] or [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] for [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundColor3|BackgroundColor3]] will also fail and an error will appear in the [[30 Official Roblox Docs/Studio/Output|Output]] window.

To set/update just one property of a `StyleRule`, see [[30 Official Roblox Docs/API Reference/Classes/StyleRule#SetProperty|SetProperty()]].

```lua
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local coreSheet = ReplicatedStorage:FindFirstChild("CoreSheet")

-- Get reference to style rule
local frameRule = coreSheet.Frame

-- Set rule properties
frameRule:SetProperties({
	["AnchorPoint"] = Vector2.new(0.5, 0),
	["BackgroundColor3"] = Color3.new(1, 0, 0.25)
})
```

Note that you can assign **tokens** as property values through the `$` prefix:

```lua
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local coreSheet = ReplicatedStorage:FindFirstChild("CoreSheet")
local tokensSheet = ReplicatedStorage:FindFirstChild("Tokens")

-- Set tokens (attributes) on tokens sheet
tokensSheet:SetAttribute("TopCenterAnchor", Vector2.new(0.5, 0))
tokensSheet:SetAttribute("MainBackgroundColor", Color3.new(0.2, 0.2, 0.3))

-- Get reference to style rule
local frameRule = coreSheet.Frame

-- Set rule properties
frameRule:SetProperties({
	["AnchorPoint"] = "$TopCenterAnchor",
	["BackgroundColor3"] = "$MainBackgroundColor"
})
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `styleProperties` | Dictionary |  | Dictionary of key-value pairs defining the properties to set. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetProperty

```lua
StyleRule:SetProperty(name: string, value: Variant): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI

Sets a new property (or modifies an existing property) for the `StyleRule`. The `name` parameter should be a valid property of the affected [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] or [[30 Official Roblox Docs/API Reference/Classes/UIComponent|UIComponent]] ([[30 Official Roblox Docs/API Reference/Classes/UICorner|UICorner]], [[30 Official Roblox Docs/API Reference/Classes/UIGradient|UIGradient]], etc.), and the assigned value should match the property's value type, for example [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] for [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AnchorPoint|AnchorPoint]] or [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]] for [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundColor3|BackgroundColor3]].

Attempts to assign invalid property names such as `"AnchorPt"` or `"BkColor"` will silently fail. Type mismatches such as [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] for [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AnchorPoint|AnchorPoint]] or [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] for [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundColor3|BackgroundColor3]] will also fail and an error will appear in the [[30 Official Roblox Docs/Studio/Output|Output]] window.

To set multiple properties for a `StyleRule` at once, see [[30 Official Roblox Docs/API Reference/Classes/StyleRule#SetProperties|SetProperties()]].

```lua
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local coreSheet = ReplicatedStorage:FindFirstChild("CoreSheet")

-- Get reference to style rule
local frameRule = coreSheet.Frame

-- Set rule property
frameRule:SetProperty("BackgroundColor3", Color3.new(1, 0, 0.25))
```

Note that you can assign **tokens** as property values through the `$` prefix:

```lua
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local coreSheet = ReplicatedStorage:FindFirstChild("CoreSheet")
local tokensSheet = ReplicatedStorage:FindFirstChild("Tokens")

-- Set new token (attribute) on tokens sheet
tokensSheet:SetAttribute("MainBackgroundColor", Color3.new(0.2, 0.2, 0.3))

-- Get reference to style rule
local frameRule = coreSheet.Frame
-- Set rule property to use the token as its value
frameRule:SetProperty("BackgroundColor3, "$MainBackgroundColor")
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | Property name to set, for example `"BackgroundColor3"`. |
| `value` | Variant |  | Property value to set, for example `Datatype.Color3.new(1, 0, 0.25)`. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetPropertyTransition

```lua
StyleRule:SetPropertyTransition(property: string, transitionParams: Variant): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI

Sets or clears the transition for a single property on the `StyleRule`. When a transition is set for a property, any change to that property's styled value will be animated over time instead of applied immediately.

The `transitionParams` parameter accepts a [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo|TweenInfo]] that configures the transition's timing. The following [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo|TweenInfo]] properties are used:

- [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo#Time|Time]] — Duration of the transition in seconds.
- [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo#EasingStyle|EasingStyle]] — The easing function used for interpolation.
- [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo#EasingDirection|EasingDirection]] — The direction of the easing function.
- [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo#DelayTime|DelayTime]] — Delay in seconds before the transition starts.

Note that the [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo#RepeatCount|RepeatCount]] and [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo#Reverses|Reverses]] fields of [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo|TweenInfo]] are ignored, as style transitions cannot repeat or reverse automatically.

To set transitions for multiple properties at once, see [[30 Official Roblox Docs/API Reference/Classes/StyleRule#SetPropertyTransitions|SetPropertyTransitions()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `property` | string |  | String name of the property to set a transition for, for example `"BackgroundColor3"` or `"Size"`. |
| `transitionParams` | Variant |  | A [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo\|TweenInfo]] or token string defining the transition timing, or `nil` to remove the transition for this property. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`StyleRule-SetPropertyTransition`, `StyleRule-SetPropertyTransition-Tokens`) are published on the source page; their code is not part of the open-source repo.*

### SetPropertyTransitions

```lua
StyleRule:SetPropertyTransitions(properties: Dictionary): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI

Similar to [[30 Official Roblox Docs/API Reference/Classes/StyleRule#SetPropertyTransition|SetPropertyTransition()]] but lets you declare and set transitions for multiple properties of the `StyleRule` at once.

Calling this method **replaces** all existing transitions on the `StyleRule` with the provided set. Each key should be a property name (string) and each value should be a [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo|TweenInfo]] or string token defining the transition timing for that property. Passing `nil` as a value for a key excludes that property from the resulting transitions.

The following [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo|TweenInfo]] properties are used:

- [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo#Time|Time]] — Duration of the transition in seconds.
- [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo#EasingStyle|EasingStyle]] — The easing function used for interpolation.
- [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo#EasingDirection|EasingDirection]] — The direction of the easing function.
- [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo#DelayTime|DelayTime]] — Delay in seconds before the transition starts.

Note that the [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo#RepeatCount|RepeatCount]] and [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo#Reverses|Reverses]] fields of [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo|TweenInfo]] are ignored, as style transitions cannot repeat or reverse automatically.

To set/update just one property transition on a `StyleRule`, see [[30 Official Roblox Docs/API Reference/Classes/StyleRule#SetPropertyTransition|SetPropertyTransition()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `properties` | Dictionary |  | Dictionary of property names to transition parameters. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`StyleRule-SetPropertyTransitions`, `StyleRule-SetPropertyTransitions-Tokens`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [StyleRule](https://create.roblox.com/docs/reference/engine/classes/StyleRule) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

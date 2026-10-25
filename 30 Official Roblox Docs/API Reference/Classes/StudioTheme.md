---
title: "StudioTheme"
description: "A collection of colors that make up a Roblox Studio theme, letting a plugin query the color of a Studio UI element for the theme the user currently has active."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/StudioTheme"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A collection of colors that make up a Roblox Studio theme, letting a plugin query the color of a Studio UI element for the theme the user currently has active.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

A **StudioTheme** represents one of Roblox Studio's UI color themes, such as the built-in **Light** and **Dark** themes, as a palette of colors loaded from the theme's definition. Each color is identified by a [[30 Official Roblox Docs/API Reference/Enums/StudioStyleGuideColor|Enum.StudioStyleGuideColor]] element (the UI element) together with a [[30 Official Roblox Docs/API Reference/Enums/StudioStyleGuideModifier|Enum.StudioStyleGuideModifier]] (the element's state, which defaults to `Default`), so a plugin can match its appearance to whichever theme the user currently has active.

Access the currently active theme through [[30 Official Roblox Docs/API Reference/Classes/Studio#Theme|Studio.Theme]], then call [[30 Official Roblox Docs/API Reference/Classes/StudioTheme#GetColor|StudioTheme:GetColor()]] to look up an individual color:

```lua
local theme = settings().Studio.Theme
local color = theme:GetColor(Enum.StudioStyleGuideColor.MainBackground)
```

Because a user can switch the active theme at any time, listen for [[30 Official Roblox Docs/API Reference/Classes/Studio#ThemeChanged|Studio.ThemeChanged]] to refresh your plugin's colors when the theme changes.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/StudioTheme#GetColor\|GetColor()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Returns the color corresponding to the arguments provided. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### GetColor

```lua
StudioTheme:GetColor(styleguideitem: StudioStyleGuideColor, modifier: StudioStyleGuideModifier = Default): Color3
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

The **GetColor()** function returns the [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]] corresponding to the arguments provided. For instance, if you would like to get the [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]] of the Studio "MainButton" when it's **disabled**, you can use the following code:

```lua
settings().Studio.Theme:GetColor(Enum.StudioStyleGuideColor.MainButton, Enum.StudioStyleGuideModifier.Disabled)
```

See the [[30 Official Roblox Docs/API Reference/Enums/StudioStyleGuideColor|Enum.StudioStyleGuideColor]] reference for a list of Studio elements and [[30 Official Roblox Docs/API Reference/Enums/StudioStyleGuideModifier|Enum.StudioStyleGuideModifier]] for a list of modifiers.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `styleguideitem` | [[30 Official Roblox Docs/API Reference/Enums/StudioStyleGuideColor\|StudioStyleGuideColor]] |  | The element you want to get the theme color for. |
| `modifier` | [[30 Official Roblox Docs/API Reference/Enums/StudioStyleGuideModifier\|StudioStyleGuideModifier]] | `Default` | The modifier you want to place on the `StyleGuideColor` element. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | The corresponding Color3 theme value. |

---
*Source: [StudioTheme](https://create.roblox.com/docs/reference/engine/classes/StudioTheme) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

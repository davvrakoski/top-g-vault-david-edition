---
title: "StyleSheet"
description: "Aggregates `StyleRules` and can be linked to `DataModel` trees to apply style properties to instances."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/StyleSheet"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Aggregates [[30 Official Roblox Docs/API Reference/Classes/StyleRule|StyleRules]] and can be linked to [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] trees to apply style properties to instances.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/StyleBase|StyleBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Gui

## Description

Aggregates [[30 Official Roblox Docs/API Reference/Classes/StyleRule|StyleRules]] and can be linked to [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] trees to apply style properties to instances. Note that a `StyleSheet` may exist outside the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]], but it cannot be derived or linked to a [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] tree in such a case.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/StyleSheet#GetDerives\|GetDerives()]] | List<[[30 Official Roblox Docs/API Reference/Classes/StyleSheet\|StyleSheet]]> | Returns an array of other `StyleSheets` from which the `StyleSheet` is deriving [[30 Official Roblox Docs/API Reference/Classes/StyleRule\|StyleRules]] and token definitions. |
| [[30 Official Roblox Docs/API Reference/Classes/StyleSheet#SetDerives\|SetDerives()]] | () | Sets the `StyleSheet` to derive [[30 Official Roblox Docs/API Reference/Classes/StyleRule\|StyleRules]] and token definitions from one or more other `StyleSheets`. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/StyleBase|StyleBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### GetDerives

```lua
StyleSheet:GetDerives(): List<StyleSheet>
```

**Thread safety:** Unsafe · **Capabilities:** UI

Returns an array of other `StyleSheets` from which the `StyleSheet` is deriving [[30 Official Roblox Docs/API Reference/Classes/StyleRule|StyleRules]] and token definitions.

**Returns**

| Type | Description |
| --- | --- |
| List<[[30 Official Roblox Docs/API Reference/Classes/StyleSheet\|StyleSheet]]> | Array of other `StyleSheets`. |

### SetDerives

```lua
StyleSheet:SetDerives(derives: Instances): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI

Sets the `StyleSheet` to derive [[30 Official Roblox Docs/API Reference/Classes/StyleRule|StyleRules]] and token definitions from one or more other `StyleSheets` in the order they are listed. This method spawns the appropriate [[30 Official Roblox Docs/API Reference/Classes/StyleDerive|StyleDerive]] instances and sets their priorities to establish the specified derivations.

```lua
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local coreSheet = ReplicatedStorage:FindFirstChild("CoreSheet")

-- Create a tokens style sheet
local tokensSheet = Instance.new("StyleSheet")
tokensSheet.Name = "Tokens"
tokensSheet.Parent = ReplicatedStorage
-- Set tokens (attributes) on tokens sheet
tokensSheet:SetAttribute("LightGray", Color3.new(0.9, 0.9, 0.9))
tokensSheet:SetAttribute("DarkGray", Color3.new(0.2, 0.2, 0.2))

-- Create theme style sheets
local lightThemeSheet = Instance.new("StyleSheet")
lightThemeSheet.Name = "LightTheme"
lightThemeSheet:SetAttribute("Background", "$LightGray")
lightThemeSheet.Parent = ReplicatedStorage
local darkThemeSheet = Instance.new("StyleSheet")
darkThemeSheet.Name = "DarkTheme"
darkThemeSheet:SetAttribute("Background", "$DarkGray")
darkThemeSheet.Parent = ReplicatedStorage

-- Set theme sheets to derive from tokens sheet
lightThemeSheet:SetDerives({ tokensSheet })
darkThemeSheet:SetDerives({ tokensSheet })

local themeDerive = Instance.new("StyleDerive")
themeDerive.Parent = coreSheet
themeDerive.StyleSheet = lightThemeSheet

-- Function to dynamically change the derived theme for the core sheet
local function changeTheme()
	if themeDerive.StyleSheet == lightThemeSheet then
		themeDerive.StyleSheet = darkThemeSheet
	elseif themeDerive.StyleSheet == darkThemeSheet then
		themeDerive.StyleSheet = lightThemeSheet
	end
end
```

Note that if you've created a design using the [[30 Official Roblox Docs/UI/Styling/Style Editor|Style Editor]], the **StyleSheet** sheet in the **Design** folder of [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]] will contain a [[30 Official Roblox Docs/API Reference/Classes/StyleDerive|StyleDerive]] to the **BaseStyleSheet** also in the **Design** folder. When setting derives with `SetDerives()`, be sure to include the base style sheet in the spot of least priority in relation to other `StyleSheets` in the `derives` array.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `derives` | Instances |  | Array of other `StyleSheets` to derive [[30 Official Roblox Docs/API Reference/Classes/StyleRule\|StyleRules]] and token definitions from. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [StyleSheet](https://create.roblox.com/docs/reference/engine/classes/StyleSheet) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

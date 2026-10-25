---
title: "Enums"
description: "A fixed list of items (enumeration)."
area: "30 Official Roblox Docs"
cluster: "Luau"
source: "https://create.roblox.com/docs/luau/enums"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*A fixed list of items (enumeration).*

> [!info]
> Enums are not a [built-in Luau type](https://luau.org/typecheck#builtin-types) and they exist only in Roblox, but they're conceptually similar to other Luau data types and are something you'll work with frequently in Roblox development.

The **enumeration** data type, or [[30 Official Roblox Docs/API Reference/Datatypes/Enum|Enum]], is a fixed list of items. You can access enums through the global object called [[30 Official Roblox Docs/API Reference/Datatypes/Enum|Enum]]. For a full list and their respective items, see [[30 Official Roblox Docs/API Reference/Enums/_Index - Enums|Enums]].

## Enum items

To get all items of an enum, call the [[30 Official Roblox Docs/API Reference/Datatypes/Enum#GetEnumItems|GetEnumItems()]] method on it. The following code sample demonstrates how to call [[30 Official Roblox Docs/API Reference/Datatypes/Enum#GetEnumItems|GetEnumItems()]] on the [[30 Official Roblox Docs/API Reference/Enums/PartType|Enum.PartType]] enum.

```lua
local partTypes = Enum.PartType:GetEnumItems()

for index, enumItem in partTypes do
	print(enumItem)
end

--[[
	Enum.PartType.Ball
	Enum.PartType.Block
	Enum.PartType.Cylinder
	Enum.PartType.Wedge
	Enum.PartType.CornerWedge
]]
```

## Data type

The [[30 Official Roblox Docs/API Reference/Datatypes/EnumItem|EnumItem]] is the data type for items in enums. An [[30 Official Roblox Docs/API Reference/Datatypes/EnumItem|EnumItem]] has three properties:

- `Name` — The name of the [[30 Official Roblox Docs/API Reference/Datatypes/EnumItem|EnumItem]].
- `Value` — The numerical index of the [[30 Official Roblox Docs/API Reference/Datatypes/EnumItem|EnumItem]].
- `EnumType` — The parent [[30 Official Roblox Docs/API Reference/Datatypes/Enum|Enum]] of the [[30 Official Roblox Docs/API Reference/Datatypes/EnumItem|EnumItem]].

Some properties of objects can only be items of certain enums. For example, the [[30 Official Roblox Docs/API Reference/Classes/Part#Shape|Shape]] property of a [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] object is an item of the [[30 Official Roblox Docs/API Reference/Enums/PartType|Enum.PartType]] enum. The following code sample demonstrates how to print the properties of the [[30 Official Roblox Docs/API Reference/Enums/PartType|Enum.PartType.Cylinder]] enum item.

```lua
print(Enum.PartType.Cylinder.Name) --> "Cylinder"
print(Enum.PartType.Cylinder.Value) --> 2
print(Enum.PartType.Cylinder.EnumType) --> PartType
```

To assign an [[30 Official Roblox Docs/API Reference/Datatypes/EnumItem|EnumItem]] as the value of a property, use the full [[30 Official Roblox Docs/API Reference/Datatypes/Enum|Enum]] declaration. You can also use the item's [[30 Official Roblox Docs/API Reference/Datatypes/EnumItem#Name|Name]] property as a string.

```lua
local Workspace = game:GetService("Workspace")

local part = Instance.new("Part") -- Create a new part

part.Shape = Enum.PartType.Cylinder -- By full enum item declaration (best practice)
part.Shape = "Cylinder" -- By enum item's name as a string

part.Parent = Workspace
```

---
*Source: [Enums](https://create.roblox.com/docs/luau/enums) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

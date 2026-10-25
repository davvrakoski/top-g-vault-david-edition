---
title: "Type coercion"
description: "Type coercion in Luau allows for arithmetic, concatenation, and assignment of differently typed values."
area: "30 Official Roblox Docs"
cluster: "Luau"
source: "https://create.roblox.com/docs/luau/type-coercion"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Type coercion in Luau allows for arithmetic, concatenation, and assignment of differently typed values.*

If Luau tries to use a value or [[30 Official Roblox Docs/Luau/Variables|variable]] in an operation, such as [[30 Official Roblox Docs/Luau/Type coercion#Arithmetic|arithmetic]], [[30 Official Roblox Docs/Luau/Type coercion#Concatenation|concatenation]], or [[30 Official Roblox Docs/Luau/Type coercion#Assignment|assignment]], but the value isn't the type that the operation expects, then Luau converts (**coerces**) the value to change its data type. Coercion happens at run time for that operation and doesn't change the value of a variable.

## Arithmetic

Luau coerces strings to numbers in [[30 Official Roblox Docs/Luau/Operators#Arithmetic|arithmetic operations]]. This behavior is built into Luau. If the types are incompatible for arithmetic, Luau throws an error and doesn't run the rest of the script. For example, you can't add a string to a number if the string does not represent a number.

```lua
print(100 + "7") -- 107
print(100 - "7") -- 93
print("1000" + 234) -- 1234
print("1000" - 234) -- 766
print("hello" + 234) -- error: attempt to perform arithmetic (add) string and number
```

## Concatenation

In concatenation, Luau coerces numbers to strings. To convert a number to a string without using coercion, use the [[30 Official Roblox Docs/API Reference/Libraries/string#format|string.format()]] function.

```lua
print("Pi is " .. math.pi) --> Pi is 3.1415926535898
print("Pi is " .. 3.1415927) --> Pi is 3.1415927

-- Rounds to three decimal places
print("Pi is " .. string.format("%.3f", 3.1415927)) -- Pi is 3.142
```

## Assignment

Some properties expect certain data types, such as an [[30 Official Roblox Docs/Luau/Type coercion#Enums|Enum]] or string, but you can assign a value of a different type to it and Luau converts the value to the type the property expects.

### Enums

Luau coerces numbers and strings of enum values into the full enum name. For example, you can name the value of the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Material|Part.Material]] property using a number, string, or full enum name, and the `print()` function always prints the full enum name. It's best practice to be explicit and use the full enum name. For more information on Enums, see [[30 Official Roblox Docs/Luau/Enums|Enums]].

```lua
local Workspace = game:GetService("Workspace")

local part1 = Instance.new("Part")
part1.Material = 816
part1.Parent = Workspace
print(part1.Material) -- Enum.Material.Concrete

local part2 = Instance.new("Part")
part2.Material = "Concrete"
part2.Parent = Workspace
print(part2.Material) -- Enum.Material.Concrete

-- This is best practice because it's the most explicit
local part3 = Instance.new("Part")
part3.Material = Enum.Material.Concrete
part3.Parent = Workspace
print(part3.Material) -- Enum.Material.Concrete
```

### Time of day

The [[30 Official Roblox Docs/API Reference/Classes/Lighting#TimeOfDay|Lighting.TimeOfDay]] property, which defines whether it is night, day, or any other time, is a string representation of the [[30 Official Roblox Docs/API Reference/Datatypes/DateTime|DateTime]] data type. If you assign a number to [[30 Official Roblox Docs/API Reference/Classes/Lighting#TimeOfDay|Lighting.TimeOfDay]], Luau converts it to the string representation of [[30 Official Roblox Docs/API Reference/Datatypes/DateTime|DateTime]].

```lua
local Lighting = game:GetService("Lighting")

Lighting.TimeOfDay = "05:00:00"
print(Lighting.TimeOfDay) -- 05:00:00

Lighting.TimeOfDay = 5
print(Lighting.TimeOfDay) -- 05:00:00
```

---
*Source: [Type coercion](https://create.roblox.com/docs/luau/type-coercion) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

---
title: "Enum"
description: "A data type that represents an individual enum."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/Enum"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*A data type that represents an individual enum.*

## Description

The [[30 Official Roblox Docs/API Reference/Datatypes/Enum|Enum]] data type represents an individual enum in Roblox. An individual enum can be indexed through the [[30 Official Roblox Docs/API Reference/Datatypes/Enums|Enums]] type, via the name of the enum itself.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Enum#GetEnumItems\|GetEnumItems()]] | Array | Returns an array of all [[30 Official Roblox Docs/API Reference/Datatypes/EnumItem\|EnumItem]] options available for this enum. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Enum#FromName\|FromName()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Enum\|Enum]] | nil | Converts an enum name to an [[30 Official Roblox Docs/API Reference/Datatypes/Enum\|Enum]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Enum#FromValue\|FromValue()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Enum\|Enum]] | nil | Converts an enum value to an [[30 Official Roblox Docs/API Reference/Datatypes/Enum\|Enum]]. |

## Methods

### GetEnumItems

```lua
Enum:GetEnumItems(): Array
```

Returns an array of all the [[30 Official Roblox Docs/API Reference/Datatypes/EnumItem|EnumItem]] options available for this enum.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of all [[30 Official Roblox Docs/API Reference/Datatypes/EnumItem\|EnumItem]] values belonging to this enum. |

### FromName

```lua
Enum:FromName(name: string): Enum | nil
```

Returns either the converted [[30 Official Roblox Docs/API Reference/Datatypes/Enum|Enum]] or `nil`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | The name of the EnumItem to look up in this enum. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Enum\|Enum]] | nil | The [[30 Official Roblox Docs/API Reference/Datatypes/EnumItem\|EnumItem]] whose Name matches the given string, or nil if no match exists. |

### FromValue

```lua
Enum:FromValue(value: number): Enum | nil
```

Returns either the converted [[30 Official Roblox Docs/API Reference/Datatypes/Enum|Enum]] or `nil`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | number |  | The integer value of the EnumItem to look up in this enum. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Enum\|Enum]] | nil | The [[30 Official Roblox Docs/API Reference/Datatypes/EnumItem\|EnumItem]] whose integer value matches the given number, or nil if no match exists. |

---
*Source: [Enum](https://create.roblox.com/docs/reference/engine/datatypes/Enum) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

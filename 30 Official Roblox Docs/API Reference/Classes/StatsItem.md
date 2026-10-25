---
title: "StatsItem"
description: "A single performance metric."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/StatsItem"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A single performance metric.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/RunningAverageItemDouble|RunningAverageItemDouble]], [[30 Official Roblox Docs/API Reference/Classes/RunningAverageItemInt|RunningAverageItemInt]], [[30 Official Roblox Docs/API Reference/Classes/RunningAverageTimeIntervalItem|RunningAverageTimeIntervalItem]], [[30 Official Roblox Docs/API Reference/Classes/TotalCountTimeIntervalItem|TotalCountTimeIntervalItem]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`

## Description

A StatsItem is an internal measurement item that is created by the engine to benchmark many of the backend components of Roblox. It cannot be created using [[30 Official Roblox Docs/API Reference/Datatypes/Instance#new|Instance.new()]], but its value can be read by plugins. They can be found stored inside of the [[30 Official Roblox Docs/API Reference/Classes/Stats|Stats]] service.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/StatsItem#GetValue\|GetValue()]] | double | Returns the StatsItem's value. |
| [[30 Official Roblox Docs/API Reference/Classes/StatsItem#GetValueString\|GetValueString()]] | string | Returns the StatsItem's value as a formatted string. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### GetValue

```lua
StatsItem:GetValue(): double
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Returns the StatsItem's value.

**Returns**

| Type | Description |
| --- | --- |
| double | The numeric value of the stats item. |

### GetValueString

```lua
StatsItem:GetValueString(): string
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Returns the StatsItem's value as a formatted string.

**Returns**

| Type | Description |
| --- | --- |
| string | The value of the stats item formatted as a string. |

---
*Source: [StatsItem](https://create.roblox.com/docs/reference/engine/classes/StatsItem) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

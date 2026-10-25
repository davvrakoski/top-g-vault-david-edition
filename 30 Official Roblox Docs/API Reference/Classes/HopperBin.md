---
title: "HopperBin"
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/HopperBin"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

> [!warning] Deprecated
> This deprecated class has been replaced by `Class.Tool`. Please use Tool for
> new work instead.

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/BackpackItem|BackpackItem]] → [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] → [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** BaseParts
- **Tags:** `Deprecated`

## Description

HopperBins are an outdated system for creating tools that can be used by a player. In place of HopperBins, please use [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]] instead.

Historically, only HopperBins worked without a 'Handle' [[30 Official Roblox Docs/API Reference/Classes/Part|Part]], but this is no longer the case thanks to the [[30 Official Roblox Docs/API Reference/Classes/Tool#RequiresHandle|Tool.RequiresHandle]] property of Tools.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/HopperBin#Active\|Active]] | boolean | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/HopperBin#BinType\|BinType]] | [[30 Official Roblox Docs/API Reference/Enums/BinType\|BinType]] | **Deprecated.**  |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/HopperBin#Deselected\|Deselected]] |  | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/HopperBin#Selected\|Selected]] | `mouse` | **Deprecated.**  |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/BackpackItem|BackpackItem]], [[30 Official Roblox Docs/API Reference/Classes/Model|Model]], [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Active

> [!warning] Deprecated
> The `Class.HopperBin` object has been superseded by the `Class.Tool`
> object which should be used for all new work.

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Input

### BinType

> [!warning] Deprecated
> The `Class.HopperBin` object has been superseded by the `Class.Tool`
> object which should be used for all new work.

**Type:** [[30 Official Roblox Docs/API Reference/Enums/BinType|BinType]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Input

## Events

### Deselected

> [!warning] Deprecated
> The `Class.HopperBin` object has been superseded by the `Class.Tool`
> object which should be used for all new work.

```lua
HopperBin.Deselected()
```

**Capabilities:** Input

### Selected

> [!warning] Deprecated
> The `Class.HopperBin` object has been superseded by the `Class.Tool`
> object which should be used for all new work.

```lua
HopperBin.Selected(mouse: Instance)
```

**Capabilities:** Input

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `mouse` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  |  |

---
*Source: [HopperBin](https://create.roblox.com/docs/reference/engine/classes/HopperBin) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

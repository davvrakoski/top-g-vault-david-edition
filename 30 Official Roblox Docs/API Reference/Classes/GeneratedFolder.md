---
title: "GeneratedFolder"
description: "A container that stores `ProceduralModel` generation results."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/GeneratedFolder"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A container that stores [[30 Official Roblox Docs/API Reference/Classes/ProceduralModel|ProceduralModel]] generation results.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Folder|Folder]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** BaseParts

## Description

`GeneratedFolder` is a container used to represent non-source-of-truth data in the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]]. These are branches that are deterministically generated from other parts of the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] instead of containing source-of-truth data.

`GeneratedFolder` is primarily used by [[30 Official Roblox Docs/API Reference/Classes/ProceduralModel|ProceduralModel]] to store generation results. It can also be used by plugins or other tools to organize generated content.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/GeneratedFolder#SetPrimaryPart\|SetPrimaryPart()]] | () | Specifies which part within the `GeneratedFolder` should be set as the [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart\|PrimaryPart]] of the [[30 Official Roblox Docs/API Reference/Classes/ProceduralModel\|ProceduralModel]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Folder|Folder]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### SetPrimaryPart

```lua
GeneratedFolder:SetPrimaryPart(part: BasePart): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic

This method allows a generator module to specify which part within the `GeneratedFolder` should be set as the [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart|PrimaryPart]] of the [[30 Official Roblox Docs/API Reference/Classes/ProceduralModel|ProceduralModel]] that results get parented to.

Generation of results happens outside of the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] and doesn't have direct access to the [[30 Official Roblox Docs/API Reference/Classes/ProceduralModel|ProceduralModel]] instance being generated. As a result, the generator must use this method instead of setting the [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart|PrimaryPart]] directly.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `part` | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] |  | The [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] inside this `GeneratedFolder` to designate as the [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart\|PrimaryPart]] of the resulting [[30 Official Roblox Docs/API Reference/Classes/ProceduralModel\|ProceduralModel]]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [GeneratedFolder](https://create.roblox.com/docs/reference/engine/classes/GeneratedFolder) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

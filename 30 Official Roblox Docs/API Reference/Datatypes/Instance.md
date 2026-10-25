---
title: "Instance"
description: "Holds the constructor for Instances."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/Instance"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*Holds the constructor for Instances.*

## Description

The [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] data type holds constructors for [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] objects.

## Summary

### Constructors

| Constructor | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Instance#new\|new()]] | `className`, `parent` | Returns an [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] of the specified class. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Instance#fromExisting\|fromExisting()]] | `existingInstance` | Returns an [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] which is a copy of an existing [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]. |

## Constructors

### new

```lua
Instance.new(className: string, parent: Instance?): Instance
```

Creates a new [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] of type `className`. Abstract classes and services cannot be created with this constructor.

Note that when the [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Parent]] of an object is set, Luau listens to a variety of different property changes for replication, rendering, and physics. For performance reasons, it's recommended to set the instance's [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Parent]] property **last** when creating new objects, instead of specifying the second argument (`parent`) of this constructor.

```lua
local Workspace = game:GetService("Workspace")

-- Set new instance's parent last (recommended)
local part = Instance.new("Part")
part.Position = Vector3.new(0, 10, 0)
part.Parent = Workspace

-- Set new instance's parent in constructor (discouraged)
local part = Instance.new("Part", Workspace)
part.Position = Vector3.new(0, 10, 0)
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `className` | string |  | Class name of the new instance to create. |
| `parent` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]? |  | Optional object to parent the new instance to. Not recommended for performance reasons (see description above). |

### fromExisting

```lua
Instance.fromExisting(existingInstance: Instance): Instance
```

Creates a new object with the same type and property values as an existing object. In most cases using [[30 Official Roblox Docs/API Reference/Classes/Instance#Clone|Instance:Clone()]] is more appropriate, but this constructor is useful when implementing low‑level libraries or systems.

There are two behavioral differences between this constructor and the [[30 Official Roblox Docs/API Reference/Classes/Instance#Clone|Instance:Clone()]] method:

- This constructor will not copy any of the descendant [[30 Official Roblox Docs/API Reference/Classes/Instance|Instances]] parented to the existing object.

- This constructor will return a new object even if the existing object had [[30 Official Roblox Docs/API Reference/Classes/Instance#Archivable|Instance.Archivable]] set to `false`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `existingInstance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The existing [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] to copy property values from. |

---
*Source: [Instance](https://create.roblox.com/docs/reference/engine/datatypes/Instance) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

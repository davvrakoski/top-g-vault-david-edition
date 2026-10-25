---
title: "SecurityCapabilities"
description: "A set of `Enum.SecurityCapability` items. See script capabilities."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/SecurityCapabilities"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*A set of [[30 Official Roblox Docs/API Reference/Enums/SecurityCapability|Enum.SecurityCapability]] items. See [[30 Official Roblox Docs/Scripting/Script capabilities|script capabilities]].*

## Description

An immutable set of [[30 Official Roblox Docs/API Reference/Enums/SecurityCapability|Enum.SecurityCapability]] values that controls which engine APIs and actions a script inside a sandboxed container can access. Assign a `SecurityCapabilities` value to an instance's [[30 Official Roblox Docs/API Reference/Classes/Instance#Capabilities|Capabilities]] property to restrict the scripts beneath it.

Capability enforcement takes effect when [[30 Official Roblox Docs/API Reference/Classes/Workspace#SandboxedInstanceMode|Workspace.SandboxedInstanceMode]] is set to [[30 Official Roblox Docs/API Reference/Enums/SandboxedInstanceMode|Enum.SandboxedInstanceMode.Experimental]].

## Summary

### Constructors

| Constructor | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/SecurityCapabilities#new\|new()]] | `...` | Returns a new set of capabilities from zero or more [[30 Official Roblox Docs/API Reference/Enums/SecurityCapability\|Enum.SecurityCapability]] items. |
| [[30 Official Roblox Docs/API Reference/Datatypes/SecurityCapabilities#fromCurrent\|fromCurrent()]] |  | Returns a new set of capabilities from the capabilities of the calling function. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/SecurityCapabilities#Add\|Add()]] | [[30 Official Roblox Docs/API Reference/Datatypes/SecurityCapabilities\|SecurityCapabilities]] | Returns a new set of capabilities with zero or more additions. |
| [[30 Official Roblox Docs/API Reference/Datatypes/SecurityCapabilities#Add\|Add()]] | [[30 Official Roblox Docs/API Reference/Datatypes/SecurityCapabilities\|SecurityCapabilities]] | Returns a new set of capabilities with the provided set added. |
| [[30 Official Roblox Docs/API Reference/Datatypes/SecurityCapabilities#Remove\|Remove()]] | [[30 Official Roblox Docs/API Reference/Datatypes/SecurityCapabilities\|SecurityCapabilities]] | Returns a new set of capabilities with zero or more deletions. |
| [[30 Official Roblox Docs/API Reference/Datatypes/SecurityCapabilities#Remove\|Remove()]] | [[30 Official Roblox Docs/API Reference/Datatypes/SecurityCapabilities\|SecurityCapabilities]] | Returns a new set of capabilities with the provided set deleted. |
| [[30 Official Roblox Docs/API Reference/Datatypes/SecurityCapabilities#Contains\|Contains()]] | boolean | Returns whether a set of capabilities contains the specified [[30 Official Roblox Docs/API Reference/Enums/SecurityCapability\|Enum.SecurityCapability]] items. |
| [[30 Official Roblox Docs/API Reference/Datatypes/SecurityCapabilities#Contains\|Contains()]] | boolean | Returns whether a set of capabilities contains another set of capabilities. |

## Constructors

### new

```lua
SecurityCapabilities.new(...: SecurityCapability): SecurityCapabilities
```

Returns a new set of capabilities from zero or more [[30 Official Roblox Docs/API Reference/Enums/SecurityCapability|Enum.SecurityCapability]] items.

```lua
local capabilities = SecurityCapabilities.new(Enum.SecurityCapability.Players,
    Enum.SecurityCapability.Animation,
    Enum.SecurityCapability.Basic)

local newScript = Instance.new("Script")
newScript.Capabilities = capabilities
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `...` | [[30 Official Roblox Docs/API Reference/Enums/SecurityCapability\|SecurityCapability]] |  | Zero or more [[30 Official Roblox Docs/API Reference/Enums/SecurityCapability\|Enum.SecurityCapability]] values to include in the new set. |

### fromCurrent

```lua
SecurityCapabilities.fromCurrent(): SecurityCapabilities
```

Returns a new set of capabilities from the capabilities of the calling function.

## Methods

### Add

```lua
SecurityCapabilities:Add(...: SecurityCapability): SecurityCapabilities
```

Returns a new set of capabilities with zero or more additions. If you add [[30 Official Roblox Docs/API Reference/Enums/SecurityCapability|Enum.SecurityCapability]] items that are already present, they are not duplicated.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `...` | [[30 Official Roblox Docs/API Reference/Enums/SecurityCapability\|SecurityCapability]] |  | Zero or more [[30 Official Roblox Docs/API Reference/Enums/SecurityCapability\|Enum.SecurityCapability]] values to add to the set. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/SecurityCapabilities\|SecurityCapabilities]] | A new set containing the union of the original capabilities and the specified additions. |

### Add

```lua
SecurityCapabilities:Add(capabilities: SecurityCapabilities): SecurityCapabilities
```

Returns a new set of capabilities with the provided set added. If you add [[30 Official Roblox Docs/API Reference/Enums/SecurityCapability|Enum.SecurityCapability]] items that are already present, they are not duplicated.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `capabilities` | [[30 Official Roblox Docs/API Reference/Datatypes/SecurityCapabilities\|SecurityCapabilities]] |  | A `SecurityCapabilities` set whose items are added to the original. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/SecurityCapabilities\|SecurityCapabilities]] | A new set containing the union of both sets. |

### Remove

```lua
SecurityCapabilities:Remove(...: SecurityCapability): SecurityCapabilities
```

Returns a new set of capabilities with zero or more deletions. [[30 Official Roblox Docs/API Reference/Enums/SecurityCapability|Enum.SecurityCapability]] items not present in the original set are ignored.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `...` | [[30 Official Roblox Docs/API Reference/Enums/SecurityCapability\|SecurityCapability]] |  | Zero or more [[30 Official Roblox Docs/API Reference/Enums/SecurityCapability\|Enum.SecurityCapability]] values to remove from the set. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/SecurityCapabilities\|SecurityCapabilities]] | A new set with the specified capabilities removed. |

### Remove

```lua
SecurityCapabilities:Remove(capabilities: SecurityCapabilities): SecurityCapabilities
```

Returns a new set of capabilities with the provided set deleted. [[30 Official Roblox Docs/API Reference/Enums/SecurityCapability|Enum.SecurityCapability]] items not present in the original set are ignored.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `capabilities` | [[30 Official Roblox Docs/API Reference/Datatypes/SecurityCapabilities\|SecurityCapabilities]] |  | A `SecurityCapabilities` set whose items are removed from the original. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/SecurityCapabilities\|SecurityCapabilities]] |  |

### Contains

```lua
SecurityCapabilities:Contains(...: SecurityCapability): boolean
```

Returns whether a set of capabilities contains the specified [[30 Official Roblox Docs/API Reference/Enums/SecurityCapability|Enum.SecurityCapability]] items. The set must contain **all** provided items to return true.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `...` | [[30 Official Roblox Docs/API Reference/Enums/SecurityCapability\|SecurityCapability]] |  | Zero or more [[30 Official Roblox Docs/API Reference/Enums/SecurityCapability\|Enum.SecurityCapability]] values to check for membership in the set. |

**Returns**

| Type | Description |
| --- | --- |
| boolean |  |

### Contains

```lua
SecurityCapabilities:Contains(capabilities: SecurityCapabilities): boolean
```

Returns whether a set of capabilities contains another set of capabilities. The set must contain **all** items in the provided set to return true.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `capabilities` | [[30 Official Roblox Docs/API Reference/Datatypes/SecurityCapabilities\|SecurityCapabilities]] |  | A `SecurityCapabilities` set to check for membership in the original set. |

**Returns**

| Type | Description |
| --- | --- |
| boolean |  |

---
*Source: [SecurityCapabilities](https://create.roblox.com/docs/reference/engine/datatypes/SecurityCapabilities) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

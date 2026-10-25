---
title: "SharedTableRegistry"
description: "Provides a global registry of named `SharedTable` objects."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/SharedTableRegistry"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Provides a global registry of named [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] objects.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

Provides a global registry of named [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] objects. It can be used to store [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] objects that are used by multiple scripts.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/SharedTableRegistry#GetSharedTable\|GetSharedTable()]] | [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable\|SharedTable]] | Gets the registered [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable\|SharedTable]] with the specified name. |
| [[30 Official Roblox Docs/API Reference/Classes/SharedTableRegistry#SetSharedTable\|SetSharedTable()]] | () | Registers the provided [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable\|SharedTable]] with the specified name. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### GetSharedTable

```lua
SharedTableRegistry:GetSharedTable(name: string): SharedTable
```

**Thread safety:** Safe · **Capabilities:** ScriptGlobals

Gets the registered [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] with the specified name. If no [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] with that name exists, a new [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] is created with that name and is returned.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | The name of the registered [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable\|SharedTable]]. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable\|SharedTable]] | The registered [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable\|SharedTable]] with the specified name, or a newly created and registered [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable\|SharedTable]] if no [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable\|SharedTable]] was previously registered under that name. |

*Code samples for this member (`SharedTableRegistry-GetSharedTable`) are published on the source page; their code is not part of the open-source repo.*

### SetSharedTable

```lua
SharedTableRegistry:SetSharedTable(name: string, st: SharedTable?): ()
```

**Thread safety:** Safe · **Capabilities:** ScriptGlobals

Registers the provided [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] with the specified name. If the provided [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] is `nil`, any existing [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] with the specified name is unregistered.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | The name of the registered [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable\|SharedTable]]. |
| `st` | [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable\|SharedTable]]? |  | The [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable\|SharedTable]] object to register, or `nil` to unregister any previously registered [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable\|SharedTable]] object. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`SharedTableRegistry-SetSharedTable`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [SharedTableRegistry](https://create.roblox.com/docs/reference/engine/classes/SharedTableRegistry) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

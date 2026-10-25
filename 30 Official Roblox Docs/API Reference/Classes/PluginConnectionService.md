---
title: "PluginConnectionService"
description: "This service is used by plugins to communicate with other instances of themselves running in other data models."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/PluginConnectionService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*This service is used by plugins to communicate with other instances of themselves running in other data models.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

This service is used by plugins to communicate with other instances of themselves running in other data models (e.g. a plugin in the Studio edit data model can communicate with the instance of that same plugin in the Studio playtest Server data model). Plugins can retrieve [[30 Official Roblox Docs/API Reference/Classes/PluginConnection|PluginConnection]] objects from this service, which provide an API for sending messages across the data model boundary. All access to this class is restricted to Plugin security. The command bar is not currently supported.

*Code samples for this API (`plugin-connection-echo`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/PluginConnectionService); their code is not part of the open-source repo.*

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PluginConnectionService#CanHaveConnectionType\|CanHaveConnectionType()]] | boolean | Checks if the current data model context can ever have connections of a given type. |
| [[30 Official Roblox Docs/API Reference/Classes/PluginConnectionService#GetPluginConnectionsOfType\|GetPluginConnectionsOfType()]] | List<[[30 Official Roblox Docs/API Reference/Classes/PluginConnection\|PluginConnection]]> | Returns a list of currently connected [[30 Official Roblox Docs/API Reference/Classes/PluginConnection\|PluginConnection]] objects with the given connection type. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PluginConnectionService#Connected\|Connected]] | `conn` | Fires just after a new [[30 Official Roblox Docs/API Reference/Classes/PluginConnection\|PluginConnection]] successfully connects. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### CanHaveConnectionType

```lua
PluginConnectionService:CanHaveConnectionType(type: PluginConnectionTargetType): boolean
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Checks if the current data model can potentially have connections of a given [[30 Official Roblox Docs/API Reference/Enums/PluginConnectionTargetType|Enum.PluginConnectionTargetType]]. Note that it is possible for this function to return true even if no such connections currently exist.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `type` | [[30 Official Roblox Docs/API Reference/Enums/PluginConnectionTargetType\|PluginConnectionTargetType]] |  | The connection type to check. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the current data model can potentially have connections of the given type. |

### GetPluginConnectionsOfType

```lua
PluginConnectionService:GetPluginConnectionsOfType(type: PluginConnectionTargetType): List<PluginConnection>
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Returns a list of currently connected [[30 Official Roblox Docs/API Reference/Classes/PluginConnection|PluginConnection]] objects with the given connection type. Each `PluginConnection` from this list will initially have their `Connected` property set to true and correspond to a connected data model related to the current data model according to their [[30 Official Roblox Docs/API Reference/Enums/PluginConnectionTargetType|Enum.PluginConnectionTargetType]]. For example, an edit data model may have [[30 Official Roblox Docs/API Reference/Enums/PluginConnectionTargetType|Enum.PluginConnectionTargetType.Test]] connections to communicate with its ongoing playtest data models, and each test data model will have an [[30 Official Roblox Docs/API Reference/Enums/PluginConnectionTargetType|Enum.PluginConnectionTargetType.Edit]] connection back to its edit data model.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `type` | [[30 Official Roblox Docs/API Reference/Enums/PluginConnectionTargetType\|PluginConnectionTargetType]] |  | The connection type to check. |

**Returns**

| Type | Description |
| --- | --- |
| List<[[30 Official Roblox Docs/API Reference/Classes/PluginConnection\|PluginConnection]]> | An array of the currently connected [[30 Official Roblox Docs/API Reference/Classes/PluginConnection\|PluginConnection]] objects with that target type. |

## Events

### Connected

```lua
PluginConnectionService.Connected(conn: PluginConnection)
```

**Security:** PluginSecurity

Fires just after a new [[30 Official Roblox Docs/API Reference/Classes/PluginConnection|PluginConnection]] successfully connects. Plugins may listen for this signal to learn when a new data model that they can communicate with becomes available.

Note: On startup, it is possible some [[30 Official Roblox Docs/API Reference/Classes/PluginConnection|PluginConnections]] already exist. Plugins should query [[30 Official Roblox Docs/API Reference/Classes/PluginConnectionService#GetPluginConnectionsOfType|PluginConnectionService:GetPluginConnectionsOfType()]] for each type they are interested in after connecting to this function.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `conn` | [[30 Official Roblox Docs/API Reference/Classes/PluginConnection\|PluginConnection]] |  | The newly connected [[30 Official Roblox Docs/API Reference/Classes/PluginConnection\|PluginConnection]]. |

---
*Source: [PluginConnectionService](https://create.roblox.com/docs/reference/engine/classes/PluginConnectionService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

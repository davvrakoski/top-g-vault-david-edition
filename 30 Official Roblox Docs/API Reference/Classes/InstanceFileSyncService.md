---
title: "InstanceFileSyncService"
description: "A service for interacting with file sync from a plugin."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/InstanceFileSyncService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A service for interacting with file sync from a plugin.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

The `InstanceFileSyncService` service provides an interface for plugins to interact with the file sync system (currently known as **Script Sync**). It allows querying the sync status of instances and retrieving instances based on file paths.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/InstanceFileSyncService#GetAllInstances\|GetAllInstances()]] | Instances | Returns an array of all instances currently involved in file synchronization. |
| [[30 Official Roblox Docs/API Reference/Classes/InstanceFileSyncService#GetStatus\|GetStatus()]] | [[30 Official Roblox Docs/API Reference/Enums/InstanceFileSyncStatus\|InstanceFileSyncStatus]] | Returns the synchronization status of a specific instance. |
| [[30 Official Roblox Docs/API Reference/Classes/InstanceFileSyncService#GetSyncedInstance\|GetSyncedInstance()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]? | Returns the instance corresponding to a given file path. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/InstanceFileSyncService#StatusChanged\|StatusChanged]] | `instance`, `status` | Fires when the synchronization status of an instance changes. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### GetAllInstances

```lua
InstanceFileSyncService:GetAllInstances(): Instances
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Returns an array containing every [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] that is currently being tracked or synchronized by file sync.

**Returns**

| Type | Description |
| --- | --- |
| Instances | Returns an array of [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instances]]. |

### GetStatus

```lua
InstanceFileSyncService:GetStatus(instance: Instance): InstanceFileSyncStatus
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Returns the current [[30 Official Roblox Docs/API Reference/Enums/InstanceFileSyncStatus|Enum.InstanceFileSyncStatus]] of the provided [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]. This indicates whether the instance is synced as a root, as a descendant, or if it is in an error state.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `instance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The instance to check. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/InstanceFileSyncStatus\|InstanceFileSyncStatus]] | Returns the [[30 Official Roblox Docs/API Reference/Enums/InstanceFileSyncStatus\|Enum.InstanceFileSyncStatus]] for the instance. |

### GetSyncedInstance

```lua
InstanceFileSyncService:GetSyncedInstance(filePath: string): Instance?
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Returns the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] associated with the specified absolute file path. Returns `nil` if the path is not mapped to any instance.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `filePath` | string |  | The absolute path to the file. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]? | Returns the Instance being synced to the file path, if one exists. Otherwise, returns nil. |

## Events

### StatusChanged

```lua
InstanceFileSyncService.StatusChanged(instance: Instance, status: InstanceFileSyncStatus)
```

**Security:** PluginSecurity

This event fires when the [[30 Official Roblox Docs/API Reference/Enums/InstanceFileSyncStatus|Enum.InstanceFileSyncStatus]] of an [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] changes. It passes the affected instance and the new file sync status enum value.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `instance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The instance whose status changed. |
| `status` | [[30 Official Roblox Docs/API Reference/Enums/InstanceFileSyncStatus\|InstanceFileSyncStatus]] |  | The new synchronization status. |

---
*Source: [InstanceFileSyncService](https://create.roblox.com/docs/reference/engine/classes/InstanceFileSyncService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

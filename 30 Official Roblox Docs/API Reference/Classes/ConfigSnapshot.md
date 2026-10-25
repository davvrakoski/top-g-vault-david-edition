---
title: "ConfigSnapshot"
description: "A snapshot of configuration values at a given version. Can be player-specific."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ConfigSnapshot"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A snapshot of configuration values at a given version. Can be player-specific.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

An object with the configuration values at a specific version. A snapshot can be targeted to a single player to apply experimentation values. This is returned by [[30 Official Roblox Docs/API Reference/Classes/ConfigService#GetConfigAsync|ConfigService:GetConfigAsync()]] and [[30 Official Roblox Docs/API Reference/Classes/ConfigService#GetConfigForPlayerAsync|ConfigService:GetConfigForPlayerAsync()]].

For more information, see [[30 Official Roblox Docs/Production/Experience configs|Experience configs]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ConfigSnapshot#Error\|Error]] | [[30 Official Roblox Docs/API Reference/Enums/ConfigSnapshotErrorState\|ConfigSnapshotErrorState]] | Populated if snapshot was in an error state. |
| [[30 Official Roblox Docs/API Reference/Classes/ConfigSnapshot#Outdated\|Outdated]] | boolean | If true, indicates the snapshot is outdated and can be refreshed to newer values. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ConfigSnapshot#GetValue\|GetValue()]] | Variant | Returns the value for the given key. |
| [[30 Official Roblox Docs/API Reference/Classes/ConfigSnapshot#GetValueChangedSignal\|GetValueChangedSignal()]] | [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptSignal\|RBXScriptSignal]] | Returns a signal that fires when the value for the given key changes due to a refresh. |
| [[30 Official Roblox Docs/API Reference/Classes/ConfigSnapshot#Refresh\|Refresh()]] | () | Refreshes the snapshot to the latest configuration values. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ConfigSnapshot#UpdateAvailable\|UpdateAvailable]] |  | Fires when a newer version of the configuration is available. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Error

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ConfigSnapshotErrorState|ConfigSnapshotErrorState]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Basic · **Tags:** `ReadOnly`, `NotReplicated`

Populated if snapshot was in an error state.

### Outdated

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Basic · **Tags:** `ReadOnly`, `NotReplicated`

If true, indicates the snapshot is outdated and can be refreshed to newer values.

## Methods

### GetValue

```lua
ConfigSnapshot:GetValue(key: string): Variant
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Returns the value for the provided key in the snapshot.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  | Key of the configuration to get the value for. |

**Returns**

| Type | Description |
| --- | --- |
| Variant | The value of the configuration for the given key. |

### GetValueChangedSignal

```lua
ConfigSnapshot:GetValueChangedSignal(key: string): RBXScriptSignal
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Returns a signal that fires when the value for the provided key changes after calling [[30 Official Roblox Docs/API Reference/Classes/ConfigSnapshot#Refresh|ConfigSnapshot:Refresh()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  | Key of the configuration to get the change signal for. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptSignal\|RBXScriptSignal]] | A `DataType.RBXScriptSignal` that fires when the value for the given key changes upon refresh. |

### Refresh

```lua
ConfigSnapshot:Refresh(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Refreshes the snapshot to the latest configuration values from the service. If not called, the snapshot will continue to reflect the values at the time it was created or last refreshed.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

## Events

### UpdateAvailable

```lua
ConfigSnapshot.UpdateAvailable()
```

**Capabilities:** Basic

Fires when a newer version of the configuration is available than the current snapshot. You can perform validation and/or call [[30 Official Roblox Docs/API Reference/Classes/ConfigSnapshot#Refresh|ConfigSnapshot:Refresh()]] to update to the latest values.

---
*Source: [ConfigSnapshot](https://create.roblox.com/docs/reference/engine/classes/ConfigSnapshot) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

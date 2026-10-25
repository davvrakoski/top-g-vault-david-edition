---
title: "ConfigService"
description: "A game service that gives access to in-experience configuration with updates in real time."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ConfigService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A game service that gives access to in-experience configuration with updates in real time.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

**ConfigService** exposes methods for getting [[30 Official Roblox Docs/API Reference/Classes/ConfigSnapshot|ConfigSnapshot]] objects. Configs can only be accessed by game servers, so you can't use [[30 Official Roblox Docs/API Reference/Classes/ConfigService|ConfigService]] within client scripts.

See [[30 Official Roblox Docs/Production/Experience configs|Experience configs]] for an in-depth guide on managing keys, deploying real-time updates, error handling, limits, and more.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ConfigService#ClearTestingValue\|ClearTestingValue()]] | () | Clears current testing value for the given key. |
| [[30 Official Roblox Docs/API Reference/Classes/ConfigService#GetConfigAsync\|GetConfigAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/ConfigSnapshot\|ConfigSnapshot]] | Retrieves a snapshot of the latest configuration. |
| [[30 Official Roblox Docs/API Reference/Classes/ConfigService#GetConfigForPlayerAsync\|GetConfigForPlayerAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/ConfigSnapshot\|ConfigSnapshot]] | Retrieves a snapshot of the latest configuration for a specific player. |
| [[30 Official Roblox Docs/API Reference/Classes/ConfigService#SetTestingValue\|SetTestingValue()]] | () | Sets a testing override for the given key. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### ClearTestingValue

```lua
ConfigService:ClearTestingValue(key: string): ()
```

**Thread safety:** Unsafe

Removes a testing override created by the [[30 Official Roblox Docs/API Reference/Classes/ConfigService#SetTestingValue|SetTestingValue()]] function. The actual configured value will be returned after calling this function.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  | Key of the configuration to clear testing value for. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### GetConfigAsync

```lua
ConfigService:GetConfigAsync(): ConfigSnapshot
```

**Thread safety:** Unsafe · **Tags:** `Yields`

This function retrieves the latest available configuration as a [[30 Official Roblox Docs/API Reference/Classes/ConfigSnapshot|ConfigSnapshot]] instance without player targeting. Snapshots can be refreshed to the latest values by calling [[30 Official Roblox Docs/API Reference/Classes/ConfigSnapshot#Refresh|ConfigSnapshot:Refresh()]].

Experiments are not applied since there is no player context.

If configuration fails to load and there is no previously available configuration, this function throws an error.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ConfigSnapshot\|ConfigSnapshot]] | A [[30 Official Roblox Docs/API Reference/Classes/ConfigSnapshot\|ConfigSnapshot]] instance with the latest configuration. |

### GetConfigForPlayerAsync

```lua
ConfigService:GetConfigForPlayerAsync(player: Player): ConfigSnapshot
```

**Thread safety:** Unsafe · **Tags:** `Yields`

Retrieves the latest available configuration as a [[30 Official Roblox Docs/API Reference/Classes/ConfigSnapshot|ConfigSnapshot]] instance targeting to the given player. Snapshots can be refreshed to the latest values by calling [[30 Official Roblox Docs/API Reference/Classes/ConfigSnapshot#Refresh|ConfigSnapshot:Refresh()]].

This function applies all experiments running for the player.

If configuration fails to load and there is no previously available configuration, this function throws an error.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The player to get the configuration for. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ConfigSnapshot\|ConfigSnapshot]] | A [[30 Official Roblox Docs/API Reference/Classes/ConfigSnapshot\|ConfigSnapshot]] instance with the latest configuration targeted to the player. |

### SetTestingValue

```lua
ConfigService:SetTestingValue(key: string, value: Variant): ()
```

**Thread safety:** Unsafe

Sets a testing override for the specified configuration key in the current server instance. When a testing value is set, calls to [[30 Official Roblox Docs/API Reference/Classes/ConfigSnapshot#GetValue|ConfigSnapshot:GetValue()]] for that key will return the testing value instead of the actual configured value.

Testing values can be cleared by calling the [[30 Official Roblox Docs/API Reference/Classes/ConfigService#ClearTestingValue|ClearTestingValue()]] function.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  | Key of the configuration to override with a testing value. |
| `value` | Variant |  | Value to set as the testing override. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [ConfigService](https://create.roblox.com/docs/reference/engine/classes/ConfigService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

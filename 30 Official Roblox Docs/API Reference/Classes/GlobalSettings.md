---
title: "GlobalSettings"
description: "Collection of menu settings for Roblox Studio."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/GlobalSettings"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Collection of menu settings for Roblox Studio.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/GenericSettings|GenericSettings]] → [[30 Official Roblox Docs/API Reference/Classes/ServiceProvider|ServiceProvider]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotBrowsable`

## Description

The base object used for Roblox Studio's settings menu. Can be accessed by using the `settings()` function, which requires the Plugin capability.

## Settings classes under the GlobalSettings

- [[30 Official Roblox Docs/API Reference/Classes/DebugSettings|DebugSettings]]
- [[30 Official Roblox Docs/API Reference/Classes/GameSettings|GameSettings]]
- [[30 Official Roblox Docs/API Reference/Classes/LuaSettings|LuaSettings]]
- [[30 Official Roblox Docs/API Reference/Classes/NetworkSettings|NetworkSettings]]
- [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings|PhysicsSettings]]
- [[30 Official Roblox Docs/API Reference/Classes/RenderSettings|RenderSettings]]
- [[30 Official Roblox Docs/API Reference/Classes/Studio|Studio]]

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/GlobalSettings#GetFFlag\|GetFFlag()]] | boolean | Returns the value of an FFlag if it exists. |
| [[30 Official Roblox Docs/API Reference/Classes/GlobalSettings#GetFVariable\|GetFVariable()]] | string | Returns the value of an FVariable, if it exists. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/GenericSettings|GenericSettings]], [[30 Official Roblox Docs/API Reference/Classes/ServiceProvider|ServiceProvider]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### GetFFlag

```lua
GlobalSettings:GetFFlag(name: string): boolean
```

**Thread safety:** Unsafe

Looks up the fast flag registered under `name` and returns its current value as a boolean: `true` when the flag's value is `true`, and `false` otherwise. Provide the flag's registered name without its type prefix, for example `MyFeature` rather than `FFlagMyFeature`. If no flag with that name is defined in the engine, the method raises an error instead of returning a value, so avoid querying flags that might not exist. Access it through the `settings()` global (requires the Plugin capability), as in `settings():GetFFlag("MyFeature")`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | The registered name of the fast flag to query, without its type prefix (for example, `MyFeature` rather than `FFlagMyFeature`). |

**Returns**

| Type | Description |
| --- | --- |
| boolean | `true` when the named flag's value is `true`, and `false` otherwise; raises an error if no flag with that name is defined. |

### GetFVariable

```lua
GlobalSettings:GetFVariable(name: string): string
```

**Thread safety:** Unsafe

Looks up the fast variable registered under `name` and returns its current value as a string. Provide the variable's registered name without its type prefix. As with [[30 Official Roblox Docs/API Reference/Classes/GlobalSettings#GetFFlag|GlobalSettings:GetFFlag()]], if no variable with that name is defined in the engine, the method raises an error rather than returning a value. Access it through the `settings()` global (requires the Plugin capability), as in `settings():GetFVariable("MyValue")`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | The registered name of the fast variable to query, without its type prefix (for example, `MyValue` rather than `FIntMyValue`). |

**Returns**

| Type | Description |
| --- | --- |
| string | The current value of the named fast variable as a string; raises an error if no variable with that name is defined. |

---
*Source: [GlobalSettings](https://create.roblox.com/docs/reference/engine/classes/GlobalSettings) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

---
title: "UserSettings"
description: "A singleton object that houses basic user settings, which persist across all games on Roblox."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/UserSettings"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A singleton object that houses basic user settings, which persist across all games on Roblox.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/GenericSettings|GenericSettings]] → [[30 Official Roblox Docs/API Reference/Classes/ServiceProvider|ServiceProvider]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`

## Description

UserSettings is a singleton object that is used to house basic user settings, which persist across all games. Currently, it only stores the [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings|UserGameSettings]] object.

You can retrieve a reference to this object via the [[30 Official Roblox Docs/API Reference/Classes/UserSettings|UserSettings()]] function, which returns it.

*Code samples for this API (`IsUserFeatureEnabled-Sample`, `Full-Screen-Mode-Detection`, `UserGameSettings-Listener`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/UserSettings); their code is not part of the open-source repo.*

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UserSettings#IsUserFeatureEnabled\|IsUserFeatureEnabled()]] | boolean | Returns true if the specified user feature is enabled. This will throw an error if the user feature does not exist. |
| [[30 Official Roblox Docs/API Reference/Classes/UserSettings#Reset\|Reset()]] | () | Erases the saved state of the UserSettings, and restores its default values. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/GenericSettings|GenericSettings]], [[30 Official Roblox Docs/API Reference/Classes/ServiceProvider|ServiceProvider]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### IsUserFeatureEnabled

```lua
UserSettings:IsUserFeatureEnabled(name: string): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Players

Returns true if the specified user feature is enabled. This will throw an error if the user feature does not exist.

This function checks user features whose names start with `"User"`. It is intended for Roblox-created scripts.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | The name of the user feature to check. Must begin with the `User` prefix. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | `true` if the named user feature exists and is enabled; otherwise `false`. |

*Code samples for this member (`IsUserFeatureEnabled-Sample`) are published on the source page; their code is not part of the open-source repo.*

### Reset

```lua
UserSettings:Reset(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Players

Erases the saved state of the UserSettings, and restores its values back to default. This function will fail to run correctly from a LocalScript, as it does not have permission to restore all of the properties in the [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings|UserGameSettings]] class.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [UserSettings](https://create.roblox.com/docs/reference/engine/classes/UserSettings) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

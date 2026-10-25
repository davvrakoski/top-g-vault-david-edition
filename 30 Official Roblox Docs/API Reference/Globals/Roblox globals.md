---
title: "Roblox globals"
description: "Built-in functions and constants unique to Roblox."
api_type: global
aliases: ["Roblox globals"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/globals/Roblox globals"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/global]
cssclasses: [tg-a30]
---

*Built-in functions and constants unique to Roblox.*

## Description

Roblox provides several unique built-in functions and variables in its embedding of Luau. These are only found on Roblox and are not packaged by default with Luau or Lua.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Globals/Roblox globals#Enum\|Enum]] | [[30 Official Roblox Docs/API Reference/Datatypes/Enums\|Enums]] | Contains all Enum objects. |
| [[30 Official Roblox Docs/API Reference/Globals/Roblox globals#game\|game]] | [[30 Official Roblox Docs/API Reference/Classes/DataModel\|DataModel]] | Refers to the DataModel singleton, the root instance of a place's hierarchy. |
| [[30 Official Roblox Docs/API Reference/Globals/Roblox globals#plugin\|plugin]] | [[30 Official Roblox Docs/API Reference/Classes/Plugin\|Plugin]] | Refers to a Plugin singleton when the code is run in the context of a Studio plugin. |
| [[30 Official Roblox Docs/API Reference/Globals/Roblox globals#shared\|shared]] | Array | A table shared between all code running at the same execution context level. |
| [[30 Official Roblox Docs/API Reference/Globals/Roblox globals#script\|script]] | [[30 Official Roblox Docs/API Reference/Classes/LuaSourceContainer\|LuaSourceContainer]] | A reference to the LuaSourceContainer object (Script, LocalScript, or ModuleScript) that is executing this code. |
| [[30 Official Roblox Docs/API Reference/Globals/Roblox globals#workspace\|workspace]] | [[30 Official Roblox Docs/API Reference/Classes/Workspace\|Workspace]] | A reference to the Workspace service, which contains all of the physical components of a place. |

### Functions

| Function | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Globals/Roblox globals#delay\|delay()]] | () | **Deprecated.** Schedules a function to be called on the next Heartbeat after the given duration (in seconds) has passed, with throttling. |
| [[30 Official Roblox Docs/API Reference/Globals/Roblox globals#DebuggerManager\|DebuggerManager()]] | DebuggerManager | **Deprecated.** Refers to the legacy `DebuggerManager` class which acts as an interface for the Luau debugger feature. |
| [[30 Official Roblox Docs/API Reference/Globals/Roblox globals#elapsedTime\|elapsedTime()]] | number | **Deprecated.** Returns the amount of time in seconds that the current instance of Roblox has been running for. |
| [[30 Official Roblox Docs/API Reference/Globals/Roblox globals#PluginManager\|PluginManager()]] | [[30 Official Roblox Docs/API Reference/Classes/PluginManager\|PluginManager]] | Refers to the [[30 Official Roblox Docs/API Reference/Classes/PluginManager\|PluginManager]], a deprecated singleton that was previously required to create plugins. |
| [[30 Official Roblox Docs/API Reference/Globals/Roblox globals#printidentity\|printidentity()]] | () | **Deprecated.** Prints "Current identity is X", where X corresponds to the current thread's security context level. |
| [[30 Official Roblox Docs/API Reference/Globals/Roblox globals#settings\|settings()]] | [[30 Official Roblox Docs/API Reference/Classes/GlobalSettings\|GlobalSettings]] | Returns the [[30 Official Roblox Docs/API Reference/Classes/GlobalSettings\|GlobalSettings]] object, which can be used to access settings objects that configure Roblox Studio's behavior. |
| [[30 Official Roblox Docs/API Reference/Globals/Roblox globals#spawn\|spawn()]] | () | **Deprecated.** Calls a function immediately through the engine scheduler, with throttling. |
| [[30 Official Roblox Docs/API Reference/Globals/Roblox globals#stats\|stats()]] | [[30 Official Roblox Docs/API Reference/Classes/Stats\|Stats]] | **Deprecated.** Returns the Stats service. |
| [[30 Official Roblox Docs/API Reference/Globals/Roblox globals#tick\|tick()]] | number | Returns the amount of time in seconds since the Unix epoch according to this device's time. |
| [[30 Official Roblox Docs/API Reference/Globals/Roblox globals#time\|time()]] | number | Returns the amount of time in seconds that has elapsed since the current game instance started running. |
| [[30 Official Roblox Docs/API Reference/Globals/Roblox globals#typeof\|typeof()]] | string | Returns the type of the given object as a string, also supporting Roblox-specific types (e.g. Vector3). |
| [[30 Official Roblox Docs/API Reference/Globals/Roblox globals#UserSettings\|UserSettings()]] | [[30 Official Roblox Docs/API Reference/Classes/UserSettings\|UserSettings]] | Returns the UserSettings object, which is used to read information from the current user's game menu settings. |
| [[30 Official Roblox Docs/API Reference/Globals/Roblox globals#version\|version()]] | string | **Deprecated.** Returns the current version of Roblox as a string, which includes the generation, version, patch and commit. |
| [[30 Official Roblox Docs/API Reference/Globals/Roblox globals#wait\|wait()]] | number, number | **Deprecated.** Yields the current thread until the specified amount of time in seconds have elapsed, with throttling. |
| [[30 Official Roblox Docs/API Reference/Globals/Roblox globals#warn\|warn()]] | () | Behaves similarly to print, except with more distinct formatting (yellow); intended for messages which describe potential problems. |
| [[30 Official Roblox Docs/API Reference/Globals/Roblox globals#ypcall\|ypcall()]] | bool, Variant | **Deprecated.** Legacy function to work around an old task scheduling limitation of [[30 Official Roblox Docs/API Reference/Globals/Luau globals#pcall\|pcall()]]. |

## Properties

### Enum

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Enums|Enums]]

A reference to the Enums data type, which stores all of the available enums that can be used on Roblox.

### game

**Type:** [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]]

A reference to the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]], which is the root Instance of Roblox's parent/child hierarchy.

### plugin

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Plugin|Plugin]]

A reference to the [[30 Official Roblox Docs/API Reference/Classes/Plugin|Plugin]] object that represents the plugin being run from this [[30 Official Roblox Docs/API Reference/Classes/Script|Script]]. This reference exists only in the context where a script is executed as a plugin and is not passed to [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScripts]] within the plugin. To use this reference in a [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]], you must explicitly pass it.

*Code samples for this member (`RobloxGlobals-plugin`) are published on the source page; their code is not part of the open-source repo.*

### shared

**Type:** Array

A table that is shared across all scripts that share the same execution context level. This serves the exact same purpose as `_G`.

### script

**Type:** [[30 Official Roblox Docs/API Reference/Classes/LuaSourceContainer|LuaSourceContainer]]

A reference to the script object that is executing the code you are writing. It can be either a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]], a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]], or a [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]]. This variable is not available when executing code from Roblox Studio's command bar.

### workspace

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]]

A reference to the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] service, which contains all of the physical components of a Roblox world.

## Functions

### delay

> [!warning] Deprecated
> This method has been superseded by `Library.task.delay()` and should not
> be used for future work.

```lua
delay(delayTime: number, callback: function): ()
```

**Tags:** `Deprecated`

Schedules a function to be executed after `delayTime` seconds have passed, without yielding the current thread. This function allows multiple Luau threads to be executed in parallel from the same stack. The delay will have a minimum duration of 29 milliseconds, but this minimum may be higher depending on the target framerate and various throttling conditions. If the `delayTime` parameter is not specified, the minimum duration will be used.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `delayTime` | number |  | The amount of time that this function will be queued before being executed. |
| `callback` | function |  | The function that will be executed once `delayTime` seconds have passed. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### DebuggerManager

> [!warning] Deprecated
> The `DebuggerManager` is obsolete and serves little to no use case for
> developers.

```lua
DebuggerManager(): DebuggerManager
```

**Tags:** `Deprecated`

Returns the legacy `DebuggerManager` class which acts as an interface for Roblox's Luau debugger feature.

This function is not recognized by Luau's analysis tool and will raise an undefined global warning.

**Returns**

| Type | Description |
| --- | --- |
| DebuggerManager | The DebuggerManager singleton instance. |

### elapsedTime

> [!warning] Deprecated
> This member is deprecated.

```lua
elapsedTime(): number
```

**Tags:** `Deprecated`

Returns how much time has elapsed since the current instance of Roblox was started. In Roblox Studio, this begins counting up from the moment Roblox Studio starts running, not just when opening a place.

**Returns**

| Type | Description |
| --- | --- |
| number | The elapsed time, in seconds, since the current Roblox instance started running. |

### PluginManager

```lua
PluginManager(): PluginManager
```

Returns the [[30 Official Roblox Docs/API Reference/Classes/PluginManager|PluginManager]] which is a deprecated singleton that was previously required to create plugins. It still has some applicable uses, such as if you need to create a [[30 Official Roblox Docs/API Reference/Classes/Plugin|Plugin]] object from Studio's [Command Bar](https://create.roblox.com/docs/studio/ui-overview#command-bar).

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PluginManager\|PluginManager]] | The PluginManager singleton instance. |

### printidentity

> [!warning] Deprecated
> This member is deprecated.

```lua
printidentity(prefix: string = Current identity is): ()
```

**Tags:** `Deprecated`

Prints `Current identity is [ID]` to the output, where [ID] corresponds to the current thread's security context level.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `prefix` | string | `Current identity is` | A custom string to print before the identity number; if omitted, defaults to "Current identity is". |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### settings

```lua
settings(): GlobalSettings
```

Returns the [[30 Official Roblox Docs/API Reference/Classes/GlobalSettings|GlobalSettings]] object, which can be used to access the settings objects that are used in Roblox Studio's settings menu.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/GlobalSettings\|GlobalSettings]] | The GlobalSettings singleton used to access Roblox Studio's settings objects. |

### spawn

> [!warning] Deprecated
> This method has been superseded by `Library.task.spawn()` and should not
> be used for future work.

```lua
spawn(callback: function): ()
```

**Tags:** `Deprecated`

Runs the specified callback function in a separate thread, without yielding the current thread.

The function will be executed the next time Roblox's Task Scheduler runs an update cycle. This delay will take at least 29 milliseconds but can arbitrarily take longer, depending on the target framerate and various throttling conditions.

The callback function is invoked with two arguments:

1. The first being the amount of time which elapsed from when spawn was called to when the function was invoked.
2. The second being equivalent to elapsedTime() or roughly how long the engine has been running.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `callback` | function |  | The function that will be executed. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`RobloxGlobals-spawn`) are published on the source page; their code is not part of the open-source repo.*

### stats

> [!warning] Deprecated
> This member is deprecated.

```lua
stats(): Stats
```

**Tags:** `Deprecated`

Returns the [[30 Official Roblox Docs/API Reference/Classes/Stats|Stats]] service. It is preferred that developers use [[30 Official Roblox Docs/API Reference/Classes/ServiceProvider#GetService|ServiceProvider:GetService()]] to retrieve it instead.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Stats\|Stats]] | The Stats service instance. |

### tick

```lua
tick(): number
```

Returns how much time has elapsed, in seconds, since the Unix epoch, on the current local session's computer. The Unix epoch is represented by 00:00:00 on 1 January 1970.

`tick()` isn't officially deprecated, but has a variety of issues. It can be off by up to one second and returns inconsistent results across time zones and operating systems. Use [[30 Official Roblox Docs/API Reference/Libraries/os#time|os.time()]], [[30 Official Roblox Docs/API Reference/Libraries/os#clock|os.clock()]], or [[30 Official Roblox Docs/API Reference/Globals/Roblox globals#time|time()]] instead. Also consider [[30 Official Roblox Docs/API Reference/Datatypes/DateTime#UnixTimestamp|DateTime.UnixTimestamp]] and [[30 Official Roblox Docs/API Reference/Datatypes/DateTime#UnixTimestampMillis|DateTime.UnixTimestampMillis]].

**Returns**

| Type | Description |
| --- | --- |
| number | The elapsed time, in seconds, since the Unix epoch (January 1, 1970) according to the local device clock. |

### time

```lua
time(): number
```

Returns the amount of time, in seconds, that has elapsed since the current game instance started running. If the current game instance is not running, this will be `0`.

If [[30 Official Roblox Docs/API Reference/Classes/Workspace#AuthorityMode|Workspace.AuthorityMode]] is [[30 Official Roblox Docs/API Reference/Enums/AuthorityMode|Enum.AuthorityMode.Server]], this value is synchronized between client and server.

**Returns**

| Type | Description |
| --- | --- |
| number | The elapsed time, in seconds, since the current game instance started running. |

### typeof

```lua
typeof(object: Variant): string
```

Returns the type of the object specified, as a string. This function is more accurate than Luau's native `type` function, as it does not denote Roblox-specific types as `userdata`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `object` | Variant |  | The Luau type that will have its type checked. |

**Returns**

| Type | Description |
| --- | --- |
| string | A string representation of the object's type, including Roblox-specific types such as "Vector3" or "CFrame". |

### UserSettings

```lua
UserSettings(): UserSettings
```

Returns the [[30 Official Roblox Docs/API Reference/Classes/UserSettings|UserSettings]] object, which is used to read information from the current user's game menu settings.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UserSettings\|UserSettings]] | The UserSettings singleton instance. |

### version

> [!warning] Deprecated
> This member is deprecated.

```lua
version(): string
```

**Tags:** `Deprecated`

Returns the current version of Roblox as a string. The integers in the version string are separated by periods, and each integers represent the following, in order:

- Generation - The current generation of the application shell that is hosting the client.
- Version - The current release version of Roblox.
- Patch - The current patch number for this version of Roblox.
- Commit - The ID of the last internal commit that was accepted into this version of the client.

**Returns**

| Type | Description |
| --- | --- |
| string | A period-separated version string in the format "generation.version.patch.commit". |

### wait

> [!warning] Deprecated
> This method has been superseded by `Library.task.wait()` and should not be
> used for future work.

```lua
wait(seconds: number = 0.03): (number, number)
```

**Tags:** `Deprecated`

Yields the current thread until the specified amount of seconds have elapsed.

The delay will have a minimum duration of 29 milliseconds, but this minimum may be higher depending on the target framerate and various throttling conditions. If the `seconds` parameter is not specified, the minimum duration will be used. This function returns:

- Actual time yielded (in seconds).
- Total time since the software was initialized (in seconds).

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `seconds` | number | `0.03` | Specifies how long the thread should yield for. |

**Returns**

| Type | Description |
| --- | --- |
| number | The actual time yielded, in seconds. |
| number | The total time elapsed since the engine started, in seconds. |

### warn

```lua
warn(params: Tuple): ()
```

Behaves identically to Luau's print function, except the output is styled as a warning, with yellow text and a timestamp. This function accepts any number of arguments, and will attempt to convert them into strings which will then be joined together with spaces between them.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `params` | Tuple |  | This function accepts any number of arguments, and will attempt to convert them into strings which will then be joined together with spaces between them. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### ypcall

> [!warning] Deprecated
> This member is deprecated.

```lua
ypcall(f: function, args: Tuple): (bool, Variant)
```

**Tags:** `Deprecated`

Legacy function to work around an old task scheduling limitation of [[30 Official Roblox Docs/API Reference/Globals/Luau globals#pcall|pcall()]]; should not be used for new work (use [[30 Official Roblox Docs/API Reference/Globals/Luau globals#pcall|pcall()]] instead).

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `f` | function |  | The function to be called in protected mode. |
| `args` | Tuple |  | Additional arguments to pass to the function. |

**Returns**

| Type | Description |
| --- | --- |
| bool | Whether the function executed successfully without raising an error. |
| Variant | The return values of the function on success, or the error message on failure. |

---
*Source: [Roblox globals](https://create.roblox.com/docs/reference/engine/globals/Roblox globals) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

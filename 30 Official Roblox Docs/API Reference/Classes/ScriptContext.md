---
title: "ScriptContext"
description: "A service that manages the execution of all `BaseScript` objects."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ScriptContext"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A service that manages the execution of all [[30 Official Roblox Docs/API Reference/Classes/BaseScript|BaseScript]] objects.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

This service controls all [[30 Official Roblox Docs/API Reference/Classes/BaseScript|BaseScript]] objects. Most of the properties and methods of this service are locked for internal use.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptContext#EnableCoverage\|EnableCoverage()]] | () | Marks an instance and its descendant scripts for code-coverage tracking. Requires `PluginOrOpenCloud` security. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptContext#GetCoverageStats\|GetCoverageStats()]] | Array | Returns code-coverage statistics for scripts marked by [[30 Official Roblox Docs/API Reference/Classes/ScriptContext#EnableCoverage\|EnableCoverage()]]. Requires `PluginOrOpenCloud` security. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptContext#SetTimeout\|SetTimeout()]] | () | Limits how long a script is allowed to run without yielding. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptContext#Error\|Error]] | `message`, `stackTrace`, `script` | Fired when an error occurs. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### EnableCoverage

```lua
ScriptContext:EnableCoverage(instance: Instance): ()
```

**Thread safety:** Unsafe · **Capabilities:** PluginOrOpenCloud

Requires `PluginOrOpenCloud` security; not callable from game scripts. Registers `instance` as a coverage root so the engine records per-line and per-function execution coverage for `instance` and every script descended from it. Retrieve the recorded data with [[30 Official Roblox Docs/API Reference/Classes/ScriptContext#GetCoverageStats|ScriptContext:GetCoverageStats()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `instance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The instance to track; coverage is recorded for this instance and every script descended from it. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### GetCoverageStats

```lua
ScriptContext:GetCoverageStats(): Array
```

**Thread safety:** Unsafe · **Capabilities:** PluginOrOpenCloud

Requires `PluginOrOpenCloud` security; not callable from experience scripts. Returns an array of coverage results, one entry per tracked script. Each entry is a table with a `Script` field (the script [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]) and a `GetHits()` function. Calling `GetHits()` returns two arrays: per-line hit counts, where `-1` marks a line that was never executed or was excluded, and per-function records containing each function's `Name`, `Line`, and `Hits`.

Like [[30 Official Roblox Docs/API Reference/Classes/ScriptContext#EnableCoverage|ScriptContext:EnableCoverage()]], this method raises an error if coverage collection is not enabled.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of per-script coverage tables, each with a `Script` field and a `GetHits` function for retrieving line and function hit counts. |

### SetTimeout

```lua
ScriptContext:SetTimeout(seconds: double): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Sets the watchdog time limit that the engine applies to running scripts. The value becomes the per-resumption execution budget: if a thread runs for longer than `seconds` since it was last resumed without yielding, the watchdog aborts it with the runtime error `Script timeout: exhausted allowed execution time`.

The timeout defaults to `0`, which disables the watchdog so that scripts may run without any time limit. Call this method with a positive value to enable enforcement, or pass `0` to turn it back off.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `seconds` | double |  | The maximum time, in seconds, that a script may run between yields before the watchdog interrupts it. A value of `0` disables the timeout. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

## Events

### Error

```lua
ScriptContext.Error(message: string, stackTrace: string, script: Instance)
```

**Capabilities:** Logging

Fires when an unhandled error occurs while running a script, reporting the error to any listening code. The engine raises this event from its error-reporting path when a thread terminates with an error, passing the error `message`, a formatted `stackTrace` string, and the `script` that was running.

This event does not fire for errors raised by the watchdog when a script exceeds its execution-time limit (see [[30 Official Roblox Docs/API Reference/Classes/ScriptContext#SetTimeout|ScriptContext:SetTimeout()]]).

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | string |  | The error message describing what went wrong. |
| `stackTrace` | string |  | The call stack at the point the error occurred, formatted as a string. |
| `script` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The script in which the error occurred. |

*Code samples for this member (`ScriptContext-Error1`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [ScriptContext](https://create.roblox.com/docs/reference/engine/classes/ScriptContext) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

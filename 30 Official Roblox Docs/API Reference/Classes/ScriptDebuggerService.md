---
title: "ScriptDebuggerService"
description: "Provides programmatic breakpoint management, execution control, and runtime inspection of Luau scripts during a playtest."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ScriptDebuggerService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Provides programmatic breakpoint management, execution control, and runtime inspection of Luau scripts during a playtest.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

`ScriptDebuggerService` exposes the Roblox Studio Luau debugger for programmatic use. It provides functionality for breakpoint management, execution control, and runtime state inspection.

**APIs in this class are currently in beta and are subject to breaking changes.**

#### Breakpoint Propagation

Breakpoints set in the **edit** [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] are set on the specific script instance and do not propagate to clones, but they propagate to corresponding scripts in play data models at the start of a playtest. Breakpoints set in a **play** [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] propagate to script clones in the same data model and to corresponding scripts in other data models.

#### Parallel Threads

The behavior of this API with parallel Luau is undefined.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptDebuggerService#AddBreakpoint\|AddBreakpoint()]] | ScriptBreakpointResult | Adds a breakpoint to a script. If a breakpoint already exists on the same script and line, its data is replaced. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptDebuggerService#ClearBreakpoints\|ClearBreakpoints()]] | () | Removes all breakpoints across all scripts. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptDebuggerService#Evaluate\|Evaluate()]] | ScriptEvaluateResult | Evaluates a Luau expression in a stack frame's context. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptDebuggerService#GetRootVariables\|GetRootVariables()]] | List<ScriptVariable> | Returns the root variables (locals, upvalues, globals) for a stack frame. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptDebuggerService#GetStackTrace\|GetStackTrace()]] | DebugStackTraceResult | Returns the call stack for a paused thread. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptDebuggerService#GetThreads\|GetThreads()]] | List<ScriptDebugThread> | Returns all paused Luau threads. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptDebuggerService#GetVariables\|GetVariables()]] | List<ScriptVariable> | Drills into structured variables (tables, [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instances]]). |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptDebuggerService#Pause\|Pause()]] | () | Requests the debugger to pause at the next safe point. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptDebuggerService#RemoveBreakpoint\|RemoveBreakpoint()]] | boolean | Removes the breakpoint on the given script and line. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptDebuggerService#SetExceptionBreakMode\|SetExceptionBreakMode()]] | () | Controls when the debugger pauses on exceptions. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptDebuggerService#Resumed\|Resumed]] | `threadIds` | Fires when a previously paused thread resumes execution. |

### Callbacks

| Callback | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptDebuggerService#OnStopped\|OnStopped()]] | ScriptResumeAction | The primary callback for reacting to debugger pauses. Returns a resume action. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### AddBreakpoint

```lua
ScriptDebuggerService:AddBreakpoint(scriptInstance: LuaSourceContainer, breakpoint: Dictionary): ScriptBreakpointResult
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Adds a breakpoint to the specified script. If a breakpoint already exists on the same script and line, its data is replaced with the new configuration.

Errors if the script instance or breakpoint argument is invalid.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `scriptInstance` | [[30 Official Roblox Docs/API Reference/Classes/LuaSourceContainer\|LuaSourceContainer]] |  | The [[30 Official Roblox Docs/API Reference/Classes/LuaSourceContainer\|LuaSourceContainer]] to place the breakpoint on. |
| `breakpoint` | Dictionary |  | Dictionary describing the breakpoint configuration through the following key-value pairs:<br><br>- `Line` — Required 1-based line number. - `Enabled` — Optional boolean whether the breakpoint is active. Default is `true`. - `Condition` — Optional string indicating the Luau expression which must be truthy to pause, for example `"health < 10"`. - `LogMessage` — Optional string message logged when the breakpoint is hit. This string is parsed as a comma-separated list of Luau expressions, evaluated in the breakpoint's scope, and concatenated [[30 Official Roblox Docs/API Reference/Globals/Luau globals#print\|print()]]‑style with spaces between segments. String literals are quoted; bare identifiers reference live values. For example, `"'count is', count"` produces output like `count is 7`. - `ContinueExecution` — If `true`, the [[30 Official Roblox Docs/API Reference/Classes/DataModel\|DataModel]] does not pause when the breakpoint is hit. Default is `false`. |

**Returns**

| Type | Description |
| --- | --- |
| ScriptBreakpointResult | Dictionary indicating whether the breakpoint was placed successfully and on which line. Includes the following key-value pairs:<br><br>- `Verified` — Boolean value indicating whether the breakpoint was placed successfully. - `Line` — The line number the breakpoint was placed on. - `Message` — Optional explanation if `Verified` is `false`. |

### ClearBreakpoints

```lua
ScriptDebuggerService:ClearBreakpoints(): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Removes all breakpoints across all scripts.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### Evaluate

```lua
ScriptDebuggerService:Evaluate(expression: string, frameId: int? = nil): ScriptEvaluateResult
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Evaluates a Luau expression in the context of the specified stack frame, or globally if no `frameId` is provided.

Errors if the expression has a syntax error or `frameId` is invalid.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `expression` | string |  | The Luau expression to evaluate. |
| `frameId` | int? | `nil` | Optional frame identifier. If omitted, evaluates globally. |

**Returns**

| Type | Description |
| --- | --- |
| ScriptEvaluateResult | Dictionary with the following key-value pairs:<br><br>- `Result` — String representation of the evaluated result. - `Type` — String indicating the Luau type of the result (`"number"`, `"string"`, `"table"`, `"Instance"`, etc.). - `VariablesReference` — If greater than `0`, drill into with [[30 Official Roblox Docs/API Reference/Classes/ScriptDebuggerService#GetVariables\|GetVariables()]]. |

### GetRootVariables

```lua
ScriptDebuggerService:GetRootVariables(frameId: int): List<ScriptVariable>
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Returns the root variables (locals, upvalues, globals) for the specified stack frame. Each variable includes a `VariablesReference` field; if greater than `0`, pass it to [[30 Official Roblox Docs/API Reference/Classes/ScriptDebuggerService#GetVariables|GetVariables()]] to drill into children.

Errors if `frameId` is invalid. Returns empty if the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] is not stopped at a breakpoint or exception, or when stopped via [[30 Official Roblox Docs/API Reference/Classes/ScriptDebuggerService#Pause|Pause()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `frameId` | int |  | The frame identifier from a debug stack frame `Id` field (see [[30 Official Roblox Docs/API Reference/Classes/ScriptDebuggerService#GetStackTrace\|GetStackTrace()]]). |

**Returns**

| Type | Description |
| --- | --- |
| List<ScriptVariable> | An array of script variable dictionaries, each containing the following key-value pairs:<br><br>- `Name` — String value indicating the variable name or table key. - `Value` — String representation of the value. - `Type` — String indicating the Luau type (`"number"`, `"string"`, `"table"`, `"Instance"`, etc.). - `Scope` — [[30 Official Roblox Docs/API Reference/Enums/ScriptVariableScope\|Enum.ScriptVariableScope]] value (children inherit parent's scope). - `VariablesReference` — If greater than `0`, call [[30 Official Roblox Docs/API Reference/Classes/ScriptDebuggerService#GetVariables\|GetVariables()]] with this to get children. |

### GetStackTrace

```lua
ScriptDebuggerService:GetStackTrace(threadId: int, startFrame: int? = nil): DebugStackTraceResult
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Returns the call stack for a paused thread, ordered innermost (current execution point) to outermost. Use `startFrame` (1‑based) for paginated retrieval of large stacks.

Errors if `threadId` or `startFrame` is invalid.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `threadId` | int |  | The thread identifier from a script debug thread `Id` field (see [[30 Official Roblox Docs/API Reference/Classes/ScriptDebuggerService#GetThreads\|GetThreads()]]). |
| `startFrame` | int? | `nil` | Optional 1-based frame index for paginated retrieval. |

**Returns**

| Type | Description |
| --- | --- |
| DebugStackTraceResult | Dictionary containing the frames ordered innermost (current) to outermost. Contains the following key-value pairs:<br><br>- `Frames` — Array of debug stack frame dictionaries. Each dictionary item contains the following key-value pairs: - `Id` — Numerical frame identifier; use with [[30 Official Roblox Docs/API Reference/Classes/ScriptDebuggerService#GetRootVariables\|GetRootVariables()]] and [[30 Official Roblox Docs/API Reference/Classes/ScriptDebuggerService#Evaluate\|Evaluate()]]. - `Name` — Human-readable name of the function at this frame. - `ScriptPath` — Full instance path of the script, for example `"ServerScriptService.MainScript"`. - `Line` — 1-based line number where execution is paused at this frame. - `TotalFrames` — Total frame count, provided when paginating. |

### GetThreads

```lua
ScriptDebuggerService:GetThreads(): List<ScriptDebugThread>
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Returns all paused Luau threads. Should be called when the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] is stopped (typically inside [[30 Official Roblox Docs/API Reference/Classes/ScriptDebuggerService#OnStopped|OnStopped]]). Returns empty results when the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] is not stopped at a breakpoint or exception, or when stopped via [[30 Official Roblox Docs/API Reference/Classes/ScriptDebuggerService#Pause|Pause()]].

**Returns**

| Type | Description |
| --- | --- |
| List<ScriptDebugThread> | An array of script debug thread dictionaries, each containing the following key-value pairs:<br><br>- `Id` — Numerical thread identifier; use with [[30 Official Roblox Docs/API Reference/Classes/ScriptDebuggerService#GetStackTrace\|GetStackTrace()]] and stepping. - `Name` — Human-readable name of the script. |

### GetVariables

```lua
ScriptDebuggerService:GetVariables(variablesReference: int): List<ScriptVariable>
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Drills into structured variables such as tables and [[30 Official Roblox Docs/API Reference/Classes/Instance|Instances]]. Pass a `VariablesReference` obtained from a script variable returned by [[30 Official Roblox Docs/API Reference/Classes/ScriptDebuggerService#GetRootVariables|GetRootVariables()]] or a previous call to this method.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `variablesReference` | int |  | A reference from a previous script variable's `VariablesReference` field (see [[30 Official Roblox Docs/API Reference/Classes/ScriptDebuggerService#GetRootVariables\|GetRootVariables()]]). |

**Returns**

| Type | Description |
| --- | --- |
| List<ScriptVariable> | An array of script variable dictionaries representing the children in the same format as variable dictionaries from [[30 Official Roblox Docs/API Reference/Classes/ScriptDebuggerService#GetRootVariables\|GetRootVariables()]]. Returns empty if the [[30 Official Roblox Docs/API Reference/Classes/DataModel\|DataModel]] is not stopped at a breakpoint or exception, or when stopped via [[30 Official Roblox Docs/API Reference/Classes/ScriptDebuggerService#Pause\|Pause()]]. |

### Pause

```lua
ScriptDebuggerService:Pause(): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Requests the debugger to pause at the next safe point. This method is asynchronous and returns immediately. When the thread pauses, [[30 Official Roblox Docs/API Reference/Classes/ScriptDebuggerService#OnStopped|OnStopped]] fires with reason [[30 Official Roblox Docs/API Reference/Enums/ScriptStoppedReason|Enum.ScriptStoppedReason.Pause]]. Has no effect if already stopped.

Only meaningful when the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] is running during a playtest. Calling `Pause()` while already stopped at a breakpoint has no effect.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### RemoveBreakpoint

```lua
ScriptDebuggerService:RemoveBreakpoint(scriptInstance: LuaSourceContainer, line: int): boolean
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Removes the breakpoint at the specified line in the given script. Returns `false` if no breakpoint exists on the line (no-op). Errors if the script instance or line number is invalid.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `scriptInstance` | [[30 Official Roblox Docs/API Reference/Classes/LuaSourceContainer\|LuaSourceContainer]] |  | The [[30 Official Roblox Docs/API Reference/Classes/LuaSourceContainer\|LuaSourceContainer]] containing the breakpoint. |
| `line` | int |  | The 1-based line number of the breakpoint to remove. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | `true` if a breakpoint was removed, `false` if no breakpoint existed on the line. |

### SetExceptionBreakMode

```lua
ScriptDebuggerService:SetExceptionBreakMode(breakMode: DebugBreakModeType): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Sets the exception break mode on **all** [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModels]]. Use [[30 Official Roblox Docs/API Reference/Enums/DebugBreakModeType|Enum.DebugBreakModeType]] to specify when the debugger should pause on exceptions.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `breakMode` | [[30 Official Roblox Docs/API Reference/Enums/DebugBreakModeType\|DebugBreakModeType]] |  | The [[30 Official Roblox Docs/API Reference/Enums/DebugBreakModeType\|Enum.DebugBreakModeType]] to set. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

## Events

### Resumed

```lua
ScriptDebuggerService.Resumed(threadIds: Array)
```

**Security:** PluginSecurity

Fires when a previously paused thread resumes. After this event, all `frameId` values, `VariablesReference` values, and script variable objects from that thread are invalidated. Re-fetch them the next time the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] stops if needed.

Avoid modifying the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]], throwing unhandled errors, or calling async yielding functions inside this event handler.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `threadIds` | Array |  | An array of thread identifiers that resumed. |

## Callbacks

### OnStopped

```lua
ScriptDebuggerService.OnStopped(stopped: Dictionary): ScriptResumeAction
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

The primary mechanism for reacting to debugger pauses. Set this to a function that receives a `stopped` payload and returns a script resume action dictionary indicating how execution should continue.

Only one `OnStopped` per [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] is allowed; it is not inherited from the edit [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]].

If the callback returns nothing or throws, [[30 Official Roblox Docs/API Reference/Enums/DebuggerResumeType|Enum.DebuggerResumeType.Resume]] is assumed. Avoid modifying the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]], throwing unhandled errors, or calling async yielding functions inside this callback.

#### Late-Set Behavior

If `OnStopped` is set while the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] is already stopped at a breakpoint and the previous value was `nil`, the callback runs immediately.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `stopped` | Dictionary |  | Dictionary describing why the debugger paused. The following key-value pairs are valid:<br><br>- `Reason` — [[30 Official Roblox Docs/API Reference/Enums/ScriptStoppedReason\|Enum.ScriptStoppedReason]] why the debugger paused. - `ThreadIds` — Array of thread identifiers that stopped. - `ExceptionText` — Error message present when `Reason` is [[30 Official Roblox Docs/API Reference/Enums/ScriptStoppedReason\|Enum.ScriptStoppedReason.Exception]]. |

**Returns**

| Type | Description |
| --- | --- |
| ScriptResumeAction | Dictionary specifying how to resume execution. Contains the following key-value pairs:<br><br>- `steppedType` — [[30 Official Roblox Docs/API Reference/Enums/DebuggerResumeType\|Enum.DebuggerResumeType]] describing how to resume. - `threadId` — Number indicating which thread to step. Required for step actions. |

---
*Source: [ScriptDebuggerService](https://create.roblox.com/docs/reference/engine/classes/ScriptDebuggerService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

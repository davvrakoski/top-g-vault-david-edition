---
title: "task"
description: "Allows for functions and threads to be coordinated with the engine's scheduler."
api_type: library
aliases: ["task"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/libraries/task"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/library]
cssclasses: [tg-a30]
---

*Allows for functions and threads to be coordinated with the engine's scheduler.*

## Description

The **task** library allows for functions and threads to be scheduled with the engine's scheduler.

The functions available in this library generally support functions and threads. In most cases using a function is sufficient, but for more advanced cases it's recommended you familiarize yourself with the [[30 Official Roblox Docs/API Reference/Libraries/coroutine|coroutine]] library.

## Summary

### Functions

| Function | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Libraries/task#spawn\|spawn()]] | thread | Calls/resumes a function/coroutine immediately through the engine's scheduler. |
| [[30 Official Roblox Docs/API Reference/Libraries/task#defer\|defer()]] | thread | Calls/resumes a function/coroutine at the end of the current resumption cycle. |
| [[30 Official Roblox Docs/API Reference/Libraries/task#delay\|delay()]] | thread | Schedules a function/coroutine to be called/resumed on the next Heartbeat after the given duration (in seconds) has passed, without throttling. |
| [[30 Official Roblox Docs/API Reference/Libraries/task#desynchronize\|desynchronize()]] | () | Causes the following code to be run in parallel. |
| [[30 Official Roblox Docs/API Reference/Libraries/task#synchronize\|synchronize()]] | () | Causes the following code to be run in serial. |
| [[30 Official Roblox Docs/API Reference/Libraries/task#wait\|wait()]] | number | Yields the current thread without throttling. |
| [[30 Official Roblox Docs/API Reference/Libraries/task#cancel\|cancel()]] | () | Cancels a thread, preventing it from being resumed. |

## Functions

### spawn

```lua
task.spawn(functionOrThread: function | thread, ...: Variant): thread
```

Accepts a function or a thread (as returned by [[30 Official Roblox Docs/API Reference/Libraries/coroutine#create|coroutine.create()]]) and calls/resumes it immediately through the engine's scheduler. Arguments after the first are sent to the function/thread.

If the calling script is currently running in a serial execution phase, then the spawned function or thread is resumed in the current serial execution phase. If the calling script is currently running in a parallel execution phase, then the spawned function or thread is resumed in the current parallel execution phase. For more information, see [[30 Official Roblox Docs/Scripting/Parallel Luau|Parallel Luau]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `functionOrThread` | function | thread |  | A function or a thread returned by [[30 Official Roblox Docs/API Reference/Libraries/coroutine#create\|coroutine.create()]]. |
| `...` | Variant |  | Arguments to send to the function or thread. |

**Returns**

| Type | Description |
| --- | --- |
| thread | The scheduled thread. |

### defer

```lua
task.defer(functionOrThread: function | thread, ...: Variant): thread
```

Accepts a function or a thread (as returned by [[30 Official Roblox Docs/API Reference/Libraries/coroutine#create|coroutine.create()]]) and defers it until the end of the current resume point within the current frame.

This function should be used when a similar behavior to [[30 Official Roblox Docs/API Reference/Libraries/task#spawn|task.spawn()]] is desirable, but the thread does not need to run immediately.

If the calling script is currently running in a serial execution phase, then the deferred function or thread is resumed in a serial execution phase. If the calling script is currently running in a parallel execution phase, then the deferred function or thread is resumed in a parallel execution phase. For more information, see [[30 Official Roblox Docs/Scripting/Parallel Luau|Parallel Luau]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `functionOrThread` | function | thread |  | A function or a thread returned by coroutine.create. |
| `...` | Variant |  | Arguments to send to the function or thread. |

**Returns**

| Type | Description |
| --- | --- |
| thread | The scheduled thread. |

### delay

```lua
task.delay(duration: number, functionOrThread: function | thread, ...: Variant): thread
```

Accepts a function or a thread (as returned by [[30 Official Roblox Docs/API Reference/Libraries/coroutine#create|coroutine.create()]]) and schedules it to be called/resumed on the next [[30 Official Roblox Docs/API Reference/Classes/RunService#Heartbeat|Heartbeat]] after the given amount of time in seconds has elapsed. Arguments after the second are sent to the function/thread.

This function differs from the deprecated global `delay()` function in that **no throttling occurs**: on the very same [[30 Official Roblox Docs/API Reference/Classes/RunService#Heartbeat|Heartbeat]] step in which enough time has passed, the function is guaranteed to be called/resumed. Providing a duration of zero (`0`) will guarantee that the function is called on the very next [[30 Official Roblox Docs/API Reference/Classes/RunService#Heartbeat|Heartbeat]].

You can calculate the actual time passed by calling [[30 Official Roblox Docs/API Reference/Libraries/os#clock|os.clock()]] upon scheduling and in the scheduled function.

If the calling script is currently running in a serial execution phase, then the delayed function or thread is resumed in a serial execution phase. If the calling script is currently running in a parallel execution phase, then the delayed function or thread is resumed in a parallel execution phase. For more information, see [[30 Official Roblox Docs/Scripting/Parallel Luau|Parallel Luau]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `duration` | number |  | The minimum number of seconds that must pass before the function/thread is called/resumed. |
| `functionOrThread` | function | thread |  | A function or a thread returned by [[30 Official Roblox Docs/API Reference/Libraries/coroutine#create\|coroutine.create()]] to be called/resumed after the duration elapses. |
| `...` | Variant |  | Arguments to be passed to the function/thread when it is due to be called/resumed. |

**Returns**

| Type | Description |
| --- | --- |
| thread | The scheduled thread. |

### desynchronize

```lua
task.desynchronize(): ()
```

If the calling script is currently running in a serial execution phase, `desynchronize()` suspends the script and the script will be resumed in the next parallel execution phase. If the calling script is currently running in a parallel execution phase, `desynchronize()` returns immediately and has no effect.

Only scripts which are descendants of an [[30 Official Roblox Docs/API Reference/Classes/Actor|Actor]] may call this method. If a script outside of an [[30 Official Roblox Docs/API Reference/Classes/Actor|Actor]] calls this method, an error will be raised. [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScripts]] may also call `desynchronize()` as long as the instantiation of the module calling it was required by a script that is a descendant of an [[30 Official Roblox Docs/API Reference/Classes/Actor|Actor]].

For more information, see [[30 Official Roblox Docs/Scripting/Parallel Luau|Parallel Luau]].

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### synchronize

```lua
task.synchronize(): ()
```

If the calling script is currently running in a parallel execution phase, `synchronize()` suspends the script and the script will be resumed in the next serial execution phase. If the calling script is currently running in a serial execution phase, `synchronize()` returns immediately and has no effect.

Only scripts which are descendants of an [[30 Official Roblox Docs/API Reference/Classes/Actor|Actor]] may call this method. If a script outside of an [[30 Official Roblox Docs/API Reference/Classes/Actor|Actor]] calls this method, an error will be raised. [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScripts]] may also call `synchronize()` as long as the instantiation of the module calling it was required by a script that is a descendant of an [[30 Official Roblox Docs/API Reference/Classes/Actor|Actor]].

For more information, see [[30 Official Roblox Docs/Scripting/Parallel Luau|Parallel Luau]].

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### wait

```lua
task.wait(duration: number = 0): number
```

Yields the current thread until the given duration (in seconds) has elapsed, then resumes the thread on the next [[30 Official Roblox Docs/API Reference/Classes/RunService#Heartbeat|Heartbeat]] step. The actual amount of time elapsed is returned.

If no duration is given, it will default to zero (`0`). This means the thread resumes on the very next step, which is equivalent in behavior to [[30 Official Roblox Docs/API Reference/Classes/RunService|RunService.Heartbeat:Wait()]]

Unlike the deprecated global `wait()`, this function **does not throttle** and guarantees the resumption of the thread on the first Heartbeat that occurs when it is due. This function also only returns the elapsed time and nothing else.

If the calling script is currently running in a serial execution phase, then the script is resumed in a serial execution phase. If the calling script is currently running in a parallel execution phase, then the script is resumed in a parallel execution phase. For more information, see [[30 Official Roblox Docs/Scripting/Parallel Luau|Parallel Luau]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `duration` | number | `0` | The amount of time in seconds that should elapse before the current thread is resumed. |

**Returns**

| Type | Description |
| --- | --- |
| number |  |

### cancel

```lua
task.cancel(thread: thread): ()
```

Cancels a thread and closes it, preventing it from being resumed manually or by the engine's scheduler.

This function can be used with other members of the **task** library that return a thread to cancel them before they are resumed. For example:

```lua
local thread = task.delay(5, function()
	print("Hello world!")
end)

task.cancel(thread)
```

Note that threads may be in a state where it is impossible to cancel them. For example, the currently executing thread and threads that have resumed another coroutine may not be cancelled. If this is the case, an error will be generated. However, code should not rely on specific thread states or conditions causing [[30 Official Roblox Docs/API Reference/Libraries/task#cancel|task.cancel()]] to fail. It is possible that future updates will eliminate these constraints and allow threads in these states to be successfully cancelled.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `thread` | thread |  | The thread that will be cancelled. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [task](https://create.roblox.com/docs/reference/engine/libraries/task) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

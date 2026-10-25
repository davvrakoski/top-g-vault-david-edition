---
title: "Schedule code"
description: "Explains how to schedule code so it executes after a specific action or cycle has completed."
area: "30 Official Roblox Docs"
cluster: "Scripting"
source: "https://create.roblox.com/docs/scripting/scheduler"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains how to schedule code so it executes after a specific action or cycle has completed.*

Scheduling code is useful in many situations, such as ensuring code executes after a specific action or cycle has completed, or delaying code for a specific duration of time. You can use the [[30 Official Roblox Docs/API Reference/Libraries/task|task]] library to optimize Roblox's [[30 Official Roblox Docs/Performance Optimization/Microprofiler/Task scheduler|task scheduler]] to manage and schedule code. You can also use a similar library called [[30 Official Roblox Docs/API Reference/Libraries/coroutine|coroutine]] to schedule code which has some additional functionality.

### Common methods

The following are the most common [[30 Official Roblox Docs/API Reference/Libraries/task|task]] methods used to schedule code. You should use the task methods over legacy scheduling methods, such as [[30 Official Roblox Docs/API Reference/Globals/Roblox globals#wait|wait()]], to ensure that your code runs optimally.

> [!warning]
> Certain legacy global methods, such as ([[30 Official Roblox Docs/API Reference/Globals/Roblox globals#spawn|spawn()]], [[30 Official Roblox Docs/API Reference/Globals/Roblox globals#delay|delay()]], and [[30 Official Roblox Docs/API Reference/Globals/Roblox globals#wait|wait()]]) can provide similar code scheduling results but are less optimized and configurable as their [[30 Official Roblox Docs/API Reference/Libraries/task|task]] alternatives. If your game uses these legacy methods, you should use [[30 Official Roblox Docs/API Reference/Libraries/task|task]] instead to ensure your game's code remains efficient and up-to-date.

The following table lists the relevant legacy global methods and their preferred, more optimized counterparts:

| Legacy global methods                   | Task methods                                       | Additional alternatives                            |
| :-------------------------------------- | :------------------------------------------------- | :------------------------------------------------- |
| `wait()`                                | [[30 Official Roblox Docs/API Reference/Libraries/task#wait\|task.wait()]]                              | [[30 Official Roblox Docs/API Reference/Classes/RunService#Heartbeat\|RunService.Heartbeat]]                       |
| `wait(n)`                               | [[30 Official Roblox Docs/API Reference/Libraries/task#wait\|task.wait(n)]]                |                                                    |
| `spawn(f)`                              | [[30 Official Roblox Docs/API Reference/Libraries/task#defer\|task.defer(f)]]              | [[30 Official Roblox Docs/API Reference/Libraries/task#delay\|task.delay(0, f)]]           |
| `delay(n, f)`                           | [[30 Official Roblox Docs/API Reference/Libraries/task#delay\|task.delay(n, f)]]           |                                                    |
| `spawn(function() f(uv1, ...) end)`    | [[30 Official Roblox Docs/API Reference/Libraries/task#defer\|task.defer(f, uv1, ...)]]    | [[30 Official Roblox Docs/API Reference/Libraries/task#delay\|task.delay(0, f, uv1, ...)]] |
| `delay(n, function() f(uv1, ...) end)` | [[30 Official Roblox Docs/API Reference/Libraries/task#delay\|task.delay(n, f, uv1, ...)]] |                                                    |

#### task.spawn()

[[30 Official Roblox Docs/API Reference/Libraries/task#spawn|task.spawn()]] takes a thread or function and resumes it **immediately** through the engine's scheduler. Additional arguments are passed to the thread or function being resumed.

The following code sample is an example of how you can use [[30 Official Roblox Docs/API Reference/Libraries/task#spawn|task.spawn()]] when calling a function that may yield while iterating over a set of objects:

```lua
local function playerAdded(player)
	print(player)
end

for _, player in Players:GetPlayers() do
	task.spawn(playerAdded, player)
end
```

#### task.defer()

[[30 Official Roblox Docs/API Reference/Libraries/task#defer|task.defer()]] takes a thread or function and defers it until the end of the current resume point within the current frame. Additional arguments are passed to the thread or function resuming.

You should typically use this when you want similar behavior to [[30 Official Roblox Docs/API Reference/Libraries/task#spawn|task.spawn()]] but don't care about the thread running immediately. The following code sample illustrates how the [[30 Official Roblox Docs/API Reference/Globals/Roblox globals|print()]] statement for `"A"` will defer until after the [[30 Official Roblox Docs/API Reference/Globals/Roblox globals|print()]] statement for `"B"` executes:

```lua
task.defer(print, "A")
print("B")
--> B
--> A
```

> [!info]
> [[30 Official Roblox Docs/API Reference/Libraries/task#defer|task.defer()]] is an optimized version of [[30 Official Roblox Docs/API Reference/Globals/Roblox globals#spawn|spawn()]] that schedules a thread to resume as soon as possible (but not immediately) without any throttling.

#### task.delay()

[[30 Official Roblox Docs/API Reference/Libraries/task#delay|task.delay()]] takes a thread or function and schedules it for resumption after the given amount of time elapses on the next [[30 Official Roblox Docs/API Reference/Classes/RunService#Heartbeat|Heartbeat]] step. The thread resumes with built-in error handling and support for other engine features. Any additional arguments are passed to the thread or function resuming.

Since the actual delay time may vary, the following code sample illustrates how you can calculate it by passing the current time as an argument:

```lua
task.delay(2, function(scheduledTime)
	print(os.clock() - scheduledTime) --> 2.038702
end, os.clock())
```

A duration of zero will result in the thread or function resuming on the next step.

> [!info]
> [[30 Official Roblox Docs/API Reference/Libraries/task#delay|task.delay()]] is an optimized version of [[30 Official Roblox Docs/API Reference/Globals/Roblox globals#delay|delay()]] that schedules a thread to resume after some time elapses without throttling.

#### task.wait()

[[30 Official Roblox Docs/API Reference/Libraries/task#wait|task.wait()]] yields the current thread until the given duration (in seconds) elapses and then resumes the thread on the next [[30 Official Roblox Docs/API Reference/Classes/RunService#Heartbeat|Heartbeat]] step.

The actual yield time may vary. The following code sample illustrates how this method returns it for convenience:

Since the actual delay time may vary, the following code sample illustrates how you can get the actual time by storing the method's return value:

```lua
local elapsedTime = task.wait(2) -- Wait for 2 seconds
print(elapsedTime) --> 2.0792941
```

If no duration is given the duration will default to zero meaning the thread will automatically resume on the next step. This means [[30 Official Roblox Docs/API Reference/Libraries/task#wait|task.wait()]] is equivalent in behavior to [[30 Official Roblox Docs/API Reference/Classes/RunService#Heartbeat|RunService.Heartbeat]].

> [!info]
> [[30 Official Roblox Docs/API Reference/Libraries/task#wait|task.wait()]] is an optimized version of [[30 Official Roblox Docs/API Reference/Globals/Roblox globals#wait|wait()]] that schedules the current thread to resume after some time elapses without throttling.

---
*Source: [Schedule code](https://create.roblox.com/docs/scripting/scheduler) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

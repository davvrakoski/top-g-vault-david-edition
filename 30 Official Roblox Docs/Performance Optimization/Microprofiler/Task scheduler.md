---
title: "Task scheduler"
description: "Task Scheduler coordinates tasks done in each frame as the game runs."
area: "30 Official Roblox Docs"
cluster: "Performance Optimization"
source: "https://create.roblox.com/docs/performance-optimization/microprofiler/task-scheduler"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Task Scheduler coordinates tasks done in each frame as the game runs.*

The **task scheduler** coordinates tasks done each frame as the game runs, even when it is paused. These tasks include detecting player input, animating characters, updating the physics simulation, and resuming scripts in a [[30 Official Roblox Docs/API Reference/Libraries/task#wait|task.wait()]] state.

While there may be multiple tasks running, the task scheduler can potentially be overloaded, especially in the following situations:

- Using a custom character rig or input scheme.
- Animating parts yourself (instead of using an [[30 Official Roblox Docs/API Reference/Classes/Animator|Animator]]).
- Depending heavily on precise physics.
- Replicating objects regularly.

## RunService

The most direct way to add frame-by-frame tasks is through the following members of [[30 Official Roblox Docs/API Reference/Classes/RunService|RunService]]:

- [[30 Official Roblox Docs/API Reference/Classes/RunService#PreAnimation|RunService.PreAnimation]]
- [[30 Official Roblox Docs/API Reference/Classes/RunService#PreSimulation|RunService.PreSimulation]]
- [[30 Official Roblox Docs/API Reference/Classes/RunService#PostSimulation|RunService.PostSimulation]]
- [[30 Official Roblox Docs/API Reference/Classes/RunService#Heartbeat|RunService.Heartbeat]]
- [[30 Official Roblox Docs/API Reference/Classes/RunService#BindToRenderStep|RunService:BindToRenderStep()]]
- [[30 Official Roblox Docs/API Reference/Classes/RunService#PreRender|RunService.PreRender]]

## Scheduler priority

The task scheduler categorizes and completes tasks in the following order. Some tasks may not perform work in a frame, while others may run multiple times.

*(image in the full Top G Vault)*

\* Script execution during [[30 Official Roblox Docs/API Reference/Classes/RunService#Heartbeat|RunService.Heartbeat]] differs depending on your game's [[30 Official Roblox Docs/API Reference/Classes/Workspace#SignalBehavior|Workspace.SignalBehavior]] setting. See [[30 Official Roblox Docs/Scripting/Events/Deferred engine events|Deferred events]].

## Best practices

To build performant games with efficiency in mind, note the following:

- **Don't connect/bind functions to the render step unless absolutely necessary.**
  Only tasks that must be done after input but before rendering should be done in such a way, like camera movement. For strict control over order, use [[30 Official Roblox Docs/API Reference/Classes/RunService#BindToRenderStep|BindToRenderStep()]] instead of [[30 Official Roblox Docs/API Reference/Classes/RunService#PreRender|PreRender]].

- **Manage physical states carefully.**
  [[30 Official Roblox Docs/API Reference/Classes/RunService#PreSimulation|PreSimulation]] happens **before** physics, while [[30 Official Roblox Docs/API Reference/Classes/RunService#PostSimulation|PostSimulation]] happens **after** physics. Therefore, gameplay logic that affects the physics state should be done in [[30 Official Roblox Docs/API Reference/Classes/RunService#PreSimulation|PreSimulation]], such as setting the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Velocity|Velocity]] of parts. In contrast, gameplay logic that relies on or reacts to the physics state should be handled in [[30 Official Roblox Docs/API Reference/Classes/RunService#PostSimulation|PostSimulation]], such as reading the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Position|Position]] of parts to detect when they enter defined zones.

- **Motor6D transform changes should be done on the PreSimulation event.**
  If you don't, [[30 Official Roblox Docs/API Reference/Classes/Animator|Animators]] will overwrite changes on the next frame. Even without an [[30 Official Roblox Docs/API Reference/Classes/Animator|Animator]], [[30 Official Roblox Docs/API Reference/Classes/RunService#PreSimulation|PreSimulation]] is the last Luau event fired before [[30 Official Roblox Docs/API Reference/Classes/Motor6D#Transform|Motor6D.Transform]] is applied to part positions.

---
*Source: [Task scheduler](https://create.roblox.com/docs/performance-optimization/microprofiler/task-scheduler) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

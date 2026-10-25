---
title: "RunService"
description: "Service responsible for all runtime activity and progression of time."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/RunService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Service responsible for all runtime activity and progression of time.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

`RunService` contains methods and events for time management as well as for managing the context in which an experience or script is running. Methods like [[30 Official Roblox Docs/API Reference/Classes/RunService#IsClient|IsClient()]], [[30 Official Roblox Docs/API Reference/Classes/RunService#IsServer|IsServer()]], and [[30 Official Roblox Docs/API Reference/Classes/RunService#IsStudio|IsStudio()]] can help you determine under what context code is running. These methods are useful for [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScripts]] that may be required by both client and server scripts. Furthermore, [[30 Official Roblox Docs/API Reference/Classes/RunService#IsStudio|IsStudio()]] can be used to add special behaviors for in‑Studio testing.

`RunService` also houses events that allow your code to adhere to the engine's frame‑by‑frame loop, such as [[30 Official Roblox Docs/API Reference/Classes/RunService#PreRender|PreRender]], [[30 Official Roblox Docs/API Reference/Classes/RunService#PreAnimation|PreAnimation]], [[30 Official Roblox Docs/API Reference/Classes/RunService#PreSimulation|PreSimulation]], [[30 Official Roblox Docs/API Reference/Classes/RunService#PostSimulation|PostSimulation]], and [[30 Official Roblox Docs/API Reference/Classes/RunService#Heartbeat|Heartbeat]]. Selecting the proper event to use for any case is important, so you should read [[30 Official Roblox Docs/Performance Optimization/Microprofiler/Task scheduler|Task Scheduler]] to make an informed decision.

##### Context Test Results

| Environment | [[30 Official Roblox Docs/API Reference/Classes/RunService#IsStudio\|IsStudio]] | [[30 Official Roblox Docs/API Reference/Classes/RunService#IsClient\|IsClient]] | [[30 Official Roblox Docs/API Reference/Classes/RunService#IsServer\|IsServer]] | [[30 Official Roblox Docs/API Reference/Classes/RunService#IsEdit\|IsEdit]] | [[30 Official Roblox Docs/API Reference/Classes/RunService#IsRunning\|IsRunning]] | [[30 Official Roblox Docs/API Reference/Classes/RunService#IsRunMode\|IsRunMode]] |
| --- | --- | --- | --- | --- | --- | --- |
| Live (Client) | `false` | `true` | `false` |  | `true` | `false` |
| Live (Server) | `false` | `false` | `true` |  | `true` | `false` |
| Edit | `true` | `true` | `true` | `true` | `false` | `false` |
| Collaborative Edit | `true` | `true` | `false` | `true` | `false` | `false` |
| Run Mode | `true` | `false` | `true` |  | `true` | `true` |
| Play Mode (Client) | `true` | `true` | `false` |  | `true` | `false` |
| Play Mode (Server) | `true` | `false` | `true` |  | `true` | `false` |
| Team Test (Client) | `true` | `true` | `false` |  | `true` | `false` |
| Team Test (Server) | `true` | `false` | `true` |  | `true` | `false` |
| Luau Execution | `false` | `false` | `true` |  | `false` | `false` |

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/RunService#RunState\|RunState]] | [[30 Official Roblox Docs/API Reference/Enums/RunState\|RunState]] | The current run state of the game's simulation. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/RunService#BindToAnimation\|BindToAnimation()]] | [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection\|RBXScriptConnection]] | Binds a custom function to be called at a fixed frequency before Animators update when fixed simulation is enabled, or immediately before `BindToSimulation` callbacks otherwise. |
| [[30 Official Roblox Docs/API Reference/Classes/RunService#BindToRenderStep\|BindToRenderStep()]] | () | Given a string name of a function and a priority, this method binds the function to [[30 Official Roblox Docs/API Reference/Classes/RunService#PreRender\|RunService.PreRender]]. |
| [[30 Official Roblox Docs/API Reference/Classes/RunService#BindToSimulation\|BindToSimulation()]] | [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection\|RBXScriptConnection]] | Binds a custom function to be called at a fixed frequency which is independent of the frame rate. |
| [[30 Official Roblox Docs/API Reference/Classes/RunService#GetPredictionStatus\|GetPredictionStatus()]] | [[30 Official Roblox Docs/API Reference/Enums/PredictionStatus\|PredictionStatus]] | Checks the [[30 Official Roblox Docs/API Reference/Enums/PredictionStatus\|Enum.PredictionStatus]] of a specific context instance, useful for debugging scripts affecting multiple instances where some might be predicted and others might not. |
| [[30 Official Roblox Docs/API Reference/Classes/RunService#IsClient\|IsClient()]] | boolean | Returns whether the current environment is running on the client. |
| [[30 Official Roblox Docs/API Reference/Classes/RunService#IsEdit\|IsEdit()]] | boolean | Returns whether the current environment is in `Edit` mode. |
| [[30 Official Roblox Docs/API Reference/Classes/RunService#IsResimulating\|IsResimulating()]] | boolean | Returns whether the client is currently in a resimulation step after a misprediction in the server authority model. |
| [[30 Official Roblox Docs/API Reference/Classes/RunService#IsRunMode\|IsRunMode()]] | boolean | Returns whether a **Run** playtest has been initiated in Studio. |
| [[30 Official Roblox Docs/API Reference/Classes/RunService#IsRunning\|IsRunning()]] | boolean | Returns whether the experience is currently running. |
| [[30 Official Roblox Docs/API Reference/Classes/RunService#IsServer\|IsServer()]] | boolean | Returns whether the current environment is running on the server. |
| [[30 Official Roblox Docs/API Reference/Classes/RunService#IsStudio\|IsStudio()]] | boolean | Returns whether the current environment is running in Studio. |
| [[30 Official Roblox Docs/API Reference/Classes/RunService#Pause\|Pause()]] | () | Pauses the experience's simulation if it is running, suspending physics and scripts. |
| [[30 Official Roblox Docs/API Reference/Classes/RunService#Reset\|Reset()]] | () | **Deprecated.** Resets the current game to a waypoint set when [[30 Official Roblox Docs/API Reference/Classes/RunService#Run\|RunService:Run()]] was called. |
| [[30 Official Roblox Docs/API Reference/Classes/RunService#Run\|Run()]] | () | Runs the game's simulation, running physics and scripts. |
| [[30 Official Roblox Docs/API Reference/Classes/RunService#SetPredictionMode\|SetPredictionMode()]] | () | Sets the prediction mode for an [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] to an [[30 Official Roblox Docs/API Reference/Enums/PredictionMode\|Enum.PredictionMode]] value. |
| [[30 Official Roblox Docs/API Reference/Classes/RunService#Stop\|Stop()]] | () | Stops the experience's simulation if it is running. |
| [[30 Official Roblox Docs/API Reference/Classes/RunService#UnbindFromRenderStep\|UnbindFromRenderStep()]] | () | Unbinds a function that was bound to the render loop using [[30 Official Roblox Docs/API Reference/Classes/RunService#BindToRenderStep\|RunService:BindToRenderStep()]]. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/RunService#Heartbeat\|Heartbeat]] | `deltaTime` | Fires every frame, after the physics simulation has completed. |
| [[30 Official Roblox Docs/API Reference/Classes/RunService#Misprediction\|Misprediction]] | `time`, `instances`, `stats` | In the server authority model, fires during prediction when the engine detects that the client has diverged from the server's authoritative state. Intended for plugin-based debugging. |
| [[30 Official Roblox Docs/API Reference/Classes/RunService#PostSimulation\|PostSimulation]] | `deltaTimeSim` | Fires every frame, after the physics simulation has completed. |
| [[30 Official Roblox Docs/API Reference/Classes/RunService#PreAnimation\|PreAnimation]] | `deltaTimeSim` | Fires every frame, prior to the physics simulation but after rendering. |
| [[30 Official Roblox Docs/API Reference/Classes/RunService#PreRender\|PreRender]] | `deltaTimeRender` | Fires every frame, prior to the frame being rendered. |
| [[30 Official Roblox Docs/API Reference/Classes/RunService#PreSimulation\|PreSimulation]] | `deltaTimeSim` | Fires every frame, prior to the physics simulation. |
| [[30 Official Roblox Docs/API Reference/Classes/RunService#RenderStepped\|RenderStepped]] | `deltaTime` | Fires every frame, prior to the frame being rendered. |
| [[30 Official Roblox Docs/API Reference/Classes/RunService#Rollback\|Rollback]] | `time` | In the server authority model, this fires after rolling back the predicted state due to a misprediction, but before resimulation begins. |
| [[30 Official Roblox Docs/API Reference/Classes/RunService#Stepped\|Stepped]] | `time`, `deltaTime` | Fires every frame, prior to the physics simulation. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### RunState

**Type:** [[30 Official Roblox Docs/API Reference/Enums/RunState|RunState]]

**Security:** read None / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Basic, PluginOrOpenCloud · **Tags:** `NotReplicated`

An [[30 Official Roblox Docs/API Reference/Enums/RunState|Enum.RunState]] value that reflects whether the game's simulation is stopped, running, or paused. Reading reports the current state; setting it transitions the simulation, equivalent to [[30 Official Roblox Docs/API Reference/Classes/RunService#Run|RunService:Run()]], [[30 Official Roblox Docs/API Reference/Classes/RunService#Pause|RunService:Pause()]], and [[30 Official Roblox Docs/API Reference/Classes/RunService#Stop|RunService:Stop()]] for the corresponding states. Defaults to [[30 Official Roblox Docs/API Reference/Enums/RunState|Enum.RunState.Stopped]]. Setting this property requires `Plugin` security.

The state reported here backs the context methods on [[30 Official Roblox Docs/API Reference/Classes/RunService|RunService]]: it is `Running` when [[30 Official Roblox Docs/API Reference/Classes/RunService#IsRunning|IsRunning()]] returns `true`, and `Stopped` when [[30 Official Roblox Docs/API Reference/Classes/RunService#IsEdit|IsEdit()]] returns `true`.

## Methods

### BindToAnimation

```lua
RunService:BindToAnimation(function: Function, frequency: StepFrequency = Hz30, priority: int = 2000): RBXScriptConnection
```

**Thread safety:** Unsafe · **Capabilities:** Basic

`BindToAnimation()` binds a custom function to be called at a fixed frequency which is independent of the frame rate. When [[30 Official Roblox Docs/API Reference/Classes/Workspace#UseFixedSimulation|Workspace.UseFixedSimulation]] is enabled, these functions are invoked before Animators update, making this the fixed-frequency counterpart to [[30 Official Roblox Docs/API Reference/Classes/RunService#PreAnimation|PreAnimation]]. When fixed simulation is disabled, they instead run immediately before [[30 Official Roblox Docs/API Reference/Classes/RunService#BindToSimulation|BindToSimulation()]] callbacks, so no pre-animation ordering should be assumed. In the server authority model, bound functions will also get called when the client needs to resimulate.

Like [[30 Official Roblox Docs/API Reference/Classes/RunService#BindToSimulation|BindToSimulation()]], the bound function is meant for physics controllers and prediction, so an error will trigger if you read or write from unsynchronized properties or call an unsynchronized method. This error is meant to help guide you in writing a pure, synchronized simulation.

To synchronize inaccessible properties, you should store the relevant data in [[30 Official Roblox Docs/Studio/Properties window#Instance attributes|attributes]] and update the relevant property in [[30 Official Roblox Docs/API Reference/Classes/RunService#PostSimulation|PostSimulation]] or [[30 Official Roblox Docs/API Reference/Classes/RunService#RenderStepped|RenderStepped]] by reading from attributes. This will leverage attribute synchronization to keep the property fully synchronized through the rollback mechanism.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `function` | Function |  | The function to call. This function will be passed one parameter called `deltaTime`, which shows the elapsed time since the callback's previous invocation. |
| `frequency` | [[30 Official Roblox Docs/API Reference/Enums/StepFrequency\|StepFrequency]] | `Hz30` | Optional [[30 Official Roblox Docs/API Reference/Enums/StepFrequency\|Enum.StepFrequency]] value indicating the frequency at which to call the bound function. Defaults to [[30 Official Roblox Docs/API Reference/Enums/StepFrequency\|Enum.StepFrequency.Hz30]]. |
| `priority` | int | `2000` | Optional priority of the binding as an integer; it determines the order in which bound functions are called within a simulation step. Lower numbers are called first. If two bindings have the same priority, the order between them is unspecified. Defaults to 2000. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection\|RBXScriptConnection]] | A [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection\|RBXScriptConnection]] that can be disconnected to unregister the callback. |

### BindToRenderStep

```lua
RunService:BindToRenderStep(name: string, priority: int, function: Function): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic

The `BindToRenderStep()` function binds a custom function to be called at a specific time during the render step. There are three main arguments: `name`, `priority`, and what `function` to call.

As it is linked to the client's rendering process, `BindToRenderStep()` can only be called on the client.

##### Name

The `name` parameter is a label for the binding and can be used with [[30 Official Roblox Docs/API Reference/Classes/RunService#UnbindFromRenderStep|RunService:UnbindFromRenderStep()]] if the binding is no longer needed.

```lua
local RunService = game:GetService("RunService")

local function functionToBind() end

-- Bind the function above to the binding named "tempBinding"
RunService:BindToRenderStep("tempBinding", 1, functionToBind)
-- Unbind the function bound to "tempBinding"
RunService:UnbindFromRenderStep("tempBinding")
```

##### Priority

The `priority` of the binding is an integer; it determines when during the render step to call the custom function. The lower this number, the sooner the custom function will be called. If two bindings have the same priority, the engine will randomly pick one to run first. The default control scripts run with these specific priorities:

- Player Input: `100`
- Camera Controls: `200` For convenience; the [[30 Official Roblox Docs/API Reference/Enums/RenderPriority|Enum.RenderPriority]] enum can be used to determine the integer value to set a binding. For example, to make a binding right before the default camera update, simply subtract `1` from the camera priority level.

When using [[30 Official Roblox Docs/API Reference/Enums/RenderPriority|Enum.RenderPriority]], remember to use `.Value` at the end of the desired enum. [[30 Official Roblox Docs/API Reference/Classes/RunService#BindToRenderStep|RunService:BindToRenderStep()]] will not work if just the enum is used on its own.

```lua
local RunService = game:GetService("RunService")

local function beforeCamera(delta)
	-- Code in here will run before the default camera script
end

RunService:BindToRenderStep("Before camera", Enum.RenderPriority.Camera.Value - 1, beforeCamera)
```

##### Custom Function and Delta Time

The last argument (`function`) is the custom function to call. This function will be passed one parameter called `deltaTime` which shows how much time passed between the beginning of the previous render step and the beginning of the current render step.

All rendering updates will wait until the code in the render step finishes. Make sure that any code called by `BindToRenderStep()` runs quickly and efficiently; if code takes too long, the experience visuals will be choppy.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | Label for the binding which can be used with [[30 Official Roblox Docs/API Reference/Classes/RunService\|Unbind]] if the binding is no longer needed. |
| `priority` | int |  | Priority of the binding as an integer; it determines when during the render step to call the custom function. The lower this number, the sooner the custom function will be called. If two bindings have the same priority, the engine will randomly pick one to run first. |
| `function` | Function |  | The custom function being bound. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`RunService-BindToRenderStep`, `runservice-custom-function`, `runservice-unbindfromrenderstep`) are published on the source page; their code is not part of the open-source repo.*

### BindToSimulation

```lua
RunService:BindToSimulation(function: Function, frequency: StepFrequency = Hz30, priority: int = 2000): RBXScriptConnection
```

**Thread safety:** Unsafe · **Capabilities:** Basic

`BindToSimulation()` binds a custom function to be called at a fixed frequency which is independent of the frame rate. In the server authority model, bound functions will also get called when the client needs to resimulate. This method is only available when [[30 Official Roblox Docs/API Reference/Classes/Workspace#UseFixedSimulation|Workspace.UseFixedSimulation]] is enabled.

Note that since the bound function is meant for physics controllers and prediction, an error will trigger if you read or write from unsynchronized properties or call an unsynchronized method. This error is meant to help guide you in writing a pure, synchronized simulation.

To synchronize inaccessible properties, you should store the relevant data in [[30 Official Roblox Docs/Studio/Properties window#Instance attributes|attributes]] and update the relevant property in [[30 Official Roblox Docs/API Reference/Classes/RunService#PostSimulation|PostSimulation]] or [[30 Official Roblox Docs/API Reference/Classes/RunService#RenderStepped|RenderStepped]] by reading from attributes. This will leverage attribute synchronization to keep the property fully synchronized through the rollback mechanism.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `function` | Function |  | The function to call. This function will be passed one parameter called `deltaTime` which shows how much time passed between the beginning of the previous simulation step and the beginning of the current simulation step. |
| `frequency` | [[30 Official Roblox Docs/API Reference/Enums/StepFrequency\|StepFrequency]] | `Hz30` | Optional [[30 Official Roblox Docs/API Reference/Enums/StepFrequency\|Enum.StepFrequency]] value indicating the frequency at which to call the bound function. If not provided, the default frequency will be used. |
| `priority` | int | `2000` | Optional priority of the binding as an integer; it determines the order in which bound functions are called within a simulation step. Lower numbers are called first. If two bindings have the same priority, the order between them is unspecified. Defaults to 2000. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection\|RBXScriptConnection]] | An [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection\|RBXScriptConnection]] that can be disconnected to unbind the function from the simulation step. |

*Code samples for this member (`RunService-BindToSimulation`) are published on the source page; their code is not part of the open-source repo.*

### GetPredictionStatus

```lua
RunService:GetPredictionStatus(context: Instance): PredictionStatus
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Clients can use this method to check the [[30 Official Roblox Docs/API Reference/Enums/PredictionStatus|Enum.PredictionStatus]] of a specific context instance, useful for debugging scripts affecting multiple instances (vehicle controllers, custom physics, etc.) where some might be predicted and others might not. This method is also useful for debugging and observing the effects of [[30 Official Roblox Docs/API Reference/Enums/PredictionMode|Enum.PredictionMode.Automatic]] prediction mode.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] for which to check prediction status. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/PredictionStatus\|PredictionStatus]] | The [[30 Official Roblox Docs/API Reference/Enums/PredictionStatus\|Enum.PredictionStatus]] of the given instance, indicating whether it is predicted, authoritative, or not participating in prediction. |

### IsClient

```lua
RunService:IsClient(): boolean
```

**Thread safety:** Safe · **Capabilities:** Basic

If the code that invoked this method is running in a client context (in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]], in a [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] required by a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]], or in a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] with [[30 Official Roblox Docs/API Reference/Classes/BaseScript#RunContext|RunContext]] set to [[30 Official Roblox Docs/API Reference/Enums/RunContext|Enum.RunContext.Client]]), this method will return `true`. In all other cases, this method will return `false`.

If this method returns `true`, the current environment can access client‑only features like [[30 Official Roblox Docs/API Reference/Classes/RunService#PreRender|RunService.PreRender]] or [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer|Players.LocalPlayer]].

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the current environment is running the client. |

### IsEdit

```lua
RunService:IsEdit(): boolean
```

**Thread safety:** Safe · **Capabilities:** Basic, PluginOrOpenCloud

This method returns whether the current environment is in "edit" mode, for example in Studio when the experience is not running.

`IsEdit()` will return the inverse of [[30 Official Roblox Docs/API Reference/Classes/RunService#IsRunning|IsRunning()]], except when the simulation has been paused, in which case both methods will return `false`.

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the current environment is in "edit" mode. |

### IsResimulating

```lua
RunService:IsResimulating(): boolean
```

**Thread safety:** Safe · **Capabilities:** Basic

Returns `true` if the engine is currently replaying simulation steps after detecting a misprediction in the server authority model; returns `false` otherwise. When the server's authoritative state diverges from the client's predicted state, the client rolls back and rapidly resimulates all affected steps within a single frame. During that resimulation pass, [[30 Official Roblox Docs/API Reference/Classes/RunService#BindToSimulation|BindToSimulation()]] callbacks and property-changed signals fire again for each replayed step, which can cause unwanted side effects such as duplicate sound playback or redundant network requests.

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the engine is currently resimulating. |

### IsRunMode

```lua
RunService:IsRunMode(): boolean
```

**Thread safety:** Safe · **Capabilities:** Basic

This method returns whether a **Run** playtest has been initiated in Studio. It will continue to return `true` if the simulation has been paused using the **Pause** button; however, once it has been stopped using the **Stop** button, it will revert to returning `false`. Note that Studio only enters "run" mode when a **Run** playtest (without the user's player character) is initiated. Also note that this method will return `false` if the simulation was started using [[30 Official Roblox Docs/API Reference/Classes/RunService#Run|RunService:Run()]].

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether a **Run** playtest has been initiated in Studio. |

### IsRunning

```lua
RunService:IsRunning(): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Returns whether the experience is currently running. `IsRunning()` will always return the inverse of [[30 Official Roblox Docs/API Reference/Classes/RunService#IsEdit|IsEdit()]] except when the simulation has been paused, in which case both methods will return `false`.

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the experience is currently running. |

### IsServer

```lua
RunService:IsServer(): boolean
```

**Thread safety:** Safe · **Capabilities:** Basic

This method returns whether the current environment is running on the server. If the code that invoked this method is running in a server context (in a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] with [[30 Official Roblox Docs/API Reference/Classes/BaseScript#RunContext|RunContext]] set to [[30 Official Roblox Docs/API Reference/Enums/RunContext|Enum.RunContext.Server]] or [[30 Official Roblox Docs/API Reference/Enums/RunContext|Enum.RunContext.Legacy]], or in a [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] required by a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]]), this method will return `true`. In all other cases, this method will return `false`.

If this function returns true, then the current environment can access server‑only features like [[30 Official Roblox Docs/API Reference/Classes/ServerStorage|ServerStorage]] or [[30 Official Roblox Docs/API Reference/Classes/ServerScriptService|ServerScriptService]].

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the current environment is running on the server. |

### IsStudio

```lua
RunService:IsStudio(): boolean
```

**Thread safety:** Safe · **Capabilities:** Basic

This method returns whether the current environment is running in Studio. It can be used to wrap code that should only execute when testing in Studio.

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the current environment is running in Studio. |

### Pause

```lua
RunService:Pause(): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Capabilities:** Basic

This method pauses the experience's simulation if it is running, suspending physics and scripts. When the simulation is paused, [[30 Official Roblox Docs/API Reference/Classes/RunService#IsRunning|IsRunning()]] will return `false`.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### Reset

> [!warning] Deprecated
> This item is deprecated and should not be used in new work.

```lua
RunService:Reset(): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Deprecated`

The Reset function resets the current game to a waypoint set when Run was called. This method should only be used after Run was called.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### Run

```lua
RunService:Run(): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Capabilities:** Basic

This method runs the experience's simulation (physics and scripts). When the simulation is running, [[30 Official Roblox Docs/API Reference/Classes/RunService#IsRunning|IsRunning()]] will return `true`. However, [[30 Official Roblox Docs/API Reference/Classes/RunService#IsRunMode|IsRunMode()]] will only return `true` if the simulation was started using the **Run** button in Studio.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetPredictionMode

```lua
RunService:SetPredictionMode(context: Instance, mode: PredictionMode): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Sets the prediction mode for an [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] (`context`) to an [[30 Official Roblox Docs/API Reference/Enums/PredictionMode|Enum.PredictionMode]] value. Mismatches between the physics properties or attributes for predicted instances will cause a rollback and resimulation on the client. Can only be called on the client.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] for which to set the prediction mode. |
| `mode` | [[30 Official Roblox Docs/API Reference/Enums/PredictionMode\|PredictionMode]] |  | The [[30 Official Roblox Docs/API Reference/Enums/PredictionMode\|Enum.PredictionMode]] to set for the context instance. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### Stop

```lua
RunService:Stop(): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Capabilities:** Basic

This method stops the experience's simulation if it is running. When the simulation is stopped, [[30 Official Roblox Docs/API Reference/Classes/RunService#IsRunning|IsRunning()]] will return `false` and [[30 Official Roblox Docs/API Reference/Classes/RunService#IsEdit|IsEdit()]] will return `true`.

In contrast to the **Stop** button in Studio, calling this method will not restore the experience to the state it was in prior to the simulation being run. This means any changes made to the experience by the physics simulation and scripts will persist after the simulation has ended.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### UnbindFromRenderStep

```lua
RunService:UnbindFromRenderStep(name: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Given a name of a function sent to [[30 Official Roblox Docs/API Reference/Classes/RunService#BindToRenderStep|BindToRenderStep()]], this method will unbind the function from being called during [[30 Official Roblox Docs/API Reference/Classes/RunService#PreRender|PreRender]]. This is used to unbind bound functions once they are no longer needed, or when they no longer need to fire every step.

If there is no bound function by the given name, this method takes no action and continues without raising an error.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | The name of the function being unbound. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

## Events

### Heartbeat

```lua
RunService.Heartbeat(deltaTime: double)
```

**Capabilities:** Basic

The `Heartbeat` event fires every frame, after the physics simulation has completed. The `deltaTime` argument indicates the time that has elapsed since the previous frame.

This event is when most scripts run. It occurs at the end of each frame and it's also when any waiting scripts are executed, such as those scheduled with the [[30 Official Roblox Docs/API Reference/Libraries/task|task]] library. `Heartbeat` is commonly used for periodic tasks, such as updating core game systems like health regeneration.

Following this step, the engine sends property updates and events to the server or clients which are later received as part of the [[30 Official Roblox Docs/Projects/Client-server runtime#Replication|replication]] receive step.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `deltaTime` | double |  | The time (in seconds) that has elapsed since the previous frame. |

### Misprediction

```lua
RunService.Misprediction(time: double, instances: Array, stats: Dictionary)
```

**Capabilities:** Basic, PluginOrOpenCloud

With server authority enabled, the Misprediction event fires when a received server state differs from the predicted state.

Use this event to build debugging tools that inspect misprediction data programmatically. For example, a plugin could listen for this event and track which instances are frequently mispredicting, what properties are diverging, and by how much.

##### Instances Array

Each entry in the `instances` array is a table with the following structure:

| Field | Type | Description |
| --- | --- | --- |
| `Instance` | `Instance` | The instance that was mispredicted. |
| `Properties` | `dictionary?` | Properties that were mispredicted. Each key is a property name mapping to a table with the client's `Predicted` and owner's/server's `Authoritative` values as captured on the step when the client first mispredicted the owner's value. Only present if there are property mismatches. |
| `Attributes` | `dictionary?` | Attributes that were mispredicted. Each key is a property name mapping to a table with the client's `Predicted` and owner's/server's `Authoritative` values as captured on the step when the client first mispredicted the owner's value. Only present if there are attribute mismatches. |

##### Stats Dictionary

The `stats` dictionary contains the following fields:

| Field | Type | Description |
| --- | --- | --- |
| `ResimulationTime` | number | The time spent during resimulation (or the amount of time rolled back). |

##### Code Sample

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `time` | double |  | The time (in seconds) from the start of simulation at which the client's predicted state first diverged from the server's authoritative state. |
| `instances` | Array |  | An array of tables, each describing an [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] that was mispredicted. See below for the structure of each entry. |
| `stats` | Dictionary |  | A dictionary of statistics about the misprediction. See below for the structure. |

*Code samples for this member (`RunService-Misprediction`) are published on the source page; their code is not part of the open-source repo.*

### PostSimulation

```lua
RunService.PostSimulation(deltaTimeSim: double)
```

**Capabilities:** Basic

The `PostSimulation` event fires every frame, after the physics simulation has completed. The `deltaTimeSim` argument indicates the time that the current frame has stepped the physics simulation, not accounting for physics throttling. This may deviate from the actual time between frames in Studio edit mode or when framerate is very low.

This event is useful for making final adjustments to the outcome of the simulation. Following this phase, the engine triggers the [[30 Official Roblox Docs/API Reference/Classes/RunService#Heartbeat|Heartbeat]] event.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `deltaTimeSim` | double |  | The time (in seconds) that the current frame has stepped the physics simulation, not accounting for physics throttling. |

### PreAnimation

```lua
RunService.PreAnimation(deltaTimeSim: double)
```

**Capabilities:** Basic

The `PreAnimation` event fires every frame, prior to the physics simulation but after rendering. The `deltaTimeSim` argument indicates the time that the current frame has stepped animations.

This event is useful for modifying animation objects, such as adjusting their speed or priority. Once the `PreAnimation` event is complete, the engine proceeds to run these animations, updating the joint transforms which will later be used to update objects during the physics simulation.

After animations are stepped, the engine triggers the [[30 Official Roblox Docs/API Reference/Classes/RunService#PreSimulation|PreSimulation]] event.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `deltaTimeSim` | double |  | The time (in seconds) that the current frame has stepped animations. |

### PreRender

```lua
RunService.PreRender(deltaTimeRender: double)
```

**Capabilities:** Basic

The `PreRender` event (replacement for [[30 Official Roblox Docs/API Reference/Classes/RunService#RenderStepped|RenderStepped]]) fires every frame, prior to the frame being rendered. The `deltaTimeRender` argument indicates the time that has elapsed since the previous frame.

This event allows you to run code and update the world before it's drawn on a player's screen. This is useful for last‑minute adjustments such as changing object positions, updating animations, or preparing visual effects, but it should be used sparingly as the engine cannot start to render the frame until code running in this event has finished executing.

As `PreRender` is client-side, it can only be used in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]], in a [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] required by a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]], or in a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] with [[30 Official Roblox Docs/API Reference/Classes/BaseScript#RunContext|RunContext]] set to [[30 Official Roblox Docs/API Reference/Enums/RunContext|Enum.RunContext.Client]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `deltaTimeRender` | double |  | The time (in seconds) that has elapsed since the previous frame. |

### PreSimulation

```lua
RunService.PreSimulation(deltaTimeSim: double)
```

**Capabilities:** Basic

The `PreSimulation` event (replacement for [[30 Official Roblox Docs/API Reference/Classes/RunService#Stepped|Stepped]]) fires every frame, prior to the physics simulation. The `deltaTimeSim` argument indicates the time that the current frame will step the physics simulation, not accounting for physics throttling. This may deviate from the actual time between frames in Studio edit mode or when framerate is very low.

This event is useful for adjusting properties like velocity or forces just before they're applied as part of the simulation. The simulation then runs, potentially multiple times, as the physics solver runs at a higher frequency than other engine systems. Once this is complete, the [[30 Official Roblox Docs/API Reference/Classes/RunService#PostSimulation|PostSimulation]] event is fired.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `deltaTimeSim` | double |  | The time (in seconds) that the current frame will step the physics simulation, not accounting for physics throttling. |

### RenderStepped

```lua
RunService.RenderStepped(deltaTime: double)
```

**Capabilities:** Basic

Fires every frame, prior to the frame being rendered.

##### Migration Note

This event has been superseded by [[30 Official Roblox Docs/API Reference/Classes/RunService#PreRender|PreRender]] which should be used for new work.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `deltaTime` | double |  | The time (in seconds) that has elapsed since the previous frame. |

### Rollback

```lua
RunService.Rollback(time: double)
```

**Capabilities:** Basic

When server authority is enabled, the `Rollback` event fires after the engine detects a misprediction and rolls back all eligible state (properties, attributes, and related physics and animation state), but before the engine resimulates the rolled-back steps.

Use this event to update state in your place that wouldn't otherwise be rolled back after a misprediction. For example, if you maintain gameplay state that can't be stored in a property or attribute with simulation access, you can listen for this event, compare the rolled-back-to step against your farthest-reached step, and rewind your custom state accordingly.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `time` | double |  | The time (in seconds) that we are rolling back to. |

*Code samples for this member (`RunService-Rollback`) are published on the source page; their code is not part of the open-source repo.*

### Stepped

```lua
RunService.Stepped(time: double, deltaTime: double)
```

**Capabilities:** Basic

Fires every frame, prior to the physics simulation.

##### Migration Note

This event has been superseded by [[30 Official Roblox Docs/API Reference/Classes/RunService#PreSimulation|PreSimulation]] which should be used for new work.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `time` | double |  | The duration (in seconds) that [[30 Official Roblox Docs/API Reference/Classes/RunService\|RunService]] has been running for. |
| `deltaTime` | double |  | The time (in seconds) that has elapsed since the previous frame. |

---
*Source: [RunService](https://create.roblox.com/docs/reference/engine/classes/RunService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

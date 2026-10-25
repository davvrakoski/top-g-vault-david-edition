---
title: "ContextActionService"
description: "A service used to bind user input to contextual actions."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ContextActionService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A service used to bind user input to contextual actions.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

Allows an experience to bind user input to contextual actions, or actions that are only enabled under some condition or period of time. For example, allowing a player to open a door only while close by. In code, an action is simply a string (the name of the action) used by the service to differentiate between unique actions. The action string is provided to [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#BindAction|BindAction]] and [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#UnbindAction|UnbindAction]], among other member functions. If two actions are bound to the same input, the most recently bound will take priority. When the most recent action is unbound, the one bound before that takes control again. Since this service deals with user input, you can only use it in client-side [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]].

#### Context and Action

A **context** is simply a condition during which a player may perform some action. Some examples include holding a [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]], being [[30 Official Roblox Docs/API Reference/Classes/Seat|seated]] in a car or standing near a door. Whatever the case may be, it is up to your [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]] to call [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#BindAction|BindAction]] when the context is entered and [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#UnbindAction|UnbindAction]] when the context is left.

An **action** is simply some input that can be performed by the player while in that context. Such an action could open/close some menu, trigger a secondary tool action or send a request to the server using [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction#InvokeServer|RemoteFunction:InvokeServer()]]. An action is identified by a unique string as the first parameter of both [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#BindAction|BindAction]] and [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#UnbindAction|UnbindAction]]. The string can be anything, but it should reflect the **action being performed, not the input being used**. For example, don't use "KeyH" as an action name - use "CarHorn" instead. It is best to define your actions as a constant at the top of your script since you will use it in at least three different places in your code.

#### Binding Actions Contextually

It's better to use ContextActionService's [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#BindAction|BindAction]] than [[30 Official Roblox Docs/API Reference/Classes/UserInputService#InputBegan|UserInputService.InputBegan]] for most cases. For [[30 Official Roblox Docs/API Reference/Classes/UserInputService#InputBegan|UserInputService.InputBegan]], your connected function would have to check if the player is in the context of the action being performed. In most cases, this is harder than just calling a function when a context is entered/ left. For example, if you want to have the `H` key trigger a car horn sound while the player is sitting in it, the player might type "hello" in chat or otherwise use the `H` key for something else. It is harder to determine if something else is using the H key (like chat) - the car might honk when the player didn't mean to. If you instead use [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#BindAction|BindAction]] and [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#UnbindAction|UnbindAction]] when the player enters/leaves the car, [[30 Official Roblox Docs/API Reference/Classes/ContextActionService|ContextActionService]] will make sure that `H` key presses trigger the honk action only when it is the most recently bound action. If something else (like chat) takes control, you won't have to worry about checking that.

#### Inspecting Bound Actions

To see a list of actions and their bound inputs, you can inspect the "Action Bindings" tab in the Developer Console (F9 while in game). This shows all bindings, including those bound by Roblox core scripts and default camera/control scripts too. This is useful for debugging if your actions are being bound/unbound at the correct times, or if some other action is stealing input from your actions. For example, if you are attempting to bind
<kbd>W</kbd><kbd>A</kbd><kbd>S</kbd><kbd>D</kbd>, it may be the case that
default character movement scripts are binding over those same keys. Similarly, the camera control script can steal right-click input if the script runs after yours.

#### Keyboardless Input

This service is especially useful for supporting gamepad and touch input. For gamepad input, you might choose to bind the B button to an action that returns the user to the previous menu when they enter another menu. For touch, on-screen touch buttons can be used in place of key presses: these buttons display only while the action is bound, and the position, text and/or images of these buttons can be configured through this service. They're somewhat limited in the amount of customization provided by this service; it's usually a better idea to make your own on-screen buttons using [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]] or [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]].

*Code samples for this API (`ContextActionService-Tool-Reload`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/ContextActionService); their code is not part of the open-source repo.*

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#BindAction\|BindAction()]] | () | Bind user input to an action given an action handling function. |
| [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#BindActionAtPriority\|BindActionAtPriority()]] | () | Behaves like [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#BindAction\|BindAction]] but also allows a priority to be assigned to the bound action for overlapping input types (higher before lower). |
| [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#BindActionToInputTypes\|BindActionToInputTypes()]] | () | **Deprecated.** Binds _functionToBind_ to input events such as key presses, mouse movement, or controller input. |
| [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#BindActivate\|BindActivate()]] | () | Bind a [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode]] with a specific [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|Enum.UserInputType]] to trigger [[30 Official Roblox Docs/API Reference/Classes/Tool\|Tool.Activation]] and [[30 Official Roblox Docs/API Reference/Classes/ClickDetector\|ClickDetector]] events. |
| [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#GetAllBoundActionInfo\|GetAllBoundActionInfo()]] | Dictionary | Get a table of information about all bound actions (key is the name passed to [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#BindAction\|BindAction]], value is a table from [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#GetBoundActionInfo\|GetBoundActionInfo]] when called with the key). |
| [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#GetBoundActionInfo\|GetBoundActionInfo()]] | Dictionary | Get a table of information about a bound action given its name originally passed to [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#BindAction\|BindAction]]. |
| [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#GetButton\|GetButton()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Retrieves a [[30 Official Roblox Docs/API Reference/Classes/ImageButton\|ImageButton]] of a [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#BindAction\|bound]] action that had a touch input button created. |
| [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#GetCurrentLocalToolIcon\|GetCurrentLocalToolIcon()]] | string | Return the [[30 Official Roblox Docs/API Reference/Classes/BackpackItem#TextureId\|BackpackItem.TextureId]] of a [[30 Official Roblox Docs/API Reference/Classes/Tool\|Tool]] currently [[30 Official Roblox Docs/API Reference/Classes/Tool#Equipped\|equipped]] by the [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]]. |
| [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#SetDescription\|SetDescription()]] | () | Given the name of a bound action with a touch button, sets the description of the action. |
| [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#SetImage\|SetImage()]] | () | If `actionName` key contains a bound action, then `image` is set as the image of the touch button. |
| [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#SetPosition\|SetPosition()]] | () | Given the name of a bound action with a touch button, sets the position of the button within the ContextButtonFrame. |
| [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#SetTitle\|SetTitle()]] | () | Given the name of a bound action with a touch button, sets the text shown on the button. |
| [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#UnbindAction\|UnbindAction()]] | () | Unbind an action from input given its name. |
| [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#UnbindActivate\|UnbindActivate()]] | () | Unbind a [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode]] with a specific [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|Enum.UserInputType]] from triggering [[30 Official Roblox Docs/API Reference/Classes/Tool\|Tool.Activation]] when bound with [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#BindActivate\|ContextActionService:BindActivate()]]. |
| [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#UnbindAllActions\|UnbindAllActions()]] | () | Removes all functions bound. No actionNames will remain. All touch buttons will be removed. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#LocalToolEquipped\|LocalToolEquipped]] | `toolEquipped` | Fires when the current player equips a [[30 Official Roblox Docs/API Reference/Classes/Tool\|Tool]]. |
| [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#LocalToolUnequipped\|LocalToolUnequipped]] | `toolUnequipped` | Fires when the current player unequips a [[30 Official Roblox Docs/API Reference/Classes/Tool\|Tool]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### BindAction

```lua
ContextActionService:BindAction(actionName: string, functionToBind: Function, createTouchButton: boolean, inputTypes: Tuple): ()
```

**Thread safety:** Unsafe · **Capabilities:** Input

Bind an action to user input given an action handling function. Upon a matching input being performed, the action handler function will be called with the arguments listed below. Valid input enum items include those within the following: [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Enum.KeyCode]], [[30 Official Roblox Docs/API Reference/Enums/UserInputType|Enum.UserInputType]] or [[30 Official Roblox Docs/API Reference/Enums/PlayerActions|Enum.PlayerActions]] . Call this function when a player **enters the context** in which an action can be performed. When the player leaves the context, call [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#UnbindAction|UnbindAction()]] with the same `actionName`.

The code sample below shows how a [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] can be [[30 Official Roblox Docs/API Reference/Classes/Sound#Play|played]] while a key (<kbd>H</kbd>), game pad button, or touch screen button is pressed.

```lua
local ContextActionService = game:GetService("ContextActionService")

-- A car horn sound
local honkSound = Instance.new("Sound", workspace)
honkSound.Looped = true
honkSound.SoundId = "rbxassetid://9120386436"

local function handleAction(actionName, inputState, inputObject)
	if actionName == "HonkHorn" then
		if inputState == Enum.UserInputState.Begin then
			honkSound:Play()
		else
			honkSound:Pause()
		end
	end
end

-- When the player sits in the vehicle:
ContextActionService:BindAction("HonkHorn", handleAction, true, Enum.KeyCode.H, Enum.KeyCode.ButtonY)

-- When the player gets out:
ContextActionService:UnbindAction("HonkHorn")
```

#### Action Handler Parameters

The action handler functions are called with the following parameters:

| # | Type | Description |
| --- | --- | --- |
| 1 | `string` | The same string that was originally passed to [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#BindAction\|BindAction()]]. This allows one function to handle multiple actions at once, if necessary. |
| 2 | [[30 Official Roblox Docs/API Reference/Enums/UserInputState\|Enum.UserInputState]] | The state of the input. [[30 Official Roblox Docs/API Reference/Enums/UserInputState\|Cancel]] is sent if some input was in progress and another action bound over that in-progress input, or if the in-progress bound action was unbound through [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#UnbindAction\|UnbindAction()]]. |
| 3 | `InputObject` | An object that contains information about the input (varies based on [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|Enum.UserInputType]]). The [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]] sometimes won't match the inputs the action was bound to: when the [[30 Official Roblox Docs/API Reference/Enums/UserInputState\|Cancel]] state is sent, this object will be [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.Unknown]] and [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|Enum.UserInputType.None]]. |

#### Action Bindings Stack

Action bindings behave like a stack: if two actions are bound to the same user input, the **most recently bound** action handler will be used. If an action handler returns [[30 Official Roblox Docs/API Reference/Enums/ContextActionResult|Enum.ContextActionResult.Pass]], the next most recently bound action handler will be called, and so on until a handler sinks the input (by returning `nil` or [[30 Official Roblox Docs/API Reference/Enums/ContextActionResult|Enum.ContextActionResult.Sink]]). When [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#UnbindAction|UnbindAction]] is called, the action handler is removed from the stack. This stack behavior can be overridden using [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#BindActionAtPriority|BindActionAtPriority]], where an additional priority parameter after `createTouchButton` may override the order in which actions are bound (higher before lower).

#### Touch Buttons

In addition to input types, this function's third parameter controls whether a button is created for [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchEnabled|TouchEnabled]] devices. Upon the first touch button's creation, a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] named "ContextActionGui" is added to the [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]]. Inside the ScreenGui is a [[30 Official Roblox Docs/API Reference/Classes/Frame|Frame]] called "ContextButtonFrame" is added. It is in this frame in which [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButtons]] for bound actions are parented; you can use [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#GetButton|GetButton()]] to retrieve such buttons for customization. A maximum of 7 touch buttons can be created through [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#BindAction|BindAction()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `actionName` | string |  | A string representing the action being performed (e.g. "HonkHorn" or "OpenDoor"). |
| `functionToBind` | Function |  | The action-handling function, called with the following parameters when the bound inputs are triggered: string (actionName), [[30 Official Roblox Docs/API Reference/Enums/UserInputState\|Enum.UserInputState]] and an InputObject. |
| `createTouchButton` | boolean |  | Whether a GUI button should be created for the action on touch input devices. |
| `inputTypes` | Tuple |  | Any number of [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode]] or [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|Enum.UserInputType]] representing the inputs to bind to the action. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`ContextActionService-Tool-Reload`, `General-Action-Handler`, `Stacked-Action-Handlers`) are published on the source page; their code is not part of the open-source repo.*

### BindActionAtPriority

```lua
ContextActionService:BindActionAtPriority(actionName: string, functionToBind: Function, createTouchButton: boolean, priorityLevel: int, inputTypes: Tuple): ()
```

**Thread safety:** Unsafe · **Capabilities:** Input

BindActionAtPriority behaves like [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#BindAction|BindAction]] but also allows a priority to be assigned to the bound action. If multiple actions are bound to the same input, the higher priority function is called regardless of the order in which the actions were bound. In other words, this function overrides the normal "stack" behavior of BindAction.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `actionName` | string |  | A string representing the action being performed (e.g. "HonkHorn" or "OpenDoor"). |
| `functionToBind` | Function |  | The action-handling function, called with the following parameters when the bound inputs are triggered: string (actionName), [[30 Official Roblox Docs/API Reference/Enums/UserInputState\|Enum.UserInputState]] and an InputObject. |
| `createTouchButton` | boolean |  | Whether a GUI button should be created for the action on touch input devices. |
| `priorityLevel` | int |  | The priority level at which the action should be bound (higher considered before lower). |
| `inputTypes` | Tuple |  | Any number of Enum.KeyCode or Enum.UserInputType representing the inputs to bind to the action. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`contextactionservice-bindaction-priorities`) are published on the source page; their code is not part of the open-source repo.*

### BindActionToInputTypes

> [!warning] Deprecated
> This item has been superseded by `Class.ContextActionService:BindAction()`
> which should be used in all new work.

```lua
ContextActionService:BindActionToInputTypes(actionName: string, functionToBind: Function, createTouchButton: boolean, inputTypes: Tuple): ()
```

**Thread safety:** Unsafe · **Capabilities:** Input · **Tags:** `Deprecated`

This function binds _functionToBind_ to input events such as key presses, mouse movement, or controller input. The specific input types the engine listens for are listed as parameters of BindAction. Whenever a player uses any of these input types, the Roblox Engine calls "functionToBind". BindAction sets the priorityLevel via [[30 Official Roblox Docs/API Reference/Enums/ContextActionPriority|Enum.ContextActionPriority]] to Default.Value, which is 2000. Use [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#GetButton|ContextActionService:GetButton()]] to control the priority of bound events.

In addition to input types, BindAction has a createTouchButton parameter. When this is set to true it creates an [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]] on any device with a touchscreen. A [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] is also created to put the context buttons into named ContextActionGui and is parented to [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]]. The created ImageButton is parented to this ContextActionGui. GetButton can be used to retrieve the button that was created.

If an input has more than one function bound to it, each function will be placed on a stack. A stack obeys the principle of last in first out. So the first object placed on the stack will be on the top. The next object placed on the stack becomes the top and the previous object moves one position down (like a stack of books). When the input is triggered, the function at the top of the stack is called. If the function returns [[30 Official Roblox Docs/API Reference/Enums/ContextActionResult|Enum.ContextActionResult]].Pass this will continue down the stack. To remove a function from being called by all input that it was bound by use [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#UnbindAction|ContextActionService:UnbindAction()]].

BindAction allows control over whether or not a bound action should be processed by other actions on the stack using [[30 Official Roblox Docs/API Reference/Enums/ContextActionResult|Enum.ContextActionResult]]. If [[30 Official Roblox Docs/API Reference/Enums/ContextActionResult|Enum.ContextActionResult.Pass]] is returned in the callback function, every action below it in the stack (last function called gets executed first) will get a chance to process it. Anything other than Pass will be treated as [[30 Official Roblox Docs/API Reference/Enums/ContextActionResult|Enum.ContextActionResult.Sink]], including `nil`. It will also sink if the callback is yielded.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `actionName` | string |  |  |
| `functionToBind` | Function |  |  |
| `createTouchButton` | boolean |  |  |
| `inputTypes` | Tuple |  |  |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### BindActivate

```lua
ContextActionService:BindActivate(userInputTypeForActivation: UserInputType, keyCodesForActivation: Tuple): ()
```

**Thread safety:** Unsafe · **Capabilities:** Input

Bind a [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Enum.KeyCode]] that can be used with a [[30 Official Roblox Docs/API Reference/Enums/UserInputType|Enum.UserInputType]] to activate [[30 Official Roblox Docs/API Reference/Classes/ClickDetector|ClickDetector]] events, [[30 Official Roblox Docs/API Reference/Classes/Tool|Tools]], and [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButtons]]. When the given key/button is pressed, it fires the [[30 Official Roblox Docs/API Reference/Classes/Mouse#Button1Down|Mouse.Button1Down]] event on the mouse sent to [[30 Official Roblox Docs/API Reference/Classes/Tool#Equipped|Tool.Equipped]]. This in turn fires the [[30 Official Roblox Docs/API Reference/Classes/Tool#Activated|Tool.Activated]] event if [[30 Official Roblox Docs/API Reference/Classes/Tool#ManualActivationOnly|Tool.ManualActivationOnly]] is not set to true. For gamepad input, this function is called by the default control scripts in order to bind the ButtonR2 [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Enum.KeyCode]].

Note that the [[30 Official Roblox Docs/API Reference/Enums/UserInputType|Enum.UserInputType]] specified must be `Keyboard` or `Gamepad1` through `Gamepad8` in order to be valid.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userInputTypeForActivation` | [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|UserInputType]] |  | Must be Keyboard or Gamepad1 through Gamepad8. |
| `keyCodesForActivation` | Tuple |  | Any number of [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode]] values that trigger [[30 Official Roblox Docs/API Reference/Classes/Tool\|Tool]] activation for the specified [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|Enum.UserInputType]]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### GetAllBoundActionInfo

```lua
ContextActionService:GetAllBoundActionInfo(): Dictionary
```

**Thread safety:** Unsafe · **Capabilities:** Input

GetAllBoundActioninfo returns a table which maps all actions' names (those originally passed to [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#BindAction|BindAction]]) to a table returned by [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#GetBoundActionInfo|GetBoundActionInfo]] when called with the action name itself. Using this function, you can inspect all presently bound actions. This is useful when debugging their priority levels or stack orders.

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | A dictionary mapping each bound action name to its info table. |

### GetBoundActionInfo

```lua
ContextActionService:GetBoundActionInfo(actionName: string): Dictionary
```

**Thread safety:** Unsafe · **Capabilities:** Input

GetBoundActionInfo returns a table with the following keys describing a bound action given its name. To get the same information for all actions at once, use [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#GetAllBoundActionInfo|GetAllBoundActionInfo]].

| Name | Type | Description |
| --- | --- | --- |
| `stackOrder` | number | Describes the index of the action on the stack (increasing) |
| `priorityLevel`* | number | Describes the [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#BindActionAtPriority\|priority]] level of the action |
| `createTouchButton` | bool | Describes whether a touch button should be created on [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchEnabled\|TouchEnabled]] devices |
| `inputTypes` | table | The input types passed to [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#BindAction\|BindAction]] for which this action will trigger |
| `description`† | string | The description of action set by [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#SetDescription\|SetDescription]] |
| `title`† | string | The title of the action set by [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#SetTitle\|SetTitle]] |
| `image`† | string | The image of the action's touch button set by [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#SetImage\|SetImage]] |

\* Priority level will still be included even if [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#BindActionAtPriority|BindActionAtPriority]] wasn't used - by default it will be 2000.

† Indicates that this field will be `nil` if the associated method was not called for the given action.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `actionName` | string |  | The name of the action originally passed to BindAction. |

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | A dictionary with keys describing the bound action, including stackOrder, priorityLevel, createTouchButton, inputTypes, description, title, and image. |

### GetButton

```lua
ContextActionService:GetButton(actionName: string): Instance
```

**Thread safety:** Unsafe · **Capabilities:** Input · **Tags:** `Yields`

GetButton returns the [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]] created by [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#BindAction|BindAction]] if its third parameter was true and the device is [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchEnabled|TouchEnabled]]. The only parameter to this function must match exactly the name of the action originally sent to BindAction.

If no such action was bound or if a button was not created, this function returns `nil`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `actionName` | string |  | The name of the action originally passed to BindAction. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | An ImageButton created by BindAction. |

### GetCurrentLocalToolIcon

```lua
ContextActionService:GetCurrentLocalToolIcon(): string
```

**Thread safety:** Unsafe · **Capabilities:** Input

GetCurrentLocalToolIcon will return the [[30 Official Roblox Docs/API Reference/Classes/BackpackItem#TextureId|BackpackItem.TextureId]] of a [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]] currently [[30 Official Roblox Docs/API Reference/Classes/Tool#Equipped|equipped]] by the [[30 Official Roblox Docs/API Reference/Classes/Player|Player]], or `nil` if there is no such Tool or if the player lacks a [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Character]].

**Returns**

| Type | Description |
| --- | --- |
| string | A content string from the Tool's TextureId, or `nil` if one could not be found. |

### SetDescription

```lua
ContextActionService:SetDescription(actionName: string, description: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** Input

SetDescription will set the description of an action bound by [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#BindAction|BindAction]]. In a list of available actions, this would be text that describes the given action.

Although the name may suggest that this method is related to the family of functions that customize a touch button for actions that create them ([[30 Official Roblox Docs/API Reference/Classes/ContextActionService#SetTitle|SetTitle]], [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#SetImage|SetImage]] and [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#SetPosition|SetPosition]]), this method does not affect such a button. This method merely sets a text description of an action, and nothing more.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `actionName` | string |  | The name of the action originally passed to BindAction. |
| `description` | string |  | A text description of the action, such as "Honk the car's horn" or "Open the inventory". |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`contextactionservice-touch-button`) are published on the source page; their code is not part of the open-source repo.*

### SetImage

```lua
ContextActionService:SetImage(actionName: string, image: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** Input

This method sets the image shown on a touch button created by [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#BindAction|BindAction()]]. Specifically, it sets the [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#Image|ImageLabel.Image]] property of the [[30 Official Roblox Docs/API Reference/Classes/ImageLabel|ImageLabel]] within the [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]] that would be returned by [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#GetButton|GetButton]]. If no such bound action exists (e.g. nothing is returned by GetButton), this function does nothing and throws no error.

This function is part of a family of methods that customize the touch button of an action. Others in this family include [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#SetPosition|SetPosition]] and [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#SetTitle|SetTitle]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `actionName` | string |  | The name of the action originally passed to BindAction. |
| `image` | string |  | The value to which the Image property should be set. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`contextactionservice-touch-button`) are published on the source page; their code is not part of the open-source repo.*

### SetPosition

```lua
ContextActionService:SetPosition(actionName: string, position: UDim2): ()
```

**Thread safety:** Unsafe · **Capabilities:** Input

This method sets the position of a touch button created by [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#BindAction|BindAction()]]. Specifically, it sets the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Position|GuiObject.Position]] property of the [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]] that would be returned by [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#GetButton|GetButton]]. If no such bound action exists (e.g. nothing is returned by GetButton), this function does nothing and throws no error.

This function is part of a family of methods that customize the touch button of an action. Others in this family include [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#SetImage|SetImage]] and [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#SetTitle|SetTitle]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `actionName` | string |  | The name of the action originally passed to BindAction. |
| `position` | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] |  | The position within the ContextButtonFrame. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`contextactionservice-touch-button`) are published on the source page; their code is not part of the open-source repo.*

### SetTitle

```lua
ContextActionService:SetTitle(actionName: string, title: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** Input

SetTitle will set the text shown on a touch button created by [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#BindAction|BindAction]]. Specifically, this sets the [[30 Official Roblox Docs/API Reference/Classes/TextLabel#Text|TextLabel.Text]] property of a [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]] within the [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]] that would be returned by [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#GetButton|GetButton]]. If no such bound action exists (e.g. nothing is returned by GetButton), this function does nothing and throws no error.

This function is part of a family of methods that customize the touch button of an action. Others in this family include [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#SetImage|SetImage]] and [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#SetPosition|SetPosition]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `actionName` | string |  | The name of the action originally passed to BindAction. |
| `title` | string |  | The text to display on the button. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`contextactionservice-touch-button`) are published on the source page; their code is not part of the open-source repo.*

### UnbindAction

```lua
ContextActionService:UnbindAction(actionName: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** Input

UnbindAction will unbind an action by name from user inputs so that the action handler function will no longer be called. Call this function when the context for some action is no longer applicable, such as closing a user interface, exiting a car or [[30 Official Roblox Docs/API Reference/Classes/Tool#Unequipped|unequipping]] a [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]]. See [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#BindAction|BindAction]] for more information on how bound actions operate.

This function **will not** throw an error if there is no such action bound with the given string. Using [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#GetAllBoundActionInfo|GetAllBoundActionInfo]] or the Developer Console's "Action Bindings" tab, you can find out what actions are presently bound.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `actionName` | string |  | The name of the action to unbind, as originally passed to BindAction. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`ContextActionService-Tool-Reload`) are published on the source page; their code is not part of the open-source repo.*

### UnbindActivate

```lua
ContextActionService:UnbindActivate(userInputTypeForActivation: UserInputType, keyCodeForActivation: KeyCode = None): ()
```

**Thread safety:** Unsafe · **Capabilities:** Input

UnbindActivate unbinds an [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Enum.KeyCode]] used with an [[30 Official Roblox Docs/API Reference/Enums/UserInputType|Enum.UserInputType]] for activating a [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]] (or a [[30 Official Roblox Docs/API Reference/Classes/HopperBin|HopperBin]]) using [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#BindActivate|BindActivate]]. This function essentially undoes the action performed by that function.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userInputTypeForActivation` | [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|UserInputType]] |  | The same UserInputType originally sent to BindActivate. |
| `keyCodeForActivation` | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|KeyCode]] | `None` | The same KeyCode originally sent to BindActivate. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### UnbindAllActions

```lua
ContextActionService:UnbindAllActions(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Input

Removes all functions bound. No actionNames will remain. All touch buttons will be removed. If a button was manipulated manually there is no guarantee it will be cleaned up.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

## Events

### LocalToolEquipped

```lua
ContextActionService.LocalToolEquipped(toolEquipped: Instance)
```

**Capabilities:** Input

Fires when a [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]] is added as a child of the local player's [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Character]] model, which occurs when the player equips the tool. The `toolEquipped` parameter is the [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]] instance that was equipped.

This event fires only for [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]] children added to the character, so it does not fire for non-Tool children. The connection is re-established each time the player's character respawns.

This event is useful for updating contextual action bindings when a tool is equipped. For example, you can call [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#BindAction|BindAction]] inside a handler connected to this event to set up tool-specific input, then call [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#UnbindAction|UnbindAction]] in the corresponding [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#LocalToolUnequipped|ContextActionService.LocalToolUnequipped]] handler.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `toolEquipped` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Tool\|Tool]] instance that was equipped. |

### LocalToolUnequipped

```lua
ContextActionService.LocalToolUnequipped(toolUnequipped: Instance)
```

**Capabilities:** Input

Fires when a [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]] is removed from the local player's [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Character]] model, which occurs when the player unequips the tool. The `toolUnequipped` parameter is the [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]] instance that was unequipped.

This event fires only for [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]] children removed from the character, so it does not fire for non-Tool children. The connection is re-established each time the player's character respawns.

This event is useful for tearing down contextual action bindings when a tool is unequipped. For example, you can call [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#UnbindAction|UnbindAction]] inside a handler connected to this event to remove tool-specific input that was bound in the corresponding [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#LocalToolEquipped|ContextActionService.LocalToolEquipped]] handler.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `toolUnequipped` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Tool\|Tool]] instance that was unequipped. |

---
*Source: [ContextActionService](https://create.roblox.com/docs/reference/engine/classes/ContextActionService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

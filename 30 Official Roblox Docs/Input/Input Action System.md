---
title: "Input Action System"
description: "The cross-platform Input Action System lets you connect actions and arrange bindings across various hardware inputs at edit time."
area: "30 Official Roblox Docs"
cluster: "Input"
source: "https://create.roblox.com/docs/input/input-action-system"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The cross-platform Input Action System lets you connect actions and arrange bindings across various hardware inputs at edit time.*

The cross-platform **Input Action System** lets you connect [[30 Official Roblox Docs/Input/Input Action System#Input actions|actions]] and arrange [[30 Official Roblox Docs/Input/Input Action System#Input bindings|bindings]] across various hardware inputs at edit time. Combined with [[30 Official Roblox Docs/Input/Input Action System#Input contexts|contexts]], you can easily configure and edit a modular input system that works on any device in any phase of play. Use cases include:

- A first-person shooter system with actions dynamically swapping in and out depending on if the player is in battle mode or spectator mode.
- A comprehensive driving system equipped with acceleration/deceleration, car boosters, and refuel stations.
- Hotkeys for an abilities system in a fighting game to swap out moves seamlessly without players missing a punch.

![](https://www.youtube.com/watch?v=Fg-Ksoa7b-s)

## Input contexts

An [[30 Official Roblox Docs/API Reference/Classes/InputContext|InputContext]] is a collection of actions which holds related [[30 Official Roblox Docs/Input/Input Action System#Input actions|input actions]], for example `PlayContext` for in‑game character controls and `NavContext` for controls to navigate around UI menus. You can [[30 Official Roblox Docs/Input/Input Action System#Context changes|enable/disable contexts]] (and their corresponding actions) through their [[30 Official Roblox Docs/API Reference/Classes/InputContext#Enabled|Enabled]] property, such as to enable the `NavContext` when an inventory menu is open and then change to the `PlayContext` when the player closes the menu and returns to primary gameplay.

Even if a game may not use multiple input contexts initially, it's recommended to create a primary context at the top level of any input system, for example the `PlayContext` instance for input that occurs during gameplay.

1. **RECOMMENDED** Create a [[30 Official Roblox Docs/API Reference/Classes/Folder|Folder]] named `Inputs` inside [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]] to hold various input contexts.

   *(image in the full Top G Vault)*

2. Insert a new [[30 Official Roblox Docs/API Reference/Classes/InputContext|InputContext]] into the folder and rename it to `PlayContext`.

   *(image in the full Top G Vault)*

3. **OPTIONAL** In the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window, set [[30 Official Roblox Docs/API Reference/Classes/InputContext#Priority|Priority]] to `2000` and enable [[30 Official Roblox Docs/API Reference/Classes/InputContext#Sink|Sink]]. A context with [[30 Official Roblox Docs/API Reference/Classes/InputContext#Sink|Sink]] enabled consumes input events for its bound [[30 Official Roblox Docs/API Reference/Enums/KeyCode|KeyCodes]] at its priority level, blocking those inputs from reaching lower-priority contexts. This is practical for use cases like an inventory screen that should suppress specific gameplay inputs while open. In this example, `PlayContext` is given a high enough [[30 Official Roblox Docs/API Reference/Classes/InputContext#Priority|Priority]] to sink its bound inputs before the default [[30 Official Roblox Docs/API Reference/Classes/PlayerScripts|PlayerScripts]] contexts process them.

   *(image in the full Top G Vault)*

## Input actions

An [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]] defines a gameplay action mechanic such as "Jump," "Sprint," or "Shoot." These actions are then mapped to hardware inputs using [[30 Official Roblox Docs/Input/Input Action System#Input bindings|input bindings]].

An [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]] can be of several variations depending on its [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type|Type]] property ([[30 Official Roblox Docs/API Reference/Enums/InputActionType|Enum.InputActionType]]). The default is [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Bool]], designed to receive `true`/`false` values from press/release of inputs such as [[30 Official Roblox Docs/API Reference/Enums/KeyCode|ButtonA]], [[30 Official Roblox Docs/API Reference/Enums/KeyCode|E]], or [[30 Official Roblox Docs/API Reference/Enums/KeyCode|MouseLeftButton]].

> [!success]
> [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]] also exposes a read-only [[30 Official Roblox Docs/API Reference/Classes/InputAction#PreferredBinding|PreferredBinding]] property that returns the child [[30 Official Roblox Docs/API Reference/Classes/InputBinding|InputBinding]] best matching the player's current input device (keyboard/mouse, gamepad, or touch). It updates dynamically as the player's device configuration changes and is the basis for [[30 Official Roblox Docs/Input/Input Action System#Displaying bindings|displaying bindings]] to players.

| Input Action Type | Example Usage |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/InputActionType\|Bool]] | Triggered actions such as jump, shoot, sprint, etc. with support for pressed/released thresholds on analog inputs. |
| [[30 Official Roblox Docs/API Reference/Enums/InputActionType\|Direction1D]] | Variable zero-to-full actions such as a car's accelerator pedal or a view scope's zoom level. |
| [[30 Official Roblox Docs/API Reference/Enums/InputActionType\|Direction2D]] | 2D directional movement such as camera rotation, or the standard Roblox character movement. |
| [[30 Official Roblox Docs/API Reference/Enums/InputActionType\|Direction3D]] | 3D directional movement like an airborne vehicle that can levitate up/down, accelerate/decelerate, and drift left/right. |
| [[30 Official Roblox Docs/API Reference/Enums/InputActionType\|ViewportPosition]] | 2D viewport coordinates like mouse input, such as for custom cursors or raycasting to select world objects. |

### Character Sprint

To test an [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]] for simple character sprinting:

1. **RECOMMENDED** Select the top-level [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] object in the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] and then, in the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window, set the [[30 Official Roblox Docs/API Reference/Classes/Workspace#PlayerScriptsUseInputActionSystem|PlayerScriptsUseInputActionSystem]] property to [[30 Official Roblox Docs/API Reference/Enums/RolloutState|Enabled]].

2. Create a new [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]] inside the `PlayContext` context within [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]]. Rename it to `CharacterSprint` to indicate its dedicated action.

   *(image in the full Top G Vault)*

3. In the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window, notice that the action's [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type|Type]] is [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Bool]] (default). This is a logical type for simple character sprinting as a boolean `true`/`false` action (character is either sprinting or not sprinting).

   *(image in the full Top G Vault)*

### Camera Rotation

To test an [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]] for camera rotation:

1. Create a new [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]] inside the `PlayContext` context within [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]]. Rename it to `CameraRotate` to indicate its dedicated action.

   *(image in the full Top G Vault)*

2. In the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window, set the action's [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type|Type]] to [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Direction2D]]. This reflects that camera rotation is a continuous 2D analog input rather than a discrete press/release.

   *(image in the full Top G Vault)*

## Input bindings

An [[30 Official Roblox Docs/API Reference/Classes/InputBinding|InputBinding]] defines which hardware binding should trigger the parent [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]], for example a key press, gamepad button, or tap on a touch‑enabled device. For [[30 Official Roblox Docs/Projects/Cross-platform development|cross‑platform]] compatibility, each [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]] should have an [[30 Official Roblox Docs/API Reference/Classes/InputBinding|InputBinding]] for **gamepad**, **keyboard/mouse**, and **touch** as illustrated here.

*(image in the full Top G Vault)*

> [!note]- **Default Bindings**
> Roblox provides default input bindings for movement, camera control, and basic environment interaction — Roblox players are familiar with these controls, so you should only override them in specific cases. Also note that the **reserved** inputs cannot be overridden and will always operate with their intended purpose.
>
> ### Roblox Reserved
>
> | Action | Mouse/Keyboard | Gamepad | Touch |
> | --- | --- | --- | --- |
> | Open Roblox menu | <kbd>Esc</kbd> | <kbd>Start</kbd> button ([[30 Official Roblox Docs/API Reference/Enums/KeyCode\|ButtonStart]]) | N/A |
> | [[30 Official Roblox Docs/Studio/Developer Console\|Developer Console]] | <kbd>F9</kbd> | N/A | N/A |
> | Fullscreen mode (Windows)<br>Show desktop (Mac) | <kbd>F11</kbd> | N/A | N/A |
> | Record video (Windows) | <kbd>F12</kbd> | N/A | N/A |
> | Take screenshot | <kbd>PrintScreen</kbd> | N/A | N/A |
>
> ### Character
>
> | Action | Mouse/Keyboard | Gamepad | Touch |
> | --- | --- | --- | --- |
> | Move forward | <kbd>W</kbd> <kbd>↑</kbd> | Press up on primary thumbstick | Press up on virtual thumbstick |
> | Move backward | <kbd>S</kbd> <kbd>↓</kbd> | Press down on primary thumbstick | Press down on virtual thumbstick |
> | Move left | <kbd>A</kbd> | Press left on primary thumbstick | Press left on virtual thumbstick |
> | Move right | <kbd>D</kbd> | Press right on primary thumbstick | Press right on virtual thumbstick |
> | Jump | <kbd>Space</kbd> | *(image in the full Top G Vault)* *(image in the full Top G Vault)* | Tap virtual jump button |
>
> ### Interface / Inventory
>
> > [!info]
> > The following action inputs are reserved unless you [[30 Official Roblox Docs/Players/Disable default UI|disable the respective feature]].
>
>
> | Action | Mouse/Keyboard | Gamepad | Touch |
> | --- | --- | --- | --- |
> | Open text chat | <kbd>/</kbd> | N/A | N/A |
> | Show/hide players list | <kbd>Tab</kbd> | N/A | N/A |
> | Toggle backpack | <kbd>`</kbd></td> <td><Typography color="disabled">N/A</Typography></td> <td><Typography color="disabled">N/A</Typography></td> </tr> <tr> <td>Equip/unequip tools</td> <td><kbd>0</kbd>-<kbd>9</kbd></td> <td>Swap between tools using front‑left and front‑right triggers (`Enum.KeyCode.ButtonL1\|ButtonL1` and `Enum.KeyCode.ButtonR1\|ButtonR1`)</td> <td>Tap on-screen tool icons</td> </tr> <tr> <td>Use equipped tool</td> <td>Click left mouse button</td> <td>Back‑right trigger (`Enum.KeyCode.ButtonR2\|ButtonR2`)</td> <td>Tap on screen</td> </tr> <tr> <td>Drop equipped tool</td> <td><kbd>Backspace</kbd></td> <td><Typography color="disabled">N/A</Typography></td> <td><Typography color="disabled">N/A</Typography></td> </tr> <tr> <td>Toggle **UI selection** mode&sup1;</td> <td><kbd>&#92;</kbd></td> <td><kbd>Select</kbd> button (`Enum.KeyCode.ButtonSelect\|ButtonSelect`)</td> <td><Typography color="disabled">N/A</Typography></td> </tr> <tr> <td>Navigate among interactive UI elements while in **UI&nbsp;selection** mode</td> <td><kbd>↑</kbd> <kbd>↓</kbd> <kbd>←</kbd> <kbd>→</kbd><br /><kbd>W</kbd> <kbd>S</kbd> <kbd>A</kbd> <kbd>D</kbd></td> <td>Primary thumbstick (`Enum.KeyCode.Thumbstick1\|Thumbstick1`) or D‑pad (`Enum.KeyCode.DPadUp\|DPadUp`; `Enum.KeyCode.DPadDown\|DPadDown`; `Enum.KeyCode.DPadLeft\|DPadLeft`; `Enum.KeyCode.DPadRight\|DPadRight`)</td> <td></td> </tr> <tr> <td>Activate an interactive UI element while in **UI&nbsp;selection** mode</td> <td><kbd>Enter</kbd></td> <td>Back‑right trigger (`Enum.KeyCode.ButtonR2\|ButtonR2`)</td> <td></td> </tr> <tr> <td>Scroll up/down/left/right in selected `Class.ScrollingFrame` while in **UI&nbsp;selection** mode</td> <td><kbd>PageUp</kbd><br /><kbd>PageDown</kbd><br /><kbd>Home</kbd><br /><kbd>End</kbd></td> <td>Secondary thumbstick (`Enum.KeyCode.Thumbstick2\|Thumbstick2`)</kbd> |  |  |
>
>
>
> *¹ If [[30 Official Roblox Docs/API Reference/Classes/GuiService#GuiNavigationEnabled|GuiNavigationEnabled]] is enabled (default)*
>
> ### Camera
>
> | Action | Mouse/Keyboard | Gamepad | Touch |
> | --- | --- | --- | --- |
> | Move camera view around | While holding right mouse button | Move secondary thumbstick | Touch-drag around screen |
> | Zoom camera in/out | Mouse scroll wheel<br><kbd>I</kbd>/<kbd>O</kbd> | Press secondary thumbstick | Pinch in/out on screen |
> | Rotate camera left or right | <kbd>←</kbd> <kbd>→</kbd> | N/A | N/A |
> | Toggle mouse lock² | <kbd>Shift</kbd> | N/A | N/A |
>
>
>
> *² If [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#EnableMouseLockOption|EnableMouseLockOption]] is enabled (default)*

<br>

The [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type|Type]] assigned to the parent [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]] directly affects which general input types (key/button/tap, analog trigger, thumbstick, etc.) are valid for child [[30 Official Roblox Docs/API Reference/Classes/InputBinding|InputBinding]] instances. In turn, values sent to the parent action's connected events depend on a binding's chosen input type. See [[30 Official Roblox Docs/Input/Input Action System#Input events|input events]] for details on the correlation between action types, bindings, and return values.

### Character Sprint

To hook up bindings for simple character sprinting:

1. Insert a new [[30 Official Roblox Docs/API Reference/Classes/InputBinding|InputBinding]] into the `CharacterSprint` action and rename it to `KeyboardBinding`. Then set the binding's [[30 Official Roblox Docs/API Reference/Classes/InputBinding#KeyCode|KeyCode]] property to [[30 Official Roblox Docs/API Reference/Enums/KeyCode|LeftShift]].

	 *(image in the full Top G Vault)*

	 *(image in the full Top G Vault)*

2. Insert a second [[30 Official Roblox Docs/API Reference/Classes/InputBinding|InputBinding]] into the `CharacterSprint` action and rename it to `GamepadBinding`. Then set the binding's [[30 Official Roblox Docs/API Reference/Classes/InputBinding#KeyCode|KeyCode]] property to [[30 Official Roblox Docs/API Reference/Enums/KeyCode|ButtonY]].

	 *(image in the full Top G Vault)*

	 *(image in the full Top G Vault)*

3. Inside a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] container inside [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]], create an [[30 Official Roblox Docs/UI/Text & image buttons|on-screen button]], rename it to `SprintButton`, and [[30 Official Roblox Docs/UI/Position and size UI objects|position/resize]] it as desired.

   *(image in the full Top G Vault)*

	 *(image in the full Top G Vault)*

4. Insert a third [[30 Official Roblox Docs/API Reference/Classes/InputBinding|InputBinding]] into the `CharacterSprint` action and rename it to `TouchBinding`. Then, in the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window, link the binding's [[30 Official Roblox Docs/API Reference/Classes/InputBinding#UIButton|UIButton]] property to the `SprintButton` button you created previously inside [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]].

	 *(image in the full Top G Vault)*

	 *(image in the full Top G Vault)*

### Camera Rotation

To hook up bindings for camera rotation:

1. Insert a new [[30 Official Roblox Docs/API Reference/Classes/InputBinding|InputBinding]] into the `CameraRotate` action and rename it to `KeyboardBinding`. Leave [[30 Official Roblox Docs/API Reference/Classes/InputBinding#KeyCode|KeyCode]] empty and instead set the four composite directional properties — [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Left|Left]], [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Right|Right]], [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Up|Up]], and [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Down|Down]] — to [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Left]], [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Right]], [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Up]], and [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Down]] respectively.

	 *(image in the full Top G Vault)*

	 *(image in the full Top G Vault)*

2. Insert a second [[30 Official Roblox Docs/API Reference/Classes/InputBinding|InputBinding]] and rename it to `GamepadBinding`. Then set the binding's [[30 Official Roblox Docs/API Reference/Classes/InputBinding#KeyCode|KeyCode]] property to [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Thumbstick2]] (right thumbstick).

	 *(image in the full Top G Vault)*

	 *(image in the full Top G Vault)*

3. Insert a third [[30 Official Roblox Docs/API Reference/Classes/InputBinding|InputBinding]] and rename it to `MouseBinding`. Set the binding's [[30 Official Roblox Docs/API Reference/Classes/InputBinding#KeyCode|KeyCode]] property to [[30 Official Roblox Docs/API Reference/Enums/KeyCode|MouseDelta]] and its [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Scale|Scale]] to `0.01`. [[30 Official Roblox Docs/API Reference/Enums/KeyCode|MouseDelta]] reports values in pixels, so the scale converts them to a reasonable rotation range.

	 *(image in the full Top G Vault)*

	 *(image in the full Top G Vault)*

4. Insert a fourth [[30 Official Roblox Docs/API Reference/Classes/InputBinding|InputBinding]] and rename it to `TouchBinding`. Set the binding's [[30 Official Roblox Docs/API Reference/Classes/InputBinding#KeyCode|KeyCode]] property to [[30 Official Roblox Docs/API Reference/Enums/KeyCode|TouchDelta]] and its [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Scale|Scale]] to `0.01`. Like [[30 Official Roblox Docs/API Reference/Enums/KeyCode|MouseDelta]], [[30 Official Roblox Docs/API Reference/Enums/KeyCode|TouchDelta]] reports values in pixels.

	 *(image in the full Top G Vault)*

	 *(image in the full Top G Vault)*

## Input events

The [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]] instance has three built-in **events** to handle player input coming from [[30 Official Roblox Docs/API Reference/Classes/InputBinding|InputBindings]].

- [[30 Official Roblox Docs/API Reference/Classes/InputAction#Pressed|Pressed]] — This event fires only when the input action's [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type|Type]] is set to [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Bool]], and only when the state transitions from `false` to `true`.
- [[30 Official Roblox Docs/API Reference/Classes/InputAction#Released|Released]] — This event fires only when the input action's [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type|Type]] is set to [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Bool]], and only when the state transitions from `true` to `false`.
- [[30 Official Roblox Docs/API Reference/Classes/InputAction#StateChanged|StateChanged]] — This event fires for all input action types whenever the state changes, except if the state attempts to transition to the same state.

Depending on the input action's [[30 Official Roblox Docs/API Reference/Classes/InputAction#Type|Type]] ([[30 Official Roblox Docs/API Reference/Enums/InputActionType|Bool]], [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Direction1D]], [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Direction2D]], [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Direction3D]], or [[30 Official Roblox Docs/API Reference/Enums/InputActionType|ViewportPosition]]) and the general input type coming from a child [[30 Official Roblox Docs/API Reference/Classes/InputBinding|InputBinding]] (key/button/tap, analog trigger, thumbstick, etc.), different values are returned to the [[30 Official Roblox Docs/API Reference/Classes/InputAction#Pressed|Pressed]], [[30 Official Roblox Docs/API Reference/Classes/InputAction#Released|Released]], and [[30 Official Roblox Docs/API Reference/Classes/InputAction#StateChanged|StateChanged]] event handlers. Examine the following tables to better understand the correlation.

### Bool

The [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Bool]] type is best for triggered actions such as jump, shoot, sprint, etc. with support for pressed/released thresholds on analog inputs.

| Valid Input Types on [[30 Official Roblox Docs/API Reference/Classes/InputBinding\|InputBindings]] | Returned to the [[30 Official Roblox Docs/API Reference/Classes/InputAction\|InputAction]] Event(s) |
| --- | --- |
| Boolean inputs from keyboard keys or basic mouse/gamepad buttons through the binding's [[30 Official Roblox Docs/API Reference/Classes/InputBinding#KeyCode\|KeyCode]] property, or a [[30 Official Roblox Docs/API Reference/Classes/GuiButton\|GuiButton]] press/release through the binding's [[30 Official Roblox Docs/API Reference/Classes/InputBinding#UIButton\|UIButton]] property. | • [[30 Official Roblox Docs/API Reference/Classes/InputAction#Pressed\|Pressed]] event:• `true` when pressed<br><br>• [[30 Official Roblox Docs/API Reference/Classes/InputAction#Released\|Released]] event:• `true` when released<br><br>• [[30 Official Roblox Docs/API Reference/Classes/InputAction#StateChanged\|StateChanged]] event:• `true` (pressed) or `false` (released) |
| Variable input amounts from analog inputs like gamepad triggers ([[30 Official Roblox Docs/API Reference/Enums/KeyCode\|ButtonL2]]/[[30 Official Roblox Docs/API Reference/Enums/KeyCode\|ButtonR2]]) through the binding's [[30 Official Roblox Docs/API Reference/Classes/InputBinding#KeyCode\|KeyCode]] property. | • [[30 Official Roblox Docs/API Reference/Classes/InputAction#Pressed\|Pressed]] event:• `true` when trigger press is `>=` [[30 Official Roblox Docs/API Reference/Classes/InputBinding#PressedThreshold\|PressedThreshold]]<br><br>• [[30 Official Roblox Docs/API Reference/Classes/InputAction#Released\|Released]] event:• `true` when trigger press is `<=` [[30 Official Roblox Docs/API Reference/Classes/InputBinding#ReleasedThreshold\|ReleasedThreshold]]<br><br>• [[30 Official Roblox Docs/API Reference/Classes/InputAction#StateChanged\|StateChanged]] event:• `true` when trigger press is `>=` [[30 Official Roblox Docs/API Reference/Classes/InputBinding#PressedThreshold\|PressedThreshold]]<br>• `false` when trigger press is `<=` [[30 Official Roblox Docs/API Reference/Classes/InputBinding#ReleasedThreshold\|ReleasedThreshold]] |

### Direction1D

The [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Direction1D]] type is best for variable zero‑to‑full actions such as a car's accelerator pedal or a view scope's zoom level.

| Valid Input Types on [[30 Official Roblox Docs/API Reference/Classes/InputBinding\|InputBindings]] | Returned to the [[30 Official Roblox Docs/API Reference/Classes/InputAction\|InputAction]] Event(s) |
| --- | --- |
| Variable input amounts from analog inputs like gamepad triggers ([[30 Official Roblox Docs/API Reference/Enums/KeyCode\|ButtonL2]]/[[30 Official Roblox Docs/API Reference/Enums/KeyCode\|ButtonR2]]) through the binding's [[30 Official Roblox Docs/API Reference/Classes/InputBinding#KeyCode\|KeyCode]], [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Up\|Up]], and [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Down\|Down]] properties. | • [[30 Official Roblox Docs/API Reference/Classes/InputAction#StateChanged\|StateChanged]] event:• `0` to `1` (fully released to fully pressed) through the [[30 Official Roblox Docs/API Reference/Classes/InputBinding#KeyCode\|KeyCode]] or [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Up\|Up]] properties<br>• `0` to `-1` (fully released to fully pressed) through the [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Down\|Down]] property |
| Boolean inputs from keyboard keys or basic mouse/gamepad buttons through the binding's [[30 Official Roblox Docs/API Reference/Classes/InputBinding#KeyCode\|KeyCode]], [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Up\|Up]], and [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Down\|Down]] properties. | • [[30 Official Roblox Docs/API Reference/Classes/InputAction#StateChanged\|StateChanged]] event:• `1` (pressed) or `0` (released) through the [[30 Official Roblox Docs/API Reference/Classes/InputBinding#KeyCode\|KeyCode]] or [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Up\|Up]] properties<br>• `-1` (pressed) or `0` (released) through the [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Down\|Down]] property |

### Direction2D

The [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Direction2D]] type is best for 2D directional movement such as camera rotation, or the standard Roblox character movement.

| Valid Input Types on [[30 Official Roblox Docs/API Reference/Classes/InputBinding\|InputBindings]] | Returned to the [[30 Official Roblox Docs/API Reference/Classes/InputAction\|InputAction]] Event(s) |
| --- | --- |
| Variable input amounts from 2D analog inputs like gamepad thumbsticks ([[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Thumbstick1]]/[[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Thumbstick2]]) through the binding's [[30 Official Roblox Docs/API Reference/Classes/InputBinding#KeyCode\|KeyCode]] property. | • [[30 Official Roblox Docs/API Reference/Classes/InputAction#StateChanged\|StateChanged]] event:• [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] between `(-1, -1)` and `(1, 1)` |
| Variable input amounts from analog inputs like gamepad triggers ([[30 Official Roblox Docs/API Reference/Enums/KeyCode\|ButtonL2]]/[[30 Official Roblox Docs/API Reference/Enums/KeyCode\|ButtonR2]]) through the binding's [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Up\|Up]], [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Down\|Down]], [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Left\|Left]], and [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Right\|Right]] properties. | • [[30 Official Roblox Docs/API Reference/Classes/InputAction#StateChanged\|StateChanged]] event:• [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] with [[30 Official Roblox Docs/API Reference/Datatypes/Vector2#Y\|Y]] component between `0` and `1` (fully released to fully pressed) through the [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Up\|Up]] property<br>• [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] with [[30 Official Roblox Docs/API Reference/Datatypes/Vector2#Y\|Y]] component between `0` and `-1` (fully released to fully pressed) through the [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Down\|Down]] property<br>• [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] with [[30 Official Roblox Docs/API Reference/Datatypes/Vector2#X\|X]] component between `0` and `-1` (fully released to fully pressed) through the [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Left\|Left]] property<br>• [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] with [[30 Official Roblox Docs/API Reference/Datatypes/Vector2#X\|X]] component between `0` and `1` (fully released to fully pressed) through the [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Right\|Right]] property |
| Boolean inputs from keyboard keys or basic mouse/gamepad buttons through the binding's [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Up\|Up]], [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Down\|Down]], [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Left\|Left]], and [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Right\|Right]] properties. | • [[30 Official Roblox Docs/API Reference/Classes/InputAction#StateChanged\|StateChanged]] event:• [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] of `(0, 1)` (pressed) or `(0, 0)` (released) through the [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Up\|Up]] property<br>• [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] of `(0, -1)` (pressed) or `(0, 0)` (released) through the [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Down\|Down]] property<br>• [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] of `(-1, 0)` (pressed) or `(0, 0)` (released) through the [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Left\|Left]] property<br>• [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] of `(1, 0)` (pressed) or `(0, 0)` (released) through the [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Right\|Right]] property |

### Direction3D

The [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Direction3D]] type is best for 3D directional movement like an airborne vehicle that can levitate up/down, accelerate/decelerate, and drift left/right.

| Valid Input Types on [[30 Official Roblox Docs/API Reference/Classes/InputBinding\|InputBindings]] | Returned to the [[30 Official Roblox Docs/API Reference/Classes/InputAction\|InputAction]] Event(s) |
| --- | --- |
| Variable input amounts from analog inputs like gamepad triggers ([[30 Official Roblox Docs/API Reference/Enums/KeyCode\|ButtonL2]]/[[30 Official Roblox Docs/API Reference/Enums/KeyCode\|ButtonR2]]) through the binding's [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Up\|Up]], [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Down\|Down]], [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Left\|Left]], [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Right\|Right]], [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Forward\|Forward]], and [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Backward\|Backward]] properties. | • [[30 Official Roblox Docs/API Reference/Classes/InputAction#StateChanged\|StateChanged]] event:• [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] with [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#Y\|Y]] component between `0` and `1` (fully released to fully pressed) through the [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Up\|Up]] property<br>• [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] with [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#Y\|Y]] component between `0` and `-1` (fully released to fully pressed) through the [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Down\|Down]] property<br>• [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] with [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#X\|X]] component between `0` and `-1` (fully released to fully pressed) through the [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Left\|Left]] property<br>• [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] with [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#X\|X]] component between `0` and `1` (fully released to fully pressed) through the [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Right\|Right]] property<br>• [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] with [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#Z\|Z]] component between `0` and `-1` (fully released to fully pressed) through the [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Forward\|Forward]] property<br>• [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] with [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#Z\|Z]] component between `0` and `1` (fully released to fully pressed) through the [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Backward\|Backward]] property |
| Boolean inputs from keyboard keys or basic mouse/gamepad buttons through the binding's [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Up\|Up]], [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Down\|Down]], [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Left\|Left]], [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Right\|Right]], [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Forward\|Forward]], and [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Backward\|Backward]] properties. | • [[30 Official Roblox Docs/API Reference/Classes/InputAction#StateChanged\|StateChanged]] event:• [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] of `(0, 1, 0)` (pressed) or `(0, 0, 0)` (released) through the [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Up\|Up]] property<br>• [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] of `(0, -1, 0)` (pressed) or `(0, 0, 0)` (released) through the [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Down\|Down]] property<br>• [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] of `(-1, 0, 0)` (pressed) or `(0, 0, 0)` (released) through the [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Left\|Left]] property<br>• [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] of `(1, 0, 0)` (pressed) or `(0, 0, 0)` (released) through the [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Right\|Right]] property<br>• [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] of `(0, 0, -1)` (pressed) or `(0, 0, 0)` (released) through the [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Forward\|Forward]] property<br>• [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] of `(0, 0, 1)` (pressed) or `(0, 0, 0)` (released) through the [[30 Official Roblox Docs/API Reference/Classes/InputBinding#Backward\|Backward]] property |

### ViewportPosition

The [[30 Official Roblox Docs/API Reference/Enums/InputActionType|ViewportPosition]] type is best for absolute 2D viewport coordinates of an input such as a mouse pointer or touch, which can be used for features like custom cursors or selecting objects.

| Valid Input Types on [[30 Official Roblox Docs/API Reference/Classes/InputBinding\|InputBindings]] | Returned to the [[30 Official Roblox Docs/API Reference/Classes/InputAction\|InputAction]] Event(s) |
| --- | --- |
| Variable input amounts from positional inputs such as a mouse pointer ([[30 Official Roblox Docs/API Reference/Enums/KeyCode\|MousePosition]]) or touch ([[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Touch]]). | • [[30 Official Roblox Docs/API Reference/Classes/InputAction#StateChanged\|StateChanged]] event:• [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] between `(0, 0)` and the maximum absolute `(X, Y)` pixel size in the viewport. |

### Character Sprint

To connect events for simple character sprinting:

1. Insert a new [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] into the `CharacterSprint` tree, alongside the various input bindings. Then set its [[30 Official Roblox Docs/API Reference/Classes/BaseScript#RunContext|RunContext]] to [[30 Official Roblox Docs/API Reference/Enums/RunContext|Client]] and rename it to `OnActivate`.

   *(image in the full Top G Vault)*

2. Paste the following code into the `OnActivate` script. Note the [[30 Official Roblox Docs/API Reference/Classes/InputAction#Pressed|Pressed]] event connection on lines `13`‑`15` which doubles the character's walk speed when a sprint input binding is pressed, and the corresponding [[30 Official Roblox Docs/API Reference/Classes/InputAction#Released|Released]] event connection on lines `16`‑`18` which resets the walk speed to default when a sprint input binding is released.

		```lua title="OnActivate (Client Script)"
		local Players = game:GetService("Players")

		local player = Players.LocalPlayer
		local character = player.Character
		if not character or character.Parent == nil then
			character = player.CharacterAdded:Wait()
		end
		local humanoid = character:WaitForChild("Humanoid")
		local defaultWalkSpeed = humanoid.WalkSpeed

		local inputAction = script.Parent

		inputAction.Pressed:Connect(function()
			humanoid.WalkSpeed = defaultWalkSpeed * 2
		end)
		inputAction.Released:Connect(function()
			humanoid.WalkSpeed = defaultWalkSpeed
		end)
		```

3. Playtest your game and test the character sprint action with the [[30 Official Roblox Docs/Input/Input Action System#Input bindings|bindings]] you chose previously: [[30 Official Roblox Docs/API Reference/Enums/KeyCode|LeftShift]] for keyboard, [[30 Official Roblox Docs/API Reference/Enums/KeyCode|ButtonY]] for gamepad, and the on‑screen `SprintButton` for touch‑enabled devices. Remember that you can use the [[30 Official Roblox Docs/Studio/Studio testing modes|Controller Emulator]] to test gamepad inputs directly in Roblox Studio.

   [Video: Sprint-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/ui/button-text-input/Sprint-Demo.mp4)

### Camera Rotation

For **continuous analog inputs** like camera rotation, [[30 Official Roblox Docs/API Reference/Classes/InputAction#StateChanged|StateChanged]] fires **once** when the state changes and does not signal until the next change, so a thumbstick held at a fixed angle only fires the event once. In these cases, poll [[30 Official Roblox Docs/API Reference/Classes/InputAction#GetState|GetState()]] each frame and multiply by delta time for frame-rate-independent behavior.

1. Insert a new [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] into the `CameraRotate` tree, alongside the various input bindings. Then set its [[30 Official Roblox Docs/API Reference/Classes/BaseScript#RunContext|RunContext]] to [[30 Official Roblox Docs/API Reference/Enums/RunContext|Client]] and rename it to `OnInput`.

   *(image in the full Top G Vault)*

2. Paste the following code into the `OnInput` script.

	```lua title="OnInput (Client Script)"
	local RunService = game:GetService("RunService")

	local CAMERA_SENSITIVITY = 1.5 -- Radians per second at action state 1

	local inputAction = script.Parent
	local camera = workspace.CurrentCamera
	camera.CameraType = Enum.CameraType.Scriptable

	RunService:BindToRenderStep("CameraRotation", Enum.RenderPriority.Camera.Value, function(dt)
		local state = inputAction:GetState()
		if state.Magnitude > 0 then
			camera.CFrame = camera.CFrame
				* CFrame.Angles(0, -state.X * CAMERA_SENSITIVITY * dt, 0)
				* CFrame.Angles(-state.Y * CAMERA_SENSITIVITY * dt, 0, 0)
		end
	end)
	```

## Context changes

Once you have an [[30 Official Roblox Docs/Input/Input Action System#Input contexts|input context]] such as `PlayContext`, you can enable/disable it during gameplay through scripting, change its [[30 Official Roblox Docs/API Reference/Classes/InputContext#Priority|Priority]] to determine which actions take precedence over others, and [[30 Official Roblox Docs/API Reference/Classes/InputContext#Sink|Sink]] inputs from being processed within contexts of lower priority.

1. To make it easier to switch contexts from other scripts, insert a new [[30 Official Roblox Docs/API Reference/Classes/BindableEvent|BindableEvent]] into your inputs folder within [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]] and rename it to `ContextEvent`.

   *(image in the full Top G Vault)*

2. Create a new [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] at the same level, set its [[30 Official Roblox Docs/API Reference/Classes/BaseScript#RunContext|RunContext]] to [[30 Official Roblox Docs/API Reference/Enums/RunContext|Client]], and rename it to `UpdateContext`.

   *(image in the full Top G Vault)*

3. Inside the `UpdateContext` script, paste the following code:

		```lua title="UpdateContext (Client Script)"
		local ReplicatedStorage = game:GetService("ReplicatedStorage")

		local inputsFolder = ReplicatedStorage:WaitForChild("Inputs")
		local contextEvent = inputsFolder:WaitForChild("ContextEvent")

		-- Connect bindable event
		contextEvent.Event:Connect(function(targetContext, enabled)
			local context = inputsFolder:FindFirstChild(targetContext)
			if context then
				context.Enabled = enabled
				print(context.Name .. ": " .. tostring(context.Enabled))
			else
				warn("InputContext not found!")
			end
		end)
		```

4. With the `UpdateContext` script in place, you can now update a named [[30 Official Roblox Docs/API Reference/Classes/InputContext|InputContext]] by firing the bindable event, for example from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] that powers a [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]] inside a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] container.

   *(image in the full Top G Vault)*

		```lua title="Button Script"
		local ReplicatedStorage = game:GetService("ReplicatedStorage")

		local inputsFolder = ReplicatedStorage:WaitForChild("Inputs")
		local contextEvent = inputsFolder:WaitForChild("ContextEvent")

		local button = script.Parent
		button.Activated:Connect(function()
			-- Fire bindable event with target input context and enabled state
			contextEvent:Fire("PlayContext", true)
		end)
		```

## Displaying bindings

Once you've set up [[30 Official Roblox Docs/Input/Input Action System#Input actions|actions]] and [[30 Official Roblox Docs/Input/Input Action System#Input bindings|bindings]], you'll typically need to show players, via on‑screen [[30 Official Roblox Docs/Projects/Cross-platform development#Assistive hints|assistive hints]], which key or button triggers each action:

### Keyboard Input

*(image in the full Top G Vault)*

### Gamepad Input

*(image in the full Top G Vault)*

<br>

The Input Action System provides two approaches:

- **RECOMMENDED** [[30 Official Roblox Docs/API Reference/Classes/InputActionLabel|InputActionLabel]] — A no-code, drag-and-drop [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] that automatically displays the correct input per platform.
- **INTERMEDIATE** [[30 Official Roblox Docs/API Reference/Classes/InputAction#PreferredBinding|PreferredBinding]] — A read-only [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]] property for creators who want full control over how bindings are displayed in custom UI.

### InputActionLabel

> [!success]
> **File** ⟩ **Beta Features** ⟩ ****

[[30 Official Roblox Docs/API Reference/Classes/InputActionLabel|InputActionLabel]] is a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] that you can insert into any [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] or [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]]. Once its [[30 Official Roblox Docs/API Reference/Classes/InputActionLabel#InputAction|InputAction]] property is set to reference an existing [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]] instance, it automatically resolves and displays the correct keybinding for the player's current input device — no scripting required. When the player switches devices (for example, picking up a gamepad after using a keyboard) or rebinds a control, the label updates instantly.

To add an [[30 Official Roblox Docs/API Reference/Classes/InputActionLabel|InputActionLabel]]:

1. Inside a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] container inside [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]], insert an [[30 Official Roblox Docs/API Reference/Classes/InputActionLabel|InputActionLabel]] just like any other [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]].
2. In the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window, set its [[30 Official Roblox Docs/API Reference/Classes/InputActionLabel#InputAction|InputAction]] property to the [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]] instance you want to display (for example, your "Sprint" action under [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]]) and [[30 Official Roblox Docs/UI/Position and size UI objects|position/resize]] it as desired.
3. When the label resolves what to show, it checks the following in order:

   1. **Custom Images** — If child [[30 Official Roblox Docs/API Reference/Classes/InputBinding|InputBindings]] have their
   [[30 Official Roblox Docs/API Reference/Classes/InputBinding#DisplayImage|DisplayImage]] property set, the label
   renders those images directly.

   2. **Platform Key Images** — Lacking custom images, the label renders
   platform-provided images for child [[30 Official Roblox Docs/API Reference/Classes/InputBinding|InputBindings]] through
   [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetImageForKeyCode|UserInputService:GetImageForKeyCode()]], if such images are available.
   Composite bindings with modifiers show multiple icons with `+` separators.

   3. **Custom Names** — Lacking available images, if child
   [[30 Official Roblox Docs/API Reference/Classes/InputBinding|InputBindings]] have their
   [[30 Official Roblox Docs/API Reference/Classes/InputBinding#DisplayName|DisplayName]] property set, the label renders
   that text using the label's style properties.

   4. **Platform Key Strings** — Lacking all of the above, the label renders
   platform-provided strings through
   [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetStringForKeyCode|UserInputService:GetStringForKeyCode()]].

   5. If no [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]] is assigned or no child [[30 Official Roblox Docs/API Reference/Classes/InputBinding|InputBinding]]
   exists, the label renders a placeholder icon.

### PreferredBinding

For customized use cases where you need full control over hint display (custom animations, conditional visibility, composited layouts), you can use [[30 Official Roblox Docs/API Reference/Classes/InputAction#PreferredBinding|InputAction.PreferredBinding]] to query the current binding and build your own UI. [[30 Official Roblox Docs/API Reference/Classes/InputAction#PreferredBinding|PreferredBinding]] is a read-only property that returns the child [[30 Official Roblox Docs/API Reference/Classes/InputBinding|InputBinding]] which best matches the player's current input device.

The following two [[30 Official Roblox Docs/API Reference/Classes/InputBinding|InputBinding]] properties provide the custom display overrides used for [[30 Official Roblox Docs/API Reference/Classes/InputAction#PreferredBinding|PreferredBinding]]. If neither is set, fall back to platform-provided values via [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetStringForKeyCode|GetStringForKeyCode()]] and [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetImageForKeyCode|GetImageForKeyCode()]].

- [[30 Official Roblox Docs/API Reference/Classes/InputBinding#DisplayName|DisplayName]] — A read/write string for custom text, for example, "Sprint."
- [[30 Official Roblox Docs/API Reference/Classes/InputBinding#DisplayImage|DisplayImage]] — A read/write [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] value for a custom image.

The following examples assume a client [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] parented to the [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]] and a hint UI object ([[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]] or [[30 Official Roblox Docs/API Reference/Classes/ImageLabel|ImageLabel]]) inside a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] within the player's [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]]. Both connect to changes to [[30 Official Roblox Docs/API Reference/Classes/InputAction#PreferredBinding|PreferredBinding]] so that the hint refreshes whenever the player switches input devices.

```lua title="Text Hint (Client Script)"
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local inputAction = script.Parent
local player = Players.LocalPlayer
local screenGui = player:WaitForChild("PlayerGui"):WaitForChild("ScreenGui")
local label = screenGui:FindFirstChildWhichIsA("TextLabel")

local function updateHintText()
	if not label then
		warn("Label UI object not found!")
		return
	end

	local binding = inputAction.PreferredBinding
	if binding and binding.DisplayName ~= "" then
		label.Text = binding.DisplayName
	elseif binding and binding.KeyCode ~= Enum.KeyCode.None then
		label.Text = UserInputService:GetStringForKeyCode(binding.KeyCode)
	else
		label.Text = ""
	end
end

inputAction:GetPropertyChangedSignal("PreferredBinding"):Connect(updateHintText)
updateHintText()
```

```lua title="Image Hint (Client Script)"
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local inputAction = script.Parent
local player = Players.LocalPlayer
local screenGui = player:WaitForChild("PlayerGui"):WaitForChild("ScreenGui")
local label = screenGui:FindFirstChildWhichIsA("ImageLabel")

local function updateHintImage()
	if not label then
		warn("Label UI object not found!")
		return
	end

	local binding = inputAction.PreferredBinding
	if binding and binding.DisplayImage.SourceType ~= Enum.ContentSourceType.None then
		label.ImageContent = binding.DisplayImage
	elseif binding and binding.KeyCode ~= Enum.KeyCode.None then
		local keyImage = UserInputService:GetImageForKeyCode(binding.KeyCode)
		label.ImageContent = (keyImage ~= "") and Content.fromUri(keyImage) or Content.none
	else
		label.ImageContent = Content.none
	end
end

inputAction:GetPropertyChangedSignal("PreferredBinding"):Connect(updateHintImage)
updateHintImage()
```

## Input Action Manager

> [!success]
> **File** ⟩ **Beta Features** ⟩ ****

The **Input Action Manager** tool is a unified, matrix-style interface to design, audit, and scale your input architecture.

To access it, navigate to the **Window** menu in Studio and select **Input** ⟩ **Input Action Manager**. If your game already uses input [[30 Official Roblox Docs/Input/Input Action System#Input contexts|contexts]], [[30 Official Roblox Docs/Input/Input Action System#Input actions|actions]], or [[30 Official Roblox Docs/Input/Input Action System#Input bindings|bindings]], the manager will automatically scan the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] and extract those existing instances into the editor grid. Any new input‑related instances will automatically populate into an `Inputs` folder within [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]].

*(image in the full Top G Vault)*

To configure an input setup for **character sprint** as outlined in the sections above:

1. **RECOMMENDED** Select the top-level [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] object in the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] and then, in the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window, set the [[30 Official Roblox Docs/API Reference/Classes/Workspace#PlayerScriptsUseInputActionSystem|PlayerScriptsUseInputActionSystem]] property to [[30 Official Roblox Docs/API Reference/Enums/RolloutState|Enabled]].

2. Inside a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] container inside [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]], create an [[30 Official Roblox Docs/UI/Text & image buttons|on-screen button]], rename it to `SprintButton`, and [[30 Official Roblox Docs/UI/Position and size UI objects|position/resize]] it as desired.

   *(image in the full Top G Vault)*

3. In the **Input Action Manager**, hover over the **Context** column header and click the **＋** button. Enter an appropriate name for the new context such as `PlayContext` and press <kbd>Enter</kbd>. An [[30 Official Roblox Docs/API Reference/Classes/InputContext|InputContext]] of the matching name appears in [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]].

	 *(image in the full Top G Vault)*

	 *(image in the full Top G Vault)*

4. Hover over the new context and click the **＋** button. From the popup menu, select [[30 Official Roblox Docs/API Reference/Enums/InputActionType|Bool]], enter `CharacterSprint` for the action's name, and press <kbd>Enter</kbd>. An [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]] of the matching name appears under the context.

	 *(image in the full Top G Vault)*

	 *(image in the full Top G Vault)*

5. In the new `CharacterSprint` row, assign bindings for each input type:

   1. **Keyboard and Mouse** — Click the arrow button and select [[30 Official Roblox Docs/API Reference/Enums/KeyCode|LeftShift]] from the picker menu.
   2. **Touch** — Click the cell and then, in the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] hierarchy, click the `SprintButton` object that you previously inserted into the [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]].
   3. **Gamepad** — Click the arrow button and select [[30 Official Roblox Docs/API Reference/Enums/KeyCode|ButtonY]] from the picker menu.

   *(image in the full Top G Vault)*

   > [!info]
   > As you assign bindings, watch for warning/error icons in the UI. Yellow warnings (**⚠**) indicate a **missing** binding for [[30 Official Roblox Docs/Projects/Cross-platform development|cross‑platform]] compatibility, while red warnings (**⚠**) indicate a **duplicate** binding for actions within the same context.

6. Insert a new [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] into the `CharacterSprint` tree, alongside the various input bindings. Then set its [[30 Official Roblox Docs/API Reference/Classes/BaseScript#RunContext|RunContext]] to [[30 Official Roblox Docs/API Reference/Enums/RunContext|Client]] and rename it to `OnActivate`.

   *(image in the full Top G Vault)*

7. Paste the following code into the `OnActivate` script. Note the [[30 Official Roblox Docs/API Reference/Classes/InputAction#Pressed|Pressed]] event connection on lines `13`‑`15` which doubles the character's walk speed when a sprint input binding is pressed, and the corresponding [[30 Official Roblox Docs/API Reference/Classes/InputAction#Released|Released]] event connection on lines `16`‑`18` which resets the walk speed to default when a sprint input binding is released.

		```lua title="OnActivate (Client Script)"
		local Players = game:GetService("Players")

		local player = Players.LocalPlayer
		local character = player.Character
		if not character or character.Parent == nil then
			character = player.CharacterAdded:Wait()
		end
		local humanoid = character:WaitForChild("Humanoid")
		local defaultWalkSpeed = humanoid.WalkSpeed

		local inputAction = script.Parent

		inputAction.Pressed:Connect(function()
			humanoid.WalkSpeed = defaultWalkSpeed * 2
		end)
		inputAction.Released:Connect(function()
			humanoid.WalkSpeed = defaultWalkSpeed
		end)
		```

---
*Source: [Input Action System](https://create.roblox.com/docs/input/input-action-system) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

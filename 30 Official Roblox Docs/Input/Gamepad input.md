---
title: "Gamepad input"
description: "Explains how to accept input from USB gamepads, such as Xbox and PlayStation controllers."
area: "30 Official Roblox Docs"
cluster: "Input"
source: "https://create.roblox.com/docs/input/gamepad"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains how to accept input from USB gamepads, such as Xbox and PlayStation controllers.*

Roblox accepts input from gamepads such as Xbox and PlayStation controllers. To simplify [[30 Official Roblox Docs/Projects/Cross-platform development|cross‑platform]] inputs, including gamepads, Roblox provides the [[30 Official Roblox Docs/Input/Input Action System|Input Action System]] to define **actions** such as "jump," "sprint," or "shoot" and set up **bindings** for multiple hardware inputs to drive those actions.

When binding gamepad inputs, see [[30 Official Roblox Docs/Input/Gamepad input#Common control schemas|common control schemas]] to create a consistent gamepad experience for players. After inputs are set, you can enhance the player's experience by including [[30 Official Roblox Docs/Input/Gamepad input#Haptic feedback|haptic feedback]] on supported controllers.

As you build out support for gamepads, remember to test frequently using a connected gamepad or the [[30 Official Roblox Docs/Input/Gamepad input#Controller emulation|Controller Emulator]] in Studio.

## Input type detection

In cross‑platform development, it's important that you determine and respond to the [[30 Official Roblox Docs/API Reference/Classes/UserInputService#PreferredInput|PreferredInput]] type a player is using, normally to ensure that [[30 Official Roblox Docs/UI/User interface#UI objects|UI elements]] like on-screen buttons and menus work elegantly and support interaction across devices.

For example, a console assumes that gamepads are the default input, but a player on PC or laptop may also choose to connect a bluetooth gamepad. In this case, mouse/keyboard remains a valid input for that player, but you can assume they want to switch to the connected gamepad as the **primary** input type.

See [[30 Official Roblox Docs/Input/Input#Input type detection|input type detection]] for more information.

> [!info]
> For alternative gamepad detection methods, see the [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GamepadEnabled|UserInputService.GamepadEnabled]] property and the [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GamepadConnected|GamepadConnected]]/[[30 Official Roblox Docs/API Reference/Classes/UserInputService#GamepadDisconnected|GamepadDisconnected]] events.

## Common control schemas

When considering specific control bindings for the [[30 Official Roblox Docs/Input/Input Action System|Input Action System]], it's best to establish consistency across different games. The following input bindings will help players immediately feel familiar and comfortable with gamepad controls.

| Input | Common use cases |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|ButtonA]] | Accepts player prompts or GUI selections. Alternatively used for primary actions such as jumping. |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|ButtonB]] | Cancels player prompts or GUI selections. Alternatively used for secondary actions such as a dodge, roll, or sprint. |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Thumbstick1]] | Generally associated with character movement. |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Thumbstick2]] | Generally associated with camera movement. |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|ButtonL2]], [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|ButtonR2]] | Generally used for primary actions, such as shooting. |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|ButtonL1]], [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|ButtonR1]], [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|ButtonX]], [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|ButtonY]] | Secondary actions such as reloading, targeting, or accessing an inventory or minimap. |

### Xbox

*(image in the full Top G Vault)*

### PlayStation

*(image in the full Top G Vault)*

## Haptic feedback

Many gamepad controllers have motors built in to provide haptic feedback. Adding rumbles and vibrations can greatly enhance a player's experience and provide subtle feedback beyond visuals or audio.

Roblox supports haptics for PlayStation gamepads, Xbox gamepads, and the Quest Touch controller. Haptic feedback is managed through [[30 Official Roblox Docs/API Reference/Classes/HapticEffect|HapticEffect]] instances which can be set to a specific [[30 Official Roblox Docs/API Reference/Classes/HapticEffect#Type|Type]] such as [[30 Official Roblox Docs/API Reference/Enums/HapticEffectType|GameplayCollision]] or [[30 Official Roblox Docs/API Reference/Enums/HapticEffectType|UIClick]].

Once a [[30 Official Roblox Docs/API Reference/Classes/HapticEffect|HapticEffect]] is in place, you can initiate it through the [[30 Official Roblox Docs/API Reference/Classes/HapticEffect#Play|Play()]] method, for instance:

```lua
local Workspace = game:GetService("Workspace")

local effect = Instance.new("HapticEffect")
effect.Type = Enum.HapticEffectType.GameplayExplosion
effect.Parent = Workspace

-- Play the haptic effect
effect:Play()
```

## Controller emulation

Use [[30 Official Roblox Docs/Studio/Controller Emulator|Controller Emulator]] to test gamepad input directly in Studio without a physical controller connected. It shows a picture of the emulated device and lights up its controls as input arrives, which helps confirm that your [[30 Official Roblox Docs/API Reference/Classes/UserInputService|UserInputService]] handlers and [[30 Official Roblox Docs/Input/Input Action System|Input Action System]] bindings react the way you expect.

---
*Source: [Gamepad input](https://create.roblox.com/docs/input/gamepad) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

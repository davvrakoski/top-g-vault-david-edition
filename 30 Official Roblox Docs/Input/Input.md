---
title: "Input"
description: "Summary of cross-platform input on Roblox and implementation guidelines."
area: "30 Official Roblox Docs"
cluster: "Input"
source: "https://create.roblox.com/docs/input"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Summary of cross-platform input on Roblox and implementation guidelines.*

Every game needs to receive user input for players to interact and view their environment. Roblox supports nearly all forms of input, including [[30 Official Roblox Docs/Input/Mouse and keyboard input|mouse/keyboard]], [[30 Official Roblox Docs/Input/Mobile input|touch]], [[30 Official Roblox Docs/Input/Gamepad input|gamepads]], and VR.

## Cross-platform input

Roblox is inherently [[30 Official Roblox Docs/Projects/Cross-platform development|cross‑platform]], as players can discover and join games on their phone or tablet, then later continue where they left off on their PC or console. Input is especially important as part of your cross‑platform development plan.

To simplify this process, Roblox provides the [[30 Official Roblox Docs/Input/Input Action System|Input Action System]] to define **actions** such as "jump," "sprint," or "shoot" and set up **bindings** for multiple hardware inputs to drive those actions. This frees you from thinking of all the technical aspects of hardware inputs and allows you to simply define which inputs perform which actions.

*(image in the full Top G Vault)*

## Input type detection

In cross‑platform development, it's important that you determine and respond to the **primary** input type a player is using, normally to ensure that [[30 Official Roblox Docs/UI/User interface#UI objects|UI elements]] like on‑screen buttons and menus work elegantly across devices.

For example, a touch‑enabled device assumes touch is the default input and that touch buttons may appear for actions, but if a player connects an additional bluetooth keyboard/mouse or gamepad, you can assume they want to switch to that as the **primary** input type and possibly use touch as a backup input for on‑screen UI. The read‑only [[30 Official Roblox Docs/API Reference/Classes/UserInputService#PreferredInput|UserInputService.PreferredInput]] property is a convenient way to test for and adapt to multiple input types across multiple device types, based on anticipated player behavior.

### Behavior

The value of [[30 Official Roblox Docs/API Reference/Classes/UserInputService#PreferredInput|PreferredInput]] changes based on built‑in device inputs and the player's most recent interaction with a connected gamepad or keyboard/mouse. Examples include:

| Real-World Scenario | `PreferredInput` |
| --- | --- |
| Player is using a phone with no other connected input devices; no possibility of an input type change. | [[30 Official Roblox Docs/API Reference/Enums/PreferredInput\|Touch]] |
| Player is using a mobile device with a bluetooth keyboard & mouse connected, but no gamepad is connected. | [[30 Official Roblox Docs/API Reference/Enums/PreferredInput\|KeyboardAndMouse]] |
| Player is using a tablet with a bluetooth gamepad connected, but no keyboard or mouse is connected. | [[30 Official Roblox Docs/API Reference/Enums/PreferredInput\|Gamepad]] |
| Player is using an Xbox or PlayStation with a bluetooth keyboard & mouse connected and has most recently interacted with the keyboard or mouse. | [[30 Official Roblox Docs/API Reference/Enums/PreferredInput\|KeyboardAndMouse]] |
| Player is on a Windows or Mac PC with a gamepad connected and has most recently interacted with the gamepad. | [[30 Official Roblox Docs/API Reference/Enums/PreferredInput\|Gamepad]] |

### Benefits

Importantly, the [[30 Official Roblox Docs/API Reference/Classes/UserInputService#PreferredInput|PreferredInput]] property overcomes the following issues related to [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchEnabled|UserInputService.TouchEnabled]] and [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetLastInputType|UserInputService:GetLastInputType()]], both traditionally used to detect input types.

- [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchEnabled|TouchEnabled]] is `true` on laptops with touch screens, so it is **not** a proper "is mobile" check.
- UI layouts for gamepad or keyboard/mouse may be more appropriate even if a device has touch capability, for example a mobile device with a bluetooth gamepad connected.
- Multiple [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetLastInputType|GetLastInputType()]] values may represent the same input device, requiring compound `or` logic in scripts. For example, [[30 Official Roblox Docs/API Reference/Enums/UserInputType|MouseWheel]], [[30 Official Roblox Docs/API Reference/Enums/UserInputType|MouseMovement]], and [[30 Official Roblox Docs/API Reference/Enums/UserInputType|MouseButton1]] all represent a mouse.
- [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetLastInputType|GetLastInputType()]] frequently thrashes between [[30 Official Roblox Docs/API Reference/Enums/UserInputType|MouseMovement]] and [[30 Official Roblox Docs/API Reference/Enums/UserInputType|Keyboard]] which may cause code to run more often than expected. Similarly, thrashes between [[30 Official Roblox Docs/API Reference/Enums/UserInputType|Touch]] and [[30 Official Roblox Docs/API Reference/Enums/UserInputType|Gamepad]] may cause on‑screen UI to flicker between layouts.
- [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetLastInputType|GetLastInputType()]] may return confusing values such as [[30 Official Roblox Docs/API Reference/Enums/UserInputType|TextInput]], [[30 Official Roblox Docs/API Reference/Enums/UserInputType|Focus]], and [[30 Official Roblox Docs/API Reference/Enums/UserInputType|InputMethod]].

> [!info]
> For advanced workflows or control schemes that rely on detecting and responding to the player's **specific** most recent UserInputType, you can continue using UserInputService:GetLastInputType() and UserInputService.LastInputTypeChanged.

<br>

The following [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] is a template for initially detecting the preferred input and responding to changes during gameplay.

```lua title="PreferredInput detection"
local UserInputService = game:GetService("UserInputService")

local function preferredInputChanged()
	local preferredInput = UserInputService.PreferredInput

	if preferredInput == Enum.PreferredInput.Touch then
		-- Player is on touch-enabled device with no other input types available/connected
		print("Touch")
	elseif preferredInput == Enum.PreferredInput.Gamepad then
		-- Player has connected or most recently interacted with a gamepad
		print("Gamepad")
	elseif preferredInput == Enum.PreferredInput.KeyboardAndMouse then
		-- Player has connected or most recently interacted with a keyboard or mouse
		print("KeyboardAndMouse")
	end
end

preferredInputChanged()

UserInputService:GetPropertyChangedSignal("PreferredInput"):Connect(function()
	preferredInputChanged()
end)
```

## Default bindings

Roblox provides default input bindings for movement, camera control, and basic environment interaction — Roblox players are familiar with these controls, so you should only override them in specific cases. Also note that the **reserved** inputs cannot be overridden and will always operate with their intended purpose.

### Roblox Reserved

| Action | Mouse/Keyboard | Gamepad | Touch |
| --- | --- | --- | --- |
| Open Roblox menu | <kbd>Esc</kbd> | <kbd>Start</kbd> button ([[30 Official Roblox Docs/API Reference/Enums/KeyCode\|ButtonStart]]) | N/A |
| [[30 Official Roblox Docs/Studio/Developer Console\|Developer Console]] | <kbd>F9</kbd> | N/A | N/A |
| Fullscreen mode (Windows)<br>Show desktop (Mac) | <kbd>F11</kbd> | N/A | N/A |
| Record video (Windows) | <kbd>F12</kbd> | N/A | N/A |
| Take screenshot | <kbd>PrintScreen</kbd> | N/A | N/A |

### Character

| Action | Mouse/Keyboard | Gamepad | Touch |
| --- | --- | --- | --- |
| Move forward | <kbd>W</kbd> <kbd>↑</kbd> | Press up on primary thumbstick | Press up on virtual thumbstick |
| Move backward | <kbd>S</kbd> <kbd>↓</kbd> | Press down on primary thumbstick | Press down on virtual thumbstick |
| Move left | <kbd>A</kbd> | Press left on primary thumbstick | Press left on virtual thumbstick |
| Move right | <kbd>D</kbd> | Press right on primary thumbstick | Press right on virtual thumbstick |
| Jump | <kbd>Space</kbd> | *(image in the full Top G Vault)* *(image in the full Top G Vault)* | Tap virtual jump button |

### Interface / Inventory

> [!info]
> The following action inputs are reserved unless you [[30 Official Roblox Docs/Players/Disable default UI|disable the respective feature]].

| Action | Mouse/Keyboard | Gamepad | Touch |
| --- | --- | --- | --- |
| Open text chat | <kbd>/</kbd> | N/A | N/A |
| Show/hide players list | <kbd>Tab</kbd> | N/A | N/A |
| Toggle backpack | <kbd>`</kbd></td> <td><Typography color="disabled">N/A</Typography></td> <td><Typography color="disabled">N/A</Typography></td> </tr> <tr> <td>Equip/unequip tools</td> <td><kbd>0</kbd>-<kbd>9</kbd></td> <td>Swap between tools using front‑left and front‑right triggers (`Enum.KeyCode.ButtonL1\|ButtonL1` and `Enum.KeyCode.ButtonR1\|ButtonR1`)</td> <td>Tap on-screen tool icons</td> </tr> <tr> <td>Use equipped tool</td> <td>Click left mouse button</td> <td>Back‑right trigger (`Enum.KeyCode.ButtonR2\|ButtonR2`)</td> <td>Tap on screen</td> </tr> <tr> <td>Drop equipped tool</td> <td><kbd>Backspace</kbd></td> <td><Typography color="disabled">N/A</Typography></td> <td><Typography color="disabled">N/A</Typography></td> </tr> <tr> <td>Toggle **UI selection** mode&sup1;</td> <td><kbd>&#92;</kbd></td> <td><kbd>Select</kbd> button (`Enum.KeyCode.ButtonSelect\|ButtonSelect`)</td> <td><Typography color="disabled">N/A</Typography></td> </tr> <tr> <td>Navigate among interactive UI elements while in **UI&nbsp;selection** mode</td> <td><kbd>↑</kbd> <kbd>↓</kbd> <kbd>←</kbd> <kbd>→</kbd><br /><kbd>W</kbd> <kbd>S</kbd> <kbd>A</kbd> <kbd>D</kbd></td> <td>Primary thumbstick (`Enum.KeyCode.Thumbstick1\|Thumbstick1`) or D‑pad (`Enum.KeyCode.DPadUp\|DPadUp`; `Enum.KeyCode.DPadDown\|DPadDown`; `Enum.KeyCode.DPadLeft\|DPadLeft`; `Enum.KeyCode.DPadRight\|DPadRight`)</td> <td></td> </tr> <tr> <td>Activate an interactive UI element while in **UI&nbsp;selection** mode</td> <td><kbd>Enter</kbd></td> <td>Back‑right trigger (`Enum.KeyCode.ButtonR2\|ButtonR2`)</td> <td></td> </tr> <tr> <td>Scroll up/down/left/right in selected `Class.ScrollingFrame` while in **UI&nbsp;selection** mode</td> <td><kbd>PageUp</kbd><br /><kbd>PageDown</kbd><br /><kbd>Home</kbd><br /><kbd>End</kbd></td> <td>Secondary thumbstick (`Enum.KeyCode.Thumbstick2\|Thumbstick2`)</kbd> |  |  |

*¹ If [[30 Official Roblox Docs/API Reference/Classes/GuiService#GuiNavigationEnabled|GuiNavigationEnabled]] is enabled (default)*

### Camera

| Action | Mouse/Keyboard | Gamepad | Touch |
| --- | --- | --- | --- |
| Move camera view around | While holding right mouse button | Move secondary thumbstick | Touch-drag around screen |
| Zoom camera in/out | Mouse scroll wheel<br><kbd>I</kbd>/<kbd>O</kbd> | Press secondary thumbstick | Pinch in/out on screen |
| Rotate camera left or right | <kbd>←</kbd> <kbd>→</kbd> | N/A | N/A |
| Toggle mouse lock² | <kbd>Shift</kbd> | N/A | N/A |

*² If [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#EnableMouseLockOption|EnableMouseLockOption]] is enabled (default)*

---
*Source: [Input](https://create.roblox.com/docs/input) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

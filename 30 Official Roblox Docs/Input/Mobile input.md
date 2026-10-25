---
title: "Mobile input"
description: "Explains Roblox support for mobile devices."
area: "30 Official Roblox Docs"
cluster: "Input"
source: "https://create.roblox.com/docs/input/mobile"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains Roblox support for mobile devices.*

The majority of Roblox sessions are played on mobile devices, so it's important to consider the mobile [[30 Official Roblox Docs/Input/Mobile input#Device orientation|device orientation]] and other [[30 Official Roblox Docs/Projects/Cross-platform development|cross‑platform]] factors when designing a game for a wide audience.

To simplify cross‑platform inputs, including player interaction with virtual buttons, Roblox provides the [[30 Official Roblox Docs/Input/Input Action System|Input Action System]] to define **actions** such as "jump," "sprint," or "shoot" and set up **bindings** for multiple hardware inputs to drive those actions.

Roblox also supports native mobile features like [[30 Official Roblox Docs/Input/Mobile input#Haptic feedback|haptic feedback]], touch gestures such as [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchSwipe|TouchSwipe]] and [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchPinch|TouchPinch]], or accelerometer and gyroscope functionality on [[30 Official Roblox Docs/API Reference/Classes/UserInputService#AccelerometerEnabled|AccelerometerEnabled]] and [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GyroscopeEnabled|GyroscopeEnabled]] devices.

## Input type detection

In cross‑platform development, it's important that you determine and respond to the [[30 Official Roblox Docs/API Reference/Classes/UserInputService#PreferredInput|PreferredInput]] type a player is using, normally to ensure that [[30 Official Roblox Docs/UI/User interface#UI objects|UI elements]] like on-screen buttons and menus work elegantly and support interaction across devices.

For example, a touch-enabled device assumes touch is the default input and that touch-buttons may appear for actions, but a player may choose to connect a bluetooth gamepad. In this case, touch remains a valid input, but you can assume the player wants to switch to the connected gamepad as the **primary** input type and possibly use touch as a backup input for on-screen UI.

See [[30 Official Roblox Docs/Input/Input#Input type detection|input type detection]] for more information.

## Device orientation

By default, Roblox games run in **landscape** mode, allowing the game to switch between landscape "left" and landscape "right" as the player's device rotates. However, games can be locked to a particular orientation if desired.

There are five different orientation modes, including two sensor-based modes and three locked modes.¹ Each of these can be set as the **default** orientation through [[30 Official Roblox Docs/API Reference/Classes/StarterGui#ScreenOrientation|StarterGui.ScreenOrientation]], accessible through Studio's [[30 Official Roblox Docs/Studio/Properties window|Properties]] window.

| Sensor Modes |  |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/ScreenOrientation\|LandscapeSensor]] | The default Roblox setting in which the game always appears in landscape mode (no portrait mode) and the device detects its physical orientation to ensure the game view is always oriented upward. |
| [[30 Official Roblox Docs/API Reference/Enums/ScreenOrientation\|Sensor]] | The device detects its physical orientation to ensure the game view is always oriented upward, switching between landscape and portrait mode as needed. |
| **Locked Modes** |  |
| [[30 Official Roblox Docs/API Reference/Enums/ScreenOrientation\|LandscapeLeft]] | On devices with a virtual home/nav bar, its touch region is at the bottom of the display. On devices with a physical home button, the home button is to the left of the display. |
| [[30 Official Roblox Docs/API Reference/Enums/ScreenOrientation\|LandscapeRight]] | On devices with a virtual home/nav bar, its touch region is at the bottom of the display. On devices with a physical home button, the home button is to the right of the display. |
| [[30 Official Roblox Docs/API Reference/Enums/ScreenOrientation\|Portrait]] | On devices with a virtual home/nav bar, its touch region is at the bottom of the display. On devices with a physical home button, the home button is below the display. |

*¹ Roblox does not include a "portrait upside-down" mode since many devices do not natively support that orientation*

<br><br>

Beyond the default [[30 Official Roblox Docs/API Reference/Classes/StarterGui#ScreenOrientation|StarterGui.ScreenOrientation]] property, you can change orientation during gameplay through [[30 Official Roblox Docs/API Reference/Classes/PlayerGui#ScreenOrientation|PlayerGui.ScreenOrientation]]. This can be useful when a game needs to enforce an orientation, such as locking the view to [[30 Official Roblox Docs/API Reference/Enums/ScreenOrientation|Portrait]] for a minigame.

The following code in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] sets the screen orientation to portrait after a short delay:

```lua title="LocalScript - Change Screen Orientation to Portrait"
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerGui = player.PlayerGui

task.wait(5)

playerGui.ScreenOrientation = Enum.ScreenOrientation.Portrait
```

Finally, you can detect changes to screen orientation during gameplay by listening to value changes on the [[30 Official Roblox Docs/API Reference/Classes/PlayerGui#CurrentScreenOrientation|PlayerGui.CurrentScreenOrientation]] property.

```lua title="LocalScript - Detect Screen Orientation Changes"
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerGui = player.PlayerGui

local function onOrientationChange()
	print("Orientation changed to", playerGui.ScreenOrientation)
end

playerGui:GetPropertyChangedSignal("ScreenOrientation"):Connect(onOrientationChange)
```

## Haptic feedback

Most mobile devices have motors built in to provide haptic feedback. Adding rumbles and vibrations can greatly enhance a player's experience and provide subtle feedback beyond visuals or audio.

Roblox supports haptics for haptic-capable devices including most iPhone, Pixel, and Samsung Galaxy devices. Haptic feedback is managed through [[30 Official Roblox Docs/API Reference/Classes/HapticEffect|HapticEffect]] instances which can be set to a specific [[30 Official Roblox Docs/API Reference/Classes/HapticEffect#Type|Type]] such as [[30 Official Roblox Docs/API Reference/Enums/HapticEffectType|GameplayCollision]] or [[30 Official Roblox Docs/API Reference/Enums/HapticEffectType|UIClick]].

Once a [[30 Official Roblox Docs/API Reference/Classes/HapticEffect|HapticEffect]] is in place, you can initiate it through the [[30 Official Roblox Docs/API Reference/Classes/HapticEffect#Play|Play()]] method, for instance:

```lua
local Workspace = game:GetService("Workspace")

local effect = Instance.new("HapticEffect")
effect.Type = Enum.HapticEffectType.GameplayExplosion
effect.Parent = Workspace

-- Play the haptic effect
effect:Play()
```

---
*Source: [Mobile input](https://create.roblox.com/docs/input/mobile) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

---
title: "Mouse and keyboard input"
description: "Explains Roblox support for computer mice and keyboards."
area: "30 Official Roblox Docs"
cluster: "Input"
source: "https://create.roblox.com/docs/input/mouse-and-keyboard"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains Roblox support for computer mice and keyboards.*

A large percentage of Roblox sessions are played on devices with a mouse and keyboard, so it's important to support these inputs when designing a game for a wide audience.

To simplify [[30 Official Roblox Docs/Projects/Cross-platform development|cross‑platform]] inputs, including mouse/keyboard, Roblox provides the [[30 Official Roblox Docs/Input/Input Action System|Input Action System]] to define **actions** such as "jump," "sprint," or "shoot" and set up **bindings** for multiple hardware inputs to drive those actions.

Roblox also supports general mouse/keyboard input through [[30 Official Roblox Docs/API Reference/Classes/UserInputService|UserInputService]] events like [[30 Official Roblox Docs/API Reference/Classes/UserInputService#InputBegan|InputBegan]] and [[30 Official Roblox Docs/API Reference/Classes/UserInputService#InputEnded|InputEnded]] and methods like [[30 Official Roblox Docs/API Reference/Classes/UserInputService#IsKeyDown|IsKeyDown()]] to check if a particular key is pressed on a keyboard.

## Input type detection

In cross‑platform development, it's important that you determine and respond to the [[30 Official Roblox Docs/API Reference/Classes/UserInputService#PreferredInput|PreferredInput]] type a player is using, normally to ensure that [[30 Official Roblox Docs/UI/User interface#UI objects|UI elements]] like on-screen buttons and menus work elegantly and support interaction across devices.

For example, a PC or laptop assumes mouse/keyboard is the default input, but a player may choose to connect a bluetooth gamepad. In this case, mouse/keyboard remains a valid input, but you can assume the player wants to switch to the connected gamepad as the **primary** input type.

See [[30 Official Roblox Docs/Input/Input#Input type detection|input type detection]] for more information.

## Generic mouse/key input

Beyond the [[30 Official Roblox Docs/Input/Input Action System|Input Action System]], you can capture mouse and keyboard inputs using [[30 Official Roblox Docs/API Reference/Classes/UserInputService|UserInputService]]. The following [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]], when placed in [[30 Official Roblox Docs/API Reference/Classes/StarterPlayerScripts|StarterPlayerScripts]], captures the began and ended phases of key and mouse clicks and prints the result to the [[30 Official Roblox Docs/Studio/Output|Output]] window.

```lua title="LocalScript - Output Key/Mouse Began and Ended"
local UserInputService = game:GetService("UserInputService")

local function onInputBegan(inputObject, processedEvent)
	-- Return if another script has already processed the input
	if processedEvent then return end

	print(inputObject.KeyCode.Name, "began!", inputObject.Position)
end

local function onInputEnded(inputObject, processedEvent)
	-- Return if another script has already processed the input
	if processedEvent then return end

	print(inputObject.KeyCode.Name, "ended!", inputObject.Position)
end

UserInputService.InputBegan:Connect(onInputBegan)
UserInputService.InputEnded:Connect(onInputEnded)
```

## Mouse icon

You can customize the appearance and behavior of a player's mouse icon within your game to create a cohesive style across all of your UI elements. This includes temporarily changing the player's mouse icon in specific circumstances, such as hovering over a button.

### Change Icon

You can change the player's mouse icon in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] by setting the [[30 Official Roblox Docs/API Reference/Classes/UserInputService#MouseIcon|MouseIcon]] property in [[30 Official Roblox Docs/API Reference/Classes/UserInputService|UserInputService]] to a custom Roblox asset ID. For example, the following [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] changes the player's default mouse icon to a circle with a blue dot in the middle.

```lua highlight="3"
local UserInputService = game:GetService("UserInputService")

UserInputService.MouseIcon = "rbxassetid://3400146391"
```

### Hide Icon

You can hide the player's mouse icon by setting the [[30 Official Roblox Docs/API Reference/Classes/UserInputService#MouseIconEnabled|UserInputService.MouseIconEnabled]] to `false` in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]]. For example, the following code switches the mouse icon from visible to invisible and back every two seconds.

```lua highlight="5,7"
local UserInputService = game:GetService("UserInputService")

while true do
	task.wait(2)
	UserInputService.MouseIconEnabled = false
	task.wait(2)
	UserInputService.MouseIconEnabled = true
end
```

### Lock Icon

You can lock the mouse icon's position to the screen using [[30 Official Roblox Docs/API Reference/Classes/UserInputService#MouseBehavior|UserInputService.MouseBehavior]] with a [[30 Official Roblox Docs/API Reference/Enums/MouseBehavior|Enum.MouseBehavior]] value of [[30 Official Roblox Docs/API Reference/Enums/MouseBehavior|LockCurrentPosition]] or [[30 Official Roblox Docs/API Reference/Enums/MouseBehavior|LockCenter]], then unlock it again with a value of [[30 Official Roblox Docs/API Reference/Enums/MouseBehavior|Default]].

If a player's mouse icon is locked in a position, [[30 Official Roblox Docs/API Reference/Classes/UserInputService#InputChanged|UserInputService.InputChanged]] still fires when the player moves the mouse, passing in the distance the mouse has moved. For example, the following code sample locks the player's mouse icon after one second, then Studio prints the mouse delta whenever the player moves their mouse.

```lua highlight="5"
local UserInputService = game:GetService("UserInputService")

task.wait(5)

UserInputService.MouseBehavior = Enum.MouseBehavior.LockCurrentPosition

UserInputService.InputChanged:Connect(function(inputObject)
	if inputObject.UserInputType == Enum.UserInputType.MouseMovement then
		print("Mouse delta is (" .. tostring(inputObject.Delta.X) .. ", " ..  tostring(inputObject.Delta.Y) .. ")")
	end
end)
```

---
*Source: [Mouse and keyboard input](https://create.roblox.com/docs/input/mouse-and-keyboard) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*

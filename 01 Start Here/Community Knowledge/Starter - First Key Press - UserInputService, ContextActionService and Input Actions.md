---
area: "01 Start Here"
cluster: "Start Here"
title: "First Key Press - UserInputService, ContextActionService and Input Actions"
tags: [roblox, community-knowledge, start-here, input, keyboard, gamepad, mobile]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/UserInputService
  - https://create.roblox.com/docs/reference/engine/classes/ContextActionService
  - https://create.roblox.com/docs/input/input-action-system
  - https://create.roblox.com/docs/reference/engine/classes/RemoteEvent
---
# First Key Press - UserInputService, ContextActionService and Input Actions

"Press F to toggle the flashlight", "press E to dash", "hold Shift to sprint": almost every game needs its own key. Roblox gives you three ways to read input, and beginners often pick the hardest one or forget that a third of players are on phones with no keyboard. This note shows the same action, **toggle a flashlight on F**, three ways, then how to tell the server about it.

Input is always read on the **client**: in a LocalScript in `StarterPlayerScripts` or `StarterCharacterScripts`. Servers have no keyboard.

## Way 1: UserInputService (quick and keyboard-only)

```lua
local UserInputService = game:GetService("UserInputService")

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
	if gameProcessedEvent then return end -- typing in chat or a TextBox
	if input.KeyCode == Enum.KeyCode.F then
		print("toggle flashlight")
	end
end)
```

- **`gameProcessedEvent`** is `true` when Roblox already used the key, for example while the player types in chat. Forgetting this check is the classic bug: the flashlight flickers every time someone types an "f" in a message.
- `InputEnded` fires on release, so "hold to sprint" is `InputBegan` (start) plus `InputEnded` (stop).
- Good for: quick tests, debug keys. Weakness: no phone button, gamepad mapping is up to you.

## Way 2: ContextActionService (adds a phone button for free)

```lua
local ContextActionService = game:GetService("ContextActionService")

local function onFlashlight(actionName, inputState, inputObject)
	if inputState == Enum.UserInputState.Begin then
		print("toggle flashlight")
	end
	return Enum.ContextActionResult.Sink
end

-- name, handler, create touch button?, then any number of inputs
ContextActionService:BindAction("Flashlight", onFlashlight, true,
	Enum.KeyCode.F, Enum.KeyCode.ButtonY)
ContextActionService:SetTitle("Flashlight", "Light")
```

- The third argument `true` creates an on-screen button on touch devices. `SetTitle` labels it; `SetPosition` moves it.
- **Binding is a stack:** the newest binding for a key wins. Returning `Sink` stops the input there; `Pass` lets the next handler (or Roblox's default) also have it.
- `UnbindAction("Flashlight")` removes it, for example when the tool is unequipped. This bind and unbind pattern is the main reason to prefer it over Way 1.

## Way 3: the Input Action System (set up in Studio, newest)

Roblox's cross-platform **Input Action System** lets you build bindings as instances instead of code:

1. In `ReplicatedStorage`, add a Folder `Inputs`, then an **InputContext** called `PlayContext`.
2. Inside it add an **InputAction** named `Flashlight` (its `Type` defaults to `Bool`, right for a button).
3. Inside the action add **InputBinding** children: one with `KeyCode` = `F`, one for a gamepad button, and one pointing at an on-screen `GuiButton` for touch.
4. Listen in a LocalScript:

```lua
local action = game.ReplicatedStorage.Inputs.PlayContext:WaitForChild("Flashlight")
action.Pressed:Connect(function()
	print("toggle flashlight")
end)
```

Contexts can be turned on and off (for example a `MenuContext` while a shop is open), which keeps controls from clashing as your game grows. For a first game, Way 2 is fine; for a game you plan to ship on phone and console, learn Way 3 early. More: [[Mobile Action Buttons - Input Action System and ContextActionService]].

## Telling the server

Toggling a light only on your own screen means nobody else sees it. Send a request; let the server do it:

```lua
-- LocalScript, inside the handler
game.ReplicatedStorage.Remotes.ToggleFlashlight:FireServer()
```

```lua
-- Script in ServerScriptService
local remote = game.ReplicatedStorage.Remotes.ToggleFlashlight
local last = {}
remote.OnServerEvent:Connect(function(player)
	if os.clock() - (last[player] or 0) < 0.3 then return end -- spam guard
	last[player] = os.clock()
	local light = player.Character and player.Character:FindFirstChild("Flashlight", true)
	if light then light.Enabled = not light.Enabled end
end)
```

The client asks; the server checks and acts. Same rule as [[First RemoteEvent - Button on the Client, Reward on the Server]].

## Picking keys

- Avoid keys Roblox reserves (Esc, F9 developer console, F11, F12, Print Screen) and keys already used for movement (WASD, Space, arrow keys).
- Common conventions players expect: **E** interact (it is also the default ProximityPrompt key), **F** flashlight or use, **Shift** sprint, **Q** ability, **R** reload. **Tab** already toggles the built-in player list, and **Shift** is the Shift Lock key when that option is enabled in `StarterPlayer`, so test for clashes.
- Show the key in your UI. Players never read a tutorial, but they read a "[F] Light" label.

## Related
[[00 START HERE - Top G Vault]] · [[Mobile Action Buttons - Input Action System and ContextActionService]] · [[First RemoteEvent - Button on the Client, Reward on the Server]] · [[Recipe - Sprint with Stamina Bar]] · [[Platform - Input Mode Detection - PreferredInput, TouchEnabled and Hybrid Devices]]

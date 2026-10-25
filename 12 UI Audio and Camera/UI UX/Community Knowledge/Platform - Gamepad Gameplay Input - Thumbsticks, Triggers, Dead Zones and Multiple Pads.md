---
area: "12 UI Audio and Camera"
cluster: "UI UX"
title: "Platform - Gamepad Gameplay Input - Thumbsticks, Triggers, Dead Zones and Multiple Pads"
tags: [roblox, community-knowledge, ui, platform, gamepad, console, input]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/input/gamepad
  - https://create.roblox.com/docs/reference/engine/classes/UserInputService
  - https://create.roblox.com/docs/reference/engine/classes/InputObject
  - https://create.roblox.com/docs/reference/engine/classes/InputBinding
---
# Platform - Gamepad Gameplay Input - Thumbsticks, Triggers, Dead Zones and Multiple Pads

Console players judge a game in the first few seconds of moving the camera and pulling a trigger. Sticks that drift, triggers that fire at a feather touch, or a camera that is either twitchy or sluggish all read as "bad port". This note covers the raw gamepad APIs and the small amount of math that makes analog input feel right, whether you use the Input Action System or `UserInputService` directly.

## Standard layout players expect (from the docs)

| Input | Common use |
|---|---|
| `ButtonA` | Confirm prompts/UI, or primary action such as jump |
| `ButtonB` | Cancel/back, or a secondary action like dodge or sprint |
| `Thumbstick1` | Move |
| `Thumbstick2` | Camera |
| `ButtonL2` / `ButtonR2` | Primary actions such as aim / shoot |
| `ButtonL1`, `ButtonR1`, `ButtonX`, `ButtonY` | Reload, target, inventory, map |

`ButtonStart` opens the Roblox menu and is reserved. By default the bumpers also cycle tools in the default backpack.

## Reading analog values
- Thumbsticks arrive as `InputObject`s with `KeyCode = Thumbstick1/2`; `Position.X` and `Position.Y` hold the stick deflection (roughly -1 to 1). They fire through `InputChanged`.
- Triggers (`ButtonL2`/`ButtonR2`) also report an analog value; community code reads it from `Position.Z` (0 released to 1 fully pulled). The InputObject docs do not spell this out, so confirm with a print in the Controller Emulator or a real pad.
- Poll instead of listening when you need the value every frame: `UserInputService:GetGamepadState(Enum.UserInputType.Gamepad1)` returns the last state of every input on that pad; `IsGamepadButtonDown(gamepad, keyCode)` checks one button.

## Dead zones done properly
Hardware sticks rarely rest at exactly zero. A radial dead zone with rescaling keeps small intentional moves usable:

```lua
local DEAD = 0.15 -- 15% of travel

local function applyDeadZone(v: Vector2): Vector2
	local m = v.Magnitude
	if m < DEAD then
		return Vector2.zero
	end
	-- rescale so output starts at 0 right after the dead zone and still reaches 1
	local scaled = math.min((m - DEAD) / (1 - DEAD), 1)
	return v.Unit * scaled
end
```
Avoid per-axis dead zones on the move stick; they make diagonals "snap" to cardinal directions.

## Feel tuning
- **Camera look:** apply a curve so precision aiming is possible. With the Input Action System set `InputBinding.ResponseCurve` (1 to 10, default 1) on the `Thumbstick2` binding of a Direction2D action; 2 to 3 is a good start. By hand: `out = v.Unit * (m ^ 2)` after the dead zone.
- **Respect the player's sensitivity:** `UserSettings():GetService("UserGameSettings").GamepadCameraSensitivity` is the player's own setting; multiply your custom camera speed by it.
- **Triggers as buttons:** use a hysteresis pair, for example press above 0.6 and release below 0.3. IAS does this with `PressedThreshold` / `ReleasedThreshold`.
- **Frame rate independence:** multiply look speed by delta time; see [[Platform - Frame Rate Caps and Frame-Rate-Independent Code]].

## Multiple and changing pads
- Pads appear as `Enum.UserInputType.Gamepad1` to `Gamepad8`. `GetConnectedGamepads()` lists them; `GamepadConnected` / `GamepadDisconnected` fire on changes.
- The micro-gamepad docs note `Gamepad1` is always the most preferred connected pad, so single-player code can read `Gamepad1`.
- `GetNavigationGamepads()` and `SetNavigationGamepad(pad, enabled)` control which pads may drive UI selection, useful if a second controller should not move menus.
- `GamepadSupports(pad, keyCode)` tells you if a button exists. TV remotes and some third-party pads lack thumbsticks or L3/R3, so never make a required action depend on a stick click.
- Disconnects mid-game: pause or open the menu when the last pad disconnects on a console session, and release held actions (aim, sprint) in the handler.

## Assist features worth adding for pads
- Aim assist or target lock in shooters and combat games (the stick is less precise than a mouse).
- Toggle options for hold actions (sprint, aim) for accessibility.
- Invert-Y option; `UserGameSettings:GetCameraYInvertValue()` exists for reading the player's Roblox setting.

## Test checklist
- [ ] No drift with hands off the pad (dead zone works).
- [ ] Slow stick pushes give slow, precise camera turns.
- [ ] Trigger does not fire when resting a finger on it.
- [ ] Same speed at 60 and 120+ FPS.
- [ ] Disconnect and reconnect the pad mid-action; nothing stays stuck.

## Related
[[UI UX - Hub]] · [[Gamepad and Console Design]] · [[Platform - Input Action Bindings Deep Dive - Thresholds, Modifiers, ResponseCurve and Scriptable]] · [[Custom Camera Systems in Luau]]

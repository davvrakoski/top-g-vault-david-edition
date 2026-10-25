---
area: "12 UI Audio and Camera"
cluster: "UI UX"
title: "Platform - Custom Touch Controls - DevTouchMovementMode, ControlModule and Thumbsticks"
tags: [roblox, community-knowledge, ui, platform, mobile, touch, thumbstick]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/enums/DevTouchMovementMode
  - https://create.roblox.com/docs/reference/engine/enums/DevTouchCameraMovementMode
  - https://create.roblox.com/docs/reference/engine/classes/GuiService
  - https://create.roblox.com/docs/reference/engine/classes/Player
  - https://create.roblox.com/docs/reference/engine/classes/InputBinding
  - https://devforum.roblox.com/t/how-to-hide-mobile-controls/3603927
  - https://devforum.roblox.com/t/detecting-mobile-stick-movement/584094
  - https://devforum.roblox.com/t/2455306
---
# Platform - Custom Touch Controls - DevTouchMovementMode, ControlModule and Thumbsticks

The default Roblox touch controls (a stick bottom-left, jump bottom-right) are good enough for most games, and players already know them. You change them when the genre needs it: a 2D side-scroller, a top-down shooter with twin sticks, a car game with pedals, or a cutscene where nothing should be on screen. This note covers the four levels of control, from a property flip to a fully custom stick.

## Level 1: pick a built-in scheme
`StarterPlayer.DevTouchMovementMode` (Enum `DevTouchMovementMode`):

| Value | Behaviour |
|---|---|
| `UserChoice` (default) | Player picks in the Roblox settings menu |
| `DynamicThumbstick` | Stick appears where the thumb lands in the lower part of the screen; separate jump button |
| `ClickToMove` | Tap a spot and the character walks there |
| `Scriptable` | Default controls do nothing; you move the character yourself |
| `Thumbstick`, `DPad`, `Thumbpad` | Deprecated, do not use |

`StarterPlayer.DevTouchCameraMovementMode`: `UserChoice`, `Classic` (no auto-rotate), `Follow` (camera swings behind as you strafe), `Orbital` (fixed height, orbit around the player). Players' own choices are visible to LocalScripts through `UserGameSettings.TouchMovementMode` and `TouchCameraMovementMode`.

## Level 2: hide the default UI for a moment
`GuiService.TouchControlsEnabled = false` hides the touch controls and their UI (default `true`). It replaces the deprecated `UserInputService.ModalEnabled`. A DevForum thread on hiding mobile controls found this cleaner than disabling the control module, which in their case left players unable to move after re-enabling. Use it for cutscenes, photo modes and full-screen menus.

## Level 3: read or drive the default controls
The player scripts' `PlayerModule` exposes the control module (community-documented, not an Engine API page):

```lua
-- LocalScript in StarterPlayerScripts
local Players = game:GetService("Players")
local PlayerModule = require(Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"))
local controls = PlayerModule:GetControls()

local move = controls:GetMoveVector() -- current stick/WASD vector, camera-relative
controls:Disable() -- stop default movement input
controls:Enable()
```
DevForum answers use `GetMoveVector()` to read the mobile stick for custom characters. Treat this as an internal script surface: re-test after Roblox player-script updates, and note that forked copies of `DynamicThumbstick` reportedly assume the default character.

## Level 4: your own thumbstick
Set movement to `Scriptable` (or disable controls) and drive `Player:Move(direction, relativeToCamera)`. Track one finger by its `InputObject`, which stays the same object for the life of that touch:

```lua
-- LocalScript: minimal fixed-base thumbstick inside a Frame "StickZone" (left half of the screen)
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local zone: Frame = script.Parent.StickZone
local knob: Frame = zone.Knob
local RADIUS = 60 -- pixels of travel

local activeTouch: InputObject? = nil
local origin = Vector2.zero

local function inZone(p: Vector2): boolean
	local pos, size = zone.AbsolutePosition, zone.AbsoluteSize
	return p.X >= pos.X and p.Y >= pos.Y and p.X <= pos.X + size.X and p.Y <= pos.Y + size.Y
end

UserInputService.TouchStarted:Connect(function(touch, processed)
	if activeTouch or processed then return end
	local p = Vector2.new(touch.Position.X, touch.Position.Y)
	if inZone(p) then
		activeTouch, origin = touch, p
	end
end)

UserInputService.TouchMoved:Connect(function(touch)
	if touch ~= activeTouch then return end
	local delta = Vector2.new(touch.Position.X, touch.Position.Y) - origin
	if delta.Magnitude > RADIUS then delta = delta.Unit * RADIUS end
	knob.Position = UDim2.new(0.5, delta.X, 0.5, delta.Y)
	local v = delta / RADIUS
	Players.LocalPlayer:Move(Vector3.new(v.X, 0, v.Y), true)
end)

UserInputService.TouchEnded:Connect(function(touch)
	if touch ~= activeTouch then return end
	activeTouch = nil
	knob.Position = UDim2.fromScale(0.5, 0.5)
	Players.LocalPlayer:Move(Vector3.zero, true)
end)
```
Notes: `InputObject.Position` for touch already accounts for the GUI inset (docs). The `processed` flag is true when the touch began on a GUI button, which keeps your stick from stealing button taps. If you use the Input Action System, a Direction2D action with an `InputBinding.UIModifier` set to the stick zone is the documented way to restrict a touch binding to a screen region.

## Design rules
- Keep the stick bottom-left and the main action bottom-right; players' thumbs are trained.
- Add a small dead zone (about 10% of radius) so resting thumbs do not drift.
- Dynamic (spawn-where-you-touch) sticks suit phones; fixed sticks suit tablets where reach is longer.
- Always restore `TouchControlsEnabled` and `Move(Vector3.zero)` when your custom mode ends.

## Related
[[UI UX - Hub]] · [[Mobile Action Buttons - Input Action System and ContextActionService]] · [[Safe Areas, Thumb Zones and Console UI Navigation]] · [[Platform - Touch Gestures - Pinch, Pan, Swipe, Long Press and Tap-in-World]]

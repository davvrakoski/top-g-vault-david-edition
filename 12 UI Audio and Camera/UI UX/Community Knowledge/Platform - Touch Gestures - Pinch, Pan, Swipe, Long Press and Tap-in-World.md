---
area: "12 UI Audio and Camera"
cluster: "UI UX"
title: "Platform - Touch Gestures - Pinch, Pan, Swipe, Long Press and Tap-in-World"
tags: [roblox, community-knowledge, ui, platform, mobile, touch, gestures]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/UserInputService
  - https://create.roblox.com/docs/input/mobile
  - https://create.roblox.com/docs/performance-optimization/test-on-hardware
---
# Platform - Touch Gestures - Pinch, Pan, Swipe, Long Press and Tap-in-World

Gestures are how phone players expect to zoom a map, flick through a shop or inspect an item. Roblox fires ready-made gesture events from `UserInputService`, so you rarely need to do finger math yourself. The catch is that the default camera already uses drag and pinch, so custom gestures must be planned around it.

## The gesture events (all on UserInputService)

| Event | Parameters | Good for |
|---|---|---|
| `TouchTap` | `touchPositions, gameProcessedEvent` | Any tap, on UI or world |
| `TouchTapInWorld` | `position: Vector2, processedByUI` | Tap-to-select units, tap-to-place; fires only when the tap hits the 3D world |
| `TouchLongPress` | `touchPositions, state, gameProcessedEvent` | Inspect, context menu, "hold to sell" |
| `TouchPan` | `touchPositions, totalTranslation, velocity, state, gameProcessedEvent` | Dragging a map, scrolling a custom carousel |
| `TouchPinch` | `touchPositions, scale, velocity, state, gameProcessedEvent` | Zoom a map/scope/build camera |
| `TouchRotate` | `touchPositions, rotation, velocity, state, gameProcessedEvent` | Rotate a placed object in build mode |
| `TouchSwipe` | `swipeDirection: SwipeDirection, numberOfTouches, gameProcessedEvent` | Flick between pages, dodge |
| `TouchDrag` | `dragDirection, numberOfTouches, gameProcessedEvent` | Detect the **start** of a directional drag before it becomes a swipe (docs: e.g. sliding a row to reveal actions) |
| `TouchStarted` / `TouchMoved` / `TouchEnded` | `touch: InputObject, gameProcessedEvent` | Raw per-finger tracking |
| `PointerAction` | `wheel, pan, pinch, gameProcessedEvent` | Trackpad/mouse-wheel equivalents on desktop |

All touch gesture events only fire while the Roblox window has focus. Device motion is separate: `AccelerometerEnabled`, `GyroscopeEnabled`, `GetDeviceRotation()` and `DeviceRotationChanged` for tilt controls.

## Always respect gameProcessedEvent
`gameProcessedEvent` is true when the touch was consumed by UI (a button, a scrolling frame) or core scripts. If you ignore it, pinching inside your shop's ScrollingFrame also zooms the camera behind it.

## Recipe: pinch-to-zoom on a map camera

```lua
-- LocalScript: pinch zoom for a top-down map view (camera is Scriptable while the map is open)
local UserInputService = game:GetService("UserInputService")

local MIN_H, MAX_H = 40, 400
local height = 150
local startHeight = height

UserInputService.TouchPinch:Connect(function(_positions, scale, _velocity, state, processed)
	if processed or not mapOpen() then return end
	if state == Enum.UserInputState.Begin then
		startHeight = height
	elseif state == Enum.UserInputState.Change and scale > 0 then
		-- fingers apart (scale > 1) means zoom in, so divide
		height = math.clamp(startHeight / scale, MIN_H, MAX_H)
	end
end)
```
This assumes `scale` is measured from the start of the gesture (unverified in docs wording; check in a quick test by printing `scale`). `mapOpen()` is your own check.

## Recipe: tap-to-select in the world

```lua
local camera = workspace.CurrentCamera
UserInputService.TouchTapInWorld:Connect(function(pos, processedByUI)
	if processedByUI then return end
	local ray = camera:ViewportPointToRay(pos.X, pos.Y)
	local hit = workspace:Raycast(ray.Origin, ray.Direction * 500)
	if hit then selectTarget(hit.Instance) end
end)
```
`selectTarget` is yours. The docs do not say whether this `position` includes the top-bar inset; if your selection lands a few pixels off on notched phones, switch to `camera:ScreenPointToRay` (inset-aware) (unverified which one matches).

## Conflicts with the default camera
- One-finger drag on empty screen rotates the default camera, and pinch zooms it. If your gesture needs those, switch the camera to `Scriptable` for that mode (map, build, photo) and give it back afterwards.
- Swipes and pans overlap: a pan becomes a swipe if released fast. Decide per screen which one you listen to.
- The dynamic thumbstick owns the lower-left area; do not put swipe zones there.
- The docs' hardware testing guide lists "pinch and swipe don't conflict with gameplay controls" as a real-device check. Emulators with a mouse cannot test two-finger gestures well.

## Checklist
- [ ] Every gesture handler returns early on `gameProcessedEvent` / `processedByUI`.
- [ ] Each gesture has a non-gesture alternative (buttons, gamepad bumpers, mouse wheel) for other devices.
- [ ] Camera ownership is switched while custom gestures are active and restored after.
- [ ] Tested on a physical phone with two fingers.

## Related
[[UI UX - Hub]] · [[Platform - Custom Touch Controls - DevTouchMovementMode, ControlModule and Thumbsticks]] · [[Custom Camera Systems in Luau]] · [[UIDragDetector Sliders and Drag-and-Drop Inventory]]

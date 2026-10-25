---
area: "12 UI Audio and Camera"
cluster: "UI UX"
title: "Platform - Input Mode Detection - PreferredInput, TouchEnabled and Hybrid Devices"
tags: [roblox, community-knowledge, ui, platform, input, cross-platform]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/UserInputService
  - https://create.roblox.com/docs/reference/engine/enums/PreferredInput
  - https://create.roblox.com/docs/input
  - https://create.roblox.com/docs/input/micro-gamepad
  - https://devforum.roblox.com/t/full-release-introducing-preferredinput-and-improved-touch-capabilities/3750890
---
# Platform - Input Mode Detection - PreferredInput, TouchEnabled and Hybrid Devices

Every cross-platform HUD has one switch at its heart: "which controls is this player using right now?". Get it wrong and a tablet player with a Bluetooth controller sees touch buttons covering the screen, or a touchscreen laptop user gets phone controls. Roblox now has one property built for this question, `UserInputService.PreferredInput`, plus several older ones that answer narrower questions. This note says which to use for what.

## The APIs and what each one really answers

| API | Answers | Use it for |
|---|---|---|
| `UserInputService.PreferredInput` | Which scheme is the player most likely using as their **primary** input | HUD mode, button prompts, glyphs, touch-button visibility |
| `TouchEnabled` | Can touch events be used here | Whether to listen to `TouchStarted` etc. Not for picking UI |
| `TouchScreenEnabled` | Does the device physically have a touch screen | Rare; the docs say `TouchEnabled` may be `false` on some touch-capable Windows hardware to avoid mobile-style controls, while this one reflects true capability |
| `KeyboardEnabled`, `MouseEnabled`, `GamepadEnabled` | Is that hardware present | Availability checks |
| `GetLastInputType()` / `LastInputTypeChanged` | The very last input event's type | Advanced schemes only; it flickers (any mouse nudge) and can report odd values like `TextInput` |
| `VREnabled` | Is a headset active | Branch to a VR UI before anything else |

`PreferredInput` values (Enum `PreferredInput`): `KeyboardAndMouse`, `Gamepad`, `Touch`, `MicroGamepad`. The docs' examples: a phone with nothing connected is `Touch`; a phone with a Bluetooth keyboard and mouse is `KeyboardAndMouse`; a tablet with a Bluetooth gamepad is `Gamepad`; an Xbox or PlayStation where the player last touched a connected keyboard is `KeyboardAndMouse`.

Two caveats from the docs:
- `MicroGamepad` (TV remotes) is described as a future value that is **not currently set**; detect remotes with `GamepadSupports` instead (see [[Platform - TV Remotes and Micro Gamepads - Android TV]]).
- The DevForum announcement (first posted June 2025, full release noted October 14, 2025) says `KeyboardEnabled`, `GamepadEnabled`, `TouchEnabled` and `LastInputType` are not being deprecated. They still answer "is it available", while `PreferredInput` answers "is it primary".

## One input-mode module, read everywhere

Put the decision in one ModuleScript so every UI piece agrees:

```lua
-- ReplicatedStorage/InputMode (ModuleScript, used from LocalScripts)
local UserInputService = game:GetService("UserInputService")

local InputMode = {}
local listeners: {(string) -> ()} = {}
local current = ""

local function resolve(): string
	if UserInputService.VREnabled then
		return "VR"
	end
	local p = UserInputService.PreferredInput
	if p == Enum.PreferredInput.Gamepad or p == Enum.PreferredInput.MicroGamepad then
		return "Gamepad"
	elseif p == Enum.PreferredInput.Touch then
		return "Touch"
	end
	return "KeyboardMouse"
end

local function refresh()
	local mode = resolve()
	if mode == current then return end
	current = mode
	for _, fn in listeners do
		task.spawn(fn, mode)
	end
end

function InputMode.get(): string
	return current
end

function InputMode.onChanged(fn: (string) -> ())
	table.insert(listeners, fn)
	task.spawn(fn, current)
end

UserInputService:GetPropertyChangedSignal("PreferredInput"):Connect(refresh)
refresh()

return InputMode
```

Then a HUD script does `InputMode.onChanged(function(mode) touchButtons.Visible = mode == "Touch" end)`.

## Hybrid devices to keep in mind
- **Tablet + controller:** gamepad becomes primary; hide touch buttons but keep on-screen UI tappable as a backup (the docs call touch a valid backup input).
- **Phone + keyboard/mouse:** treat as desktop; show key hints.
- **Console + keyboard:** possible; show key hints only after the player uses the keyboard.
- **Touchscreen laptops and Windows handhelds:** the case where `TouchEnabled` behaviour changed over time. Never pick UI from `TouchEnabled` alone.
- **Mouse + gamepad at once** (gyro or Joy-Con style setups): `PreferredInput` picks one; a commenter on the announcement flagged this. Accept both inputs in gameplay even if the HUD shows only one set of hints.

## Pitfalls
- Reading the mode once at startup. Players plug in controllers mid-session; always listen for changes.
- Switching UI on `LastInputTypeChanged`: a laptop user resting a hand on the trackpad makes your prompts flicker.
- Hiding touch buttons when a gamepad connects but forgetting to re-show them when it disconnects (`PreferredInput` handles this if you listen to it).
- Forgetting VR: a headset player also has controllers, so check `VREnabled` before the gamepad branch.

## Test
Device Emulator phone profile, then connect the Controller Emulator mid-play: touch buttons must hide and glyphs must swap within a frame or two. Disconnect it: they must come back.

## Related
[[UI UX - Hub]] · [[Safe Areas, Thumb Zones and Console UI Navigation]] · [[Mobile Action Buttons - Input Action System and ContextActionService]] · [[UI breaks on phone - gamepad]]

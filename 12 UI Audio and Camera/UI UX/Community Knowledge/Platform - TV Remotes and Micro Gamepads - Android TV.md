---
area: "12 UI Audio and Camera"
cluster: "UI UX"
title: "Platform - TV Remotes and Micro Gamepads - Android TV"
tags: [roblox, community-knowledge, ui, platform, tv, remote, gamepad]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/input/micro-gamepad
  - https://create.roblox.com/docs/reference/engine/enums/PreferredInput
  - https://create.roblox.com/docs/reference/engine/classes/UserInputService
---
# Platform - TV Remotes and Micro Gamepads - Android TV

Some Roblox players sit in front of a smart TV holding a remote with arrows, a centre button and a back button, and nothing else. Roblox calls these **micro gamepads**. Most games are unplayable with one because they assume two sticks. You probably will not design a whole game around a remote, but your menus, lobby and shop should work with one, and simple genres (quiz, idle, tycoon management) can be fully remote-friendly.

## What a remote sends today
Micro gamepads appear as `Gamepad1` to `Gamepad8` like any pad. The docs describe raw remote keycodes (`ButtonUp`, `ButtonDown`, `ButtonLeft`, `ButtonRight`, `ButtonCenter`, `ButtonBack`) but say that for now the events **map to legacy gamepad keycodes** before your code sees them:

| Remote key | Context | Arrives as | Common use |
|---|---|---|---|
| Center | everywhere | `ButtonA` | Select / jump |
| Back | everywhere | `ButtonB` | Back, dismiss |
| Arrows | menus, selection mode, virtual cursor | `DPadUp/Down/Left/Right` | Move focus |
| Up/Down | gameplay with Classic camera | `Thumbstick1` | Walk |
| Left/Right | gameplay with Classic camera | `Thumbstick2` | Turn camera |
| All arrows | gameplay with Follow camera | `Thumbstick1` | Walk with auto-rotating camera |

The docs warn not to identify a remote from these legacy codes alone, because a full controller sends the same ones.

## Detecting a remote
`PreferredInput.MicroGamepad` exists but the docs call it a future API that is not yet set. Until then, check capabilities of the preferred pad (`Gamepad1` is always the most preferred connected pad):

```lua
local UserInputService = game:GetService("UserInputService")

local function isLimitedPad(): boolean
	local pad = Enum.UserInputType.Gamepad1
	if not UserInputService:GetGamepadConnected(pad) then
		return false
	end
	return not UserInputService:GamepadSupports(pad, Enum.KeyCode.Thumbstick1)
		and not UserInputService:GamepadSupports(pad, Enum.KeyCode.Thumbstick2)
end

local function isTvRemote(): boolean
	return isLimitedPad() and UserInputService:GamepadSupports(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonCenter)
end
```
Put these in your input-mode module and reuse them everywhere instead of re-checking per feature. Re-check on `GamepadConnected`/`GamepadDisconnected`.

## Making the game remote-friendly
1. **Treat it as a selection-only device.** Every screen must work with four arrows, centre and back. No virtual cursor (four arrows are too slow for pointing).
2. **One action per button in menus.** Centre confirms, Back goes back. No "hold X" or chord actions.
3. **Visible focus** at all times, and **focus memory** when menus reopen (see [[Platform - Gamepad Menu Recipes - Custom Highlights, Focus Memory and Navigation Sounds]]).
4. **Branch actions by device**, not by key. The docs' pattern: a `ConfirmOrJump` action on `ButtonA` calls "activate focused item" when a limited pad is preferred, and "jump" otherwise. Same for `BackOrCancel` on `ButtonB`.
5. **Simplify gameplay** when `isLimitedPad()` is true: auto-run, auto-aim, larger hitboxes, or a "menu-driven" mode for management games.
6. **TV layout:** large controls, generous spacing, safe margins (10-foot rules from the console guidelines apply).

With CAS, return `Enum.ContextActionResult.Pass` for states you do not handle and `Sink` once handled, as the docs' example does, so other bindings still work.

## Testing in Studio
The docs give a direct path: enable **Device Emulator**, choose the **Android TV** device (renders a 1920x1080 viewport and enables a virtual TV remote on `Gamepad1`), then in the **Controller Emulator** pick **TV Remote** (only listed while Android TV is selected). Drive it from the keyboard; **Edit mappings** changes the keys. Confirm `InputBegan`/`InputChanged` and your action events fire. Test on a physical remote when you can.

## Related
[[UI UX - Hub]] · [[Platform - Input Mode Detection - PreferredInput, TouchEnabled and Hybrid Devices]] · [[Gamepad and Console Design]] · [[Device, Network and Controller Simulation Test Pass]]

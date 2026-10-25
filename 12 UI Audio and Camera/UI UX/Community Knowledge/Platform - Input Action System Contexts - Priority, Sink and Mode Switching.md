---
area: "12 UI Audio and Camera"
cluster: "UI UX"
title: "Platform - Input Action System Contexts - Priority, Sink and Mode Switching"
tags: [roblox, community-knowledge, ui, platform, input, input-action-system]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/input/input-action-system
  - https://create.roblox.com/docs/reference/engine/classes/InputContext
  - https://create.roblox.com/docs/reference/engine/classes/InputAction
  - https://devforum.roblox.com/t/input-actions-stop-listening-to-released-input-when-toggled-off-then-back-on/4019333
  - https://devforum.roblox.com/t/studio-beta-input-action-manager/4737890
---
# Platform - Input Action System Contexts - Priority, Sink and Mode Switching

The Input Action System (IAS) lets one action ("Attack") be driven by a key, a trigger and a touch button. The part that makes or breaks a real game is **contexts**: which set of actions is live while the player is on foot, driving, in a shop or typing. Done right, a gamepad's A button jumps on foot, confirms in menus and does nothing while chatting, with no `if menuOpen then` checks scattered through your code. This note goes past the basics in [[Mobile Action Buttons - Input Action System and ContextActionService]].

## The three properties that matter

| `InputContext` property | Meaning |
|---|---|
| `Enabled` | Whole context on/off. Disabled contexts fire nothing. |
| `Priority` (int) | Higher priority contexts process input before lower ones. |
| `Sink` (bool) | When true, the keys **bound in this context** are not passed to lower-priority contexts. Contexts with the **same** priority still all receive the input. |

The important detail is in the docs' wording: Sink only blocks the KeyCodes that this context itself binds. A menu context with `Sink = true` that binds only `ButtonB` (back) will **not** block `ButtonR2` (attack) in the gameplay context below it. To stop attacks while a menu is open, you either disable the gameplay context or bind the same input in the menu context.

## A layout that scales

Docs recommendation: a folder `ReplicatedStorage/Inputs` holding the contexts, with at least one top-level gameplay context even in small games.

| Context | Priority | Sink | Enabled when |
|---|---|---|---|
| `PlayContext` | 1000 | false | Character alive, no vehicle |
| `VehicleContext` | 1000 | false | Seated in a vehicle (PlayContext off) |
| `MenuContext` | 2000 | true | Any full-screen menu open |
| `ModalContext` | 3000 | true | Confirm dialogs over menus |

Mutually exclusive modes (on foot vs vehicle) are simpler as an on/off swap at equal priority. Stacked layers (menus over gameplay) are where Priority and Sink earn their keep.

```lua
-- LocalScript: one place that owns context state
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Inputs = ReplicatedStorage:WaitForChild("Inputs")

local contexts = {
	Play = Inputs:WaitForChild("PlayContext"),
	Vehicle = Inputs:WaitForChild("VehicleContext"),
	Menu = Inputs:WaitForChild("MenuContext"),
}

local onRelease: {() -> ()} = {} -- cleanup for held actions (sprint, charge, aim)

local function setMode(mode: "OnFoot" | "Vehicle")
	for _, release in onRelease do release() end
	contexts.Play.Enabled = mode == "OnFoot"
	contexts.Vehicle.Enabled = mode == "Vehicle"
end

local function setMenuOpen(open: boolean)
	if open then
		for _, release in onRelease do release() end
	end
	contexts.Menu.Enabled = open
	contexts.Play.Enabled = not open and contexts.Vehicle.Enabled == false
end

return { setMode = setMode, setMenuOpen = setMenuOpen, onRelease = onRelease }
```

## The held-input trap
A bug report on the DevForum describes an action that was disabled while its key was held and re-enabled later: it never received the `Released` event, so sprint stayed on. Roblox staff replied that actions intentionally do **not** resync to the current hardware state when re-enabled. The fix is in your code: whenever you disable a context, run "release" logic for every hold-style action in it (stop sprinting, cancel charge, drop aim). The `onRelease` table above exists for exactly this.

## Other practical notes
- Use `InputAction.Enabled` to grey out a single ability (cooldown, no ammo) without touching the context.
- `InputAction:GetState()` and the typed state properties (`BoolState`, `Direction2DState`, etc.) let a per-frame loop read analog actions without event spam.
- `Workspace.PlayerScriptsUseInputActionSystem` set to `Enabled` makes the default player scripts use IAS (the docs list it as the recommended first step in the Input Action Manager walkthrough). Test default movement after flipping it.
- The **Input Action Manager** (Window > Input, Studio beta at the time of writing) shows a matrix of actions by device and flags missing bindings (yellow) and duplicates inside one context (red). The DevForum beta post says instances made with it are safe to publish because IAS itself is fully released.
- Chat and text boxes: Roblox already routes typing away from gameplay binds for core chat, but your own `TextBox` focus should also enable a high-priority, sinking context or disable `PlayContext`.

## Checklist
- [ ] One owner script changes contexts; nothing else sets `Enabled`.
- [ ] Every hold action has a release hook called on context disable.
- [ ] Menus either disable gameplay contexts or sink the same keys.
- [ ] Each action has keyboard, gamepad and touch bindings (no yellow warnings).
- [ ] Back (`ButtonB`/Escape-equivalent) works in every menu context.

## Related
[[UI UX - Hub]] · [[Platform - Input Action Bindings Deep Dive - Thresholds, Modifiers, ResponseCurve and Scriptable]] · [[Combo Systems and Input Buffering]] · [[Vehicle Input Actions - Keyboard, Gamepad Triggers and Touch Pedals]]

---
area: "12 UI Audio and Camera"
cluster: "UI UX"
title: "Platform - Input Action Bindings Deep Dive - Thresholds, Modifiers, ResponseCurve and Scriptable"
tags: [roblox, community-knowledge, ui, platform, input, input-action-system, gamepad]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/InputBinding
  - https://create.roblox.com/docs/reference/engine/classes/InputAction
  - https://create.roblox.com/docs/input/input-action-system
---
# Platform - Input Action Bindings Deep Dive - Thresholds, Modifiers, ResponseCurve and Scriptable

An `InputBinding` is more than "this key". It carries the tuning that makes a trigger feel crisp, a thumbstick camera precise, a WASD diagonal not faster than straight, and a touch stick only react inside its zone. Most of these properties are ignored by tutorials, so games end up re-implementing them badly in Luau. This note lists each one with a concrete use.

## Property reference with uses

| Property | Applies to | What it does | Typical use |
|---|---|---|---|
| `KeyCode` | all | The hardware input | `ButtonR2`, `E`, `Thumbstick2` |
| `UIButton` | Bool | A `GuiButton` that drives the action | Your own styled touch button |
| `PressedThreshold` / `ReleasedThreshold` | Bool on analog inputs | Value above which the action counts as pressed / below which it is released. Pressed is clamped so it is never below Released | Trigger "fire" at 0.6, release at 0.3: a hysteresis band so a half-held trigger does not chatter |
| `PrimaryModifier` / `SecondaryModifier` | all | Extra keys that must be held (order does not matter; leave unset for none) | `LeftShift`+`E` for "drop item" vs `E` for "use" |
| `UIModifier` | all | A `GuiButton` that must be pressed for the binding to count | A touch region: the docs mention a dynamic thumbstick that only responds to touches starting in one UI area |
| `Up` / `Down` / `Left` / `Right` (+ `Forward` / `Backward`) | Direction1D/2D/3D | Composite keys that build a vector | WASD into a Direction2D move action |
| `ClampMagnitudeToOne` (default true) | Direction types | Normalises composite vectors longer than 1 | Keep on for movement (no fast diagonals); turn off for free-cam axes or raw wheel deltas |
| `Scale`, `Vector2Scale`, `Vector3Scale` | analog | Multiplies the incoming value | Touch drag deltas are large; the docs' camera example scales `TouchDelta` down |
| `ResponseCurve` (1 to 10, default 1) | Direction2D on `Thumbstick1`/`Thumbstick2` | Quadratic curve: small stick moves get finer, big moves still reach full speed | Camera look: try 2 to 3 |
| `PointerIndex` | pointer inputs | Which pointer/finger | Multi-touch schemes |
| `Type` | all | `Automatic` (hardware) or `Scriptable` (only `Fire()`) | Tutorials, AI, replays |
| `DisplayName` / `DisplayImage` | display | Custom text/image used by hint UI | Your own glyph art |

## Scriptable bindings: input from code
`InputAction:Fire()` is deprecated. The replacement is a child binding with `Type = Scriptable`, then `binding:Fire(state)`. The state must match the action type: boolean for Bool, number for Direction1D, `Vector2` for Direction2D. Calling `Fire` on an `Automatic` binding errors.

Uses:
- Tutorial "press to continue" that also accepts an on-screen arrow you animate.
- An accessibility "auto-fire" toggle that holds the Bool action for the player.
- Replays or bots that drive the same code path as players.

```lua
-- LocalScript: an auto-sprint accessibility toggle that reuses the Sprint action
local sprint = game.ReplicatedStorage.Inputs.PlayContext.Sprint
local scripted = sprint:WaitForChild("AutoSprintBinding") -- InputBinding, Type = Scriptable

local function setAutoSprint(on: boolean)
	scripted:Fire(on) -- fires Pressed / Released like a real key
end
```

## Runtime rebinding
Bindings are instances, so a settings menu can change `KeyCode` while the game runs, and `InputActionLabel` hints follow automatically (the `GetImageForKeyCode` docs mention labels updating when the player rebinds). A minimal capture flow:

```lua
local UserInputService = game:GetService("UserInputService")

local function captureKey(binding: InputBinding, onDone: (Enum.KeyCode) -> ())
	local conn
	conn = UserInputService.InputBegan:Connect(function(input, _processed)
		local t = input.UserInputType
		if t == Enum.UserInputType.Keyboard or t.Name:match("^Gamepad") then
			if input.KeyCode == Enum.KeyCode.Escape or input.KeyCode == Enum.KeyCode.ButtonStart then
				conn:Disconnect() -- reserved keys: cancel instead of binding
				return
			end
			binding.KeyCode = input.KeyCode
			conn:Disconnect()
			onDone(input.KeyCode)
		end
	end)
end
```

Save the chosen `KeyCode.Name` per action in the player's settings data and reapply on join. Keep separate keyboard and gamepad bindings so a rebind on one device never steals the other. Do not allow binding to Roblox-reserved inputs (Esc/Start menu, F9 console, F11, F12, PrintScreen).

## Pitfalls
- One binding per action. Every action needs a keyboard, a gamepad and a touch (`UIButton`) binding or console and phone players cannot use it.
- Tiny dead triggers: `PressedThreshold` near 0 makes resting fingers fire weapons. Start at 0.5.
- Using `ResponseCurve` on movement: it is meant for look/aim; walking with a strong curve feels sluggish.
- Fast diagonals after setting `ClampMagnitudeToOne = false` on a WASD move action.

## Related
[[UI UX - Hub]] · [[Platform - Input Action System Contexts - Priority, Sink and Mode Switching]] · [[Mobile Action Buttons - Input Action System and ContextActionService]] · [[Vehicle Input Actions - Keyboard, Gamepad Triggers and Touch Pedals]]

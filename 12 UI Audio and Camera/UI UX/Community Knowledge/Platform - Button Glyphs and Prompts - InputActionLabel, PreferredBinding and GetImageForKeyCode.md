---
area: "12 UI Audio and Camera"
cluster: "UI UX"
title: "Platform - Button Glyphs and Prompts - InputActionLabel, PreferredBinding and GetImageForKeyCode"
tags: [roblox, community-knowledge, ui, platform, gamepad, console, glyphs]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/input/input-action-system
  - https://create.roblox.com/docs/reference/engine/classes/InputActionLabel
  - https://create.roblox.com/docs/reference/engine/classes/UserInputService
  - https://create.roblox.com/docs/reference/engine/enums/GamepadType
  - https://create.roblox.com/docs/projects/cross-platform
---
# Platform - Button Glyphs and Prompts - InputActionLabel, PreferredBinding and GetImageForKeyCode

"Press E to open" on an Xbox is the fastest way to tell a console player your game was not made for them. Prompts must show the right glyph for the device in hand: a key on keyboard, a Cross/Circle on PlayStation, A/B on Xbox, nothing (or a tap icon) on touch. Roblox gives three tiers of help, from zero-code to fully custom.

## Tier 1: InputActionLabel (no code)
If your actions use the Input Action System, insert an `InputActionLabel` into any ScreenGui or SurfaceGui and set its `InputAction` property. It updates itself when the player switches devices or rebinds. Per the docs it picks what to draw in this order:
1. `DisplayImage` set on the matching child `InputBinding`.
2. Platform key images from `UserInputService:GetImageForKeyCode()`. Composite bindings with modifiers draw several icons joined by `+`.
3. `DisplayName` on the binding, drawn with the label's text style.
4. Platform key strings from `GetStringForKeyCode()`.
5. A placeholder icon if no action or binding exists.

So to brand your glyphs, set `DisplayImage` per binding; to rename an action ("Sprint" instead of "LeftShift"), set `DisplayName`.

## Tier 2: PreferredBinding (custom layout)
`InputAction.PreferredBinding` is a read-only property returning the child binding that best matches the player's current device. Listen for its change and build your own hint (animated, conditional, combined with other UI):

```lua
-- LocalScript: hint that follows the player's device for one action
local UserInputService = game:GetService("UserInputService")

local function bindHint(action: InputAction, icon: ImageLabel, text: TextLabel)
	local function refresh()
		local b = action.PreferredBinding
		icon.Visible, text.Visible = false, false
		if not b then return end
		if b.UIButton then
			return -- touch: the on-screen button itself is the hint
		end
		local img = (b.KeyCode ~= Enum.KeyCode.None) and UserInputService:GetImageForKeyCode(b.KeyCode) or ""
		if img ~= "" then
			icon.Image = img
			icon.Visible = true
		else
			text.Text = if b.DisplayName ~= "" then b.DisplayName
				else UserInputService:GetStringForKeyCode(b.KeyCode, Enum.KeyCodeStringFormat.Abbreviated)
			text.Visible = true
		end
	end
	action:GetPropertyChangedSignal("PreferredBinding"):Connect(refresh)
	refresh()
end
```

## Tier 3: the raw helpers
- `GetImageForKeyCode(keyCode)` returns Roblox's default icon for the **currently connected** gamepad family. The docs limit it to Xbox, PlayStation and Windows. Expect an empty result for keys without an image (letters, numbers) and fall back to text.
- `GetStringForKeyCode(keyCode, format)` returns the key label the player should actually press. It fixes non-QWERTY layouts (on AZERTY, `KeyCode.Q` is labelled `A`) and, for gamepads, returns platform names: on PlayStation `ButtonA` reads `ButtonCross`, `ButtonB` reads `ButtonCircle`, `ButtonStart` reads `ButtonOptions`; on Xbox `ButtonL1` reads `ButtonLB`, `ButtonR2` reads `ButtonRT`. That string makes a clean lookup key for your own glyph sprite sheet.
- `KeyCodeStringFormat.Abbreviated` gives short names (`LCtrl`, `Bksp`, `Esc`) that fit small key caps.
- `Enum.GamepadType` (`Unknown`, `PS4`, `PS5`, `XboxOne`) describes the connected pad; the docs say it is fixed to the native pad on consoles and otherwise follows the most recently connected pad. Prefer the helpers above, which already account for it.

## Custom glyph art from the string

```lua
local GLYPHS = { -- your own uploaded images, one per platform string
	ButtonA = "rbxassetid://0", ButtonCross = "rbxassetid://0",
	ButtonB = "rbxassetid://0", ButtonCircle = "rbxassetid://0",
	ButtonRT = "rbxassetid://0", ButtonR2 = "rbxassetid://0",
}
local function glyphFor(keyCode: Enum.KeyCode): string?
	return GLYPHS[UserInputService:GetStringForKeyCode(keyCode)]
end
```
Replace the zeros with your asset IDs; keep a text fallback for anything missing.

## Rules for prompts
- Never hard-code a key letter in a string; build prompts from the binding.
- Touch players get no key glyph. Make the button itself the prompt, or show a hand/tap icon.
- Keep glyph size at least the text cap height; on TVs scale both up together.
- When two devices could apply (controller on a laptop), follow `PreferredInput`, not the last key pressed.
- ProximityPrompts already swap `KeyboardKeyCode` / `GamepadKeyCode` hints; set both fields.

## Related
[[UI UX - Hub]] · [[Platform - Input Mode Detection - PreferredInput, TouchEnabled and Hybrid Devices]] · [[Custom ProximityPrompt UI]] · [[Gamepad and Console Design]]

---
area: "12 UI Audio and Camera"
cluster: "UI UX"
title: "Mobile Action Buttons - Input Action System and ContextActionService"
tags: [roblox, community-knowledge, ui, mobile, input, touch-controls]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/input/input-action-system
  - https://create.roblox.com/docs/input/mobile
  - https://create.roblox.com/docs/reference/engine/classes/InputBinding
  - https://create.roblox.com/docs/reference/engine/classes/ContextActionService
  - https://create.roblox.com/docs/reference/engine/classes/InputActionLabel
---
# Mobile Action Buttons - Input Action System and ContextActionService

Most Roblox players are on phones, and a combat or tool game without good touch buttons loses them in the first minute. There are now two official ways to make an on-screen button that does the same thing as a key: the newer **Input Action System** (InputContext / InputAction / InputBinding), where a binding can point at your own `UIButton`, and the older **ContextActionService** auto-generated touch buttons. This note shows both and the layout rules that make buttons usable.

## Option A: Input Action System (recommended for new work)

One action, many bindings, one handler:

```
StarterPlayerScripts
  CombatContext (InputContext)         Priority, Sink, Enabled
    Attack (InputAction, Type = Bool)
      KeyboardBinding (InputBinding)   KeyCode = MouseButton1
      GamepadBinding  (InputBinding)   KeyCode = ButtonR2
      TouchBinding    (InputBinding)   UIButton = HUD.AttackButton
```

```lua
local attack = script.Parent.CombatContext.Attack
attack.Pressed:Connect(function()
	startSwing()
end)
attack.Released:Connect(function()
	releaseCharge()
end)
```

Why it is better for mobile:

- The touch button is **your** `ImageButton`, styled like the rest of your HUD, linked through `InputBinding.UIButton`. The docs' sprint example does exactly this.
- `Pressed`/`Released` fire for `Bool` actions on state change; `StateChanged` fires for every type. Hold-to-charge works the same on all devices.
- Turn whole control sets on and off with `InputContext.Enabled` (for example a `VehicleContext` vs `OnFootContext`). `Priority` and `Sink` let a menu context block gameplay bindings while open.
- `InputActionLabel` shows the current key or glyph for an action automatically, which keeps tutorial prompts honest across keyboard and gamepad.
- Analog actions: `Direction1D` for throttles, `Direction2D` for aiming (`TouchDelta` with a `Scale` like 0.01 for camera look, per the docs).

## Option B: ContextActionService touch buttons

Older but still common, and quick for prototypes:

```lua
local CAS = game:GetService("ContextActionService")

local function onDodge(_, state: Enum.UserInputState)
	if state == Enum.UserInputState.Begin then
		dodge()
	end
	return Enum.ContextActionResult.Sink
end

CAS:BindAction("Dodge", onDodge, true, Enum.KeyCode.Q, Enum.KeyCode.ButtonB)
CAS:SetTitle("Dodge", "DODGE")
CAS:SetPosition("Dodge", UDim2.new(1, -170, 1, -150))
CAS:SetImage("Dodge", "rbxassetid://0000000000")
```

The third argument `true` creates a touch button on mobile only. `GetButton` returns it for extra styling. Downsides: the buttons live inside the default touch control frame, styling is limited, and positions near the jump button need manual tuning per screen.

## Layout rules for touch buttons

| Rule | Value |
|---|---|
| Minimum hit area | 44x44 px; primary attack 80-110 px |
| Placement | Right thumb arc around the jump button; most-used action closest to the thumb's rest point |
| Spacing | 8-12 px between buttons so thumbs don't hit two |
| Count | 3-5 visible buttons max; context buttons appear only when relevant (interact, reload) |
| Feedback | Press scale 0.92 + sound + haptic where available |
| Safe area | Keep inside the device safe area; avoid the top-left Roblox controls (`GuiService.TopbarInset`) |

- Show touch buttons only when the player is actually using touch. Check `UserInputService.PreferredInput` (or the last input type) and hide them when a controller connects to a phone or tablet.
- Make cooldowns visible on the button itself (radial fill or darkening plus a number), because touch players can't see a keyboard hotbar.
- Offer a "button size" and "edit layout" setting. Players with small or large hands will use it.

## Testing

- Studio device emulator for layout, then a real phone for thumb reach and multi-touch (move + attack + camera at the same time).
- Test with a gamepad connected to a phone: touch buttons should hide.
- Check that a menu context with `Sink` stops attacks firing through open menus.

## Related
[[UI UX - Hub]] · [[Safe Areas, Thumb Zones and Console UI Navigation]] · [[Vehicle Input Actions - Keyboard, Gamepad Triggers and Touch Pedals]] · [[UI breaks on phone - gamepad]] · [[Cross-Platform UI System]]

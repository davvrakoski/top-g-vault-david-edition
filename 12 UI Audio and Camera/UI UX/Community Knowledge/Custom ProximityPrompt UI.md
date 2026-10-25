---
area: "12 UI Audio and Camera"
cluster: "UI UX"
title: "Custom ProximityPrompt UI"
tags: [roblox, community-knowledge, ui, proximityprompt, interaction, billboardgui]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/ui/proximity-prompts
  - https://create.roblox.com/docs/reference/engine/classes/ProximityPrompt
  - https://create.roblox.com/docs/reference/engine/classes/ProximityPromptService
  - https://create.roblox.com/docs/reference/engine/classes/BillboardGui
---
# Custom ProximityPrompt UI

The default "E - Open" prompt is fine for prototypes but clashes with every art style. ProximityPrompts already solve the hard parts: range checks, line of sight, picking the prompt the camera faces, per-device keys and hold timers. Setting `Style = Custom` keeps all of that behaviour and lets you draw your own UI. This is one of the cheapest ways to make a game look less like a template.

## What stays built in

| Property / event | Purpose |
|---|---|
| `ActionText`, `ObjectText` | "Open" / "Crate" labels you render |
| `KeyboardKeyCode`, `GamepadKeyCode` | Keys per device |
| `HoldDuration` | Hold-to-confirm time (0 = tap) |
| `MaxActivationDistance`, `RequiresLineOfSight` | When it is visible |
| `Exclusivity` | `OnePerButton` shows only the prompt the camera points at; `AlwaysShow` shows all |
| `ClickablePrompt` | Allow clicking/tapping the prompt itself |
| `UIOffset` | Screen-space offset of the prompt UI |
| `PromptShown(inputType)` / `PromptHidden` | Build and remove your UI (LocalScript) |
| `PromptButtonHoldBegan` / `PromptButtonHoldEnded` | Drive the hold progress animation |
| `Triggered(player)` | Gameplay (server or client) |
| `ProximityPromptService.MaxPromptsVisible` | Global cap on visible prompts |

`PromptShown` passes a `ProximityPromptInputType` of `Keyboard`, `Gamepad` or `Touch`, so you can show the right glyph or a big tap button on mobile.

## Build it once for every prompt

Listen on `ProximityPromptService` in one LocalScript instead of putting a script in every prompt:

```lua
local PPS = game:GetService("ProximityPromptService")
local TweenService = game:GetService("TweenService")
local template = script.PromptTemplate -- a BillboardGui you designed

local active = {}

PPS.PromptShown:Connect(function(prompt: ProximityPrompt, inputType)
	if prompt.Style ~= Enum.ProximityPromptStyle.Custom then return end
	local gui = template:Clone()
	gui.Adornee = prompt.Parent
	gui.Frame.Action.Text = prompt.ActionText
	gui.Frame.Object.Text = prompt.ObjectText
	gui.Frame.Key.Text = if inputType == Enum.ProximityPromptInputType.Touch then "TAP"
		elseif inputType == Enum.ProximityPromptInputType.Gamepad then "X" -- swap for a glyph image
		else prompt.KeyboardKeyCode.Name
	gui.Parent = game.Players.LocalPlayer.PlayerGui

	local fill = gui.Frame.HoldBar.Fill
	local holdTween
	local c1 = prompt.PromptButtonHoldBegan:Connect(function()
		fill.Size = UDim2.fromScale(0, 1)
		holdTween = TweenService:Create(fill, TweenInfo.new(prompt.HoldDuration), { Size = UDim2.fromScale(1, 1) })
		holdTween:Play()
	end)
	local c2 = prompt.PromptButtonHoldEnded:Connect(function()
		if holdTween then holdTween:Cancel() end
		fill.Size = UDim2.fromScale(0, 1)
	end)
	active[prompt] = { gui = gui, conns = { c1, c2 } }
end)

PPS.PromptHidden:Connect(function(prompt)
	local entry = active[prompt]
	if not entry then return end
	for _, c in entry.conns do c:Disconnect() end
	entry.gui:Destroy()
	active[prompt] = nil
end)
```

Map gamepad keys to button images (Xbox and PlayStation differ) rather than text, using `UserInputService:GetImageForKeyCode` or your own glyph set.

## BillboardGui settings for prompts

- `AlwaysOnTop = true` so walls don't hide the label you are allowed to use (line of sight is checked by the prompt).
- Size in **offset** (for example 160x56 px) for a constant on-screen size, or scale for world-size labels.
- `LightInfluence = 0` so it doesn't dim at night.
- Keep text 18 px or larger; check on a phone.

## Mobile

Touch players can't press E. With a custom style, your UI has to provide the tap target: put a large `TextButton`/`ImageButton` (44 px or more) in the billboard and call `prompt:InputHoldBegin()` on press and `prompt:InputHoldEnd()` on release. The API reference says these methods exist exactly for triggering a customised prompt from a GUI button, and they also run the hold timer. Test this on a real phone: a custom UI without a button makes prompts unusable for touch players.

## Design rules

- One prompt visible at a time near clustered props (`Exclusivity = OnePerButton`).
- Use `HoldDuration` 0.5 to 1 s for destructive or costly actions (sell, delete, open paid crate), 0 for doors and pickups.
- Put the gameplay on the server: `Triggered` passes the player; validate distance and state there, never trust the client UI.
- Turn prompts off (`Enabled = false`) instead of leaving dead ones that do nothing.

## Related
[[UI UX - Hub]] · [[Gamepad and Console Design]] · [[Safe Areas, Thumb Zones and Console UI Navigation]] · [[TweenService UI Animation Recipes]]

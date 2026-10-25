---
area: "12 UI Audio and Camera"
cluster: "UI UX"
title: "Platform - Gamepad Menu Recipes - Custom Highlights, Focus Memory and Navigation Sounds"
tags: [roblox, community-knowledge, ui, platform, gamepad, console, navigation]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/GuiService
  - https://create.roblox.com/docs/reference/engine/classes/GuiObject
  - https://create.roblox.com/docs/reference/engine/classes/GuiBase2d
  - https://create.roblox.com/docs/reference/engine/classes/PlayerGui
  - https://create.roblox.com/docs/production/publishing/console-guidelines
  - https://create.roblox.com/docs/reference/engine/enums/HapticEffectType
---
# Platform - Gamepad Menu Recipes - Custom Highlights, Focus Memory and Navigation Sounds

The vault's safe-area note already covers the basics of gamepad selection (`Selectable`, `SelectedObject`, `SelectionGroup`, `NextSelection*`). This note is the polish layer that console players notice: a selection highlight that matches your art style, menus that remember where you were, a back button that always works, and soft sound/haptic ticks as focus moves. The console guidelines explicitly recommend audio feedback for selection and menu traversal.

## 1. Replace the default selection box
The default highlight is a generic outline. Two properties override it:
- `PlayerGui.SelectionImageObject`: one adornment for all of the player's UI.
- `GuiObject.SelectionImageObject`: an override for one element (a big card that needs a bigger glow).

The docs warn that the adornment overlays the selected object at the adornment's own `Size`, so size it with **scale** (for example `UDim2.fromScale(1.1, 1.1)` centred with `AnchorPoint = 0.5, 0.5` and `Position = UDim2.fromScale(0.5, 0.5)`) so it fits any button.

```lua
-- LocalScript: one branded highlight for every menu
local Players = game:GetService("Players")
local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")

local highlight = Instance.new("ImageLabel")
highlight.Name = "SelectionGlow"
highlight.BackgroundTransparency = 1
highlight.Image = "rbxassetid://0" -- your 9-slice glow frame
highlight.ScaleType = Enum.ScaleType.Slice
highlight.SliceCenter = Rect.new(16, 16, 48, 48)
highlight.AnchorPoint = Vector2.new(0.5, 0.5)
highlight.Position = UDim2.fromScale(0.5, 0.5)
highlight.Size = UDim2.new(1, 12, 1, 12)

playerGui.SelectionImageObject = highlight
```

## 2. Focus memory per menu
Players hate reopening a shop and being thrown back to the first tab. Store the last selected object per menu and restore it:

```lua
local GuiService = game:GetService("GuiService")
local lastFocus: {[Instance]: GuiObject} = {}

local function openMenu(menu: GuiObject, default: GuiObject)
	menu.Visible = true
	local target = lastFocus[menu]
	if not (target and target:IsDescendantOf(menu) and target.Visible) then
		target = default
	end
	GuiService.SelectedObject = target
end

local function closeMenu(menu: GuiObject)
	local sel = GuiService.SelectedObject
	if sel and sel:IsDescendantOf(menu) then
		lastFocus[menu] = sel
		GuiService.SelectedObject = nil
	end
	menu.Visible = false
end
```
If you do not know a sensible default, `GuiService:Select(menu)` asks the engine to pick a selectable, visible, on-screen descendant of `menu` for you.

## 3. A back button that always works
- Bind `ButtonB` in your menu input context (with `Sink`) to "close the top-most menu", never to gameplay while a menu is open.
- Keep a stack of open menus; Back pops one level and restores the previous menu's focus.
- On the root menu, Back closes the menu entirely and gives control back to gameplay.

## 4. Sounds and haptics on focus change
`GuiObject.SelectionGained` and `SelectionLost` fire per element, and `GuiBase2d.SelectionChanged` fires on containers. Hook one handler on the menu root rather than every button:

```lua
local SoundService = game:GetService("SoundService")
local tick = SoundService:WaitForChild("UI"):WaitForChild("FocusTick")

GuiService:GetPropertyChangedSignal("SelectedObject"):Connect(function()
	if GuiService.SelectedObject then
		tick:Play() -- keep it short (under 80 ms) and quiet
		playHaptic(Enum.HapticEffectType.UIHover) -- see the haptics note
	end
end)
```
Use `UIHover` for focus moves and `UIClick` for confirms; the enum descriptions say UIHover is for browsing without intent and UIClick is crisp confirmation. Let players turn both off.

## 5. Scroll lists and grids
- Make only the cells `Selectable`; make the ScrollingFrame and decorative frames non-selectable so focus does not land on containers.
- For long inventories, set `SelectionGroup = true` on the grid and the `SelectionBehavior*` edges to `Stop` so the stick cannot fall out of the grid by accident; open the side panel with a bumper instead.
- Check that the frame scrolls to keep the selected cell visible; if a layout breaks it, scroll manually from `SelectionGained` using `CanvasPosition`.
- Give tabs bumper shortcuts (`ButtonL1`/`ButtonR1`) so players do not have to travel across the whole screen; the console guidelines recommend shortcuts for essential actions.

## 6. Global switches to know
- `GuiService.GuiNavigationEnabled`: default controller GUI navigation on/off.
- `GuiService.AutoSelectGuiEnabled`: when on, the gamepad Select button (or Backslash) auto-selects a GUI; when off you must set `SelectedObject` yourself to start navigation.
- `GuiService.MenuIsOpen` and `MenuOpened`/`MenuClosed`: the Roblox core menu state; pause your own input handling while it is open.

## Checklist
- [ ] Branded `SelectionImageObject` sized with scale.
- [ ] Every menu restores its last focus.
- [ ] Back works on every screen and never triggers gameplay.
- [ ] Focus tick sound and optional haptic, both toggleable.
- [ ] No container ever receives selection.

## Related
[[UI UX - Hub]] · [[Safe Areas, Thumb Zones and Console UI Navigation]] · [[Gamepad and Console Design]] · [[9-Slice Panels and Buttons - SliceCenter and SliceScale]]

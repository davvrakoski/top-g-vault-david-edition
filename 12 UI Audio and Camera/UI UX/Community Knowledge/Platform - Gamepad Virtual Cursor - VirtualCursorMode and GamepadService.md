---
area: "12 UI Audio and Camera"
cluster: "UI UX"
title: "Platform - Gamepad Virtual Cursor - VirtualCursorMode and GamepadService"
tags: [roblox, community-knowledge, ui, platform, gamepad, console, cursor]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/GamepadService
  - https://create.roblox.com/docs/reference/engine/enums/VirtualCursorMode
  - https://create.roblox.com/docs/reference/engine/classes/StarterGui
  - https://create.roblox.com/docs/production/publishing/console-guidelines
  - https://create.roblox.com/docs/input/micro-gamepad
---
# Platform - Gamepad Virtual Cursor - VirtualCursorMode and GamepadService

Roblox offers two out-of-the-box ways for a controller to use UI: **directional selection** (focus jumps from button to button) and a **virtual cursor** (a pointer moved by the stick, like a mouse). The console guidelines name both. Directional selection is best for lists and menus; the cursor rescues screens that were built for a mouse and are hard to navigate one step at a time: dense skill trees, world maps, drag-and-drop inventories, or UI made by a plugin you do not control.

## The switches

| API | Type | What it does |
|---|---|---|
| `StarterGui.VirtualCursorMode` | `Enum.VirtualCursorMode`: `Default`, `Disabled`, `Enabled` | Game-wide opt-in. The GamepadService docs say to set it to `Enabled` to allow the gamepad cursor in your game |
| `GamepadService.GamepadCursorEnabled` | boolean, read-only | Whether the cursor is on right now |
| `GamepadService:EnableGamepadCursor(guiObject)` | method | Turns the cursor on (or moves it if already on). Pass a GuiObject to start the cursor on it, or `nil` for the default position. Calling it with **no argument errors**; a non-GuiObject argument errors and no cursor appears |
| `GamepadService:DisableGamepadCursor()` | method | Turns it off if on |

## Pattern: cursor only where it helps
Keep normal directional selection for most UI and switch to the cursor for one screen:

```lua
-- LocalScript: use the virtual cursor only while the world map is open
local GamepadService = game:GetService("GamepadService")
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")

local map: Frame = script.Parent.WorldMap
local centerPin: GuiObject = map.CenterPin

local function openMap()
	map.Visible = true
	if UserInputService.PreferredInput == Enum.PreferredInput.Gamepad then
		GuiService.SelectedObject = nil -- hand control from selection to the cursor
		GamepadService:EnableGamepadCursor(centerPin)
	end
end

local function closeMap()
	if GamepadService.GamepadCursorEnabled then
		GamepadService:DisableGamepadCursor()
	end
	map.Visible = false
end

GamepadService:GetPropertyChangedSignal("GamepadCursorEnabled"):Connect(function()
	-- player toggled the cursor off from their side: close the map or fall back to selection
	if map.Visible and not GamepadService.GamepadCursorEnabled then
		closeMap()
	end
end)
```
Remember `StarterGui.VirtualCursorMode = Enabled` must be set for the cursor to be available at all.

## When to choose which

| Screen | Better choice | Why |
|---|---|---|
| Main menu, settings, shop list | Directional selection | Predictable, fast with D-pad |
| Grid inventory | Selection with `SelectionGroup` | Cells are uniform |
| World map with free-placed pins | Cursor | Pins are irregular; selection order guesses wrong |
| Drag-and-drop crafting | Cursor (or a dedicated "pick up / place" selection flow) | Drag needs a pointer |
| Mouse-built third-party UI | Cursor as a stopgap | Cheaper than rewriting, but rewrite later |

## Pitfalls
- Leaving the cursor on after closing the screen: the stick no longer moves the character the way players expect. Always disable on close.
- Mixing both at once: clear `GuiService.SelectedObject` when enabling the cursor so two focus systems do not fight.
- Tiny targets: a stick-driven cursor is far less precise than a mouse. Keep cursor targets at least as large as touch targets (see [[Platform - Touch Target Sizes and Mobile-First HUD Layout]]).
- TV remotes: the micro-gamepad docs note remote arrows map to D-pad events in "menu, selection mode, or virtual cursor" contexts. A cursor driven by four arrow keys is slow; prefer selection for remote-heavy platforms.
- Do not rely on hover-only tooltips; show info for the selected or pointed item on a fixed panel instead.

## Test
Controller Emulator in Studio, then a real pad: open and close the cursor screen five times quickly, unplug the pad while it is open, and check that gameplay controls return normally.

## Related
[[UI UX - Hub]] · [[Platform - Gamepad Menu Recipes - Custom Highlights, Focus Memory and Navigation Sounds]] · [[Gamepad and Console Design]] · [[UIDragDetector Sliders and Drag-and-Drop Inventory]]

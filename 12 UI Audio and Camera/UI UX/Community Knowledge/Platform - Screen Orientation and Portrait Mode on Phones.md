---
area: "12 UI Audio and Camera"
cluster: "UI UX"
title: "Platform - Screen Orientation and Portrait Mode on Phones"
tags: [roblox, community-knowledge, ui, platform, mobile, orientation, portrait]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/input/mobile
  - https://create.roblox.com/docs/reference/engine/enums/ScreenOrientation
  - https://create.roblox.com/docs/reference/engine/classes/PlayerGui
  - https://create.roblox.com/docs/reference/engine/classes/StarterGui
  - https://create.roblox.com/docs/production/publishing/adaptive-design
---
# Platform - Screen Orientation and Portrait Mode on Phones

Roblox games run in landscape by default, which suits third-person action. But some genres play better held upright with one hand: idle and clicker games, card and puzzle games, social apps, minigames inside a bigger game. Roblox lets you pick or switch orientation per game and even mid-session. Doing it well means designing two layouts or committing to one and locking it.

## The five modes (`Enum.ScreenOrientation`)

| Mode | Kind | Behaviour |
|---|---|---|
| `LandscapeSensor` | sensor (default) | Always landscape; flips between left/right as the phone rotates so the view stays upright |
| `Sensor` | sensor | Follows the device: landscape or portrait as it rotates |
| `LandscapeLeft` | locked | Fixed landscape (home/nav bar region at the bottom) |
| `LandscapeRight` | locked | Fixed landscape, other side |
| `Portrait` | locked | Fixed upright |

There is no upside-down portrait because many devices do not support it (docs footnote). Orientation only matters on phones and tablets; desktop and console are unaffected.

## Where to set it
- **Default for the game:** `StarterGui.ScreenOrientation` in the Properties window.
- **At runtime, per player:** `PlayerGui.ScreenOrientation`, from a LocalScript. Example use from the docs: lock to portrait for a specific scene.
- **What the screen actually is now:** `PlayerGui.CurrentScreenOrientation` (read it; listen with `GetPropertyChangedSignal`). Note the docs' sample listens to `ScreenOrientation` (the requested mode); for layout decisions, listen to `CurrentScreenOrientation` (the real result, which differs under `Sensor`).

```lua
-- LocalScript: portrait for the in-game phone minigame, landscape again afterwards
local Players = game:GetService("Players")
local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")

local function enterMinigame()
	playerGui.ScreenOrientation = Enum.ScreenOrientation.Portrait
end

local function exitMinigame()
	playerGui.ScreenOrientation = Enum.ScreenOrientation.LandscapeSensor
end

playerGui:GetPropertyChangedSignal("CurrentScreenOrientation"):Connect(function()
	local o = playerGui.CurrentScreenOrientation
	local portrait = o == Enum.ScreenOrientation.Portrait
	script.Parent:SetAttribute("Portrait", portrait) -- layouts react to this attribute
end)
```

## Designing for portrait
- **Camera:** the vertical field of view gets very tall and narrow. Top-down, side-on or fixed cameras work better than a free third-person orbit. Pull the camera back or raise it.
- **HUD:** the adaptive design guidelines show different layouts for Medium/Landscape and Small/Portrait. In portrait, stack UI vertically: status bar at the top (below the notch and Roblox top bar), content in the middle, actions in a bottom bar where one thumb reaches.
- **One-handed reach:** the bottom third is easy, the top third is hard. Put buttons low, put information high.
- **Default touch controls:** the stick and jump still appear in portrait and take a big share of the narrow width. Many portrait games set `DevTouchMovementMode` to `Scriptable` or `ClickToMove`, or hide controls (`GuiService.TouchControlsEnabled = false`) in menu-only scenes.
- **Text:** line length shrinks; allow wrapping and `AutomaticSize` instead of shrinking text.

## Supporting both (Sensor)
- Build two layout variants of the HUD, switched by the attribute above, not one layout stretched to both.
- Avoid relayout during fast action; consider locking orientation once a round starts.
- Re-check `GuiService:GetInsetArea(...)` after every rotation; notch and home-bar insets move to different edges.

## Pitfalls
- Locking `Portrait` for the whole game while the 3D gameplay was built for landscape: players see a sliver of the world.
- Forgetting to restore `LandscapeSensor` after a portrait minigame.
- Testing only in the Device Emulator: rotate a real phone to see how fast and how often the switch fires, and whether players' hands cover your buttons.

## Related
[[UI UX - Hub]] · [[Platform - Screen Size Classes - ViewportDisplaySize, Breakpoints and UIScale]] · [[Safe Areas, Thumb Zones and Console UI Navigation]] · [[Responsive UI Layouts - UIListLayout, UIGridLayout and Flex]]

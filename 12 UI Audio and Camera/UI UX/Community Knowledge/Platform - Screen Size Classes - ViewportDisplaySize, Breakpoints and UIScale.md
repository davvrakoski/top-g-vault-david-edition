---
area: "12 UI Audio and Camera"
cluster: "UI UX"
title: "Platform - Screen Size Classes - ViewportDisplaySize, Breakpoints and UIScale"
tags: [roblox, community-knowledge, ui, platform, responsive, screen-size]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/projects/cross-platform
  - https://create.roblox.com/docs/production/publishing/adaptive-design
  - https://create.roblox.com/docs/reference/engine/classes/GuiService
  - https://create.roblox.com/docs/reference/engine/enums/DisplaySize
  - https://create.roblox.com/docs/production/publishing/console-guidelines
---
# Platform - Screen Size Classes - ViewportDisplaySize, Breakpoints and UIScale

The same Roblox game is shown on a 5-inch phone held at arm's length, a 27-inch monitor at 60 cm and a 65-inch TV across the room. Pure Scale sizing (a panel at 75% width) looks fine on a monitor, cramped on a phone and gigantic on a 4K TV, as the cross-platform docs point out. The fix is to classify the screen, pick a layout per class, and scale within that layout. The vault's [[Responsive UI Layouts - UIListLayout, UIGridLayout and Flex]] covers the layout objects; this note covers the decision logic.

## Signals you can read

| Signal | What it tells you |
|---|---|
| `GuiService.ViewportDisplaySize` (`Small`, `Medium`, `Large`) | Roblox's own category: Small = most phones/tablets/handhelds, Medium = most laptops/monitors, Large = most TVs or larger. Read-only, can change (window resize, casting) |
| `workspace.CurrentCamera.ViewportSize` | Pixel size of the 3D view (fires `GetPropertyChangedSignal("ViewportSize")`) |
| `GuiService:GetInsetArea(Enum.ScreenInsets.CoreUISafeInsets)` | The usable rectangle after notches and top bar |
| `UserInputService.PreferredInput` | Touch vs gamepad vs mouse, which changes target sizes |
| `PlayerGui.CurrentScreenOrientation` | Portrait vs landscape on phones |

Do not guess device type from pixel counts: the docs warn that predicting screen size by pixels "often leads to misinterpretation". `GuiService:IsTenFootInterface()` is deprecated in favour of `ViewportDisplaySize`.

## No-code option: style queries
The Style Editor supports style queries on `ViewportDisplaySize` and `PreferredInput` with intrinsic selectors such as `@ViewportDisplaySizeSmall` (cross-platform docs), so a StyleSheet can swap text sizes and paddings per class without scripts. See [[UI Styling with StyleSheets, Tokens and Themes]].

## Script option: one layout controller

```lua
-- LocalScript: pick a layout class and a UIScale for the whole HUD
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local camera = workspace.CurrentCamera

local hud: ScreenGui = script.Parent
local uiScale = hud:FindFirstChildOfClass("UIScale") or Instance.new("UIScale", hud)

local REFERENCE_HEIGHT = { Small = 390, Medium = 1080, Large = 1080 } -- design canvas per class
local BOOST = { Small = 1.0, Medium = 1.0, Large = 1.25 } -- TVs sit far away

local function refresh()
	local class = GuiService.ViewportDisplaySize.Name -- "Small" | "Medium" | "Large"
	local h = camera.ViewportSize.Y
	local scale = (h / REFERENCE_HEIGHT[class]) * BOOST[class]
	uiScale.Scale = math.clamp(scale, 0.6, 2.5)
	hud:SetAttribute("LayoutClass", class) -- child scripts/styles switch layouts on this
	hud:SetAttribute("Touch", UserInputService.PreferredInput == Enum.PreferredInput.Touch)
end

GuiService:GetPropertyChangedSignal("ViewportDisplaySize"):Connect(refresh)
camera:GetPropertyChangedSignal("ViewportSize"):Connect(refresh)
UserInputService:GetPropertyChangedSignal("PreferredInput"):Connect(refresh)
refresh()
```
The reference heights and TV boost are starting values to tune, not Roblox numbers. Design each class's panels in Offset at its reference canvas, and let `UIScale` stretch them.

## What changes per class (adaptive design guidelines, applied)

| Class | Layout | Sizing |
|---|---|---|
| Small (phone) | One column, bottom sheets, a menu button that collapses secondary buttons ("hamburger") | Big touch targets, fewer items per row |
| Small (tablet, landscape) | Two panes possible, but buttons near screen edges for thumb reach | Do not let scale make buttons huge |
| Medium | Full desktop layout, side panels, hover tooltips | Smaller targets OK with a mouse |
| Large (TV) | Fewer, larger elements; ScrollingFrames instead of dense grids; TV-safe margins | Text and glyphs scaled up for 2.5 to 3 m viewing |

## Pitfalls
- Using only `UIAspectRatioConstraint` and Scale: tall phones (about 19.5:9) and 4:3 tablets get very different results. Test both.
- Applying `UIScale` to a ScreenGui with `ScreenInsets = None` art: decoration may scale past the edges; keep art in its own ScreenGui.
- `TextScaled` inside scaled frames: text size becomes unpredictable and ignores the player's preferred text size. Prefer fixed `TextSize` per class.
- Forgetting that `ViewportDisplaySize` can change mid-session on desktop when the window is resized.

## Related
[[UI UX - Hub]] · [[Responsive UI Layouts - UIListLayout, UIGridLayout and Flex]] · [[Cross-Platform UI System]] · [[Platform - Text Legibility on Phones and TVs - Sizes, Contrast and PreferredTextSize]]

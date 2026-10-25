---
area: "12 UI Audio and Camera"
cluster: "UI UX"
title: "Platform - Text Legibility on Phones and TVs - Sizes, Contrast and PreferredTextSize"
tags: [roblox, community-knowledge, ui, platform, text, accessibility, mobile, console]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/publishing/accessibility
  - https://create.roblox.com/docs/production/publishing/adaptive-design
  - https://create.roblox.com/docs/reference/engine/classes/GuiService
  - https://create.roblox.com/docs/performance-optimization/test-on-hardware
  - https://developer.android.com/guide/topics/ui/accessibility/apps
  - https://create.roblox.com/docs/production/publishing/console-guidelines
---
# Platform - Text Legibility on Phones and TVs - Sizes, Contrast and PreferredTextSize

Text that is crisp on a 1440p monitor turns into grey fuzz on a budget phone or a TV across the room. Roblox's hardware testing guide says it plainly: UI that looks crisp at 1440p "can become illegible" on a low-resolution phone, and you should check text at arm's length on your lowest device. Since most sessions are on mobile, small text silently costs you players who cannot read prices, quests or tutorials.

## Sizes: what to aim for
Roblox does not publish a minimum text size. Working numbers for this vault (our recommendations, tune per font):

| Use | Phone (Small) | Desktop (Medium) | TV (Large, 2.5 to 3 m away) |
|---|---|---|---|
| Body / descriptions | 14 to 16 | 14 to 16 | 22 to 28 |
| Buttons | 16 to 20 | 16 | 24 to 32 |
| Headers | 22 to 28 | 22 to 28 | 36 to 48 |
| Fine print (never critical info) | 12 | 12 | 18 |

(Numbers are `TextSize` at the reference canvas of your layout, before `UIScale`.) On phones Roblox UI sizes appear to be in device-independent units: the `GetInsetArea` example in the GuiService docs shows a phone usable area only a few hundred units tall, far below native pixel counts (our inference, unverified).

The adaptive design guidelines add: choose sizes readable on mobile, not just desktop; avoid excessively decorative or thin fonts; test the smallest expected size on real devices.

## Contrast
Roblox's accessibility guidelines recommend "sufficient color contrast" without a number. Android's accessibility guidance gives concrete thresholds you can adopt: at least **4.5:1** for text under 18sp (or bold under 14sp), and **3:1** for larger text. In 3D games the background changes constantly, so:
- Put text on a solid or semi-opaque panel, not straight on the world.
- Or add a `UIStroke` (1 to 2 px, dark) to light text over gameplay.
- Do not rely on color alone for meaning (accessibility guidelines): pair red/green with icons or words.
- Respect `GuiService.PreferredTransparency`: players who ask for more opaque backgrounds should get them.

## PreferredTextSize: how it interacts with your UI
Players can raise **Text Size** in Roblox settings; it maps to `GuiService.PreferredTextSize` (`Medium` default, `Large`, `Larger`, `Largest`) and is applied by the engine's text pipeline. Per the docs:
- `UITextSizeConstraint` `MinTextSize`/`MaxTextSize` still clamp it, so a tight `MaxTextSize` blocks the player's choice.
- `TextScaled = true` text is **not** scaled by it.
- `AutomaticSize` elements grow to fit the larger text.
- `TextWrapped` text wraps onto more lines, limited by the element's size.
- `TextService:GetTextSize()` and `GetTextBoundsAsync()` include the change.

So the legible-by-default recipe is: fixed `TextSize`, `TextWrapped = true`, parents with `AutomaticSize` (Y), generous `MaxTextSize` (or none), and avoid `TextScaled` for anything longer than a one-word badge.

```lua
-- LocalScript: test your UI at every preferred size by logging what the player has
local GuiService = game:GetService("GuiService")
local function report()
	print("PreferredTextSize:", GuiService.PreferredTextSize.Name)
end
GuiService:GetPropertyChangedSignal("PreferredTextSize"):Connect(report)
report()
```
Change the setting in the Roblox menu during a playtest and watch for clipped buttons.

## TV specifics
- Viewing distance of 8 to 10 feet (console guidelines) means text must be roughly 1.5 to 2 times its desktop size.
- Some TVs crop edges: keep text inside the safe area.
- Thin strokes shimmer on TVs; use medium or bold weights.

## Quick audit
1. Device Emulator, smallest phone profile, physical-size display scaling.
2. Read every screen at arm's length without zooming. Anything you squint at fails.
3. Set Text Size to Largest; nothing clips or overlaps.
4. Blur test: the accessibility guidelines show a blurred shop to simulate low vision. Screenshot, blur slightly, check that prices and buttons still read.

## Related
[[UI UX - Hub]] · [[Settings and Accessibility Blueprint]] · [[UIStroke, UIGradient and UIShadow Recipes]] · [[Platform - Screen Size Classes - ViewportDisplaySize, Breakpoints and UIScale]]

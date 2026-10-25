---
area: "12 UI Audio and Camera"
cluster: "UI UX"
title: "CanvasGroup - Fading and Tinting Whole Panels"
tags: [roblox, community-knowledge, ui, canvasgroup, transparency, performance]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/CanvasGroup
  - https://devforum.roblox.com/t/1797885
  - https://devforum.roblox.com/t/canvasgroup-flickers-when-initially-shown/4015258
  - https://devforum.roblox.com/t/canvasgroup-not-being-rendered-in-mobile-devices/4040119
---
# CanvasGroup - Fading and Tinting Whole Panels

Fading a menu used to mean looping over every descendant and tweening `BackgroundTransparency`, `TextTransparency`, `ImageTransparency` and `UIStroke.Transparency` separately, which also looked wrong because overlapping children became see-through on top of each other. A `CanvasGroup` renders its whole subtree into one texture and then applies `GroupTransparency` and `GroupColor3` to the result. One property, one tween, correct-looking fade. The catch is texture memory, so use it deliberately.

## What it does (from the API reference)

- Descendants are flattened into a single texture, then `GroupTransparency` (0-1) and `GroupColor3` (a multiply tint) apply to the whole image.
- `UICorner` and `UIGradient` placed under the CanvasGroup apply to the whole group, so you can round or gradient-mask a complex panel in one go.
- `ClipsDescendants` is always true: anything outside the group's bounds is cut off. Drop shadows and "pop out" badges must live outside it.
- Flattening only happens when the ancestor `ScreenGui` uses `ZIndexBehavior = Sibling`.
- It costs extra texture memory, and the quality and memory cap follow the client's graphics quality level. Past the cap the group renders as a **blank** texture.
- The docs recommend static sizes: resizing forces a new texture.

## Good uses

| Use | Why CanvasGroup wins |
|---|---|
| Fade a whole menu or HUD panel in/out | One `GroupTransparency` tween instead of dozens |
| Dim a disabled card | `GroupColor3 = Color3.fromRGB(120,120,120)` greys everything at once |
| Rounded clip of a complex layout | `UICorner` on the group clips all children |
| Gradient fade at the edge of a list | `UIGradient` with a Transparency sequence on the group |
| Damage tint on a portrait | Tween `GroupColor3` to red and back |

## Bad uses

- Anything that resizes every frame (animated `Size`, `AutomaticSize` content that changes often, scrolling feeds). Each size change means a new texture.
- Dozens of CanvasGroups on screen at once, such as one per inventory slot. Memory adds up and low-end phones hit the cap first, which shows as blank panels.
- Crisp small text that must stay sharp. Community reports list blurry text inside CanvasGroups as a known issue, and quality also scales with the user's graphics setting.
- Wrapping a whole `ScreenGui` "just in case".

## Pattern: fade only during the transition

Keep the panel as a normal Frame most of the time, and use the CanvasGroup only while fading. A simple version keeps the CanvasGroup permanently but leaves `GroupTransparency = 0` while idle. If memory is a problem on mobile, a stricter version swaps the content into a CanvasGroup for the fade and back out afterwards.

```lua
local TweenService = game:GetService("TweenService")
local FADE = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

local function fade(group: CanvasGroup, visible: boolean)
	if visible then
		group.GroupTransparency = 1
		group.Visible = true
	end
	local tween = TweenService:Create(group, FADE, { GroupTransparency = visible and 0 or 1 })
	tween.Completed:Connect(function(state)
		if state == Enum.PlaybackState.Completed and not visible then
			group.Visible = false
		end
	end)
	tween:Play()
end
```

## Known issues reported on the DevForum

- **Flicker on first show:** a thread reports descendants flicker for a moment the first time a CanvasGroup becomes visible. Workaround in practice: make it visible at `GroupTransparency = 1` one frame before fading in (unverified as an official fix).
- **Mobile differences:** a thread reports a `GroupTransparency` toggle that worked in Studio's device emulator but not on a real phone. Always test on a physical low-end device; the emulator does not reproduce memory caps.

## Checklist

- [ ] `ScreenGui.ZIndexBehavior = Sibling`
- [ ] Group has a fixed size; content inside does not resize every frame
- [ ] Nothing important sits outside the group bounds (it will be clipped)
- [ ] Fewer than a handful of CanvasGroups visible at once
- [ ] Tested on a real phone at low graphics quality

## Related
[[UI UX - Hub]] · [[TweenService UI Animation Recipes]] · [[UI Performance - Gradients, Big Lists and Per-Frame Updates]] · [[UI Design System and Tokens]]

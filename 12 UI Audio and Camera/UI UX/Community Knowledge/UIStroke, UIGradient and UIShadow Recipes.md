---
area: "12 UI Audio and Camera"
cluster: "UI UX"
title: "UIStroke, UIGradient and UIShadow Recipes"
tags: [roblox, community-knowledge, ui, uistroke, uigradient, uishadow, styling]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/ui/appearance-modifiers
  - https://create.roblox.com/docs/reference/engine/classes/UIStroke
  - https://create.roblox.com/docs/reference/engine/classes/UIGradient
  - https://create.roblox.com/docs/reference/engine/classes/UIShadow
---
# UIStroke, UIGradient and UIShadow Recipes

Appearance modifiers are child objects that change how their parent draws. They replace most of the old "stack three ImageLabels for an outline and a shadow" tricks, need no uploaded images, and scale cleanly on every screen. This note lists the properties that matter and recipes for outlined text, shiny buttons, rarity glows and soft shadows. Some features below were marked **Beta** (File > Beta Features) in the docs at the time of writing; check before shipping.

## UIStroke

| Property | Notes |
|---|---|
| `ApplyStrokeMode` | `Contextual` outlines the parent's **text**; `Border` outlines the frame edge |
| `Thickness` + `StrokeSizingMode` | Pixels by default; with `ScaledSize` on text it scales with font size |
| `LineJoinMode` | `Round`, `Bevel`, `Miter` corners |
| `BorderStrokePosition` / `BorderOffset` | Put the border inside, centred or outside the edge, plus extra offset |
| `Transparency` | Independent of the parent's transparency |
| `ZIndex` | Layer several strokes on one object; equal ZIndex has undefined order |

A `UIGradient` under a `UIStroke` colours the stroke itself.

**Recipe: game-title text that reads on any background**
- TextLabel, white text, `FontFace` heavy weight.
- UIStroke A: `Contextual`, Thickness 3, black, Transparency 0, ZIndex 1.
- UIStroke B: `Contextual`, Thickness 6, dark colour of your accent, Transparency 0.4, ZIndex 0 (outer soft ring behind A).

## UIGradient

| Property | Notes |
|---|---|
| `Color` | `ColorSequence` |
| `Transparency` | `NumberSequence` (great for fade-out masks) |
| `Rotation` | Angle in degrees (Linear) |
| `Offset` | Shift as a fraction of parent size; tween it to animate |
| `Type` (beta) | `Linear`, `Radial`, `Elliptical`, `Conical` |
| `Scale` (beta) | How much of the sequence fits in the element |
| `TileMode` (beta) | `Clamp`, `Repeat`, `Mirror` past the gradient's ends |

**Recipe: shine sweep on a "BUY" button**

```lua
local TweenService = game:GetService("TweenService")
-- A white overlay frame on top of the button; the gradient hides all of it except a thin streak
local overlay = Instance.new("Frame")
overlay.Size = UDim2.fromScale(1, 1)
overlay.BackgroundColor3 = Color3.new(1, 1, 1)
overlay.BorderSizePixel = 0
overlay.Active = false -- don't steal clicks
overlay.Parent = buyButton -- add a UICorner matching the button if it is rounded

local shine = Instance.new("UIGradient")
shine.Rotation = 20
shine.Transparency = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 1),
	NumberSequenceKeypoint.new(0.45, 1),
	NumberSequenceKeypoint.new(0.5, 0.55), -- the visible streak
	NumberSequenceKeypoint.new(0.55, 1),
	NumberSequenceKeypoint.new(1, 1),
})
shine.Offset = Vector2.new(-1, 0)
shine.Parent = overlay
TweenService:Create(shine, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, false, 2),
	{ Offset = Vector2.new(1, 0) }):Play()
```

The `TweenInfo` here repeats forever (`-1`) with a 2 s delay between sweeps. Only run it on the one button you want noticed; animated gradients on every element add per-frame work (see the UI performance note).

**Recipe: rarity glow ring.** A Frame behind the item icon with `Type = Radial`, Color from rarity colour to the same colour, Transparency 0.2 -> 1. Slowly tween `Rotation` on a `Conical` gradient for a "legendary" sweep.

**Recipe: list edge fade.** On a container, a vertical gradient with Transparency `0 -> 0 -> 1` at the bottom fades content before it is clipped. On a `CanvasGroup` this masks the whole group.

## UIShadow (beta at time of writing)

| Property | Notes |
|---|---|
| `Mode` | `Shape` (frame outline; follows UICorner and rotation) or `Text` (glyphs) |
| `BlurRadius` | `UDim`; scale part is relative to the shorter side |
| `Offset`, `Spread` | Move and grow/shrink the shadow |
| `Inset` | Draw inside the parent (pressed-in look) |
| `ShowBehindParent` | false = don't darken content seen through a transparent parent |
| `Color`, `Transparency`, `ZIndex` | Add a `UIGradient` child for multicolour shadows |

UIShadow doesn't support Path2D or textures. Useful defaults for a floating card: `Offset (0, 4)` px, `BlurRadius (0, 12)`, `Transparency 0.6`. For a pressed button state, swap to `Inset = true` with a small blur.

## Performance and readability

- Strokes and shadows are cheap per element, but hundreds of animated gradients are not. Animate only focus elements.
- Outlines beat drop shadows for text readability on busy 3D backgrounds; use both only for big titles.
- Check strokes at small sizes: a 3 px stroke on 14 px text swallows the letters. Use `ScaledSize` on text strokes.

## Related
[[UI UX - Hub]] · [[UI Design System and Tokens]] · [[UI Performance - Gradients, Big Lists and Per-Frame Updates]] · [[CanvasGroup - Fading and Tinting Whole Panels]]

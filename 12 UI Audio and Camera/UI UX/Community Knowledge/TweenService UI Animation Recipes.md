---
area: "12 UI Audio and Camera"
cluster: "UI UX"
title: "TweenService UI Animation Recipes"
tags: [roblox, community-knowledge, ui, tweenservice, animation, game-feel]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/ui/animation
  - https://create.roblox.com/docs/reference/engine/classes/TweenService
  - https://create.roblox.com/docs/reference/engine/classes/Tween
  - https://create.roblox.com/docs/reference/engine/classes/UIScale
  - https://create.roblox.com/docs/reference/engine/classes/GuiService
---
# TweenService UI Animation Recipes

Static menus feel cheap. A 0.1 to 0.25 second tween on press, open and close is what makes Roblox UI feel "finished", and it costs almost nothing because tweens run on the client. This note collects small, reusable recipes and the rules that stop tweens from fighting each other.

## The rules first

- **Tween on the client only.** UI lives in `PlayerGui`; run tweens from LocalScripts. Server tweens replicate every property step.
- **One property, one tween.** The docs state that if two tweens animate the same property, the older one is cancelled and overwritten by the newest. Use that on purpose (spam-clicking a button just restarts the press tween) but never run "fade in" and "fade out" on the same property in parallel and expect a blend.
- **Animate a wrapper, not the layout child.** Objects controlled by a `UIListLayout`/`UIGridLayout` have their `Position` set by the layout, so tweening `Position` on them is overwritten. Tween a child inside the cell, or use `UIScale.Scale` and `Rotation`, which layouts do not touch.
- **Prefer `UIScale` for pops.** `UIScale` multiplies the parent's absolute size, so the whole subtree (text, strokes, corners) scales together and you don't have to remember the original `Size`.
- **Honour Reduce Motion.** `GuiService.ReducedMotionEnabled` maps to the player's Reduce Motion setting. When it is true, replace movement and scale with a short fade or an instant change.

## Timing cheat sheet

| Interaction | Duration | EasingStyle / Direction |
|---|---|---|
| Button press down | 0.06-0.08 s | Quad, Out |
| Button release / hover | 0.12-0.15 s | Back, Out (small overshoot) |
| Panel open | 0.18-0.25 s | Quint or Back, Out |
| Panel close | 0.12-0.18 s | Quad, In (closing faster than opening feels snappy) |
| Toast slide-in | 0.25 s | Quint, Out |
| Reward "pop" | 0.3-0.4 s | Elastic or Back, Out |

`EasingStyle` options in the enum: Linear, Sine, Back, Quad, Quart, Quint, Bounce, Elastic, Exponential, Circular, Cubic.

## Recipe 1: press feedback with UIScale

```lua
local TweenService = game:GetService("TweenService")
local GuiService = game:GetService("GuiService")

local PRESS = TweenInfo.new(0.07, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local RELEASE = TweenInfo.new(0.14, Enum.EasingStyle.Back, Enum.EasingDirection.Out)

local function addPress(button: GuiButton)
	local scale = button:FindFirstChildOfClass("UIScale") or Instance.new("UIScale")
	scale.Parent = button
	local function to(value: number, info: TweenInfo)
		if GuiService.ReducedMotionEnabled then
			scale.Scale = 1
			return
		end
		TweenService:Create(scale, info, { Scale = value }):Play()
	end
	button.MouseButton1Down:Connect(function() to(0.92, PRESS) end)
	button.MouseButton1Up:Connect(function() to(1, RELEASE) end)
	button.MouseLeave:Connect(function() to(1, RELEASE) end)
end
```

## Recipe 2: panel open/close that can't double-fire

Keep one state flag and let the newest tween win. Hide the panel only when the close tween actually completes, so a fast reopen is not hidden by an old callback.

```lua
local OPEN = TweenInfo.new(0.22, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
local CLOSE = TweenInfo.new(0.14, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

local function setOpen(panel: GuiObject, scale: UIScale, open: boolean)
	panel:SetAttribute("WantOpen", open)
	if open then
		panel.Visible = true
		scale.Scale = 0.85
		TweenService:Create(scale, OPEN, { Scale = 1 }):Play()
	else
		local t = TweenService:Create(scale, CLOSE, { Scale = 0.85 })
		t.Completed:Connect(function(state)
			if state == Enum.PlaybackState.Completed and not panel:GetAttribute("WantOpen") then
				panel.Visible = false
			end
		end)
		t:Play()
	end
end
```

Fade the panel at the same time by tweening `GroupTransparency` on a `CanvasGroup` parent (see the CanvasGroup note), not every child's transparency one by one.

## Recipe 3: toast stack

1. Put toasts in a Frame with a `UIListLayout` (bottom-aligned).
2. Each toast is a fixed-size cell; inside it, an inner Frame starts at `Position = UDim2.fromScale(1.2, 0)` and tweens to `(0, 0)`.
3. After 3 seconds, tween the inner frame back out, then `Destroy()` the cell. The layout closes the gap.
4. Cap the stack (for example 4 visible) and drop the oldest first.

## Pitfalls

- Creating a new `TweenInfo` every frame or every hover is wasteful; define them once as constants.
- `Tween.Completed` fires with `PlaybackState.Cancelled` when a newer tween overrides it; check the state before running "after" logic.
- Tweening `Size` of text with `TextScaled = true` causes text to jitter as it re-fits. Use `UIScale` instead.
- Long, bouncy easing on frequently used buttons gets tiring. Save Elastic/Bounce for rewards.

## Related
[[UI UX - Hub]] · [[UI Design System and Tokens]] · [[Polish Checklist]] · [[Responsive UI Layouts - UIListLayout, UIGridLayout and Flex]] · [[CanvasGroup - Fading and Tinting Whole Panels]]

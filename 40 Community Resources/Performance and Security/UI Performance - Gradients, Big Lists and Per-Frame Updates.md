---
area: "40 Community Resources"
cluster: "Performance and Security"
source_note: "community/performance-security/ui-performance"
title: "UI Performance - Gradients, Big Lists and Per-Frame Updates"
tags: [roblox, community, "cluster/performance-and-security", ui, mobile, client-performance]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/reference/engine/classes/UIGradient
  - https://devforum.roblox.com/t/2477813
---
# UI Performance - Gradients, Big Lists and Per-Frame Updates

UI rarely shows up in profiling until a shop with 800 items or an animated gradient HUD drops low-end phones below 30 FPS. Three causes come up again and again: **expensive gradient animation**, **huge lists**, and **writing UI properties every frame**.

## 1. UIGradient rules (Creator Hub, Performance Considerations)

- Use **no more than 6 color stops** on `Color`.
- **Don't put a UIGradient on text that has a text stroke** (`TextStrokeColor3`). The gradient tries to blend with strokes and borders, and that can hurt performance.
- **Don't rewrite `Color` or `Transparency` often.** Each change rebuilds the colour sequence, which is expensive. Set them once, then animate **`Offset` or `Rotation`** instead.
- For a gradient that never changes on an element that changes state a lot, it's a trade-off: a UIGradient costs processing time, a pre-made gradient image costs memory.

```lua
-- Shimmer by moving Offset, not by rebuilding the ColorSequence every frame.
local RunService = game:GetService("RunService")
local gradient = script.Parent:WaitForChild("UIGradient") :: UIGradient
local t = 0
RunService.RenderStepped:Connect(function(dt)
	if not gradient.Parent or not (gradient.Parent :: GuiObject).Visible then return end
	t = (t + dt * 0.5) % 2
	gradient.Offset = Vector2.new(t - 1, 0)
end)
```

## 2. Big lists: only show what's on screen

JuniorMikezz (DevForum, Jul 2023) saw FPS drop when scrolling a ScrollingFrame full of ImageLabels. What came out of the thread:

- **Too many ImageLabels** is the usual cause. One reply said things outside the screen or outside a `ClipsDescendants` parent aren't rendered, but having that many instances still costs.
- **Lower image resolution** for thumbnails (Igoras666).
- ttttbs1243 posted a script that hides children outside the visible area. It **broke `AutomaticCanvasSize`**: hidden children stopped counting toward the canvas size, so the scrollbar disappeared. If you hide off-screen rows, **set the canvas size yourself**.

### Original virtualized list (fixed row height)

```lua
-- Reuses a small pool of rows instead of creating one per item.
local ROW_H, POOL = 60, 14
local frame = script.Parent :: ScrollingFrame
local template = frame:WaitForChild("RowTemplate") :: Frame
template.Visible = false

local items: {string} = {} -- fill with your data
local rows: {Frame} = {}
for i = 1, POOL do
	local r = template:Clone()
	r.Visible = true
	r.Parent = frame
	rows[i] = r
end

local function render()
	frame.CanvasSize = UDim2.fromOffset(0, #items * ROW_H) -- manual, not AutomaticCanvasSize
	local first = math.floor(frame.CanvasPosition.Y / ROW_H) + 1
	for i, r in rows do
		local index = first + i - 1
		local item = items[index]
		r.Visible = item ~= nil
		if item then
			r.Position = UDim2.fromOffset(0, (index - 1) * ROW_H)
			;(r:FindFirstChild("Label") :: TextLabel).Text = item
		end
	end
end

frame:GetPropertyChangedSignal("CanvasPosition"):Connect(render)
render()
```

Set `POOL` to a few more rows than fit on the tallest screen you support. Call `render()` again whenever `items` changes.

## 3. Per-frame writes

- Update text labels such as timers or currency **when the value changes**, or a few times a second, not on every `RenderStepped`.
- **Skip work for hidden UI.** Check `Visible` and the `ScreenGui.Enabled` flag before updating (the shimmer example above does this).
- Disconnect per-frame connections when a menu closes. Leftover connections are a common leak (see [[Memory Leaks and Lifecycle Management]]).

## Credits

Roblox Creator Hub, *UIGradient* reference (CC BY 4.0). DevForum: JuniorMikezz, bluebxrrybot, Igoras666, ttttbs1243 (*Scrolling Frame FPS drops*, 2023). The code above is original.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Performance and Security - Hub]]

**Related notes:** [[UIGradient]] · [[Responsive UI Layouts - UIListLayout, UIGridLayout and Flex]] · [[Memory Leaks and Lifecycle Management]] · [[Mobile Performance Deep Dive]]

<!-- TDOD_GRAPH_END -->

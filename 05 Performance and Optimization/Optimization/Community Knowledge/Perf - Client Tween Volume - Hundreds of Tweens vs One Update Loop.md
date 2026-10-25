---
area: "05 Performance and Optimization"
cluster: "Optimization"
title: "Client Tween Volume - Hundreds of Tweens vs One Update Loop"
tags: [roblox, community-knowledge, performance, optimization, tweenservice, animation]
cssclasses: [tg-a05]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/TweenService
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot
  - https://create.roblox.com/docs/performance-optimization/improve
---
# Client Tween Volume - Hundreds of Tweens vs One Update Loop

TweenService is the easy way to animate a property, and on the client it is the right default for a door, a button bounce, a coin pop. The trouble starts when a game creates tweens by the hundred: every coin in a simulator bobbing with its own looping tween, every tile in a grid getting a new tween on each hover, every pickup spawning three tweens. Server-side tweens already have their own note (replication cost); this one is about the client, where the cost is object churn and property writes, and where a single update loop can beat hundreds of tween objects.

## What a tween costs

- **Creation.** `TweenService:Create()` returns a new `Tween` instance each call, plus the property table you pass in. Creating tweens on every hover or every frame is steady allocation and garbage.
- **Property writes.** Each running tween writes its properties every frame. The write cost is the same whether a tween or your own code does it; the difference is that you cannot skip, batch or throttle a tween's writes.
- **Conflicts.** Per the TweenService reference, if two tweens animate the same property, the older one is cancelled and the newer one wins. Spamming new tweens on hover therefore works visually but creates a new object each time.

## When tweens are fine

- Fewer than a few dozen active at once (rough guide, not an official limit).
- Fire-and-forget UI transitions: menu slide, button scale, fade.
- One-off world motion: door, elevator, a single cutscene prop.

Reuse one Tween per object when the same motion repeats: create it once, call `:Play()` again. For back-and-forth hover effects, keep two tweens (in and out) per button instead of creating new ones on every event.

```lua
local TweenService = game:GetService("TweenService")
local info = TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

local function setupHover(btn: GuiButton)
    local scale = btn:FindFirstChildOfClass("UIScale") or Instance.new("UIScale")
    scale.Parent = btn
    local grow = TweenService:Create(scale, info, {Scale = 1.08})
    local shrink = TweenService:Create(scale, info, {Scale = 1})
    btn.MouseEnter:Connect(function() grow:Play() end)
    btn.MouseLeave:Connect(function() shrink:Play() end)
end
```

Animating a `UIScale` instead of `Size` also avoids re-running a parent UIListLayout (see the UI layout churn note).

## When to switch to one loop

Hundreds of world objects doing the same kind of motion (coins bobbing, crops swaying, conveyor items): replace the tweens with one client loop. Benefits:
- No tween objects at all.
- Skip objects that are far away or off screen.
- Move many anchored parts in one call with `workspace:BulkMoveTo()`.
- Use `TweenService:GetValue(alpha, style, direction)` to keep the same easing curves.

```lua
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local coins: {BasePart} = {}      -- filled by your spawner
local bases: {CFrame} = {}        -- each coin's rest CFrame
local parts, cframes = {}, {}

RunService.PreRender:Connect(function()
    local t = os.clock()
    table.clear(parts); table.clear(cframes)
    for i, coin in coins do
        local phase = (t * 0.8 + i * 0.13) % 1
        local a = TweenService:GetValue(phase < 0.5 and phase * 2 or 2 - phase * 2,
            Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
        parts[#parts + 1] = coin
        cframes[#cframes + 1] = bases[i] * CFrame.new(0, a * 0.6, 0) * CFrame.Angles(0, t * 2, 0)
    end
    workspace:BulkMoveTo(parts, cframes, Enum.BulkMoveMode.FireCFrameChanged)
end)
```

Add a distance check before writing each coin to skip far ones, and consider running at a lower rate for distant objects.

## Checklist

- [ ] No `TweenService:Create` inside per-frame code or high-frequency events.
- [ ] Repeating motions reuse their Tween objects.
- [ ] Mass identical motion uses one loop plus BulkMoveTo.
- [ ] UI pops animate UIScale, not Size or Position inside layouts.

## Related
[[Optimization - Hub]] - [[BulkMoveTo - Moving Hundreds of Anchored Parts Per Frame]] - [[Server-Side Tweens and Property Churn - Hidden Replication Cost]] - [[Math - Lerp vs TweenService vs SmoothDamp - Choosing an Animator]]

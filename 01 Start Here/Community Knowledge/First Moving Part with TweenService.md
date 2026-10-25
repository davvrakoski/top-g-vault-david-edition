---
area: "01 Start Here"
cluster: "Start Here"
title: "First Moving Part with TweenService"
tags: [roblox, community-knowledge, start-here, tweenservice, animation, platforms]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/TweenService
  - https://create.roblox.com/docs/reference/engine/datatypes/TweenInfo
  - https://create.roblox.com/docs/tutorials/use-case-tutorials/physics/create-moving-objects
---
# First Moving Part with TweenService

Doors that slide, platforms that float back and forth, coins that bob, UI that pops in: almost all simple motion in Roblox is a **tween**. TweenService smoothly changes any number-like property (Position, CFrame, Size, Transparency, Color) from its current value to a target over time, with easing so it looks natural. One function, three arguments, endless uses.

## The three ingredients

```lua
local TweenService = game:GetService("TweenService")
local info = TweenInfo.new(2)                       -- how
local goal = {Position = part.Position + Vector3.new(0, 10, 0)} -- what
local tween = TweenService:Create(part, info, goal) -- build
tween:Play()                                        -- run
```

### TweenInfo arguments (all optional, in order)

| Argument | Default | Example |
| --- | --- | --- |
| `time` | 1 | `2` seconds |
| `easingStyle` | `Quad` | `Enum.EasingStyle.Sine` (smooth), `Bounce`, `Back`, `Linear` |
| `easingDirection` | `Out` | `In`, `Out`, `InOut` |
| `repeatCount` | 0 | `-1` = forever |
| `reverses` | false | `true` = go back after reaching the goal |
| `delayTime` | 0 | seconds before starting |

## Recipe 1: a floating platform (forever, back and forth)

Script inside an **Anchored** part:

```lua
local TweenService = game:GetService("TweenService")
local part = script.Parent

local info = TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
local goal = {CFrame = part.CFrame * CFrame.new(0, 0, 20)}
TweenService:Create(part, info, goal):Play()
```

Tween `CFrame` rather than `Position` when the part is rotated, so it moves along its own axis.

## Recipe 2: a sliding door

```lua
local TweenService = game:GetService("TweenService")
local door = script.Parent
local closedCFrame = door.CFrame
local openCFrame = closedCFrame * CFrame.new(door.Size.X, 0, 0)
local info = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

local function setOpen(isOpen)
	local target = isOpen and openCFrame or closedCFrame
	TweenService:Create(door, info, {CFrame = target}):Play()
end
```

Hook `setOpen` to a ProximityPrompt ([[First Interaction with ProximityPrompt]]).

## Recipe 3: fade and remove

```lua
local tween = TweenService:Create(part, TweenInfo.new(1), {Transparency = 1})
tween:Play()
tween.Completed:Wait()
part:Destroy()
```

`Completed` fires when the tween finishes, so you can chain actions.

## Recipe 4: UI pop-in (LocalScript)

```lua
frame.Size = UDim2.fromScale(0, 0)
frame.Visible = true
TweenService:Create(frame, TweenInfo.new(0.25, Enum.EasingStyle.Back), {Size = UDim2.fromScale(0.4, 0.5)}):Play()
```

## Server or client?

| Tween on | Effect |
| --- | --- |
| Server | Everyone sees it; position updates are replicated to clients, which can look slightly choppy and costs bandwidth for many parts |
| Client (LocalScript) | Perfectly smooth, but only that player sees it |

For a first game, server tweens on a few platforms are fine. For many moving decorations, a common approach is: the server decides **when**, clients run the tween. See [[Server-Side Tweens and Property Churn - Hidden Replication Cost]].

## Pitfalls

- **Players slide off tweened platforms.** Tweening an anchored part teleports it every frame; characters standing on it do not get carried reliably. For rideable platforms, use physics movers (`PrismaticConstraint`, `AlignPosition`) or the techniques in [[Moving Platforms - Why Players Slide Off]].
- Starting a new tween on the same property cancels the old one; that is usually what you want for doors.
- Tweening an unanchored part: physics fights the tween. Anchor it.
- Models: tween the PrimaryPart's CFrame with everything welded to it (welded parts unanchored), or tween a `CFrameValue` and call `model:PivotTo()` on change.

## Related
[[00 START HERE - Top G Vault]] · [[Moving Platforms - Why Players Slide Off]] · [[Springs and Damping for Game Feel]] · [[First Obby in 30 Minutes]] · [[30 Official Roblox Docs/API Reference/Classes/TweenService|TweenService (official)]]

---
area: "01 Start Here"
cluster: "Start Here"
title: "Build - Obby Weekend - 30 Stages, Obstacle Tags and a Skip Button"
tags: [roblox, community-knowledge, start-here, weekend-build, obby]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/CollectionService
  - https://create.roblox.com/docs/reference/engine/classes/TweenService
  - https://create.roblox.com/docs/scripting/attributes
  - https://create.roblox.com/docs/production/monetization/developer-products
  - https://create.roblox.com/docs/production/analytics/funnel-events
  - https://create.roblox.com/docs/resources/templates
---
# Build - Obby Weekend - 30 Stages, Obstacle Tags and a Skip Button

[[First Obby in 30 Minutes]] proves you can make 5 stages. A publishable obby needs about 30 stages, a handful of reusable obstacle types, saved progress and a skip button, and it must not lag. The big beginner mistake is putting a script inside every moving part; at 30 stages that is hundreds of scripts. This plan builds an **obstacle kit** first (one script, driven by tags and attributes), then spends the build time on level design, which is what players actually judge. Stage saving and the skip product are already written up in [[Recipe - Obby Stage Save and Skip Stage Product]], so this note only tells you when to plug them in.

## The weekend scope

| In | Cut (later) |
|---|---|
| 30 stages, 3 themed sections of 10 | 100 stages, difficulty modes |
| 5 obstacle types from one script | Conveyor puzzles, gravity flips |
| Stage saving, "Skip stage" product | Trails, VIP door, radio pass |
| A stage leaderboard | Global leaderboard, speedrun timer |
| Funnel event per stage | A/B testing |

## Day 1 - the kit and the first 15 stages (about 6 hours)

1. **Grab a reference (20 min).** Open the official Classic Obby template in Studio (File > New) to see checkpoints, fast pads and jump pads that already work; list in [[Roblox Studio Templates - Official Uncopylocked Starter Games]]. Do not ship it as is.
2. **Kit pieces (1.5 h).** Make one example of each obstacle and tag it with the Tag Editor: `Kill` (lava), `Spin` (a bar with attribute `Speed` in degrees per second), `Fade` (a platform that vanishes after you step on it), `Move` (attributes `Offset` as a Vector3 and `Time`), `Jump` (pad with attribute `Power`). Kill bricks by tag: [[Starter - First Tags and Attributes - One Script for Every Kill Brick]]. Jump pads: [[Recipe - Jump Pads and Speed Pads]].
3. **Core script (1.5 h).** Below. After it works, building a stage is just copying tagged parts.
4. **Stages 1-15 (2.5 h).** Teach one obstacle per stage, then combine two. Keep gaps the same size within a section. Read [[Obby Stage Design - Difficulty Ramp, Checkpoints and Readable Hazards]] and [[World - Obby Themes and Visual Language]] (one colour language: red kills, blue bounces, yellow moves).

## Day 2 - finish, save, skip, measure (about 6 hours)

1. **Stages 16-30 (3 h).** Section 3 should be hard, not unfair: no blind jumps, no 1-stud ledges on mobile.
2. **Saving and skip (1.5 h).** Paste in the recipe from [[Recipe - Obby Stage Save and Skip Stage Product]]. Its stage check only accepts "current stage + 1", so touching stage 30 early does nothing. Test purchases first in Studio: [[Testing Purchases - Developer Products, Passes and ProcessReceipt]].
3. **Funnel (30 min).** Log a funnel step per stage so you can see where people quit. [[Zone and Stage Funnels with AnalyticsService]].
4. **Lag pass (1 h).** Anchor everything, delete unused unions, check the server stays light: [[Speed - Case Study - Fixing a Laggy Obby]].

## The core script: one kit for every obstacle

```lua
-- ServerScriptService/ObstacleKit
local CollectionService = game:GetService("CollectionService")
local TweenService = game:GetService("TweenService")

local function spin(part)
	local degrees = part:GetAttribute("Speed") or 90
	local half = TweenInfo.new(180 / math.abs(degrees), Enum.EasingStyle.Linear)
	-- two half turns, because a tween to the same CFrame would not move
	task.spawn(function()
		while part.Parent do
			local t = TweenService:Create(part, half,
				{CFrame = part.CFrame * CFrame.Angles(0, math.pi, 0)})
			t:Play()
			t.Completed:Wait()
		end
	end)
end

local function fade(part)
	local busy = false
	part.Touched:Connect(function(hit)
		if busy or not hit.Parent:FindFirstChildOfClass("Humanoid") then return end
		busy = true
		TweenService:Create(part, TweenInfo.new(0.6), {Transparency = 1}):Play()
		task.wait(0.6)
		part.CanCollide = false
		task.wait(2.5)
		part.Transparency, part.CanCollide = 0, true
		busy = false
	end)
end

local function move(part)
	local offset = part:GetAttribute("Offset") or Vector3.new(0, 0, 10)
	local time = part:GetAttribute("Time") or 2
	local info = TweenInfo.new(time, Enum.EasingStyle.Sine,
		Enum.EasingDirection.InOut, -1, true) -- repeat forever, reverse
	TweenService:Create(part, info, {CFrame = part.CFrame + offset}):Play()
end

for tag, setup in {Spin = spin, Fade = fade, Move = move} do
	for _, part in CollectionService:GetTagged(tag) do setup(part) end
	CollectionService:GetInstanceAddedSignal(tag):Connect(setup)
end
```

Spin and Move parts must be **Anchored**. A tweened anchored platform does not carry the player along with it; for platforms players ride, use a constraint instead: [[Recipe - Moving Platform with PrismaticConstraint]]. The spinner loops half turns because a full 360-degree tween ends at the same CFrame it started from, so nothing would move.

## What to cut when you run late

- Stop at 20 stages. Twenty polished stages beat thirty rushed ones.
- Drop `Fade` and `Move`; Kill, Spin and Jump are enough for variety.
- Skip the theme change between sections; change only the colour of the floor.

## How to test

- [ ] Play every stage on a **phone emulator** (Test > Device). Mobile jumps fail first.
- [ ] Touch a Fade platform with two players at once: it fades once and comes back.
- [ ] Walk straight to stage 30's checkpoint by flying in Studio: the stage counter does not jump.
- [ ] Buy "Skip stage" in Studio test purchase: stage +1, saved after rejoin.
- [ ] The Script Performance window shows `ObstacleKit` as the only obstacle script.

## Related
[[00 START HERE - Top G Vault]] - [[Obby Platformer Starter Architecture]] - [[First Obby in 30 Minutes]] - [[Flopped Launch Teardown - Elevation Obby Case]]

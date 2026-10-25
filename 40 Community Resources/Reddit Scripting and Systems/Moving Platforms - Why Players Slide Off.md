---
area: "40 Community Resources"
cluster: "Reddit Scripting and Systems"
source_note: "community/reddit-scripting/moving-platforms-players-slide"
title: "Moving Platforms - Why Players Slide Off"
tags: [roblox, community, reddit, "cluster/reddit-scripting-and-systems"]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/players-sliding-off-rotating-platforms/4946734
  - https://devforum.roblox.com/t/make-the-player-stand-on-a-tween-moving-platform-like-tower-of-hell/2929792
cssclasses: [tg-a40]
---

# Moving Platforms - Why Players Slide Off

Obby and tower builders hit this immediately: tween a platform and the player doesn't ride it; make it physical and they slowly slide off.

## Why it happens

- **Tweening `CFrame` on an anchored part teleports it each step.** There's no physical velocity, so the character controller has nothing to "stand on" and gets left behind.
- **Physics platforms (constraints, unanchored) do carry players**, but rotating ones fling them outward over time. @metatablecatmaid: that is just momentum, like anything on a spinning plate. @cartler adds that tiny jitters lift the character off the surface while it keeps the outward momentum.
- **Server-side tweens replicate at network rate**, so they look choppy for clients.

## What works (from the threads)

1. **Animate platforms on the client.** @aeficium, on how Tower of Hell-style games do it: run the movement client-side so it's smooth for the local player. Everyone sees their own copy; keep it deterministic (same start time from the server) so players see the same thing.
2. **Carry the character yourself.** Each frame, find the platform under the player (downward raycast) and apply the platform's frame-to-frame movement to the character. A Oct 2026 reply shared a script doing this; the own version below shows the core idea.
3. **Use physics movers instead of tweens** (`AlignPosition`, `PrismaticConstraint`, `LinearVelocity`) when you want the engine to carry players, and accept some tuning for rotation.

## Own sketch: carry the local character with the platform

```lua
-- LocalScript in StarterCharacterScripts
local RunService = game:GetService("RunService")
local character = script.Parent
local root = character:WaitForChild("HumanoidRootPart") :: BasePart

local params = RaycastParams.new()
params.FilterType = Enum.RaycastFilterType.Exclude
params.FilterDescendantsInstances = {character}

local lastPlatform: BasePart? = nil
local lastPlatformCFrame: CFrame? = nil

RunService.PreSimulation:Connect(function()
	local result = workspace:Raycast(root.Position, Vector3.new(0, -6, 0), params)
	local platform = result and result.Instance
	if platform and platform:HasTag("MovingPlatform") then
		if platform == lastPlatform and lastPlatformCFrame then
			-- how the platform moved since last frame, applied to the character
			local delta = platform.CFrame * lastPlatformCFrame:Inverse()
			root.CFrame = delta * root.CFrame
		end
		lastPlatform = platform
		lastPlatformCFrame = platform.CFrame
	else
		lastPlatform, lastPlatformCFrame = nil, nil
	end
end)
```

Tag platforms `MovingPlatform` with CollectionService. Test jumping off and landing back on; if you use Server Authority, movement must go through its simulation path instead (see [[Server Authority 2026 - What the Community Learned]]).

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Reddit Scripting and Systems - Hub]]

**Related notes:** [[Network Ownership and Physics Replication]] · [[Physics, Collisions and Ragdolls]] · [[Mover constraints]] · [[TweenService]]

<!-- TDOD_GRAPH_END -->

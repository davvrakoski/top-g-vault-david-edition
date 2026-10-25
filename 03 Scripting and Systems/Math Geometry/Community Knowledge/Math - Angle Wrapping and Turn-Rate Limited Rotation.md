---
area: "03 Scripting and Systems"
cluster: "Math Geometry"
title: "Math - Angle Wrapping and Turn-Rate Limited Rotation"
tags: [roblox, community-knowledge, math, angles, rotation, turrets, ai]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/libraries/math
  - https://create.roblox.com/docs/reference/engine/datatypes/CFrame
  - https://create.roblox.com/docs/reference/engine/datatypes/Vector3
---
# Math - Angle Wrapping and Turn-Rate Limited Rotation

Turrets that spin 350 degrees the wrong way, NPCs that twitch when the target is behind them, and compass UIs that jump from 359 to 0 are all the same bug: angles were compared without **wrapping**. The fix is to keep yaw as a single number, always take the **shortest signed difference**, and move toward the goal at a capped turn rate.

## Yaw from a direction

`CFrame.Angles(0, yaw, 0).LookVector` is `(-sin yaw, 0, -cos yaw)`, so the yaw that faces a direction `d` is:

```lua
local function yawOf(d: Vector3): number
	return math.atan2(-d.X, -d.Z) -- 0 faces -Z (Roblox forward)
end
```

Check: `d = (0,0,-1)` gives 0; `d = (-1,0,0)` gives `pi/2`, and `CFrame.Angles(0, pi/2, 0)` does look along -X.

## Wrapping

```lua
local TAU = math.pi * 2 -- also available as math.tau
local function wrap(a: number): number -- into [-pi, pi)
	return (a + math.pi) % TAU - math.pi
end
local function shortestDelta(from: number, to: number): number
	return wrap(to - from)
end
```

Luau's `%` on numbers is floor-based (`a - math.floor(a/b)*b`), so it returns a value in `[0, b)` even for negative `a`. That is why this works without extra `if`s. `math.fmod` truncates toward zero instead and does **not** give the same result for negatives.

## Turn at most N degrees per second (own code)

```lua
local TURN_RATE = math.rad(180) -- deg/s
local yaw = 0
RunService.Heartbeat:Connect(function(dt)
	local goal = yawOf(target.Position - turret.Position)
	local delta = shortestDelta(yaw, goal)
	local step = math.clamp(delta, -TURN_RATE * dt, TURN_RATE * dt)
	yaw = wrap(yaw + step)
	turret:PivotTo(CFrame.new(turret:GetPivot().Position) * CFrame.Angles(0, yaw, 0))
end)
```

- Constant speed and an exact stop: no overshoot, ideal for turrets and tank hulls.
- For an organic ease-in use `yaw += delta * (1 - math.exp(-10 * dt))` instead of the clamp.

## Aim cone check with yaw

"Can this turret fire?" becomes `math.abs(shortestDelta(yaw, goal)) < math.rad(5)`, which is cheaper to reason about than a dot product when you already track yaw.

## Pitch limits

Keep pitch separate and clamp it, never wrap it: `pitch = math.clamp(pitch, math.rad(-10), math.rad(60))`. Build the final rotation as `CFrame.Angles(0, yaw, 0) * CFrame.Angles(pitch, 0, 0)` (yaw first in world space, then pitch locally) so the turret never rolls.

## UI compass

Display heading `(math.deg(-yaw) % 360)` for a 0..360 readout that grows clockwise from north = -Z. Pick your north and write it down; mixing conventions across scripts is the usual cause of mirrored minimaps.

## Pitfalls

- Euler angles from `CFrame:ToEulerAnglesYXZ()` are fine for yaw, but full 3D orientations should be blended with `CFrame:Lerp`, not by lerping three angles.
- Do not store degrees in one script and radians in another; convert at the edges with `math.rad`/`math.deg`.
- Wrap after every addition, or yaw slowly grows to huge values and loses float precision.

## Related
[[Math Geometry - Hub]] · [[CFrame Recipes - Facing, Offsets and Relative Space]] · [[Math - Cross Product Recipes - Surface Alignment and Signed Angles]] · [[Frame-Rate Independent Smoothing - Exponential Decay and Springs]]

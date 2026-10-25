---
area: "06 Characters and Animation"
cluster: "Animation"
title: "Anim - Turn-in-Place - AutoRotate Off, Angle Threshold and Turn Clips"
tags: [roblox, community-knowledge, animation, locomotion, turn-in-place, shift-lock]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://create.roblox.com/docs/reference/engine/classes/AnimationTrack
  - https://create.roblox.com/docs/reference/engine/classes/AlignOrientation
  - https://create.roblox.com/docs/reference/engine/classes/Motor6D
---
# Anim - Turn-in-Place - AutoRotate Off, Angle Threshold and Turn Clips

In shift-lock, over-the-shoulder and first-person games the camera turns and the standing character spins with it, instantly, feet sliding on the floor. That "turntable" look is one of the clearest signs of an unpolished third-person game. Turn-in-place fixes it: the upper body follows the camera a little, and once the gap gets too big the feet step around with a short turn clip.

## The model

1. **Torso/head follow** the aim yaw up to a limit (for example 60-70 degrees) using a procedural twist on the `Waist` / `Neck` `Motor6D.Transform` (see the procedural lean note).
2. **Feet stay planted** while the gap is below the threshold.
3. When the gap passes the threshold (around 70-90 degrees), **play a turn clip** (left or right) and rotate the root to the aim yaw over the clip's length.
4. While **moving**, skip all of this and let the root face the move/aim direction normally.

## Setup

- Set `Humanoid.AutoRotate = false` on the local character while in this camera mode, otherwise the Humanoid keeps snapping the root to the movement direction.
- Rotate the root yourself. Simplest: an `AlignOrientation` on the `HumanoidRootPart` (one-attachment mode, `RigidityEnabled` off, a moderate `MaxAngularVelocity`) whose target CFrame you set each frame. Directly writing `HumanoidRootPart.CFrame` also works on the client but fights physics more.
- Author two short clips, `Turn90_L` and `Turn90_R` (about 0.4-0.6 s), keyed **in place**: the feet step, but the root does not rotate in the clip. Your code rotates the root, the clip only sells the steps.

## Core logic (client, RenderStepped)

```lua
local THRESHOLD = math.rad(75)
local turning = false

local function yawOf(cf: CFrame)
	local look = cf.LookVector
	return math.atan2(-look.X, -look.Z)
end

local function wrap(a)
	return (a + math.pi) % (2 * math.pi) - math.pi
end

RunService.RenderStepped:Connect(function()
	local moving = humanoid.MoveDirection.Magnitude > 0.1
	local aimYaw = yawOf(workspace.CurrentCamera.CFrame)
	local bodyYaw = yawOf(root.CFrame)
	local gap = wrap(aimYaw - bodyYaw)

	if moving then
		align.CFrame = CFrame.Angles(0, aimYaw, 0) -- face aim while strafing
		return
	end
	if not turning and math.abs(gap) > THRESHOLD then
		turning = true
		local track = gap > 0 and turnLeft or turnRight
		track:Play(0.1)
		align.CFrame = CFrame.Angles(0, aimYaw, 0)
		task.delay(track.Length * 0.8, function() turning = false end)
	end
	-- upper-body twist toward the remaining gap is applied elsewhere
end)
```

Tune `MaxAngularVelocity` so the root covers 90 degrees in about the clip length (for a 0.5 s clip: roughly `math.rad(180)` rad/s).

## Making it look right

- **Match clip length to rotation time.** If the root finishes turning long before the feet stop stepping, it reads as sliding again.
- **Scale for big gaps.** For a 180-degree flick, either play a dedicated `Turn180` clip or play the 90 clip at `AdjustSpeed(1.5)`.
- **Turn clips at `Movement` priority**, the base idle at `Idle`; your twist on the spine runs after the Animator, so it layers on top.
- **Cancel on move input:** when `MoveDirection` becomes non-zero, stop the turn track with a short fade (0.1 s) and go straight to locomotion.
- **Replication:** root rotation of the local character replicates through physics; the turn tracks replicate because they play on the local character's `Animator`. Upper-body twist done in `Motor6D.Transform` is local only, so drive other players' twist from a replicated aim value if you want them to see it.

## Pitfalls

- Forgetting to restore `AutoRotate = true` when leaving shift-lock or entering a vehicle.
- Threshold too small: the character steps every time the camera wobbles. Add a dead zone and require the gap to stay past the threshold for about 0.1 s.
- Turn clip with root rotation baked in: the body double-rotates. Strip root rotation in Blender or keep the clip in place.

## Related
[[Animation - Hub]] · [[Procedural Lean and Torso Twist with Motor6D.Transform]] · [[Directional Locomotion Blending - Strafe, Speed-Matched Gaits]] · [[Math - Angle Wrapping and Turn-Rate Limited Rotation]]

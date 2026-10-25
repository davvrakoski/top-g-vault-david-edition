---
area: "06 Characters and Animation"
cluster: "Animation"
title: "Procedural Lean and Torso Twist with Motor6D.Transform"
tags: [roblox, community-knowledge, animation, procedural, motor6d, runservice]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Motor6D
  - https://create.roblox.com/docs/reference/engine/classes/RunService
  - https://create.roblox.com/docs/reference/engine/classes/JointInstance
  - https://devforum.roblox.com/t/moving-the-characters-real-arms/188712
---
# Procedural Lean and Torso Twist with Motor6D.Transform

Small procedural touches (leaning into turns, tilting the torso toward the camera's pitch, a head that tracks the mouse) make keyframed animation feel alive. The trick is to add them **on top of** the Animator's output instead of fighting it. Roblox documents exactly when the Animator writes each joint, so you can layer your offset in the right slot every frame.

## Frame order that matters

From the `Motor6D.Transform` reference:

1. `RunService.PreAnimation` fires.
2. The `Animator` writes `Motor6D.Transform` for every animated joint.
3. `RunService.PreSimulation` fires (formerly `Stepped`).
4. Transforms are applied in a batch, then physics steps.

So: **read and multiply `Transform` in `PreSimulation`**. Anything you set in `PreAnimation` gets overwritten. Editing `C0` instead works too, but `C0` changes replicate as property changes and fight other scripts; `Transform` is not replicated and is the documented place for custom animation.

## Recipe: lean into turns

```lua
local RunService = game:GetService("RunService")
local root = character:WaitForChild("HumanoidRootPart")
local waist = character:WaitForChild("UpperTorso"):WaitForChild("Waist") -- R15
local lean = 0

RunService.PreSimulation:Connect(function(dt)
	local localVel = root.CFrame:VectorToObjectSpace(root.AssemblyLinearVelocity)
	local yawRate = root.AssemblyAngularVelocity.Y
	local target = math.clamp(-yawRate * 0.05 - localVel.X * 0.01, -0.25, 0.25)
	lean += (target - lean) * math.min(1, dt * 8) -- simple smoothing
	waist.Transform = waist.Transform * CFrame.Angles(0, 0, lean)
end)
```

Multiplying keeps whatever the walk clip did and adds the lean. Replacing (`waist.Transform = CFrame.Angles(...)`) wipes the animation for that joint.

## Recipe: torso pitch follows the camera

For shooters, split the camera pitch across joints so no single joint bends unnaturally:

| Joint (R15) | Share of pitch |
| --- | --- |
| `Waist` | 40% |
| `Neck` | 40% |
| Shoulders (if not using IK aim) | 20% |

Clamp pitch to about ±60 degrees. For other players to see it, the owning client sends its pitch (throttled to ~10-20 Hz, as an attribute or unreliable remote), and every client applies the same math locally. Do not set `Transform` on the server for player characters; it is not replicated.

## Smoothing and budget

- Use a spring or exponential smoothing, never raw input; raw mouse deltas jitter.
- Only run the code for characters within ~100 studs and on screen; skip far NPCs entirely.
- One connection that loops over a list of characters is cheaper than one connection per character.

## Pitfalls

- **Effect stacks forever:** if you multiply `C0` each frame instead of `Transform`, the rotation accumulates. The docs say the Animator "usually" overwrites `Transform` each frame, which is what makes multiplying safe. For a joint that no playing track drives, do not rely on that (unverified): keep your own base CFrame and set `Transform = base * offset`.
- **Throttled frames:** on remote characters the engine may skip animation evaluation (animator LOD). `Animator.EvaluationThrottled` is `true` on those frames; skip your offset then, or it multiplies onto last frame's already-offset pose.
- **Wrong axis:** joint axes depend on the rig's `C0`/`C1` orientation. Test each axis in isolation with a big angle first.
- **R6 differences:** R6 uses `Root Hip` (in `HumanoidRootPart`) and `Neck` in the Torso; there is no `Waist`.

## Related
[[Animation - Hub]] · [[Procedural Animation, Springs and Recoil]] · [[IKControl Recipes - Foot Planting, Aiming and Look-At]] · [[Springs and Damping for Game Feel]]

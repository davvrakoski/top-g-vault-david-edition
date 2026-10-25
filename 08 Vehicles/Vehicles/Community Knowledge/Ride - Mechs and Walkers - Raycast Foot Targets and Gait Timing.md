---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Ride - Mechs and Walkers - Raycast Foot Targets and Gait Timing"
tags: [roblox, community-knowledge, vehicles, mech, procedural-animation, ik]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://devforum.roblox.com/t/procedural-animation/4014790
  - https://devforum.roblox.com/t/help-with-foot-placement-script/232507
  - https://devforum.roblox.com/t/r15-ik-foot-placement/68675
  - https://devforum.roblox.com/t/how-to-make-mech-legs/2616259
  - https://devforum.roblox.com/t/broken-ik-controls/3807266
  - https://create.roblox.com/docs/animation/inverse-kinematics
---
# Ride - Mechs and Walkers - Raycast Foot Targets and Gait Timing

Mechs, spider tanks and walking vehicles look amazing when their feet plant on stairs and rocks, and silly when a canned walk animation slides over the ground. The standard trick is procedural legs: the body moves like a hover vehicle, and each foot steps to a raycast target when it falls too far behind. DevForum procedural animation threads describe the same two ingredients: raycasted foot targets and an IK solver for the leg.

## Split the problem
1. **Body**: a hovering root driven like a hover vehicle (`AlignPosition` or `LinearVelocity` + `AlignOrientation`), kept at a set height above the average foot height. The legs are visual and do not hold it up.
2. **Foot targets**: one per leg, in world space, planted until a step is needed.
3. **Leg solve**: IK from hip to foot target, or a simple 2-bone solve on Motor6Ds.

This is why mechs on Roblox do not fall over: physics never balances on the legs.

## Choosing a step
For each leg keep a "home" point: hip offset projected forward by velocity.

```lua
local function homeFor(leg, root)
	local origin = root.CFrame:PointToWorldSpace(leg.hipOffset)
	local lead = root.AssemblyLinearVelocity * 0.25 -- step ahead of motion
	local hit = workspace:Raycast(origin + lead + Vector3.yAxis * 5, Vector3.yAxis * -20, params)
	return hit and hit.Position, hit and hit.Normal
end
```
- If the planted foot is more than `stepDistance` (about 0.6 x leg length) from home, start a step.
- Step = move the foot along an arc from old to new target over 0.2-0.35 s, height `sin(t * pi) * lift`.
- Align the foot to the surface normal (the R15 foot placement thread uses the ray normal for this).

## Gait timing (the part people skip)
Only some legs may step at once, or the mech floats:
- **Biped**: legs alternate; leg B cannot start until leg A is planted.
- **Quadruped / spider**: diagonal pairs (front-left with back-right). Allow a pair to step only when the other pair is planted.
- Faster movement shortens step time but never lets all feet lift together.

Shake the camera and play a heavy thud when each foot lands; that sells the weight more than any model.

## Leg solving options
| Option | Pros | Cons |
|---|---|---|
| `IKControl` per leg (`Type = Position`, `ChainRoot` hip, `EndEffector` foot, `Target` = an Attachment you move, `Pole` for knee direction) | Built in, smooth | Needs a Humanoid or AnimationController with Animator; one thread reports behaviour changes after a Studio update (legs flipping on steps) |
| Hand-written 2-bone solve (law of cosines) on Motor6D `Transform` | Full control, any leg count | You write the math |
| CCD IK module (community, linked in the mech legs thread) | Many joints | Check license before bundling |

For custom mechs, use an `AnimationController` + `Animator` in the model and Motor6Ds for the leg joints, so `IKControl` works without a Humanoid.

## Network and cost
- Run foot placement on every client for nearby mechs; the server only moves the body. Feet do not need to replicate.
- Skip the raycasts for mechs far from the camera and fall back to a simple looping walk.

## Pitfalls
- Foot rays hitting the mech itself: exclude the model in `RaycastParams`.
- Step targets on moving platforms drift; store targets relative to the hit part when it is unanchored.

## Related
[[Vehicles - Hub]] - [[Inverse Kinematics]] - [[Hover, Boat and Flying Vehicles with Mover Constraints]] - [[Ride - Tank Turrets - Yaw and Pitch Servos Aimed in Local Space]]

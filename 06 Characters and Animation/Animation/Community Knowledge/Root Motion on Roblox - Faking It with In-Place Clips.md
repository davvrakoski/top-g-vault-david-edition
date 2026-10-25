---
area: "06 Characters and Animation"
cluster: "Animation"
title: "Root Motion on Roblox - Faking It with In-Place Clips"
tags: [roblox, community-knowledge, animation, root-motion, combat, dodge]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/AnimationTrack
  - https://create.roblox.com/docs/reference/engine/classes/LinearVelocity
  - https://create.roblox.com/docs/animation/events
  - https://docs.unity3d.com/430/Documentation/Manual/ScriptingRootMotion.html
---
# Root Motion on Roblox - Faking It with In-Place Clips

In engines like Unity or Unreal, "root motion" means the animation itself moves the character: a lunge clip carries the body two metres forward and the engine moves the capsule to match. Roblox's `Animator` has no root-motion extraction in the Creator Docs we checked (no mention of root motion in the animation or API pages as of 2026-10-25). If you key the `HumanoidRootPart`/`LowerTorso` forward, only the **visual mesh** moves; the `HumanoidRootPart` (the physics capsule) stays put, and the body snaps back when the clip ends. Dodges, lunges, vaults and finishers therefore need a different approach.

## The standard approach: in-place clip + scripted movement

1. **Author or clean the clip "in place".** The hips stay over the origin on the horizontal plane; only vertical bob and body motion remain. Mixamo and most mocap packs offer an "In Place" option, or remove the root's forward channel in Blender.
2. **Move the character with physics or CFrame** over the same duration the clip would have travelled.
3. **Sync the two with markers** so movement starts and stops on the right frames.

## Choosing the mover

| Need | Mover | Notes |
| --- | --- | --- |
| Dash/dodge that respects walls | `LinearVelocity` on the root (attachment at root) | Set `VectorVelocity`, `MaxForce` high; remove after the window. Collides properly. |
| Short lunge with exact distance | Tween a velocity, or apply `AssemblyLinearVelocity` once | Distance = speed × time; check friction. |
| Cinematic sync kill / vault over a fixed obstacle | `PivotTo` along a precomputed path while anchored | Exact, but no collisions; validate the path first. |
| Knockback from a hit | Impulse (`ApplyImpulse`) on the victim's root | Owner of the assembly must apply it, see knockback note. |

## Measuring the distance a clip "wants"

If you start from a root-motion clip, read the travel in Blender before making it in place: note the root bone's X/Y at the first and last frame, convert to studs (your export scale), and store it as data next to the animation ID:

```lua
local MoveData = {
	Lunge = { distance = 9, startMarker = "MoveStart", stopMarker = "MoveStop" },
	DodgeBack = { distance = -12, startMarker = "MoveStart", stopMarker = "MoveStop" },
}
```

At runtime, on `MoveStart` compute `speed = distance / (stopTime - startTime)` and drive a `LinearVelocity` along the root's look vector until `MoveStop`.

## Curved speed (better feel)

Real root motion is rarely constant speed: a dodge bursts fast then eases out. Approximate the curve with 3-4 keyed speeds or an ease function (`TweenService:GetValue(alpha, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)`) applied to the velocity each frame.

## Multiplayer rules

- Player dodges: the owning client drives movement (it owns the physics), the server only validates distance and cooldown.
- NPC lunges: server drives movement; clients just see replicated position.
- Never trust a client-reported "I lunged 30 studs"; clamp to the table distance plus a tolerance.

## Pitfalls

- **Clip still drifts:** the in-place conversion left a small forward offset; the mesh slowly separates from the capsule. Zero it fully.
- **Humanoid fights the mover:** `Humanoid` applies its own walk forces. During the move, set `Humanoid.AutoRotate = false` and keep `WalkSpeed` input from steering, or briefly switch to a physics state.
- **Snapping at the end:** stop the mover on the same frame the clip settles, not on `Stopped`, which fires after the fade.

## Related
[[Animation - Hub]] · [[Animation Markers for Hit Frames, Footsteps and Sync]] · [[Mocap Cleanup for Roblox - In-Place, Loops and Foot Slide]] · [[Smooth Knockback - What Works for All Clients]]

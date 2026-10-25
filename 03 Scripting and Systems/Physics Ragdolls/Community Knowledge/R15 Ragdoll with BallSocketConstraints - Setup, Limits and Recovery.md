---
area: "03 Scripting and Systems"
cluster: "Physics Ragdolls"
title: "R15 Ragdoll with BallSocketConstraints - Setup, Limits and Recovery"
tags: [roblox, community-knowledge, physics, ragdoll, r15, constraints, humanoid]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/BallSocketConstraint
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://devforum.roblox.com/t/removing-ballsocketconstraints-to-disable-ragdoll-without-killing-the-character/2622110
  - https://devforum.roblox.com/t/r15-ragdoll-help/3613703
  - https://devforum.roblox.com/t/partially-solved-ragdoll-mechanic-leaves-the-character-dangling-on-its-rootpart-r15/3887448
  - https://devforum.roblox.com/t/how-to-make-ragdoll-joints/3254759
---
# R15 Ragdoll with BallSocketConstraints - Setup, Limits and Recovery

Ragdolls sell impact: knockouts, explosions, deaths, being hit by a car. The standard Roblox technique is to swap each `Motor6D` joint for a `BallSocketConstraint` at the same attachment points, then swap back to recover. DevForum help threads show the same failures again and again (instant death, floating, limbs bending backwards, jitter, dangling from the root). This note is the setup that avoids them. For the bigger picture of ragdoll states see [[Ragdoll Engineering and Recovery]].

## The core idea

R15 characters are held together by Motor6Ds (`Neck`, `Waist`, `RightShoulder`, `LeftHip`, ...). Each Motor6D joins `Part0` and `Part1` at matching rig attachments (for example `NeckRigAttachment` exists in both Head and UpperTorso). To ragdoll:

1. For each Motor6D, create a `BallSocketConstraint` with `Attachment0`/`Attachment1` set to the two matching `*RigAttachment`s.
2. Disable the Motor6D (`motor.Enabled = false`) rather than destroying it, so you can re-enable it to recover.
3. Put the Humanoid into a physics state so it stops fighting the ragdoll.

Pre-create the sockets disabled when the character spawns and just toggle `Enabled`, instead of creating them at the moment of impact (fewer allocations, no hitch).

## Humanoid settings that prevent the classic bugs

| Setting | Why |
| --- | --- |
| `Humanoid.RequiresNeck = false` (before disabling the Neck) | otherwise the character dies the moment the Neck Motor6D is disconnected, even briefly |
| `Humanoid.BreakJointsOnDeath = false` | on death, keep joints so *your* ragdoll code runs instead of the parts falling apart |
| `humanoid:ChangeState(Enum.HumanoidStateType.Physics)` (or `PlatformStand = true`) | stops the Humanoid from trying to stand and "floating" while ragdolled |
| `HumanoidRootPart.CanCollide = false` while ragdolled | reported fix for bodies dangling or propping up on the root part |
| Restore with `ChangeState(GettingUp)` after re-enabling motors | smooth recovery |

`ChangeState` on a player's character must run on the client that owns it (the player's own client) to take effect reliably, because the client simulates its own character. Many systems fire a remote to the owner to set the state while the server toggles joints.

## Joint limits (stop limbs bending backwards)

`BallSocketConstraint` properties: `LimitsEnabled`, `UpperAngle` (cone half-angle, degrees), `TwistLimitsEnabled`, `TwistLowerAngle`, `TwistUpperAngle`, `MaxFrictionTorque`, `Restitution`.

Starting values (our own, tune by eye; the attachment axes decide which direction is "forward" for the cone):

| Joint | UpperAngle | Twist range | Notes |
| --- | --- | --- | --- |
| Neck | 30-45 | -40 to 40 | keeps head from rolling off |
| Waist | 20-30 | -20 to 20 | stiff torso reads better |
| Shoulders | 75-90 | -60 to 60 | arms flop naturally |
| Elbows | 0-10 (cone) | 0 to 135 | rotate attachment so twist acts as hinge |
| Hips | 45-60 | -30 to 30 | |
| Knees | 0-10 | -135 to 0 | |

Small `MaxFrictionTorque` (for example 5-20) damps the "jelly" jitter one thread complained about. Hinge-like joints (elbows, knees) can also use a `HingeConstraint` with `LimitsEnabled` instead.

## Collision inside the ragdoll

Limbs colliding with each other cause jitter and explosions. Options: keep adjacent parts from colliding with `NoCollisionConstraint`s between limb pairs, or put ragdoll parts into a collision group that does not collide with itself ([[Collision Groups - Setup Recipes and the WorldRoot API]]). Make sure limbs **do** collide with the world, or the body sinks through the floor.

## Network ownership
The server should own NPC ragdolls; a player's own ragdoll is simulated by their client. For dead player bodies that persist, consider cloning the character into a server-owned corpse so other clients see consistent motion ([[Vehicle Network Ownership Recipes - Drivers, Passengers and Exit Jolts]] explains the same ownership rules).

## Recovery checklist
- [ ] Re-enable every Motor6D; disable every socket.
- [ ] Restore `HumanoidRootPart.CanCollide` and any collision group changes.
- [ ] Teleport the root upright above the ground (`PivotTo` with a raycast to the floor) before standing, or the character snaps through terrain.
- [ ] `ChangeState(GettingUp)` on the owning client.
- [ ] Restore `RequiresNeck = true` if your game relies on neck-based death.

## Related
[[Physics Ragdolls - Hub]] · [[Ragdoll Engineering and Recovery]] · [[Physics, Collisions and Ragdolls]] · [[Smooth Knockback - What Works for All Clients]]

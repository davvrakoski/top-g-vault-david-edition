---
area: "06 Characters and Animation"
cluster: "Animation"
title: "Ragdoll Death with BallSocketConstraints"
tags: [roblox, community-knowledge, animation, ragdoll, physics, humanoid]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://create.roblox.com/docs/reference/engine/classes/BallSocketConstraint
  - https://create.roblox.com/docs/reference/engine/classes/Animator
  - https://devforum.roblox.com/t/how-to-make-ragdolls/770050
  - https://devforum.roblox.com/t/removing-ballsocketconstraints-to-disable-ragdoll-without-killing-the-character/2622110
  - https://devforum.roblox.com/t/ragdoll-instantly-kills-player/2892239
---
# Ragdoll Death with BallSocketConstraints

By default a Roblox character that dies simply falls apart: `Humanoid.BreakJointsOnDeath` is `true`, so every joint is destroyed and the limbs scatter. A ragdoll keeps the body connected but floppy, which reads far better for combat, horror and physics games. The standard community method is to swap each `Motor6D` for a `BallSocketConstraint` at the moment of death (or knock-down), and it works for both R6 and R15.

## The core recipe

1. Set `Humanoid.BreakJointsOnDeath = false` on the character (a script in `StarterCharacterScripts` is the usual place).
2. For each `Motor6D` in the character, create two `Attachment`s: one in `Part0` at `C0`, one in `Part1` at `C1`. Their world positions coincide at the joint pivot.
3. Create a `BallSocketConstraint` with `Attachment0`/`Attachment1` set to that pair, parent it near the joint.
4. Disable the motor (`Motor6D.Enabled = false`) instead of destroying it if you may want to stand the character back up.
5. Turn on `CanCollide` for limbs if your rig has them off; otherwise limbs pass through the floor and each other.

```lua
-- Server: build sockets once, enable them on death
local function buildSockets(character: Model)
	for _, motor in character:GetDescendants() do
		if motor:IsA("Motor6D") and motor.Part0 and motor.Part1 then
			local a0 = Instance.new("Attachment")
			a0.CFrame = motor.C0
			a0.Parent = motor.Part0
			local a1 = Instance.new("Attachment")
			a1.CFrame = motor.C1
			a1.Parent = motor.Part1
			local socket = Instance.new("BallSocketConstraint")
			socket.Attachment0, socket.Attachment1 = a0, a1
			socket.LimitsEnabled = true
			socket.UpperAngle = 60
			socket.TwistLimitsEnabled = true
			socket.Enabled = false
			socket.Parent = motor.Parent
		end
	end
end
```

## Limits per joint (starting values)

| Joint | UpperAngle | Twist limits | Note |
| --- | --- | --- | --- |
| Neck | 30-45 | -30 to 30 | Stops the head spinning |
| Shoulders | 70-90 | -45 to 45 | Arms flop but do not invert |
| Elbows / knees | 0-10 with hinge, or socket 45 | tight | A `HingeConstraint` reads more natural |
| Hips | 50-70 | -20 to 20 | Too loose = legs fold through torso |
| Waist (R15) | 20-30 | -15 to 15 | Keeps the spine from collapsing |

Values are community starting points, not official numbers; tune by eye.

## Knock-down without death

Ragdolling a live character is harder because the `Humanoid` keeps trying to stand up.

- Set `Humanoid.RequiresNeck = false` first, or disabling the Neck motor kills the player instantly (a common forum bug report).
- Put the humanoid in `Enum.HumanoidStateType.Physics` with `Humanoid:ChangeState()` on the machine that owns the character's physics (the player's client for player characters), and disable `GettingUp` with `SetStateEnabled` while ragdolled.
- To recover: re-enable motors, disable sockets, then `ChangeState(Enum.HumanoidStateType.GettingUp)`.

## Keeping momentum

When the motors switch off, limbs inherit no animation velocity and the body drops like a sack. `Animator:ApplyJointVelocities(motors)` computes velocities from the current animation and applies them to each `Part1`. Disable the joints first; the method skips parts that are still in the same assembly.

## Pitfalls

- **Respawn repairs joints:** with `BreakJointsOnDeath = false`, the humanoid can try to rebuild joints. Many games clone the dead body into a corpse model (anchored after a few seconds) and let the real character respawn normally.
- **Flinging:** network ownership flipping at death can launch the body. Keep ownership with the player, or set it to the server before enabling sockets for NPCs.
- **Cost:** dozens of active ragdolls are real physics load. Anchor or delete corpses after 5-10 seconds on mobile-first games.
- **Accessories:** hats are welded to the head, so they follow; layered clothing deforms with the body automatically.

## Checklist

- [ ] `BreakJointsOnDeath` off, `RequiresNeck` off for knock-downs
- [ ] Sockets pre-built and disabled (no spikes at death)
- [ ] Limits set per joint; limbs collide
- [ ] Corpse cleanup timer
- [ ] Tested on R6 and R15 if the game allows both

## Related
[[Animation - Hub]] · [[Character Damage, Limbs and Status Model]] · [[R6 vs R15 vs Custom Rigs - Choosing a Character Rig]] · [[Animator Priorities, Weights and Blending Done Right]]

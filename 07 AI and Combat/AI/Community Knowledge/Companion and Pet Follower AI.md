---
area: "07 AI and Combat"
cluster: "AI"
title: "Companion and Pet Follower AI"
tags: [roblox, community-knowledge, ai, pets, companions, followers, alignposition]
cssclasses: [tg-a07]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/physics/constraints/align-position
  - https://create.roblox.com/docs/reference/engine/classes/AlignPosition
  - https://devforum.roblox.com/t/pet-follow-system/2176090
  - https://devforum.roblox.com/t/pets-movement-system-jittering/2619895
  - https://devforum.roblox.com/t/creating-followers/490329
---
# Companion and Pet Follower AI

Pets are the backbone of simulators, and companions (a dog in a survival game, a squadmate in a shooter) are some of the most-loved NPCs when they work and the most hated when they block doors, teleport randomly or jitter. There are two very different jobs here: **cosmetic pets** that only need to look like they follow, and **gameplay companions** that path, fight and must be server-correct. Mixing the two approaches is where most DevForum "my pet jitters" threads come from.

## Cosmetic pets: render on the client

If a pet has no gameplay effect beyond "it is there":

1. The server only stores which pets each player has equipped (an attribute or a folder of values on the player).
2. **Every client** creates the pet models locally for every player and moves them every frame (`RunService.RenderStepped` or `PreRender`) toward slot offsets behind each player.
3. No physics, no network ownership, no replication cost. Smooth on every device.

```lua
-- client: position N pets in an arc behind the owner's root part
local SPACING, BACK = 3, 5
local function slotCFrame(root: BasePart, i: number, n: number): CFrame
	local offsetX = (i - (n + 1) / 2) * SPACING
	return root.CFrame * CFrame.new(offsetX, 0, BACK)
end

-- each frame: pet:PivotTo(pet:GetPivot():Lerp(target, 1 - math.exp(-10 * dt)))
```

The `1 - exp(-k*dt)` factor makes the smoothing frame-rate independent. Add a small bob (`math.sin(t * 2) * 0.3`) for flying pets and raycast down for walking pets so they sit on the ground.

## Physics pets: AlignPosition

If pets must collide or be seen by the server, the forum consensus is an `AlignPosition` + `AlignOrientation` from an attachment on the pet to a target attachment offset from the player's HumanoidRootPart, with the pet's network owner set to the owning player so motion is smooth for them. Tuning notes from the jitter threads: lower `Responsiveness` (10-25) and cap `MaxVelocity` rather than raising `MaxForce`, and do not also move the pet from the server, which fights the constraint.

## Gameplay companions: a small state machine on the server

| State | Behavior |
| --- | --- |
| Follow | Stay within 6-12 studs of the leader; only re-path when farther than 12 (hysteresis stops jitter, as a forum reply suggests: start at 10, stop at 5) |
| Catch-up | Leader more than 40 studs away or no path: teleport to a spot behind the leader **out of the leader's camera view** |
| Engage | Enemy within range and leader in combat: attack, but never wander more than 25 studs from the leader |
| Idle | Leader still for 5 s: sit, look around, play idle animations |
| Yield | Leader walks toward the companion in a narrow space: step aside (raycast left/right for free space) |

Key details:

- **Pathfind to a point behind the leader, not to the leader.** Target `leaderRoot.CFrame * CFrame.new(2, 0, 6)`. The companion stops beside you instead of pushing you.
- **Re-path on a timer** (every 0.5-1 s) or when the leader moves more than 4 studs, not every frame.
- **`MoveTo` times out after 8 s**: chain waypoints or re-issue moves for long trips.
- **Collision groups:** put companions in a group that does not collide with their own leader, so they never block a doorway you are trying to walk through.
- **Teleport with the leader.** When the player teleports (spawn, fast travel), move the companion instantly too.

## Companion combat tips

- Make companions deal meaningful but lower damage; let them **draw** enemy threat a little so they feel useful.
- Never let a companion steal the last hit's reward unless kill credit goes to the leader (credit the owner in your damage attribution).
- Downed instead of dead: companions that revive after 20 s avoid the "my dog died, I quit" moment.

## Related
[[AI - Hub]] - [[Enemy AI Pathing Loop with PathfindingService]] - [[NPC Movement - MoveTo Timeout and Pathfinding Stutter]] - [[Steering Behaviors and Boids for NPC Groups]]

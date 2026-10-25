---
area: "07 AI and Combat"
cluster: "AI"
title: "Wildlife and Ambient Creature AI - Passive, Neutral and Hostile Behaviors"
tags: [roblox, community-knowledge, ai, wildlife, animals, ambient, open-world]
cssclasses: [tg-a07]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://minecraft.wiki/w/Mob
  - https://www.red3d.com/cwr/steer/gdc99/
  - https://create.roblox.com/docs/characters/pathfinding
  - https://create.roblox.com/docs/reference/engine/classes/BasePart#SetNetworkOwner
---
# Wildlife and Ambient Creature AI - Passive, Neutral and Hostile Behaviors

Survival games, hunting games and open-world RPGs on Roblox live or die by whether the world feels alive: deer that bolt when you sprint, wolves that circle, birds that scatter. Ambient creatures need very different AI from combat enemies: **cheap, numerous, readable and mostly about reacting to the player.** Minecraft is the best documented model of a simple, effective wildlife ruleset.

## Minecraft's three temperaments (per the Minecraft Wiki)

- **Passive**: never deliberately attacks players; after being hurt, flees in random directions.
- **Neutral**: passive until provoked (usually by an attack), then attacks whoever hit it.
- **Hostile**: attacks players inside its detection range, facing and chasing as soon as they come close.
- Most mobs **notice players within 16 blocks**, and **wander randomly only if a player is within 32 blocks**: creatures far from everyone do nothing.

Give each species a `temperament` field and you have most of the behavior for free.

## A wildlife state machine

| State | Trigger | Behavior |
|---|---|---|
| Idle / graze | default | Play idle anim, occasional head turn |
| Wander | timer 5-15 s | Pick a random point 10-30 studs away on the navmesh, walk slowly |
| Alert | player within notice radius and moving fast or close | Stop, face player, ears up, 0.5-1.5 s |
| Flee (passive) | alert escalates, or hurt | Run away from threat (Reynolds flee/evade) to 60+ studs, then return to Idle |
| Defend (neutral) | hurt, or player near young/den | Attack attacker until it is 30+ studs away or 15 s pass |
| Hunt (hostile/predator) | prey or player in range | Stalk slowly, then sprint; give up after a distance limit |

**Alert before reaction** is what makes wildlife readable and huntable: a crouching player can approach to the alert radius without triggering flight.

## Herds

- One **leader** wanders; followers keep an offset from the leader (separation + cohesion from boids).
- When any member flees, the whole herd flees in a shared direction (away from the threat, averaged with the leader's heading).
- Herds are a great way to show 10 animals with only one pathfinding call (the leader's).

## Perception tuned to play

- Notice radius scales with player **speed** and **stance**: sprinting 40 studs, walking 20, crouching 8.
- Noise events (gunshots) alert everything within 80 studs: the classic "shot scares the whole valley" moment.
- Predators notice prey creatures too, which creates emergent scenes (wolves chasing deer) for little cost.

## Performance budget

Roblox servers can drown in ambient NPCs. Rules:

- **Simulate only near players** (Minecraft's 32-block wander rule): creatures farther than ~250 studs from every player freeze or are despawned and respawned later.
- **Spawn around players, out of view**, on valid terrain, with a per-area cap; despawn when no player has been near for a while (keep tamed or named animals).
- Wildlife does not need `Humanoid` in many cases: move `AnimationController` rigs with `CFrame` or `AlignPosition` and raycast down to stick to terrain.
- Update far animals at 2 Hz and near ones at 10 Hz (see the tick budgeter note).
- Consider **client-side birds and fish**: purely cosmetic creatures can be spawned and simulated by each client with zero server cost.

## Pitfalls

- Animals fleeing into walls: flee toward a navmesh point away from the threat, not a raw direction.
- Every animal computing paths at once after a gunshot; stagger reactions by 0-0.4 s, which also looks more natural.
- Hostile wildlife spawning on top of new players at spawn; keep a safe radius.

## Related
[[AI - Hub]] - [[Steering Behaviors and Boids for NPC Groups]] - [[NPC Vision and Hearing Model]] - [[NPC Tick Budgeter]] - [[Companion and Pet Follower AI]]

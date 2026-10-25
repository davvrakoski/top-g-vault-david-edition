---
area: "07 AI and Combat"
cluster: "AI"
title: "PvE Enemy Archetypes - Fodder, Tank, Ranged, Disabler, Healer and Exploder"
tags: [roblox, community-knowledge, ai, enemies, archetypes, pve, encounter-design]
cssclasses: [tg-a07]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://www.gamedeveloper.com/design/cyber-demons-the-ai-of-doom-2016-
  - https://www.readkong.com/page/the-ai-systems-of-left-4-dead-michael-booth-valve-9664541
  - https://www.shacknews.com/article/57892/left-4-dead-at-gdc
---
# PvE Enemy Archetypes - Fodder, Tank, Ranged, Disabler, Healer and Exploder

A wave of 30 identical zombies is a DPS check, not an encounter. Good PvE games build enemies as **roles** that each ask the player a different question, then mix roles so the player must prioritize. DOOM (2016) shipped 16 AI archetypes, each with distinct behavior (Tommy Thompson's Game Developer write-up: imps keep distance and throw fireballs, pinkies charge, hell knights lunge). Left 4 Dead's special infected are the purest example of role design: each one punishes a specific bad habit of the team.

## The core roles

| Role | Question it asks | Behavior rules | Reference example |
|---|---|---|---|
| **Fodder / swarm** | Can you handle numbers? | Low HP, straight chase, dies in 1-3 hits, comes in groups | L4D common infected mobs of 20-30; DOOM zombies stagger fast |
| **Tank / brute** | Can you kite and focus? | High HP, slow, telegraphed big hits, knockback, often immune to stagger | L4D Tank, DOOM mancubus |
| **Ranged** | Can you close distance or use cover? | Keeps a preferred distance band, retreats when approached | DOOM imp |
| **Charger / rusher** | Do you watch your flanks? | Long wind-up, fast straight-line rush, vulnerable after | DOOM pinky |
| **Disabler** | Does your team stay together? | Pins or drags one player; must be freed by a teammate | L4D Smoker (prefers spots above survivors), Hunter |
| **Area denial / bomber** | Do you respect space? | Slow, explodes or leaves hazard on death or near players | L4D Boomer (spawns ahead, since it is slow and cannot chase) |
| **Support / healer** | Do you pick targets? | Stays behind the pack, heals or buffs allies, flees when targeted | Common in MMOs and horde shooters |
| **Elite / mini-boss** | Can you manage cooldowns? | Mix of two roles with more HP and a unique move | |

## Rules that make roles readable

- **Silhouette and sound per role.** Players must recognize a role from 50 studs. L4D's specials each have a distinct audio cue.
- **One job per enemy.** If the tank also shoots fireballs, it is no longer a positioning question.
- **Counter the player's favorite habit.** Players camping a corner? Add bombers. Spreading out? Add disablers.
- **Priority conflict.** Mix a role that must be killed first (healer, disabler) with a role that is dangerous to ignore (rusher). That decision is the fun.

## Implementation pattern on Roblox

Keep one generic NPC brain and drive it with an archetype config:

```lua
-- Archetypes/Bomber.lua
return {
	health = 60, walkSpeed = 10,
	preferredRange = { 0, 4 },  -- wants to touch you
	attack = "ExplodeOnContact",
	deathEffect = "AcidPool",
	spawnRule = "Ahead",        -- like the Boomer: slow, so spawn in the team's path
	threatWeight = 3,           -- director cost
	maxAlive = 2,
}
```

The state machine (Idle, Chase, KeepDistance, Attack, Flee) reads `preferredRange`, `attack` and `flee` thresholds. New enemies become new config files, not new scripts.

## Mixing waves (budget per role)

- Start each wave from a **role budget**: for example 70% fodder, 15% ranged, 10% specialists, 5% tank by cost.
- Cap simultaneous specialists (`maxAlive`) so the screen never has three disablers.
- Introduce a new role alone first, in a safe space, before mixing it (classic DOOM/Half-Life teaching pattern).

## Performance notes

- Fodder can use the cheapest movement (direct `MoveTo` toward the target or a flow field) and no pathfinding until stuck.
- Specialists get pathfinding and perception; there are few of them.
- Exploders: run the radius check on the server once at detonation, not every frame.

## Related
[[AI - Hub]] - [[Threat Tables and Target Selection for Enemies]] - [[Ranged Enemy Tactics - Cover Points, Line of Sight and Peeking]] - [[Flow Fields for Large Hordes]] - [[Production NPC State Machine]]

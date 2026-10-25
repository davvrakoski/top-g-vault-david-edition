---
area: "02 Game Design and Economy"
cluster: "Story Quests Cinematics"
title: "Stalker Monster AI Feel - Director Leash, Senses and Fair Kills"
tags: [roblox, community-knowledge, story, horror, ai, monster, fairness]
cssclasses: [tg-a02]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://www.gamedeveloper.com/design/the-perfect-organism-the-ai-of-alien-isolation
  - https://create.roblox.com/docs/characters/pathfinding
---
# Stalker Monster AI Feel - Director Leash, Senses and Fair Kills

A single unkillable monster that hunts players through the map (Piggy, the Alien, most "escape the house" games) is only scary if players believe two things: **it could find me at any moment**, and **when it catches me, it was my fault**. If the monster cheats (walks straight to a hidden player), players feel robbed. If it is dumb, it is not scary. The best documented answer is Alien: Isolation's two-layer AI, described by Tommy Thompson (AI and Games) for Game Developer in 2017 with input from Creative Assembly. It maps cleanly onto a Roblox server script plus a `PathfindingService` monster.

## Two brains

| Layer | Knows | Job |
|---|---|---|
| **Director** (macro) | Always knows where every player is | Gives the monster *hints*: "search around this room". Never the exact position. |
| **Monster** (micro) | Only what its own senses detect | Searches, hears, sees, chases. Can be fooled. |

The director also tracks a **menace gauge**: pressure rises when the monster is within short walking distance of the player, when the player can see it, and when it is close on the motion tracker and could reach the player quickly. When menace peaks, the director pulls the monster **backstage** (into vents, or a neighbouring area) to give the player a break. The article reports that across the whole campaign the alien teleports only twice, both for cutscenes.

Roblox translation: the director is a server module that every few seconds picks a **search area** near (not on) the player who has gone longest without pressure. The monster pathfinds to random points inside that area.

```lua
-- Director: hint, never the answer
local function pickSearchPoint(target)
	local root = target.Character and target.Character:FindFirstChild("HumanoidRootPart")
	if not root then return nil end
	local offset = Vector3.new(math.random(-30, 30), 0, math.random(-30, 30))
	return root.Position + offset -- the monster still has to find them
end
```

## Senses the player can understand

Alien: Isolation's alien detected footsteps (walking vs running), gunshots, the motion tracker's beeps when very close, and used short ray checks behind itself so sneaking up on it did not work. For Roblox:

- **Sight:** a view cone (dot product above about 0.5) plus a `workspace:Raycast` from the monster's head to the player's head. Darkness or hiding should reduce the range. Full model: [[NPC Vision and Hearing Model]].
- **Hearing:** each player action emits a noise radius: walking 15 studs, sprinting 40, a dropped item 50, crouching 5. The monster investigates the loudest recent noise.
- **Memory:** after losing sight, the monster goes to the *last known position*, then searches nearby points. It does not know where the player went next.

## Search like it is unsure

The article stresses that the alien searches points of interest in a deliberately **suboptimal order** and sometimes **backtracks**, which reads as doubt and gives players a chance. Do the same: shuffle the search points and revisit one. Let level designers mark **"never look here"** zones (Alien: Isolation allowed this) so a well-chosen hiding spot is never punished randomly.

## Learning without punishment

The alien had 100+ behaviour tree nodes, some **locked at the start** and unlocked as the game went on, so it seemed to learn (for example, checking lockers). The key rule: **unlocks never came from player deaths**, which would have felt unfair; timed triggers made sure it kept pace. In a chapter game, unlock "checks hiding spots" in chapter 2, "fakes leaving" in chapter 3.

## Telegraph every kill

A fair catch has a readable lead-up:

1. **Hear it** (footsteps, breathing, a theme sting) at 40+ studs.
2. **See it** before it can attack, with at least 1-2 seconds to react.
3. **Wind-up** before the hit: a scream or lunge animation of 0.3-0.6 s, during which a well-timed dodge or door slam can still save you.
4. Show **why** you died: a short replay angle or a line like "It heard you sprinting."

## Pitfalls

- **Server-side `Humanoid:MoveTo` jitter** makes the monster look drunk. Set network ownership of the monster to the server (`SetNetworkOwner(nil)`) and follow waypoints in order ([[Enemy AI Pathing Loop with PathfindingService]]).
- **Speed higher than sprint with no way to break line of sight** means every chase is a death. Monster speed slightly above walk, slightly below sprint, plus loops in the map.
- **Kill on touch** through walls: check line of sight before the attack lands.
- **Spawning in view.** Never place or teleport the monster where any player's camera can see.

## Related
[[Story Quests Cinematics - Hub]] · [[Story - Horror Tension Director - Intensity, Build Up, Peak and Relax]] · [[Horror Map Design - Pacing, Loops and Readable Darkness]] · [[Case Study - Piggy]]

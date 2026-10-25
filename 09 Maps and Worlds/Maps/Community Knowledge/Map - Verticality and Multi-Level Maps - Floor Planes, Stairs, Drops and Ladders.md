---
area: "09 Maps and Worlds"
cluster: "Maps"
title: "Map - Verticality and Multi-Level Maps - Floor Planes, Stairs, Drops and Ladders"
tags: [roblox, community-knowledge, maps, verticality, level-design, layout]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://book.leveldesignbook.com/process/layout/flow/verticality
  - https://create.roblox.com/docs/tutorials/curriculums/environmental-art/greybox-your-environment
  - https://devforum.roblox.com/t/ruskis-tutorial-1-how-to-design-a-map-layout/277853
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://create.roblox.com/docs/characters/pathfinding
---
# Map - Verticality and Multi-Level Maps - Floor Planes, Stairs, Drops and Ladders

Height is the cheapest way to make a small map feel big and a fight feel tactical, but every extra level multiplies confusion, camera problems and NPC pathing bugs. The trick is to use a few clear floor levels, give each level a reason to exist, and design up and down movement as deliberately as doors.

## Floor planes: about three per area
The Level Design Book's verticality page recommends grouping height changes into a small number of **floor planes**: bottom, middle and top. A fourth usually just adds another middle path. Merge small height differences into one plane, and don't stack many overlapping floors, because players lose track of them. It also notes that "up" and "down" are often easier goals to understand than compass directions.

Roblox's laser-tag greybox curriculum is a good worked example: a **main floor**, a **mezzanine** (the highest ground, covering half the middle combat area), a **rise** of wedges between them that breaks sightlines, and an **outdoor floor** that is the lowest point, reached by a wedge drop. Elevation is used on purpose to control sightlines and fight distance.

## Heights in studs
| Element | Starting value | Why |
|---|---|---|
| Wall a player must not jump | 10+ studs | Roblox's greybox curriculum uses 10-stud walls so default avatars can't jump them (default `JumpHeight` is 7.2) |
| Floor-to-floor in a building | 14-18 studs | Room for a third-person camera above the head; Ruski's tutorial keeps playable buildings to 2-3 stories |
| Ledge players should climb with a jump | 4-6 studs | Inside the 7.2-stud jump with margin for lag and slopes |
| Railing / half cover | 3-4 studs | Blocks bodies, not heads |

## Going up: stairs, ramps, ladders
- **Stairs need floor space.** Plan them in the blockout; a stairwell that is added later always eats a room.
- **Smooth collision under stepped visuals.** Many builders put an invisible wedge (`Transparency` 1, `CanCollide` true) under visual steps and set the steps `CanCollide` false. Movement is smoother, and the rise/run is just the wedge angle.
- **Slope limit:** `Humanoid.MaxSlopeAngle` (set from `StarterPlayer.CharacterMaxSlopeAngle`) defaults to 89 degrees, so characters walk up almost anything. If you want slopes to be barriers, lower it (for example 45) and make sure all intended ramps are below that.
- **Ladders:** `TrussPart` is climbable by default. For NPCs, pass `AgentCanClimb = true` in the pathfinding agent parameters, or they will treat ladders as walls.
- **Jump pads and lifts** add speed. The Level Design Book's Quake 3 example ("The Longest Yard") shows the cost: players in the air are predictable targets.

## Going down: drops as one-way valves
The same page notes that dropping is easier than climbing, so downward flow feels heavier, and a **one-way drop** stops backtracking. Use drops to:
- Commit players to a fight or a new area (no retreating through the chokepoint).
- Create fast return routes from high ground, so the high-ground player can't just stay up forever.
If drops should hurt, add fall damage based on fall speed, and make the safe drops visibly different (a ledge with a rail gap, a pile of boxes).

## High ground balance
High ground is strong because it sees more. Balance it by:
- **Exposure:** a high spot should be visible from several low spots.
- **Access cost:** a long stair, a loud metal walkway, or one ladder that leaves you stuck while climbing.
- **Fast exits down** (drops) but slow ways up.
The Level Design Book also warns that gamepad players aim more slowly, so avoid big height differences in PvP maps that force extreme up/down aiming; many console shooters keep floor planes mostly flat with shallow slopes.

## Readability
- Give each floor a different floor colour or material in the blockout (the greybox curriculum uses distinct colours per side and for the exterior), and keep that difference subtly in the art pass.
- Put a tall landmark through all levels (an atrium, a shaft, a tree) so players can see where they are vertically.
- If your map has a minimap, show floors separately or highlight the current floor.

## Testing
- Test every ledge with the smallest and largest avatar scales your game allows.
- Run NPC pathfinding between floors and check for unreachable areas (`PathStatus` not `Success`).
- Walk each stair at 30 FPS on a phone: steps that snag are much worse there.

## Related
[[Maps - Hub]] - [[Sightlines, Cover and Chokepoints for PvP Maps]] - [[Camera-Friendly Interiors - Occlusion Mode, Ceiling Height and Zoom Limits]] - [[Map Blockout to Art Pass Workflow]] - [[Enemy AI Pathing Loop with PathfindingService]]

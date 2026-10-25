---
area: "09 Maps and Worlds"
cluster: "Maps"
title: "Map - Capture the Flag Maps - Base Layout, Flag Rooms and Route Pace"
tags: [roblox, community-knowledge, maps, pvp, capture-the-flag, team-modes]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://unrealarchive.org/wikis/unreal-wiki/Legacy:Mapping_For_CTF.html
  - https://teamfortress.fandom.com/wiki/CTF
  - https://icculus.org/gtkradiant/documentation/Team_Arena_Mapping_Help/pages/design_tips.html
  - https://create.roblox.com/docs/tutorials/curriculums/environmental-art/greybox-your-environment
---
# Map - Capture the Flag Maps - Base Layout, Flag Rooms and Route Pace

Capture the flag (CTF) is the team mode where the map matters most. In deathmatch any route is fine; in CTF the only flow that counts is the one between the two flag rooms, and every room, door and spawn either helps the carrier escape or helps the defenders stop them. Old Unreal and Quake mapping guides solved most of this twenty years ago, and their rules translate directly to Roblox.

## The base
Most CTF maps are two identical bases facing each other (Team Fortress wiki). Inside each base:
- **A flag room that is a dead end.** The Unreal Wiki mapping guide notes CTF maps usually have at least two dead ends: the flag rooms. That is fine because the flag is the reason to go there.
- **Several exits from the flag room.** Two to three is the sweet spot. One exit is a deathtrap for attackers; five makes it impossible to defend.
- **Ownership must be obvious.** Team colour on floors, walls and lights, plus the flag on a clear central plinth. Keep the middle of the map neutral in colour.
- **Defender supplies, not power weapons.** The Unreal guide puts health and a weak weapon in the flag room and the strong pickups away from the flag, so defenders must leave their post to get them.
- **Capture point at the flag.** The TF wiki notes that separating the flag spawn and the capture zone confuses new players. On Roblox, use the same plinth for both.

## Where spawns go
Spawns decide the balance:
| Spawn position | Effect |
|---|---|
| Behind or level with the flag | Helps attackers (carriers leave before defenders respawn in front of them) |
| Between flag and middle | Helps defenders (fresh players stand in the carrier's path) |
| Closer to the middle than halfway through the base | Avoid: spawn-camping and instant re-defence |

Use `SpawnLocation.TeamColor` with `Neutral = false` and put each team's spawns inside its own base only.

## Route pace
The Unreal guide sorts CTF maps by pace:
- **Slow:** a long open middle with little cover and one central chokepoint. Whoever holds the middle wins.
- **Medium:** corridors with pillars, several routes, one chokepoint just inside each base.
- **Fast:** small maps, a figure 8 or a straight line with a few obstacles.
It recommends figure 8 or braided routes with crossovers. Roblox's own laser-tag greybox (three primary lanes, five cross lanes, 10-stud wide halls) is a good medium-pace skeleton: put a flag room behind each spawn zone.

## Distances and timing
- Measure **carrier run time** flag to flag with default `WalkSpeed` 16. 30-45 seconds on the fastest route is a good start for 6v6; much shorter means caps every minute, much longer means stalemates.
- The fastest route should also be the most exposed. Side routes are slower but have cover.
- If carriers move slower (common: `WalkSpeed` 14 while holding the flag), retime the routes with the carrier speed, not the normal one.

## Symmetry
The Unreal guide calls symmetry the surest route to balance: mirror (bases face each other) or rotational (copy and rotate a base). Structural symmetry does not need matching art; two themed bases can share the same floor plan. Avoid stacked bases where one team is above the other; the upper team can drop in. Asymmetric CTF needs many experienced playtests.

## Single-flag variants
For one-flag modes, put the flag roughly equidistant from both bases (GtkRadiant Team Arena guide), and give it more than one approach from each side.

## Roblox checklist
- [ ] Flag plinth is also the capture zone; it is a server-side `GetPartBoundsInBox` check, not `Touched`
- [ ] Each flag room has 2-3 exits and its own team colour
- [ ] Carrier run time measured on every route
- [ ] Dropped flag auto-returns after a timer if nobody touches it
- [ ] No rooftop or ledge lets a carrier skip the middle (see boundaries)
- [ ] Map tested with more players than planned (the Unreal guide warns an 8-player map will see 16)

## Related
[[Maps - Hub]] - [[Arena Map Typologies - Bowl, Figure 8, Hub and Three Lane]] - [[Spawn Area Design - SpawnLocation Rules, Protection and Exits]] - [[Sightlines, Cover and Chokepoints for PvP Maps]] - [[Map Boundaries, Kill Planes and Out-of-Bounds Handling]]

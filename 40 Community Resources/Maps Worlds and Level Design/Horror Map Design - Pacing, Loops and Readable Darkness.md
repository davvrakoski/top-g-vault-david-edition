---
area: "40 Community Resources"
cluster: "Maps Worlds and Level Design"
source_note: "community/maps-level-design/horror-map-design"
title: "Horror Map Design - Pacing, Loops and Readable Darkness"
tags: [roblox, community, level-design, horror, pacing, "cluster/maps-worlds-and-level-design"]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://book.leveldesignbook.com/process/preproduction/pacing
  - https://book.leveldesignbook.com/process/layout/typology
  - https://book.leveldesignbook.com/process/lighting
  - https://www.above-the-garage.com/wienies/
  - https://create.roblox.com/docs/characters/pathfinding
  - https://create.roblox.com/docs/tutorials/use-case-tutorials/lighting/create-flickering-lights
---
# Horror Map Design - Pacing, Loops and Readable Darkness

Horror is one of Roblox's biggest genres and one of the easiest to get wrong. A dark map is not a scary map. Fear comes from pacing (quiet, then threat, then relief), from spaces that make players feel hunted, and from darkness the player can still read.

## Pace the map like a song
The Level Design Book's pacing chapter (summarized, CC BY-NC-SA) describes levels as **beats** and suggests an **intensity graph**: plot each area's tension and check that it rises and falls. For horror maps:

| Beat | Map space | Purpose |
|---|---|---|
| Calm | Safe room, lit hallway, start area | Teach controls, build dread, let players breathe |
| Unease | Quiet rooms with small signs (blood trail, open door, sound) | Anticipation is the scariest part |
| Threat | Encounter space with a chase or hide choice | Peak |
| Relief | A save point, a locked door behind you, a lit room | Contrast that makes the next threat land |

Two rules from the same chapter fit horror especially well: **start slow and quiet**, and **don't keep players "on" all the time**; a map that is always tense becomes numb. Also avoid ending on the hardest moment; a slightly easier final escape after the peak feels better.

## Spaces that make chases work
- **Chase loops.** The "ring around the rosie" typology (small open area with solid cover in the middle) is the classic chase loop: players circle a table, a shelf or a pillar to break line of sight. Put one in every area where the monster can catch players.
- **Two ways out of big rooms.** Dead ends are fine for tension (closets, lockers) but every main room needs a second exit or the monster wins every time.
- **Hiding spots with a cost.** A locker that is perfectly safe becomes the only strategy. Make some hiding spots risky (the monster checks them sometimes) or timed.
- **Corridors with a view ahead.** A long corridor where players can see the monster coming is scarier than a corner it pops out of every time.
- **NPC pathing must agree with the map.** Mark hiding spots, safe rooms and doors with `PathfindingModifier` labels and costs so the monster's paths match your design (setup in [[Enemy AI Pathing Loop with PathfindingService]]).

## Readable darkness
- Never pure black. Keep enough ambient light that silhouettes and floors read; darkness should hide *distance*, not the floor under the player. Starting values: [[Lighting Presets by Genre - LightingStyle, Atmosphere and Post]] (HorrorNight preset) and [[Lighting too dark - overprocessed]].
- Light the critical path with motivated sources (a lamp, an exit sign, moonlight through a window). Players should be able to find the way out without a flashlight, but slowly.
- Use flicker and colour as signals: flicker = danger nearby, red = exit or hazard. Roblox's [[Create flickering lights]] tutorial covers the effect.
- Test on a phone in a bright room. If you can't see anything, your players can't either.

## Sound as a map tool
Stephen Clarke-Willson's "audible weenie" idea (above-the-garage.com) works in reverse in horror: a sound ahead (dripping, a radio, scraping) pulls players forward and builds dread before they see anything. Use 3D sounds placed in the world, not global music, so direction reads. More: [[Audio Zones, Occlusion and Mixing]].

## Room-based horror maps
Games built from many short rooms (the "Doors" style) keep pacing fresh by mixing room types: corridors, big halls, dark rooms, safe rooms. Generate them from a pool of prefab rooms with [[Room-Chain Generation with Connector Attachments]] and weight the pool so threat rooms never come three in a row.

## Checklist
- [ ] Intensity graph sketched for the whole map; every peak followed by relief
- [ ] Every monster area has a chase loop and a second exit
- [ ] Hiding spots have a weakness
- [ ] Monster pathing uses modifiers for doors, hiding spots and safe rooms
- [ ] Map readable on a phone at lowest graphics; never pure black
- [ ] 3D sound cues lead toward objectives

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Maps Worlds and Level Design - Hub]]

**Related notes:** [[Horror Starter Architecture]] · [[ReRand Open Games - RENTED Horror, ACE-ULTRA Shooter and Workshop Template (Apache-2.0)]] · [[Guiding Players with Light, Color and Affordance]] · [[Room-Chain Generation with Connector Attachments]]

<!-- TDOD_GRAPH_END -->

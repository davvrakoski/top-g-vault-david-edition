---
area: "09 Maps and Worlds"
cluster: "Maps"
title: "World - Dungeon Rooms and Boss Arenas"
tags: [roblox, community-knowledge, maps, dungeon, boss, combat]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://kenney.nl/assets/modular-dungeon-kit
  - https://kenney.nl/assets/mini-dungeon
  - https://create.roblox.com/docs/reference/engine/classes/PathfindingService
  - https://book.leveldesignbook.com/process/combat
---
# World - Dungeon Rooms and Boss Arenas

Dungeons are a rhythm: corridor, fight room, reward, corridor, harder fight, boss. Handcrafted rooms with clear purposes beat random sprawl, and the boss arena is the one room that deserves a design document of its own. (For procedural room chaining, see the room-chain note; this note is about what goes inside each room.)

## Room types and sizes
| Room | Size (studs) | Purpose |
|---|---|---|
| Corridor | 12-16 wide | Breather, pacing, foreshadowing |
| Fight room | 60-90 square | 1-3 waves, cover pillars, two entrances |
| Puzzle / trap room | 40-60 | Readable hazards, no combat |
| Treasure room | 20-40 | Reward, dead end, often hidden |
| Pre-boss antechamber | 30-50 | Checkpoint, heal, shop, "point of no return" door |
| Boss arena | 120-200 across | One big readable space |

## Boss arena recipe
1. **Shape:** circle or rounded square. Corners are where players get trapped by the camera and by AoE attacks.
2. **Clear floor, few obstacles.** 3-5 pillars or cover pieces max; the boss's attacks are the "terrain".
3. **Telegraph zones:** the floor must contrast with attack decals (red/orange ground circles, glowing cracks). Keep the floor a flat, mid-dark material so telegraphs pop.
4. **Height for the camera:** ceiling at least 40-60 studs or open sky. Large bosses fill the screen in low rooms.
5. **Phase spaces:** reveal new areas per phase (a floor collapses, side alcoves open, the arena floods). Changing the arena is cheaper than new attacks and feels huge.
6. **Entry lock and exit reward.** Door seals on entry, opens to a reward room when the boss dies. Save a respawn point just outside.
7. **NPC pathing:** check the boss can reach every spot with PathfindingService, or make sure "unreachable" spots are intentional.

## Key kits
- Kenney **Modular Dungeon Kit** and **Mini Dungeon**: CC0, bundle-safe.
- KayKit **Dungeon Remastered** (CC0) for a chunky stylised look.

## Lighting tips
- Dungeons: warm torches near doors, darker middles; light the exits so players always know where to go.
- Boss arena: brighter and evenly lit compared with the dungeon; dramatic rim light from braziers or a sky hole. Players must see every telegraph.
- Phase changes can shift the color (blue -> red) via a `ColorCorrectionEffect` tween.

## Performance budget
- Each room is a Model; only the current and neighbouring rooms need to exist or be streamed.
- Boss fights are VFX-heavy - keep the arena itself simple (few props, few shadowed lights) to leave headroom for effects.

## Common mistakes
- Boss arenas with clutter that blocks dodges or hides telegraphs.
- Arena floors the same color as attack warnings.
- Long walk back after dying - put the checkpoint at the door.
- Every room the same square; vary size and height to create rhythm.

## Related
[[Maps - Hub]] - [[Room-Chain Generation with Connector Attachments]] - [[Arena Map Typologies - Bowl, Figure 8, Hub and Three Lane]] - [[Spawn Area Design - SpawnLocation Rules, Protection and Exits]]

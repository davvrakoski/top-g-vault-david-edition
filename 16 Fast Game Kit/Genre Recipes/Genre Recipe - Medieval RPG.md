---
area: "16 Fast Game Kit"
cluster: "Genre Recipes"
tags: [fast-game-kit, roblox, genre-recipe, rpg, medieval, fantasy]
cssclasses: [tg-a16]
---

# Genre Recipe - Medieval RPG

## Why this matters
A medieval/fantasy RPG (town hub, quests, dungeons, loot, levels) is the classic "one more run" game, and it fits co-op play with friends very well.
The vault is strongest here on assets: the Kenney Castle, Fantasy Town and Dungeon kits plus KayKit's rigged adventurers and skeletons give you a complete stylised world without modelling.

## Core loop in 3 lines
1. **Prepare:** in town, take quests, buy/upgrade gear, form a party.
2. **Adventure:** clear a dungeon or field zone: fight enemies, find loot, beat a boss.
3. **Grow:** XP, levels and better gear unlock harder dungeons; repeat.

Deeper breakdown: [[Open World RPG Starter Architecture]] · [[Master Build Order]].

## MVP feature list
- [ ] One town hub (shops, quest board, blacksmith).
- [ ] One field zone + one dungeon (5-8 rooms) with a boss.
- [ ] 3 enemy types (melee, ranged, tank) + 1 boss with 2 phases.
- [ ] Melee combat (sword) + 1 alternative (bow or staff) with 2-3 skills.
- [ ] Inventory + equipment slots (weapon, armour, trinket).
- [ ] Loot tables with rarities (earned by play: no paid randomness).
- [ ] 10 quests (kill, collect, talk), XP and levels 1-20.
- [ ] Party/co-op: friends in the same dungeon instance.
- [ ] Saving, currency, shop, settings, codes: from [[Starter Code - Hub]].

## Realistic timeline (estimates)

| Team | MVP (1 town, 1 dungeon) | 3 dungeons + crafting + mounts |
|---|---|---|
| Solo, with the Starter Code kit | 6-10 weeks | 4-6 months |
| Small team (2 scripters, builder, animator/VFX) | 4-6 weeks | 2-4 months |

## Build order, week by week

| Week | Build | Done when |
|---|---|---|
| 1 | Melee combat, 1 enemy with state machine + pathfinding, health, death/respawn | Fighting 3 enemies feels good |
| 2 | Inventory, equipment, loot table drops, XP and levels | Kill → loot → equip → stronger loop saves |
| 3 | Dungeon (Modular Dungeon Kit), enemy types 2-3, room gating | Clearing the dungeon takes 10-15 minutes |
| 4 | Boss with phases, second weapon type + skills | Boss is readable and fair |
| 5 | Town hub, quests (10), NPC dialogue, shops | New player finds the dungeon from the quest board |
| 6 | Party/co-op instance, lighting, juice, art pass | 4 friends can run the dungeon together |
| 7-8 | Shop, analytics, mobile controls, performance, soft launch | [[Launch Week Checklist]] done |

## Systems from the vault

| System | Notes |
|---|---|
| Combat | [[Melee Combo Blueprint]] · [[Server-Authoritative Melee Pattern]] · [[Hitbox Detection - Spatial Queries vs Raycasts vs Shapecasts]] · [[Combat Feel Tuning Worksheet]] |
| Ranged / magic | [[Client-Predicted, Server-Validated Projectiles]] · [[Energy Orb and Projectile VFX]] · [[Elemental Weapon VFX System — Fire, Ice, Arcane, Holy and Dark]] |
| Skills | [[Ability and Status Framework]] · [[Damage and Status Effects Blueprint]] · [[FX - Healing, Buff and Debuff Auras - Status VFX Players Can Read]] |
| Enemies | [[Production NPC State Machine]] · [[Enemy AI Pathing Loop with PathfindingService]] · [[Behavior Trees and Utility AI in Luau]] · [[Ranged Enemy Tactics - Cover Points, Line of Sight and Peeking]] |
| Encounters | [[Encounter Director and Pacing]] · [[Threat Tables and Target Selection for Enemies]] · [[Scalable NPC Update Scheduler]] |
| Boss | [[Boss Fight Design - Phases, Telegraphs and Arena Rules]] · [[FX - Magic Circles - Rotating Rune Decals, Rising Beams and Cast Telegraphs]] |
| Inventory / gear | [[Inventory and Equipment Blueprint]] · [[Inventory Equipment and Loot Framework]] · [[Net - Inventory Data Models - Stacks, Unique Items and Item IDs]] · [[Custom Inventory and Hotbar - Community Approaches]] |
| Loot | [[Weighted Loot Table]] · [[Math - Drop Chance Math - At Least Once, Expected Tries and Stacking]] · [[Pity Timers and Pseudo-Random Distribution]] |
| Levels | [[Progression, XP, and Skill Tree Blueprint]] · [[XP Curve Formulas - Time-to-Level Targets and Level Caps]] |
| Quests / dialogue | [[Quest System Blueprint]] · [[Quest Objective Framework]] · [[Dialogue Trees as Data - Nodes, Conditions and Effects]] · [[Daily Quest Rotation - Deterministic Seeds and Fair Resets]] |
| Dungeons | [[World - Dungeon Rooms and Boss Arenas]] · [[Procedural Dungeon and Room Generation]] · [[Room-Chain Generation with Connector Attachments]] |
| Castles / town | [[World - Castles and Keeps]] · [[Low-Poly Village Kit — Clean Stylized Production]] · [[Wayfinding with Landmarks and Weenies]] |
| Party / instances | [[Social Systems - Parties, Friends and Co-Play]] · [[TeleportService Flows With Data and Reserved Servers]] · [[Story - Co-op Story Checkpoints - Respawn, Catch-Up and Party Wipes]] |
| Crafting (later) | [[Crafting System Blueprint]] · [[Recipe - Crafting Table]] |
| Mounts (later) | [[Char - Mounts and Riding Animals]] |
| Look | [[Lighting Presets by Genre - LightingStyle, Atmosphere and Post]] · [[Vibrant Fantasy Biome — Saturated Without Becoming Noise]] |
| Dupe safety | [[Anti-Dupe Transaction Blueprint]] · [[Test - Dupe Hunting Test Script - Trades, Gifts, Drops and Rejoins]] |

## Assets from the vault

| Need | Use | Notes |
|---|---|---|
| Castle, walls, siege weapons | [[Kenney - Castle Kit]] | Towers, gates, drawbridge, catapult, trebuchet, ballista |
| Town buildings | [[Kenney - Fantasy Town Kit]] · [[Kenney - Retro Fantasy Kit]] | Houses, roofs, stalls, docks |
| Dungeons | [[Kenney - Modular Dungeon Kit]] · [[Kenney - Mini Dungeon]] · [[More Free Sources - KayKit]] (Dungeon Remastered, 203 FBX) | Rooms, corridors, props |
| Caves | [[Kenney - Modular Cave Kit]] | Mines, cave dungeons |
| Hex overworld (option) | [[More Free Sources - KayKit]] (Medieval Hexagon Pack) · [[Kenney - Hexagon Kit]] | Stylised world map |
| Heroes and enemies (rigged) | [[More Free Sources - KayKit]] (Adventurers, Skeletons) | Rigged and animated, CC0 |
| Nature | [[Kenney - Nature Kit]] · [[Kenney - Mini Forest]] | Forests, rocks, fields |
| Graveyard zone | [[Kenney - Graveyard Kit]] | Crypts, skeleton/zombie characters |
| Extra dungeon pieces | [[More Free Sources - OpenGameArt CC0]] (Modular Dungeon, Modular Temple, Fantasy Chest, Stone Pillars) | CC0 |
| Realistic props (if going realistic) | [[Poly Haven Roblox-Ready - Catalog]] (Weapons, Containers, Furniture) | Do not mix with low-poly kits |
| Skill VFX | [[Top G Originals - VFX Mesh Pack]] | Slashes for swords, `VFX_Ground_Decal` magic circles, `VFX_Sphere_Shell` orbs, `VFX_Dome_Half` shields |
| NPC personality walks | [[100STYLE Mocap - Catalog]] | `Old`, `WalkingStickLeft`, `Proud`, `Monk`, `Heavyset` for townsfolk; retarget + credit |

![[20 FBX Asset Library/Kenney/Castle Kit/Preview.png|300]] ![[20 FBX Asset Library/Kenney/Fantasy Town Kit/Preview.png|300]]

## Monetization that fits

| Item | Type | Notes |
|---|---|---|
| Extra inventory / bank slots | Pass | Quality of life |
| 2x XP (timed) | Dev product | Safe |
| Cosmetic armour sets, capes, weapon skins | Dev product | Cosmetic ([[Accessories by Script - AddAccessory, Attachment Names and Game Gear]]) |
| Pets/companions (cosmetic) | Dev product | [[Companion and Pet Follower AI]] |
| Dungeon revive | Dev product | Keep cheap and optional |
| Loot boxes / chest keys for Robux | Paid random item | Avoid in v1; if added later: odds UI + PolicyService ([[Paid Random Items, Odds Disclosure and PolicyService]]) |

## Don't copy
- Generic fantasy (knights, dragons, elves, skeletons) is free to use. Specific worlds are not: no names, maps, races, logos or characters from well-known fantasy films, books or games.
- Do not copy another Roblox RPG's map, item names, UI or class names.
- Notes: [[Reference IP, Originality and Asset Rights]] · [[Policy - Using Brands, the Roblox Name and Licensed IP]].

## Top 5 time-wasters
1. **An open world first.** One town and one dungeon prove the loop; the world grows with updates.
2. **Deep crafting at launch.** Crafting needs many items to matter. Add it once loot is varied.
3. **Writing lore before quests work.** Players read little; keep quest text short ([[Story - Writing for Kids and Teens on Roblox - Reading Level, Tone and Safety]]).
4. **Too many classes.** Two weapon types with 2-3 skills each are enough for v1.
5. **Unbudgeted NPC counts.** Dozens of humanoid enemies tank servers ([[NPCs tank server performance]] · [[Perf - Humanoid Cost Knobs for NPCs - States, EvaluateStateMachine and Humanoid-Free Rigs]]).

## Related
[[Genre Recipes - Hub]] · [[Genre Recipe - Open-Sea Action RPG]] · [[Genre Recipe - Horror]] · [[AI - Hub]] · [[Story Quests Cinematics - Hub]] · [[Inventory Economy - Hub]]

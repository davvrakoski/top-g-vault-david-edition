---
area: "16 Fast Game Kit"
cluster: "Genre Recipes"
tags: [fast-game-kit, roblox, genre-recipe, rpg, open-sea, pirate]
cssclasses: [tg-a16]
---

# Genre Recipe - Open-Sea Action RPG

## Why this matters
Open-sea action RPGs (islands, boats, quests, bosses and power-granting relics, in the vein of pirate-anime-inspired Roblox hits) combine three strong hooks: exploration, combat and collecting powers.
They are also big. This recipe shows how to ship a **small first sea** fast, with original names, and grow it with updates.

> [!warning] Scope alert
> This is one of the largest genres in this kit. Plan for the MVP below, not for the game you see at the top of the charts after years of updates.

## Core loop in 3 lines
1. **Quest:** take quests on an island, fight NPC enemies, level up.
2. **Sail:** take your boat to the next island; find relics (powers), weapons and bosses.
3. **Grow:** stats and abilities unlock harder islands and bosses; repeat sea by sea.

Deeper breakdown: [[Open World RPG Starter Architecture]] · [[Anime Action Starter Architecture]] · [[Case Study - Blox Fruits]].

## MVP feature list
- [ ] 2 islands (starter + level 15-30) and the sea between them.
- [ ] One boat type with spawn/despawn at docks.
- [ ] Melee combat (M1 combo) + 1 weapon type (sword).
- [ ] 3 "relic" powers with 3 moves each (original names, see Don't copy).
- [ ] 3 enemy types + 1 boss with phases.
- [ ] Quest giver NPCs with kill/collect quests (10-15 quests).
- [ ] Level, XP, stat points (strength, defence, relic power).
- [ ] Relic spawns in the world on a timer (free) as the main source in v1.
- [ ] Saving, currency, shop, settings, codes: from [[Starter Code - Hub]].

## Realistic timeline (estimates)

| Team | MVP (2 islands, 3 relics, 1 boss) | First sea complete (5-6 islands, 8 relics) |
|---|---|---|
| Solo, with the Starter Code kit | 8-12 weeks | 5-8 months |
| Small team (2 scripters, builder, animator/VFX) | 4-8 weeks | 3-5 months |

## Build order, week by week

| Week | Build | Done when |
|---|---|---|
| 1 | Melee combat + enemy AI + XP/levels on a grey island | Fighting 5 enemies to level 3 feels good |
| 2 | Quest system + 5 quests + NPC dialogue, stat points | Quest → level → stats loop works and saves |
| 3 | Boat: spawn at dock, sailing, buoyancy, dock-to-dock travel | Two players can sail together without jitter |
| 4 | Relic system: 3 relics, 3 moves each, VFX, world spawns | Relics feel distinct; held relic saves |
| 5 | Island 2, boss with phases, sword weapon | Boss fight takes 2-4 minutes and is fair |
| 6 | Art pass, water look, lighting, juice | Screenshots look like a real game |
| 7 | Shop, analytics, mobile controls, performance + streaming | Phone runs both islands with StreamingEnabled |
| 8 | QA, thumbnails, soft launch | [[Launch Week Checklist]] done |

## Systems from the vault

| System | Notes |
|---|---|
| Combat | [[Melee Combo Blueprint]] · [[Server-Authoritative Melee Pattern]] · [[Hitbox Detection - Spatial Queries vs Raycasts vs Shapecasts]] · [[Hitstun, I-Frames, Poise and Super Armor]] |
| Relic powers | [[Ability and Status Framework]] · [[FX - Ability VFX Timelines - Wind-Up, Release, Impact and Linger as Data]] · [[Elemental Weapon VFX System — Fire, Ice, Arcane, Holy and Dark]] |
| Enemies | [[Production NPC State Machine]] · [[Enemy AI Pathing Loop with PathfindingService]] · [[Threat Tables and Target Selection for Enemies]] · [[NPC Crowds, Animation LOD and Server Budgets]] |
| Bosses | [[Boss Fight Design - Phases, Telegraphs and Arena Rules]] · [[World - Dungeon Rooms and Boss Arenas]] |
| Quests | [[Quest System Blueprint]] · [[Quest Objective Framework]] · [[Dialogue Trees as Data - Nodes, Conditions and Effects]] · [[NPC Conversation UX - Prompts, Typewriter Text and Skipping]] |
| Levels and stats | [[Progression, XP, and Skill Tree Blueprint]] · [[XP Curve Formulas - Time-to-Level Targets and Level Caps]] · [[Starter - First Level and XP System - Level-Up Formula and XP Bar]] |
| Boats | [[Hover, Boat and Flying Vehicles with Mover Constraints]] · [[Ride - Boat Planing, Hull Trim and Speed-Driven Wakes]] · [[Physics - Custom Buoyancy Math - Archimedes with VectorForce]] · [[Boats and Ocean Resources - BuoyancySensor, Gerstner Waves and FFT Ocean]] |
| Boat spawning / ownership | [[Vehicle Spawner and Garage System - Server Flow]] · [[Vehicle Network Ownership Recipes - Drivers, Passengers and Exit Jolts]] · [[Riding Moving Vehicles - Keeping Standing Players Onboard]] · [[Ride - Anchors and Mooring with RopeConstraint]] |
| Islands and sea | [[World - Tropical Islands and Beaches]] · [[Map - Water as a Level Design Tool - Rivers as Barriers, Bridges, Fords and Boat Routes]] · [[Open World Layout - POIs, Triangle Rule and Travel Time]] · [[Wayfinding with Landmarks and Weenies]] |
| Water look | [[Water, Shorelines and Foam — Practical Roblox Approach]] · [[Terrain Water Gameplay - Swimming Checks, Disabling Swim and Water Settings]] · [[FX - Water Element VFX - Water Orbs, Tidal Waves and Splash Crowns]] |
| Streaming / seas | [[Large World Streaming Architecture]] · [[StreamingEnabled Gotchas and Streaming-Safe Client Code]] · [[Multi-Place Experience Architecture]] (later seas as places) · [[TeleportService Flows With Data and Reserved Servers]] |
| Drops | [[Weighted Loot Table]] · [[Inventory and Equipment Blueprint]] |
| Lighting | [[Lighting Presets by Genre - LightingStyle, Atmosphere and Post]] · [[Day-Night Cycle and Weather Transitions in Practice]] |

## Assets from the vault

| Need | Use | Notes |
|---|---|---|
| Ships, docks, cannons, flags | [[Kenney - Pirate Kit]] | Pirate ships (small/medium/large), ghost ship, wreck, docks, cannons, chests, palms |
| Small boats | [[Kenney - Watercraft Kit]] | Row boats, sail boats, speed boats, buoys, cargo |
| Realistic ship props | [[Poly Haven Roblox-Ready - Catalog]] (Ships, Containers, Props) | Barrels, crates, ropes |
| Island nature | [[Kenney - Nature Kit]] · [[More Free Sources - OpenGameArt CC0]] (palm trees, rocks) | Palms, rocks, cliffs |
| Island towns | [[Kenney - Fantasy Town Kit]] · [[Kenney - Retro Fantasy Kit]] | Houses, docks, stalls |
| Forts / marine base | [[Kenney - Castle Kit]] | Walls, towers, gates |
| Treasure, crates | [[Kenney - Survival Kit]] · [[More Free Sources - OpenGameArt CC0]] (Low Poly Gold Treasure, Fantasy Chest) | Loot props |
| NPCs / enemies | [[More Free Sources - KayKit]] (Adventurers, Skeletons: rigged + animated) · [[Kenney - Animated Characters Protagonists]] | Skeleton pirates for a cursed island |
| Relic VFX | [[Top G Originals - VFX Mesh Pack]] | `VFX_Tornado_Twist` (wind relic), `VFX_Crystal_Shards` (ice), `VFX_Pillar_Tapered` (fire), `VFX_Lightning_Bolt_A/B` (storm), `VFX_Sphere_Shell` (orbs) |
| NPC idle/walk variety | [[100STYLE Mocap - Catalog]] | `Drunk`, `Proud`, `Old`, `HandsInPockets` for town NPCs; credit required |

![[20 FBX Asset Library/Kenney/Pirate Kit/Preview.png|360]]

## Monetization that fits

| Item | Type | Notes |
|---|---|---|
| 2x XP / 2x drop rate (timed or permanent) | Pass or product | A drop-rate boost on random drops **changes odds**: show the effect numerically |
| Relic storage slots | Pass | Quality of life |
| Fast boat / boat skins | Pass | Cosmetic + travel speed |
| Buy a specific relic | Dev product | Fixed price, no randomness, simplest to make compliant |
| Relic "spin" / random roll | Paid random item | Odds UI + PolicyService gate ([[Paid Random Items, Odds Disclosure and PolicyService]] · [[Luck Multipliers - How Boosts Change the Odds You Must Show]]) |
| Private servers | Built-in | Grinding with friends |

## Don't copy
**This genre is inspired by a famous anime. Keep everything original.**

| Do not use | Use your own instead (examples) |
|---|---|
| "Devil Fruit", fruit names, fruit designs | "Relics", "Tide Stones", "Storm Shards" with your own designs |
| "Haki", "Observation/Armament" | "Resolve", "Focus", "Iron Will" |
| Character names, crews, outfits, the straw hat, Jolly Roger designs | Your own captains, factions and flags |
| "Grand Line", "Sea Kings", "Marines" as named | "The Shattered Sea", "Deepbeasts", "The Admiralty Watch" |
| Another Roblox game's island layouts, UI, quest text, sword names | Original layouts and writing |

Notes: [[Policy - Using Brands, the Roblox Name and Licensed IP]] · [[Policy - Copyright and Trademark Takedowns - Notices and Counter Notices]] · [[Reference IP, Originality and Asset Rights]] · official [[Intellectual Property Guidelines]]. A licensed tie-in is only possible through official licensing ([[IP licensing for creators]]).

## Top 5 time-wasters
1. **Building the whole ocean at once.** Ship 2 islands; each update adds an island.
2. **Physics boats tuned last.** Boat jitter and ownership bugs take time; build the boat in week 3, not week 7.
3. **Twenty relics at launch.** Three great relics beat twenty weak ones; each new relic is an update headline.
4. **Unbounded sea size.** A huge empty ocean is boring and costly. Keep sailing time short ([[Open World Layout - POIs, Triangle Rule and Travel Time]]).
5. **Random relic rolls in v1.** World spawns and fixed-price relics ship faster and need no odds UI.

## Related
[[Genre Recipes - Hub]] · [[Genre Recipe - Fighting Battlegrounds]] · [[Genre Recipe - Medieval RPG]] · [[Vehicles - Hub]] · [[Story Quests Cinematics - Hub]] · [[Scope Cutter - What to Build First]]

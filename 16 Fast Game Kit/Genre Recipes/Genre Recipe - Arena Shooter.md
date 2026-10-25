---
area: "16 Fast Game Kit"
cluster: "Genre Recipes"
tags: [fast-game-kit, roblox, genre-recipe, shooter, pvp]
cssclasses: [tg-a16]
---

# Genre Recipe - Arena Shooter

## Why this matters
Short-round arena shooters (duels and small-team fights in compact maps, in the style popularised by games like RIVALS and Arsenal) have very high replay value: a 2-minute round is the whole loop.
They are also the genre where networking quality decides everything. Hit registration that feels unfair kills the game faster than missing content, so most of the vault links here are about netcode.

## Core loop in 3 lines
1. **Queue:** join a 1v1 / 2v2 / 5v5 match from the lobby.
2. **Fight:** short round on a small map; first to N kills or rounds wins.
3. **Unlock:** earn currency/XP, unlock weapons and cosmetic skins, queue again.

Deeper breakdown: [[FPS TPS Starter Architecture]] · [[Round PvP Starter Architecture]] · [[Case Study - Rivals]] · [[Case Study - Arsenal]].

## MVP feature list
- [ ] Lobby + queue for one mode (1v1 duel or 2v2 is the smallest).
- [ ] Round system: countdown, round, win screen, back to lobby.
- [ ] 4 weapons: pistol, rifle, shotgun, sniper (config-driven).
- [ ] Hitscan or projectile weapons with server validation and lag compensation.
- [ ] Health, damage, headshots, kill feed, spectate on death.
- [ ] 2-3 small maps with clear sightlines and cover.
- [ ] Recoil/spread, muzzle flash, hit marker, hit sound.
- [ ] Mobile fire button + aim assist for touch/gamepad.
- [ ] Currency/XP, weapon unlocks, shop, settings (sensitivity!): from [[Starter Code - Hub]].

## Realistic timeline (estimates)

| Team | MVP (1 mode, 4 weapons, 2 maps) | With ranked + skins shop |
|---|---|---|
| Solo, with the Starter Code kit | 4-6 weeks | 8-12 weeks |
| Small team (2 scripters + builder + VFX) | 2-4 weeks | 6-8 weeks |

Shooters take longer than they look because of netcode testing with real latency.

## Build order, week by week

| Week | Build | Done when |
|---|---|---|
| 1 | One weapon end to end: input, client effects, server hit check, damage, kill | Two players at 150 ms simulated ping agree on who hit whom |
| 2 | Round system, lobby queue, kill feed, spectate, 2 more weapons | A full 1v1 match runs start to finish |
| 3 | Maps 1-2, weapon 4, recoil/spread, aim assist, mobile controls | Phone and gamepad players can compete |
| 4 | Juice (VFX, sounds, hit-stop), unlocks, shop, analytics | Funnel: join → first match → first unlock |
| 5-6 | Anti-exploit pass, performance, thumbnails, soft launch | [[Launch Week Checklist]] done |

## Systems from the vault

| System | Notes |
|---|---|
| Weapons | [[Hitscan and Projectile Weapon Blueprint]] · [[Config-Driven Weapons]] |
| Netcode | [[Client-Predicted, Server-Validated Projectiles]] · [[Lag Compensation and Server Rewind for Melee and Hitscan]] · [[Latency, Prediction and Reconciliation]] |
| Projectiles | [[Projectile Libraries - FastCast, FastCast2 and SwiftCast]] · [[Projectile Ballistics - Gravity Arcs, Launch Angles and Lead]] · [[Raycasts and Shapecasts - RaycastParams in 2026]] |
| Gun feel | [[Recoil, Spread and Bloom for Roblox Guns]] · [[Math - Weapon Spread and Bell Curves - Cone Sampling and Gaussian Random]] · [[FOV Punch, Sprint FOV and Zoom]] · [[Trauma-Based Camera Shake]] |
| Hits and kills | [[Headshots and Hit Zones - Damage Multipliers and Accessory Hits]] · [[Kill Credit, Assists and Damage Attribution]] · [[Recipe - Kill Feed]] |
| Rounds and lobby | [[Recipe - Round System with Intermission]] · [[Lobby and Round System Blueprint]] · [[Recipe - Spectate Mode]] |
| Matchmaking | [[Matchmaking Blueprint]] · [[MemoryStore Queues and Sorted Maps for Matchmaking]] · [[Map - Minigame Hubs and Duel Pads - Parallel Arenas in One Server]] |
| Maps | [[Arena Map Typologies - Bowl, Figure 8, Hub and Three Lane]] · [[Sightlines, Cover and Chokepoints for PvP Maps]] · [[Map Rotation and Voting - Loading Maps from ServerStorage]] · [[Spawn Area Design - SpawnLocation Rules, Protection and Exits]] |
| First person | [[First-Person Viewmodels - Arms Rig, Camera Binding and Sway]] · [[First-Person Mode, Visible Body and Viewmodels]] |
| Input | [[Aim Assist for Gamepad and Touch]] · [[Mobile Action Buttons - Input Action System and ContextActionService]] · [[Platform - Gamepad Gameplay Input - Thumbsticks, Triggers, Dead Zones and Multiple Pads]] |
| VFX | [[Muzzle Flash Recipe - Flash, Light, Smoke and Shell]] · [[Impact Decals - Bullet Holes, Scorch Marks and Pooling]] · [[FX - Hit Sparks per Material - An Impact Lookup Table]] |
| Anti-exploit | [[Server-Side Movement Validation and Anti-Exploit Checks]] · [[Tool Security - Equip Checks, Server Cooldowns and Dropped Tools]] · [[Anti-Cheat Reality Check - What Servers Can and Cannot Catch]] |
| Performance | [[Speed - Case Study - Fixing a Laggy Shooter]] · [[Remote Send Rate - Batching, Deltas and When One Remote Is Not Faster]] |
| QA | [[Test - Combat Regression Checklist]] · [[Device, Network and Controller Simulation Test Pass]] |
| Open-source reference | [[ReRand Open Games - RENTED Horror, ACE-ULTRA Shooter and Workshop Template (Apache-2.0)]] · [[Roblox Weapons Kit and NPC Kit - Official Prefabs (Limited Use License)]] |

## Assets from the vault

| Need | Use | Notes |
|---|---|---|
| Weapons (stylised) | [[Kenney - Blaster Kit]] | 18 blasters, scopes, silencers, clips, grenades, targets |
| Extra guns / crates | [[More Free Sources - OpenGameArt CC0]] | Hunting rifle, flamethrower, weapon crates, ammo box |
| Arena pieces | [[Kenney - Mini Arena]] · [[Kenney - Prototype Kit]] | Walls, columns, stairs, cover blocks |
| Industrial map | [[Kenney - City Kit (Industrial)]] · [[Kenney - Factory Kit]] · [[Poly Haven Roblox-Ready - Catalog]] (Industrial, Containers) | Warehouses, containers, catwalks |
| Sci-fi map | [[Kenney - Space Station Kit]] · [[More Free Sources - KayKit]] (Space Base Bits) | Corridors, rooms |
| Urban map | [[Kenney - City Kit (Commercial)]] · [[Kenney - Retro Urban Kit]] | Streets and rooftops |
| VFX | [[Top G Originals - VFX Mesh Pack]] | `VFX_Cone_Burst` muzzle blast, `VFX_Impact_Star_Sharp` hit flash, `VFX_Trail_Ribbon` tracers |
| Locomotion (NPC bots, lobby) | [[100STYLE Mocap - Catalog]] | Sidestep clips (`SW`/`SR`) for strafing bots; retarget to R15, credit required |
| Map workflow | [[Map Blockout to Art Pass Workflow]] · [[Industrial Warehouse Interior — Modular Roblox Build]] | Blockout with parts first |

![[20 FBX Asset Library/Kenney/Blaster Kit/Preview.png|360]]

## Monetization that fits

| Item | Type | Notes |
|---|---|---|
| Weapon skins / wraps | Dev product or pass | Cosmetic only; do not sell better stats |
| Weapon unlock early | Dev product | Only if the free unlock is reachable in reasonable play |
| Emotes / finishers | Dev product | Cosmetic ([[Custom Emotes in Your Game - Own Wheel, PlayEmoteAsync and Validation]]) |
| Private servers | Built-in | Friends' lobbies |
| Season pass (later) | Dev product | Needs a live player base ([[Season Pass Tier Pacing - XP per Tier and Mission Budget Math]]) |
| Skin cases / crates (later) | Paid random item | Full odds UI + PolicyService gate ([[Paid Random Items, Odds Disclosure and PolicyService]]) |

Competitive games lose players fast if purchases change who wins. See [[Ethical Monetization Lines - Where Devs Draw Pay-to-Win]].

## Don't copy
- Do not use RIVALS, Arsenal or any other game's name, logo, UI layout, weapon skins or maps. "Short-round duel shooter" is a genre; their art and branding are theirs.
- No real gun brand names or trademarked weapon designs; generic names ("Rifle", "Scout") are safe.
- Check maturity settings for realistic weapons and blood ([[Maturity Questionnaire Walkthrough - Common Genre Answers]] · [[FX - Kid-Friendly Hit Feedback - Blood Alternatives and Maturity Labels]]).
- Notes: [[Policy - Using Brands, the Roblox Name and Licensed IP]] · [[Reference IP, Originality and Asset Rights]].

## Top 5 time-wasters
1. **Client-decided hits.** Exploiters will kill everyone; rebuild later costs weeks. Validate from day one.
2. **Testing only at 0 ms.** Use network simulation; most real players are not on a perfect connection.
3. **Many modes before one is fun.** Ship duels, add modes once the base fight is good.
4. **Big maps.** Arena shooters need small maps; long walks between fights kill short-session play.
5. **Hand-made weapon scripts per gun.** One weapon system + a config table per weapon.

## Related
[[Genre Recipes - Hub]] · [[Genre Recipe - Fighting Battlegrounds]] · [[Genre Recipe - GTA-Lite City]] · [[Combat - Hub]] · [[Ship a Roblox Game in 30 Days]]

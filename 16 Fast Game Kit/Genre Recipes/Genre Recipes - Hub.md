---
area: "16 Fast Game Kit"
cluster: "Genre Recipes"
tags: [fast-game-kit, roblox, genre-recipe, graph-hub]
cssclasses: [tg-a16]
---

# Genre Recipes - Hub

## Why this matters
Picking the genre is the biggest scope decision you make. A genre recipe tells you, before you write code, what the smallest shippable version is, how long it usually takes and which vault notes and FBX packs to use.
Each recipe has the same sections, so you can compare genres side by side and pick the one that fits your time and skills.

> [!warning] Timelines are estimates
> All durations assume the [[Starter Code - Hub]] plumbing is reused and art comes from the vault's asset library. Real pace depends on experience, hours per week and how strictly you cut scope. No recipe promises players or revenue.

## The recipes

| Recipe | Core fantasy | Solo MVP (est.) | Small team MVP (est.) | Hardest part |
|---|---|---|---|---|
| [[Genre Recipe - Simulator]] | Click, upgrade, zones, rebirth, pets | 1-3 weeks | 1-2 weeks | Juice and pacing in a crowded genre |
| [[Genre Recipe - Tycoon]] | Build a business from droppers | 1-3 weeks | 1-2 weeks | Button pacing, drop performance |
| [[Genre Recipe - Obby]] | Jump stages, checkpoints | 4-10 days | 3-7 days | Difficulty ramp, phone controls |
| [[Genre Recipe - Arena Shooter]] | Short-round duels, unlock guns | 4-6 weeks | 2-4 weeks | Netcode and hit registration |
| [[Genre Recipe - Fighting Battlegrounds]] | Movesets, combos, free-for-all | 4-6 weeks | 2-4 weeks | Combat feel, animation load |
| [[Genre Recipe - Open-Sea Action RPG]] | Islands, boats, relic powers, bosses | 8-12 weeks | 4-8 weeks | Scope, boats, streaming |
| [[Genre Recipe - GTA-Lite City]] | Cars, jobs, cops and robbers | 6-10 weeks | 4-6 weeks | Vehicles, city streaming |
| [[Genre Recipe - Medieval RPG]] | Town, dungeons, loot, levels | 6-10 weeks | 4-6 weeks | Content volume, NPC budgets |
| [[Genre Recipe - Horror]] | Escape a monster with friends | 4-8 weeks | 3-5 weeks | Monster AI, tension pacing, maturity |

## Which recipe should I pick?

| If you... | Pick | Why |
|---|---|---|
| Have never shipped a game | Obby or Simulator | Fewest systems; you learn the full publish cycle |
| Want a 7-day sprint | Simulator, Obby or Tycoon | See [[7-Day Cash-Grab Sprint - Simulator, Obby, Tycoon]] |
| Are a strong scripter, weak builder | Arena Shooter or Battlegrounds | Small maps, code-heavy |
| Are a strong builder, weak scripter | Obby or Horror | Level design carries the game |
| Have an animator/VFX artist | Battlegrounds | Feel and VFX are the product |
| Have a team of 3-4 and 2+ months | Open-Sea RPG, GTA-Lite or Medieval RPG | Big-world genres reward teams |
| Want viral clips | Horror or Battlegrounds | Scares and big hits make shareable moments |

More on choosing: [[Genre and Subgenre Selection - The Three-Month Lock]] · [[Case Study - Patterns Across Hit Roblox Games]] · [[Roblox 2026 Platform Snapshot]].

## Every recipe has these sections
1. **Core loop in 3 lines:** act, reward, escalate.
2. **MVP feature list:** a checklist; anything not on it waits for an update.
3. **Realistic timeline:** solo vs small team, as estimates.
4. **Build order week by week:** with a "done when" test for each week.
5. **Systems from the vault:** the exact deep dives and community notes.
6. **Assets from the vault:** the exact Kenney, KayKit, Poly Haven, OpenGameArt, 100STYLE and VFX Mesh Pack folders.
7. **Monetization that fits:** passes and products that suit the genre, with policy notes.
8. **Don't copy:** IP guardrails for that genre.
9. **Top 5 time-wasters:** the traps that eat weeks.

## Asset quick map
The most-used packs across the recipes:

| Pack | Used by | Notes |
|---|---|---|
| [[Top G Originals - VFX Mesh Pack]] | All nine | 22 original meshes: slashes, shockwaves, beams, lightning, orbs |
| [[Kenney - Prototype Kit]] | All (blockout) | Grey-box pieces, buttons, doors, coins |
| [[Kenney - Nature Kit]] | Simulator, Obby, Open-Sea, Medieval, Battlegrounds | 329 nature pieces |
| [[Kenney - Cube Pets]] | Simulator | Instant pet roster |
| [[Kenney - Factory Kit]] | Tycoon, Shooter | Conveyors, catwalks |
| [[Kenney - Platformer Kit]] | Obby | Block sets for stages |
| [[Kenney - Blaster Kit]] | Arena Shooter | Stylised guns and attachments |
| [[Kenney - Mini Arena]] | Shooter, Battlegrounds | Arena walls, columns |
| [[Kenney - Pirate Kit]] · [[Kenney - Watercraft Kit]] | Open-Sea RPG | Ships, docks, boats |
| [[Kenney - City Kit (Roads)]] · [[Kenney - Car Kit]] | GTA-Lite | Roads and cars |
| [[Kenney - Castle Kit]] · [[Kenney - Fantasy Town Kit]] · [[Kenney - Modular Dungeon Kit]] | Medieval RPG | Castles, towns, dungeons |
| [[Kenney - Graveyard Kit]] | Horror, Medieval | Crypts + spooky characters |
| [[More Free Sources - KayKit]] | Medieval, Horror, Tycoon, Simulator | Rigged adventurers/skeletons, dungeon, city, restaurant, Halloween |
| [[Poly Haven Roblox-Ready - Catalog]] | Horror, GTA-Lite, Tycoon | Realistic props already under the triangle limit |
| [[100STYLE Mocap - Catalog]] | NPCs in every genre | 100 walk/run styles; retarget to R15; **credit required** |

How to import: [[Modular Kits from the Kenney FBX Library]] · [[FBX Import Settings, Scale and Collision Fidelity]] · [[Importing FBX Animations and Retargeting - Kenney Rig Walkthrough]]. Licenses and credits: [[Asset Licenses and Credits]].

## Shared systems every recipe uses
These come from the Starter Code kit or are the same in every genre:

| Need | Notes |
|---|---|
| Saving | [[DataStore Session Locking, Retries, Versioning and Erasure]] |
| Purchases | [[Purchase Fulfillment and Receipt Reliability]] · [[Passes vs Developer Products vs Subscriptions - 2026 Decision Guide]] |
| Remotes and security | [[Remote Payload Validation]] · [[Remote Rate Limiting Pattern]] |
| Analytics | [[Analytics Custom Events, Funnels and Dashboards Setup]] |
| Onboarding | [[First 10 Minutes Retention Design]] |
| Mobile UI | [[Platform - Touch Target Sizes and Mobile-First HUD Layout]] |
| Lighting | [[Lighting Presets by Genre - LightingStyle, Atmosphere and Post]] |
| Policy | [[Policy - What Gets Games Taken Down - Pre-Launch Compliance Audit]] · [[Paid Random Items, Odds Disclosure and PolicyService]] |
| IP | [[Reference IP, Originality and Asset Rights]] · [[Policy - Using Brands, the Roblox Name and Licensed IP]] |

## Genres not covered (yet) and where to start
- Tower defense: [[Tower Defense Starter Architecture]] · [[Tower Defense Genre Breakdown - Waves, Placement Economy and Unit Rosters]] · [[Kenney - Tower Defense Kit]].
- Racing: [[Racing Starter Architecture]] · [[Kart Racing Systems - Checkpoints, Laps, Boost Pads and Respawn]] · [[Kenney - Racing Kit]].
- Roleplay / life sim: [[Roleplay and Life Sim Genre Breakdown - Roles, Props and Homes]] · [[Social Hangout Starter Architecture]].
- Zombie survival: [[Zombie Survival Starter Architecture]] · [[Zombie Crowd Director Blueprint]].

## Related
[[Fast Game Kit - Hub]] · [[Playbook - Hub]] · [[Starter Code - Hub]] · [[Ship a Roblox Game in 30 Days]] · [[Scope Cutter - What to Build First]] · [[Foundations Planning - Hub]] · [[FBX Asset Library - Hub]]

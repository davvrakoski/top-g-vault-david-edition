---
area: "16 Fast Game Kit"
cluster: "Genre Recipes"
tags: [fast-game-kit, roblox, genre-recipe, obby]
cssclasses: [tg-a16]
---

# Genre Recipe - Obby

## Why this matters
An obby (obstacle course) needs almost no economy and no AI: the content is level design, so it is the fastest genre to a finished, testable game.
Because obbies are so easy to make, the bar is high. A tight difficulty ramp, readable hazards and a strong theme are what separate one from the thousands of others.

## Core loop in 3 lines
1. **Jump:** clear a stage of platforms and hazards.
2. **Save:** touch the checkpoint; your stage is saved.
3. **Push on:** each stage set adds one new mechanic; finish for a badge, a trail or a harder tier.

Deeper breakdown: [[Obby Platformer Starter Architecture]] · [[First Obby in 30 Minutes]].

## MVP feature list
- [ ] 30-50 stages in 3-5 themed sets, one new hazard type per set.
- [ ] Checkpoints with saved stage, respawn at last checkpoint.
- [ ] Kill bricks, moving platforms, jump pads, conveyors (all tag-driven).
- [ ] Stage counter on the HUD + leaderstat.
- [ ] Skip-stage developer product (server-validated).
- [ ] Finish area with badge and a reward.
- [ ] Optional timer for speedrunners.
- [ ] Saving, codes, shop, settings: from [[Starter Code - Hub]].

## Realistic timeline (estimates)

| Team | MVP (40 stages) | 100 stages + timer leaderboards |
|---|---|---|
| Solo, with the Starter Code kit | 4-10 days | 3-4 weeks |
| Small team (1 scripter + 1-2 builders) | 3-7 days | 2-3 weeks |

Stage count is limited by testing time more than by building time: every stage must be played on a phone.

## Build order, week by week

| Week | Build | Done when |
|---|---|---|
| 1 | Checkpoint + stage save, tag-driven hazards, 20 grey stages, skip product | A new player clears stage 10 without help; phone test passes |
| 2 | Stages 21-50, themes per set, juice (checkpoint VFX, sounds), badges, analytics per stage | Death heatmap shows no "wall" stage that stops most players |
| 3 | Timer + leaderboard, passes, thumbnails, soft launch | [[Launch Week Checklist]] done |
| 4+ (update) | New world of 20 stages per update, seasonal reskin | Based on stage funnel data |

## Systems from the vault

| System | Notes |
|---|---|
| Stage save + skip | [[Recipe - Obby Stage Save and Skip Stage Product]] |
| Stage design | [[Obby Stage Design - Difficulty Ramp, Checkpoints and Readable Hazards]] · [[Map - Parkour Flow Maps - Jump Metrics, Movement Lines and Skill Shortcuts]] |
| Jump numbers | [[Physics - Jump Height, JumpPower and Gravity Conversions]] · [[First Character Tweaks - WalkSpeed, JumpHeight, Health and Sprint]] |
| Hazards by tag | [[Starter - First Tags and Attributes - One Script for Every Kill Brick]] · [[CollectionService Tag-Driven Architecture]] |
| Moving platforms | [[Recipe - Moving Platform with PrismaticConstraint]] · [[Moving Platforms - Why Players Slide Off]] |
| Pads and moves | [[Recipe - Jump Pads and Speed Pads]] · [[Recipe - Double Jump]] · [[Recipe - Wall Jump]] · [[Recipe - Ledge Grab and Climb Up]] |
| Timer | [[Recipe - Speedrun Timer with Checkpoint Validation]] · [[Weekly and Seasonal Leaderboards with OrderedDataStore]] |
| Kill planes | [[Map Boundaries, Kill Planes and Out-of-Bounds Handling]] |
| Themes | [[World - Obby Themes and Visual Language]] · [[Guiding Players with Light, Color and Affordance]] |
| Stage analytics | [[Zone and Stage Funnels with AnalyticsService]] · [[Position and Death Heatmaps for Map Playtests]] |
| Anti-cheat | [[Server-Side Movement Validation and Anti-Exploit Checks]] (teleport to final checkpoint is the classic exploit) |
| Performance | [[Speed - Case Study - Fixing a Laggy Obby]] |
| Case lessons | [[Flopped Launch Teardown - Elevation Obby Case]] · [[Session Time and D1 Rescue - Tag Obby Teardown]] |
| Open-source reference | [[Coding Roblox Games Made Easy - Book Obby and Battle Royale Demos (MIT)]] |

## Assets from the vault

| Need | Use | Notes |
|---|---|---|
| Platforms, blocks, slopes | [[Kenney - Platformer Kit]] | Grass/stone/snow block sets, arrows, barrels |
| Prototype / tech stages | [[Kenney - Prototype Kit]] | Floor buttons, doors, coins, sliding doors |
| Marble/rolling stages | [[Kenney - Marble Kit]] | Tracks and funnels |
| Skate / city set | [[Kenney - Mini Skate]] · [[Kenney - Retro Urban Kit]] | Ramps, rails |
| Space set | [[Kenney - Space Kit]] · [[Kenney - Modular Space Kit]] | Sci-fi theme |
| Holiday set | [[Kenney - Holiday Kit]] | Seasonal update reskin ([[World - Seasonal Event Reskins]]) |
| Nature decoration | [[Kenney - Nature Kit]] | Trees, rocks between stages |
| Juice | [[Top G Originals - VFX Mesh Pack]] | `VFX_Shockwave_Ring` on checkpoint, `VFX_Pillar_Tapered` on world finish |
| Import | [[Modular Kits from the Kenney FBX Library]] · [[Modular Kit Grid Audit - Module Sizes and an Off-Grid Finder]] | Keep platforms on a stud grid |

![[20 FBX Asset Library/Kenney/Platformer Kit/Preview.png|360]]

## Monetization that fits

| Item | Type | Notes |
|---|---|---|
| Skip stage | Dev product | Core obby product; validate on the server |
| Gravity coil / speed coil | Pass | Classic; make sure it cannot skip whole worlds |
| Trails, nametag colour | Pass | Cosmetic |
| Checkpoint "save me" (respawn at current spot) | Dev product | Optional |
| VIP area | Pass | Cosmetic hangout |
| Rewarded video for a skip | Ad | Check eligibility and rules ([[Immersive Ads, Rewarded Video and Sponsored Games]]) |

## Don't copy
- Do not copy stage layouts, names or thumbnails from a specific popular obby. Themes ("lava", "candy") are generic; another game's exact tower or branding is not.
- No brand characters as stage themes without a licence ([[Policy - Using Brands, the Roblox Name and Licensed IP]]).
- Honest thumbnails: show your real stages ([[Thumbnail clicks but players leave]]).

## Top 5 time-wasters
1. **One script per kill brick.** Use tags; one script handles every hazard.
2. **Building 200 stages before testing 20.** Difficulty walls show up in data at stage 8, not stage 180.
3. **Precise jumps tuned on PC only.** Phone players have less control; test every stage on touch ([[Platform - Touch Target Sizes and Mobile-First HUD Layout]]).
4. **Client-side checkpoint saving.** Exploiters set their own stage; checkpoints must be confirmed by the server.
5. **Fancy movement systems in v1.** Default character controller plus a few pads is enough to ship.

## Related
[[Genre Recipes - Hub]] · [[7-Day Cash-Grab Sprint - Simulator, Obby, Tycoon]] · [[Ship a Roblox Game in 30 Days]] · [[Maps Worlds and Level Design - Hub]] · [[Genre Recipe - Horror]]

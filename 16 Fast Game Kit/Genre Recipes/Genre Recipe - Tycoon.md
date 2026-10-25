---
area: "16 Fast Game Kit"
cluster: "Genre Recipes"
tags: [fast-game-kit, roblox, genre-recipe, tycoon]
cssclasses: [tg-a16]
---

# Genre Recipe - Tycoon

## Why this matters
Tycoons turn waiting into building: every purchase visibly adds something to your plot, which makes progress feel real with very simple code.
The work is mostly pacing (button prices vs income) and performance (hundreds of droppers and drops), both covered in the vault.

## Core loop in 3 lines
1. **Earn:** droppers produce items that ride conveyors to a collector and become cash.
2. **Buy:** step on the next button to build a dropper, upgrader, wall or decoration.
3. **Grow:** income rises, buttons get pricier, rebirth resets the plot for a multiplier.

Deeper breakdown: [[Tycoon Genre Breakdown - Droppers, Button Ladders and Pacing]] · [[Simulator Tycoon Starter Architecture]].

## MVP feature list
- [ ] Plot claim on join, plot released on leave ([[Tycoon Plot Layout and Plot Assignment]]).
- [ ] 3-4 dropper tiers, conveyor, upgrader, collector.
- [ ] Button ladder of 30-50 purchases with a dependency order.
- [ ] Cash display + collect pad (or auto-collect pass).
- [ ] Rebirth with a multiplier.
- [ ] Plot saves: owned buttons are saved as a list of IDs and rebuilt on join.
- [ ] Saving, daily reward, codes, shop, settings: from [[Starter Code - Hub]].
- [ ] Theme: one clear fantasy (factory, restaurant, theme park, space base).

## Realistic timeline (estimates)

| Team | MVP | With 2 floors + rebirth decor |
|---|---|---|
| Solo, with the Starter Code kit | 1-3 weeks | 4-6 weeks |
| Small team (2-4) | 1-2 weeks | 3-4 weeks |

## Build order, week by week

| Week | Build | Done when |
|---|---|---|
| 1 | Plot assignment, dropper → conveyor → collector, 15 buttons, cash | One plot works for 4 players at once without crossing |
| 2 | Buttons 16-50, upgraders, rebirth, saving owned buttons, analytics funnel | Rejoin rebuilds the plot exactly; first rebirth in about 30-45 minutes |
| 3 | Art pass with one kit, build animations, juice, shop, thumbnails | [[Launch Week Checklist]] storefront + QA done |
| 4+ (update) | Second floor, decor mode, NPC customers, events | Pick by analytics |

## Systems from the vault

| System | Notes |
|---|---|
| First dropper | [[First Tycoon Dropper - Dropper, Conveyor and Collector]] |
| Plot layout | [[Tycoon Plot Layout and Plot Assignment]] |
| Button prices | [[Incremental Cost Curves - Exponential Costs and Bulk Buy Math]] · [[Economy Sources and Sinks Spreadsheet Model]] |
| Rebirth | [[Rebirth and Prestige Formulas - Pacing Resets That Feel Good]] |
| Offline income | [[Offline Earnings - Idle Rewards Without Clock Exploits]] |
| Drops performance | [[Speed - Case Study - Fixing a Laggy Tycoon]] · [[Object Pooling Without Making a Mess]] · [[BulkMoveTo - Moving Hundreds of Anchored Parts Per Frame]] · [[Speed - Physics Object Budget - Assemblies, Loose Debris, Ragdolls and Constraint Counts]] |
| Tag-driven buttons | [[CollectionService Tag-Driven Architecture]] · [[Starter - First Tags and Attributes - One Script for Every Kill Brick]] |
| Build-in animation | [[TweenService UI Animation Recipes]] · [[First Moving Part with TweenService]] |
| Free placement (later) | [[Grid Placement System - Community Blueprint]] · [[Math - Square Grids - World to Cell, Neighbours and Chunk Keys]] |
| Saving plot state | [[Net - Player Data Schema Design - Keys, Defaults and Size Budget]] · [[Save Schema Migration Blueprint]] |
| Case studies | [[Case Study - Theme Park Tycoon 2]] · [[Case Study - Lumber Tycoon 2]] · [[Case Study - Work at a Pizza Place]] |
| Open-source reference | [[Tycoon Starters - Factorial Defense and Industry Tycoon (MIT)]] |

## Assets from the vault

| Theme | Use | Notes |
|---|---|---|
| Factory tycoon | [[Kenney - Factory Kit]] | Conveyors, cogs, catwalks, floor buttons |
| Building shell | [[Kenney - Building Kit]] · [[Kenney - Modular Buildings]] | Walls, floors, stairs |
| Shop / restaurant | [[Kenney - Mini Market]] · [[Kenney - Food Kit]] · [[More Free Sources - KayKit]] (Restaurant Bits) | Counters, food items as drops |
| Theme park | [[Kenney - Coaster Kit]] · [[Kenney - Mini Arcade]] | Rides, stalls |
| Car dealership | [[Kenney - Car Kit]] · [[Kenney - City Kit (Commercial)]] | Cars as "products" |
| Space base | [[Kenney - Space Station Kit]] · [[Kenney - Modular Space Kit]] | Sci-fi theme |
| Interiors | [[Kenney - Furniture Kit]] · [[Poly Haven Roblox-Ready - Catalog]] (Furniture, Industrial) | Decor buttons |
| Juice | [[Top G Originals - VFX Mesh Pack]] | `VFX_Shockwave_Ring_Wide` on build, `VFX_Pillar_Tapered` on rebirth |
| Import | [[Modular Kits from the Kenney FBX Library]] · [[Modular Kits and Grid Snapping in Studs]] | Snap to a grid that matches the plot |

![[20 FBX Asset Library/Kenney/Factory Kit/Preview.png|360]]

## Monetization that fits

| Item | Type | Notes |
|---|---|---|
| 2x cash | Pass | Most common tycoon pass |
| Auto-collect | Pass | Quality of life |
| Extra dropper / VIP dropper | Pass | Cosmetic-flavoured income boost; keep it modest |
| Cash packs | Dev product | Price relative to button costs ([[Currency Pack Ladders - Bonus Percentages and Anchoring]]) |
| Instant build / skip timer | Dev product | Only if you have build timers |
| Decor / plot skins | Pass | Cosmetic, safe |

Avoid paid random items in v1. If you add mystery crates later, follow [[Paid Random Items, Odds Disclosure and PolicyService]].

## Don't copy
- Real brand names and logos (fast-food chains, car makers, theme parks) on buildings or products are trademark problems. Invent names. See [[Policy - Using Brands, the Roblox Name and Licensed IP]].
- Do not copy a hit tycoon's button layout, art or name. Same genre is fine; same game is not ([[Reference IP, Originality and Asset Rights]]).

## Top 5 time-wasters
1. **Physics drops with no pooling.** Hundreds of loose parts lag servers; pool or anchor-and-tween drops early.
2. **Hand-placing 50 buttons with 50 scripts.** Use one tag-driven script and a config table.
3. **Free placement before the ladder works.** Grid building is an L-sized feature; ship the linear ladder first.
4. **Saving every part's CFrame.** Save owned button IDs and rebuild from templates.
5. **Too many plots per server.** Pick MaxPlayers to match plot count and memory ([[Choosing MaxPlayers - Server Memory, CPU and Map Size]]).

## Related
[[Genre Recipes - Hub]] · [[Genre Recipe - Simulator]] · [[7-Day Cash-Grab Sprint - Simulator, Obby, Tycoon]] · [[Ship a Roblox Game in 30 Days]] · [[Inventory Economy - Hub]]

---
area: "16 Fast Game Kit"
cluster: "Genre Recipes"
tags: [fast-game-kit, roblox, genre-recipe, simulator]
cssclasses: [tg-a16]
---

# Genre Recipe - Simulator

## Why this matters
Simulators (click, collect, upgrade, unlock zones, rebirth) are the cheapest Roblox genre to build because one action and a number ladder carry the whole game.
They are also crowded, so the win comes from a clear theme, strong juice and honest monetization, not from more systems.

## Core loop in 3 lines
1. **Act:** click/swing/collect to gain a resource.
2. **Convert:** sell or deposit it for currency; buy upgrades that make step 1 faster.
3. **Escalate:** unlock the next zone (bigger numbers), rebirth for a permanent multiplier, repeat.

Deeper breakdown: [[Simulator Genre Breakdown - Click, Upgrade, Zone, Rebirth]] · [[Simulator Tycoon Starter Architecture]].

## MVP feature list
- [ ] One core action with a satisfying hit (sound + VFX + number pop).
- [ ] Backpack capacity + sell pad (or auto-deposit).
- [ ] 6-10 upgrades in 2 tracks (power, capacity).
- [ ] 3 zones with gates priced on an exponential curve.
- [ ] Rebirth with a clear multiplier.
- [ ] Pets: **fixed** pets bought with in-game currency in v1 (eggs come later, with odds UI).
- [ ] Leaderboard (total currency or rebirths).
- [ ] Saving, daily reward, codes, shop, settings: from [[Starter Code - Hub]].
- [ ] Big-number formatting (1.2K, 3.4M, 5.6B).

## Realistic timeline (estimates)

| Team | MVP | With eggs + 5 zones |
|---|---|---|
| Solo, using the Starter Code kit | 1-3 weeks | 4-6 weeks |
| Small team (2-4: scripter, builder, UI/VFX) | 1-2 weeks | 3-4 weeks |

Estimates assume the kit's data/shop/UI plumbing is reused and art comes from the vault's kits.

## Build order, week by week

| Week | Build | Done when |
|---|---|---|
| 1 | Core action, backpack, sell pad, 6 upgrades, zone 1, leaderstats | 10 minutes of play feel rewarding in grey boxes |
| 2 | Zones 2-3 + gates, rebirth, fixed pets with follow AI, number formatting, analytics funnel | Rejoin keeps everything; first rebirth reachable in about 20-30 minutes of play |
| 3 | Art pass, juice, shop (passes + products), thumbnails, soft launch | [[Launch Week Checklist]] storefront and QA items done |
| 4+ (update) | Eggs with odds UI, zone 4-5, trading later | Odds UI passes [[Policy - Paid Random Items - Odds Disclosure Checklist]] |

## Systems from the vault

| System | Notes |
|---|---|
| Cost curves | [[Incremental Cost Curves - Exponential Costs and Bulk Buy Math]] · [[Economy Sources and Sinks Spreadsheet Model]] |
| Big numbers | [[Big Numbers in Simulators - Doubles, 2^53 and Number Libraries]] · [[Number Abbreviation for Simulator UIs]] |
| Rebirth | [[Rebirth and Prestige Formulas - Pacing Resets That Feel Good]] |
| Zones and gates | [[Map - Simulator Zone Worlds - Zone Chains, Gate Placement and World Hubs]] · [[Gating Map Areas - Per-Player Barriers with Collision Groups and Local Parts]] |
| Pets | [[Companion and Pet Follower AI]] · [[Model - Cute Stylized Pets - Proportions, Topology and Rig-Ready Shapes]] |
| Eggs / luck (later) | [[Paid Random Items, Odds Disclosure and PolicyService]] · [[Weighted Loot Table]] · [[Luck Multipliers - How Boosts Change the Odds You Must Show]] · [[Pity Timers and Pseudo-Random Distribution]] |
| Offline / idle | [[Offline Earnings - Idle Rewards Without Clock Exploits]] |
| Click security | [[Recipe - Server-Side Cooldowns and Rate Limits]] · [[Remote Rate Limiting Pattern]] |
| Rewards feel | [[FX - Collectible Pickups - Idle Glint, Magnet Pull and Collect Pop]] · [[FX - Level-Up and Reward Bursts - Light Pillars, Confetti and Screen Pops]] · [[Damage Numbers and Overhead Bars with BillboardGui]] |
| Performance | [[Speed - Case Study - Fixing a Laggy Pet Simulator]] · [[Object Pooling Without Making a Mess]] |
| Trading (later) | [[Trading Economy Design - Trade Windows, Value and Policy Gates]] · [[Trading and Duplication Threat Model]] |
| Case studies | [[Case Study - Pet Simulator 99]] · [[Case Study - Bee Swarm Simulator]] · [[Case Study - Grow a Garden]] · [[Headbutt Simulator Story - 650k Robux First Game Lessons]] |
| Open-source reference | [[Halloween Simulator - roblox-ts Simulator Game (CC0)]] · [[Bocchi Upgrade Tree - Incremental Button Game (MIT)]] |

## Assets from the vault

| Need | Use | Notes |
|---|---|---|
| Pets | [[Kenney - Cube Pets]] | 24 cube animals (cat, dog, panda, tiger...), instant pet roster |
| Zone 1 (nature) | [[Kenney - Nature Kit]] · [[Kenney - Mini Forest]] | Trees, rocks, paths |
| Themed zones | [[Kenney - Food Kit]] · [[Kenney - Holiday Kit]] · [[Kenney - Space Kit]] · [[Kenney - Hexagon Kit]] | One theme per zone |
| Collectibles / coins | [[Kenney - Prototype Kit]] (`coin`, crates) | Recolour per zone |
| Hub buildings | [[More Free Sources - KayKit]] (City Builder Bits, Prototype Bits) | Same blocky style |
| Characters / NPC shopkeepers | [[Kenney - Mini Characters]] · [[Kenney - Blocky Characters]] | Rigged with animations |
| Juice | [[Top G Originals - VFX Mesh Pack]] | `VFX_Pillar_Tapered` level-up, `VFX_Shockwave_Ring` rebirth, `VFX_Flare_Crossed` pickups |
| Import help | [[Modular Kits from the Kenney FBX Library]] · [[FBX Import Settings, Scale and Collision Fidelity]] | Shared colormap per kit |

![[20 FBX Asset Library/Kenney/Cube Pets/Preview.png|360]]

## Monetization that fits

| Item | Type | Notes |
|---|---|---|
| 2x currency | Pass | Classic first purchase |
| Auto-click / auto-collect | Pass | Removes grind, not a win button |
| +Backpack capacity | Pass | Feels fair |
| Currency packs (ladder) | Dev product | [[Currency Pack Ladders - Bonus Percentages and Anchoring]] |
| Starter pack | Dev product | [[Starter Packs - First Purchase Offers That Convert Without Pressure]] |
| Eggs / luck boosts (later) | Dev product or Robux-buyable currency | **Paid random items**: odds UI before purchase + PolicyService gate |
| Cosmetic trails, pet slots | Pass | [[Avatar - Cosmetic Trails and Auras on the Character - Attachments, Ownership and Budgets]] |

Guardrails: [[Ethical Monetization Lines - Where Devs Draw Pay-to-Win]] · [[Policy - Shop Messaging for Young Players and Dark Patterns]].

## Don't copy
- Do not reuse another simulator's name, pet designs, egg art, UI layout or currency names. Use your theme to make your own.
- No licensed characters (anime, cartoons, memes owned by someone) as pets or zones without a licence. See [[Policy - Using Brands, the Roblox Name and Licensed IP]] · [[Reference IP, Originality and Asset Rights]].
- Trend themes are fine as an idea; copying a specific hit game's assets or exact layout is not.

## Top 5 time-wasters
1. **Building trading before launch.** Dupe risk and policy gates; ship without it.
2. **Eggs before the odds UI.** Either build the odds UI properly or sell fixed pets.
3. **Ten zones at launch.** Three finished zones beat ten empty ones; add one per update.
4. **Custom number library from scratch.** Use doubles plus formatting until you really pass 1e15 ([[Big Numbers in Simulators - Doubles, 2^53 and Number Libraries]]).
5. **Modelling pets by hand.** Start with [[Kenney - Cube Pets]]; commission custom pets once the game earns.

## Related
[[Genre Recipes - Hub]] · [[7-Day Cash-Grab Sprint - Simulator, Obby, Tycoon]] · [[Ship a Roblox Game in 30 Days]] · [[Genre Recipe - Tycoon]] · [[Inventory Economy - Hub]]

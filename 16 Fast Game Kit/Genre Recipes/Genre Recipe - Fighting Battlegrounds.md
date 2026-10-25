---
area: "16 Fast Game Kit"
cluster: "Genre Recipes"
tags: [fast-game-kit, roblox, genre-recipe, fighting, battlegrounds, combat]
cssclasses: [tg-a16]
---

# Genre Recipe - Fighting Battlegrounds

## Why this matters
Battlegrounds games (free-for-all melee arenas where you pick a character with a moveset, as in The Strongest Battlegrounds) live or die on combat feel: hit-stop, knockback, combos and readable VFX.
The vault has an unusually deep combat and VFX section plus an original VFX mesh pack, so this is a genre where the vault saves the most time.

## Core loop in 3 lines
1. **Pick:** choose a character (moveset) in a shared arena server.
2. **Fight:** M1 combos, 4 special moves, block/dash; knock out other players.
3. **Unlock:** kills/time earn currency for new characters, emotes and cosmetics; fight again.

Deeper breakdown: [[Anime Action Starter Architecture]] · [[Case Study - The Strongest Battlegrounds]] · [[Combat Framework]].

## MVP feature list
- [ ] 2 characters, each with an M1 4-hit combo + 4 abilities (cooldowns on HUD).
- [ ] Block, dash, ragdoll/knockback on heavy hits.
- [ ] Server-authoritative hit detection with lag tolerance.
- [ ] Hitstun, i-frames on dash, guard break.
- [ ] Hit-stop + camera shake + impact VFX on every hit.
- [ ] Kill counter, kill feed, simple leaderboard.
- [ ] One arena map with breakable props.
- [ ] Mobile ability buttons (4 + dash + block).
- [ ] Currency, character unlocks, shop, settings: from [[Starter Code - Hub]].

## Realistic timeline (estimates)

| Team | MVP (2 characters) | 5 characters + ultimates |
|---|---|---|
| Solo, with the Starter Code kit | 4-6 weeks | 10-14 weeks |
| Small team (scripter + animator + VFX + builder) | 2-4 weeks | 6-10 weeks |

Animation is the bottleneck. Each move needs an animation, VFX timeline and tuning pass.

## Build order, week by week

| Week | Build | Done when |
|---|---|---|
| 1 | Ability framework, M1 combo, hitbox, damage, hitstun, block, dash | Two players trade hits at 150 ms ping and both agree on what happened |
| 2 | Character 1 full moveset (4 abilities) with animations + VFX timelines, knockback, ragdoll | Character 1 is fun to play for 10 minutes |
| 3 | Character 2, arena map, kill feed, mobile buttons, character select | Two distinct playstyles, phone players can fight |
| 4 | Juice pass, unlock currency, shop, analytics, anti-exploit | Funnel: join → first kill → first unlock |
| 5-6 | Balance pass from config, thumbnails, soft launch | [[Launch Week Checklist]] done |

## Systems from the vault

| System | Notes |
|---|---|
| Abilities | [[Ability and Status Framework]] · [[Status Effect Container]] · [[Cooldown Module]] · [[Damage and Status Effects Blueprint]] |
| Combos | [[Melee Combo Blueprint]] · [[Combo Systems and Input Buffering]] |
| Hitboxes | [[Hitbox Detection - Spatial Queries vs Raycasts vs Shapecasts]] · [[Melee Hitbox Modules - RaycastHitbox to ShapecastHitbox]] |
| Server authority | [[Server-Authoritative Melee Pattern]] · [[Server Melee Validation]] · [[Lag Compensation and Server Rewind for Melee and Hitscan]] |
| Hit states | [[Hitstun, I-Frames, Poise and Super Armor]] · [[Parry, Block and Guard Break - Timing Windows Over the Network]] |
| Feel | [[Hitstop, Screen Shake and Camera Impact Feel]] · [[Hitstop and Impact Freeze]] · [[Combat Feel Tuning Worksheet]] |
| Knockback / ragdoll | [[Smooth Knockback - What Works for All Clients]] · [[Physics - Impulse Math - ApplyImpulse, Mass and Velocity Change]] · [[R15 Ragdoll with BallSocketConstraints - Setup, Limits and Recovery]] |
| Movement | [[Recipe - Dash]] · [[Net - Predicting Movement Abilities - Dashes, Double Jumps and Server Checks]] |
| Animation | [[Animation Markers for Hit Frames, Footsteps and Sync]] · [[Combat Animation Authoring Tips]] · [[Anim - Animation Principles for Game Clips - Anticipation, Follow-Through and Holds]] · [[Char - Hit Reactions and Directional Flinch Layering]] |
| VFX timelines | [[FX - Ability VFX Timelines - Wind-Up, Release, Impact and Linger as Data]] · [[Replicating VFX - Server Signals, Client Renders]] · [[VFX Budget and Readability]] |
| Character select | [[Char - Character Select and Class Systems with Different Rigs]] |
| Lock-on camera | [[Camera Obstruction, Shoulder Swap and Lock-On]] |
| Combat tagging | [[Combat Tagging and Combat Logging Penalties]] · [[Kill Credit, Assists and Damage Attribution]] |
| Look | [[Anime Roblox Visual Direction]] · [[Stylized and Anime Lighting]] |
| QA | [[Test - Combat Regression Checklist]] · [[Combat double-hits or misses]] |

## Assets from the vault

| Need | Use | Notes |
|---|---|---|
| Ability VFX | [[Top G Originals - VFX Mesh Pack]] | Slashes (thin, wide, 360, uppercut), shockwave ring/wall, tornado, dome, pillar, lightning, impact stars, crystal shards, ground decal |
| VFX recipes | [[Mesh VFX Recipes with the Top G VFX Mesh Pack]] · [[Arc Slash, Crescent and Wave VFX]] · [[FX - Shockwaves - Expanding Mesh Rings, Dust Walls and Ground Slams]] · [[FX - Dash Afterimages and Ghost Trails - Cloning Poses Safely]] · [[FX - Anime Power-Up Aura - Flame Shell, Rising Sparks and Ground Pressure]] · [[FX - Earth Element VFX - Rock Spikes, Crater Rings and Flying Debris]] | Each maps to pack meshes |
| Impact frames | [[DevForum Impact Frame Techniques]] · [[DevForum Slash VFX Breakdowns]] | Community breakdowns |
| Free VFX textures | [[Free VFX and FX - Hub]] · [[Greyscale VFX Textures - Tint in Studio]] | CC0/MIT sources, license-checked |
| Arena | [[Kenney - Mini Arena]] · [[Kenney - Nature Kit]] · [[Kenney - City Kit (Commercial)]] | Open ground + breakable props |
| Breakables | [[Destructible Map Pieces - FragmentAsync, Pre-Fractured Models and Debris Budgets]] · [[Destructible Props Blueprint]] | Budget debris |
| Locomotion styles | [[100STYLE Mocap - Catalog]] | `Proud`, `Strutting`, `KarateChop`, `Punch`, `Kick` styles for character personality; retarget, credit required |
| Animation sources | [[Free Animation Picker by Game Type]] · [[Free Animation Sources - License Table]] | Check each license |

![[20 FBX Asset Library/Top G Originals - VFX Meshes/Previews/VFX_Slash_Wide.png|200]] ![[20 FBX Asset Library/Top G Originals - VFX Meshes/Previews/VFX_Shockwave_Ring.png|200]]

## Monetization that fits

| Item | Type | Notes |
|---|---|---|
| Character unlock | Dev product (or currency) | Keep every character earnable by play |
| Emotes / taunts | Dev product | Cosmetic ([[Custom Emotes in Your Game - Own Wheel, PlayEmoteAsync and Validation]]) |
| Move VFX skins (colour, aura) | Pass / product | Cosmetic; must not hide hitboxes |
| Kill effects | Dev product | Cosmetic |
| Private servers | Built-in | Friends train together |
| VIP server perks | Pass | Cosmetic chat tag, lobby area |

Never sell damage, cooldown or health boosts in a PvP fighter ([[Ethical Monetization Lines - Where Devs Draw Pay-to-Win]]).

## Don't copy
- **Biggest risk in this genre.** Do not name characters, moves or games after anime/manga heroes (no "Saitama", "Gojo", "Kamehameha", "Domain Expansion"), and do not recreate their outfits or signature poses. Make original archetypes ("the Brawler", "the Blade", "the Storm").
- Do not copy another battlegrounds game's move list, UI, character art or name.
- Notes: [[Policy - Using Brands, the Roblox Name and Licensed IP]] · [[Policy - Copyright and Trademark Takedowns - Notices and Counter Notices]] · [[Reference IP, Originality and Asset Rights]] · official [[Intellectual Property Guidelines]].
- Violence level: answer the maturity questionnaire honestly; stylised hits without blood keep the widest audience ([[FX - Kid-Friendly Hit Feedback - Blood Alternatives and Maturity Labels]]).

## Top 5 time-wasters
1. **Six characters before one feels good.** Character 1 sets the bar; tune it until it is fun.
2. **Client hitboxes.** Fast to write, impossible to secure. Server validation from week 1.
3. **Particle-only VFX.** Mesh VFX from the pack read better and cost less ([[VFX looks good but kills FPS]]).
4. **Hand-coding each move.** Moves are data (wind-up, active frames, recovery, VFX cues) run by one framework.
5. **Skipping mobile buttons.** Many players are on phones; 4 abilities + dash + block must fit the thumb zone ([[Safe Areas, Thumb Zones and Console UI Navigation]]).

## Related
[[Genre Recipes - Hub]] · [[Genre Recipe - Arena Shooter]] · [[Genre Recipe - Open-Sea Action RPG]] · [[Combat - Hub]] · [[VFX - Hub]] · [[Ship a Roblox Game in 30 Days]]

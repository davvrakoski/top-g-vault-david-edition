---
area: "16 Fast Game Kit"
cluster: "Genre Recipes"
tags: [fast-game-kit, roblox, genre-recipe, horror]
cssclasses: [tg-a16]
---

# Genre Recipe - Horror

## Why this matters
Horror games (escape a monster, solve small puzzles, survive with friends, as in DOORS, Piggy or Forsaken) are great for small teams: one map, one monster and good audio can carry a whole chapter.
They also spread well through videos, because scares make clips. The hard parts are tension pacing and staying inside Roblox's maturity and flashing rules.

## Core loop in 3 lines
1. **Explore:** move through dark rooms with a light source, find keys and clues.
2. **Survive:** a monster hunts by sight and sound; hide, run, or distract it.
3. **Escape:** solve the chapter's final puzzle, escape, unlock the next chapter or a harder mode; replay with friends.

Deeper breakdown: [[Horror Starter Architecture]] · [[Case Study - DOORS]] · [[Case Study - Piggy]] · [[Case Study - Forsaken]] · [[Case Study - 99 Nights in the Forest]].

## MVP feature list
- [ ] One map (house, school, hospital, cave) taking 15-30 minutes to escape.
- [ ] One monster with patrol → suspicious → chase → search states, sight + hearing.
- [ ] Flashlight with battery (or lantern), crouch, sprint with stamina.
- [ ] 3-5 hiding spots types (closets, beds, lockers) with monster checks.
- [ ] 4-6 key/lock puzzles with a dependency chart.
- [ ] Tension director: build-up, peak, relax, so scares do not become noise.
- [ ] Co-op lobby (1-4 players), downed/revive or spectate on death.
- [ ] Audio: ambience, monster cues, silence used deliberately.
- [ ] Brightness calibration screen + reduced-flashing setting.
- [ ] Saving, currency, shop, settings: from [[Starter Code - Hub]].

## Realistic timeline (estimates)

| Team | MVP (1 chapter) | 3 chapters + modes |
|---|---|---|
| Solo, with the Starter Code kit | 4-8 weeks | 3-5 months |
| Small team (scripter, builder, audio/animator) | 3-5 weeks | 2-3 months |

## Build order, week by week

| Week | Build | Done when |
|---|---|---|
| 1 | Blockout map with loops, flashlight, sprint/crouch, monster state machine + pathfinding | Monster chases you around a loop and you can escape it |
| 2 | Sight/hearing senses, hiding spots, key/lock puzzles, death/spectate | One full run start to escape works in grey boxes |
| 3 | Tension director, scripted scares with cooldowns, chase sequence, audio pass | Testers report fear without frustration |
| 4 | Art pass, fog and lighting, monster model + animations, co-op lobby | Screenshots look scary but readable |
| 5 | Shop, analytics (death points), brightness screen, maturity check, soft launch | [[Launch Week Checklist]] done |

## Systems from the vault

| System | Notes |
|---|---|
| Monster AI | [[Story - Stalker Monster AI Feel - Director Leash, Senses and Fair Kills]] · [[NPC Vision and Hearing Model]] · [[Production NPC State Machine]] · [[Enemy AI Pathing Loop with PathfindingService]] · [[Net - Server-Owned NPCs - Network Ownership for Moving NPCs]] |
| Tension pacing | [[Story - Horror Tension Director - Intensity, Build Up, Peak and Relax]] · [[Story - Scare Budgets and Cooldowns - Scripted Scares That Stay Scary]] · [[Encounter Director and Pacing]] |
| Scares and ethics | [[Story - Jump Scares, Flashing and Maturity Labels - Ethical Horror on Roblox]] |
| Chases | [[Story - Scripted Chase Sequences - Suspense, Guide Lights and Fair Fails]] |
| Hiding | [[Story - Hiding Spots - Closets, Lockers and Monster Checks]] |
| Flashlight | [[Story - Horror Flashlights - Aim, Battery, Replication and Shadow Budget]] · [[Recipe - Sprint with Stamina Bar]] · [[Sprint, Crouch and Slide - A Movement State Layer over the Humanoid]] |
| Puzzles | [[Story - Puzzle Dependency Charts - Keys, Locks and Gates]] · [[Story - Puzzle Hint Systems - Tiered Nudges, Timers and Diegetic Clues]] · [[Recipe - Keycard Door with ProximityPrompt]] |
| Safe rooms / checkpoints | [[Story - Safe Rooms - Relief, Save Points and Their Rules]] · [[Story - Co-op Story Checkpoints - Respawn, Catch-Up and Party Wipes]] |
| Story | [[Story - Lore Drip - Notes, Tapes and Collectibles That Players Read]] · [[Environmental Storytelling - What Happened Here]] · [[Story - Chapter-Based Games - Places, Teleports and Chapter Select]] · [[Story - Endings and Replayability - Multiple Endings, Badges and Post-Game Hooks]] |
| Map design | [[Horror Map Design - Pacing, Loops and Readable Darkness]] · [[Camera-Friendly Interiors - Occlusion Mode, Ceiling Height and Zoom Limits]] · [[Overgrown Abandoned Interior — Ruin + Nature Recipe]] |
| Procedural rooms (replay) | [[Procedural Dungeon and Room Generation]] · [[Room-Chain Generation with Connector Attachments]] |
| Audio | [[Story - Horror Audio - Silence, Room Reverb and Monster Cues]] · [[Audio Zones, Occlusion and Mixing]] · [[AudioEmitter Attenuation Curves and Acoustic Simulation]] · [[Ambient Soundscapes - Loop Beds and Random One-Shots]] |
| Lighting / fog | [[FX - Horror Fog and Brightness Calibration - Silhouettes, Fog Walls and a Gamma Screen]] · [[Fog Options - Lighting Fog vs Atmosphere vs Local Fog Volumes]] · [[Local Light Budgets - PointLight, SpotLight and SurfaceLight]] · [[Lighting too dark - overprocessed]] |
| Co-op | [[Downed, Revive and Bleed-Out States]] · [[Recipe - Spectate Mode]] · [[Lobby and Round System Blueprint]] |
| Accessibility | [[Thunder, Lightning and Accessibility]] · [[Subtitles and Captions - Readable Defaults for Roblox]] |
| Open-source reference | [[ReRand Open Games - RENTED Horror, ACE-ULTRA Shooter and Workshop Template (Apache-2.0)]] · [[Beyond the Dark and The Mystery of Duvall Drive - Official Showcase Places]] |

## Assets from the vault

| Need | Use | Notes |
|---|---|---|
| Graveyard / crypt | [[Kenney - Graveyard Kit]] | Crypts, coffins, candles, fences + ghost, zombie, skeleton, vampire characters |
| Caves / mines | [[Kenney - Modular Cave Kit]] · [[More Free Sources - OpenGameArt CC0]] (Mine Assets) | Tunnels |
| House / school interiors | [[Kenney - Furniture Kit]] · [[Poly Haven Roblox-Ready - Catalog]] (Furniture, Lighting, Decorative, Props) | Realistic props sell creepy interiors well |
| Halloween dressing | [[More Free Sources - KayKit]] (Halloween Bits) · [[Kenney - Holiday Kit]] | Pumpkins, lanterns |
| Abandoned industrial | [[Kenney - City Kit (Industrial)]] · [[Poly Haven Roblox-Ready - Catalog]] (Industrial, Containers) | Warehouses, pipes |
| Skeleton enemies | [[More Free Sources - KayKit]] (Skeletons, rigged) | CC0 |
| Survivors | [[Kenney - Animated Characters Survivors]] | Rigged with idle/run/jump |
| Monster locomotion | [[100STYLE Mocap - Catalog]] | `Zombie`, `Stiff`, `DragLeftLeg`/`DragRightLeg`, `LimpLeft`, `Crouched`, `InTheDark`, `Tiptoe`, `Dinosaur`: retarget to R15 for an unsettling walk; credit required |
| Textures (grime) | [[More Free Sources - ambientCG]] · [[Model - Weathering and Grime - Edge Wear, Dirt Masks and Decal Layers]] | CC0 |
| VFX | [[Top G Originals - VFX Mesh Pack]] | `VFX_Lightning_Bolt_A` for storms, `VFX_Flare_Crossed` for candle glow, `VFX_Ground_Decal` for blood-free stains/runes |

![[20 FBX Asset Library/Kenney/Graveyard Kit/Preview.png|360]]

## Monetization that fits

| Item | Type | Notes |
|---|---|---|
| Revives | Dev product | Keep cheap; never block the chapter's end |
| Flashlight / lantern skins | Dev product | Cosmetic |
| Extra lives in hard mode | Dev product | Optional mode only |
| Chapter unlock early | Dev product | Only if chapters also unlock by play |
| Emotes / lobby cosmetics | Dev product | Social |
| Private servers | Built-in | Friend groups, streamers |

## Don't copy
- Do not copy DOORS entities, Piggy characters, FNAF animatronics, Slenderman-style trademarked designs, or any monster name, look or signature sound from another horror game or film.
- Do not reuse another game's room layouts, UI or chapter names.
- **Maturity and safety:** gore, realistic violence and strong scares need honest questionnaire answers; follow flashing limits and offer a reduced-flashing option ([[Story - Jump Scares, Flashing and Maturity Labels - Ethical Horror on Roblox]] · [[Maturity Questionnaire Walkthrough - Common Genre Answers]] · [[Blood - Damage VFX - Gore Policy]]).
- Notes: [[Reference IP, Originality and Asset Rights]] · [[Policy - Using Brands, the Roblox Name and Licensed IP]].

## Top 5 time-wasters
1. **Scares before the monster AI works.** A monster that gets stuck or kills unfairly kills the fear ([[AI gets stuck or loops]]).
2. **Too dark.** Pitch-black screens are not scary, just unplayable, especially on phones. Use a brightness screen and readable silhouettes.
3. **Many monsters in chapter 1.** One well-tuned monster is scarier than four weak ones.
4. **Real-time shadows everywhere.** Light sources with shadows are expensive; budget them ([[Shadow and Light Source Cost - CastShadow, Light Shadows and Lighting Technology]]).
5. **Long cutscenes and lore dumps.** Players want to play; drip lore through notes and the environment.

## Related
[[Genre Recipes - Hub]] · [[Genre Recipe - Obby]] · [[Genre Recipe - Medieval RPG]] · [[Story Quests Cinematics - Hub]] · [[Audio - Hub]] · [[Lighting - Hub]] · [[Zombie Survival Starter Architecture]]

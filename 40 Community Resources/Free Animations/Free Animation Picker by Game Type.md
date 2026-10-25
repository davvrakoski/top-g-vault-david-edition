---
area: "40 Community Resources"
cluster: "Free Animations"
source_note: "community/free-animations/free-animation-picker-by-game-type"
title: "Free Animation Picker by Game Type"
tags: [roblox, community, animation, free-assets, "cluster/free-animations"]
verified: 2026-10-25
license: "mixed - see table"
sources:
  - https://quaternius.itch.io/universal-animation-library
  - https://quaternius.itch.io/universal-animation-library-2
  - http://mocap.cs.cmu.edu/motcat.php
  - https://rokoko.com/resources/rokoko-mocap-16-free-walk-and-run-cycle-animations
  - https://www.rokoko.com/resources/rokoko-mocap-free-magic-themed-animations
  - https://create.roblox.com/docs/animation/using
  - https://create.roblox.com/docs/animation/capture
cssclasses: [tg-a40]
---

# Free Animation Picker by Game Type

> "Where do I get free animations for my ___ game?" is a weekly Reddit question. This maps game types to the license-checked sources in this cluster. Status column = vault policy (see [[Free Animation Sources - License Table]]).

Game type | Need | First pick | Backup | Status
---|---|---|---|---
Hangout / social | Idles, waves, sits, dances, emotes | Roblox catalog packs as defaults ([[Use animations]]) + your own video capture | Mixamo dances, Quaternius UAL emotes | Catalog: Roblox IDs; Mixamo/UAL: use-only
Obby / platformer | Run, jump, fall, climb, land | Catalog packs or default Animate | 100STYLE locomotion styles ([[100STYLE Mocap - Catalog]]); UAL 2 climb | 100STYLE: CC BY 4.0, in vault
Horde / zombie survival | Shambles, attacks, hit reacts, deaths | Quaternius UAL 2 zombie walk + scratch, UAL death clips | CMU "Situations & Scenarios" takes; your own capture for signature shambles | UAL: use-only here
Melee / battlegrounds | Swings, combos, dashes, knockback | Hand-keyed or own capture (signature moves) | UAL 2 melee + sword dash + knockback; CMU boxing | see [[Combat Animation Authoring Tips]]
Shooter | Aim idle, reload, gun walk | Quaternius UAL 1 gun actions | Mixamo rifle sets | use-only
Fantasy / magic | Spell casts | Rokoko free magic pack | Mixamo spell clips | use-only
Roleplay / story | Talking, sitting, gestures, cutscenes | Roblox Animation Capture (face + body) | Rokoko TV-themed pack, ACCAD sets | ACCAD: CC BY 3.0, credit
Sports | Kicks, throws, swings | CMU Physical Activities & Sports | Own capture | CMU: use-only, credit requested
Creatures / non-humanoid | Custom rigs | Hand-keyed (Rig Type = Custom on import) | Adaptive Animation for humanoid-ish rigs ([[Importing FBX Animations and Retargeting - Kenney Rig Walkthrough]]) | own work

## Rules that apply to every row
- Retarget with [[Mixamo to R15 - Blender Retarget Workflow]]; clean with [[Mocap Cleanup for Roblox - In-Place, Loops and Foot Slide]].
- Publish under the game owner ([[Animation Permissions and Sharing - 2025 Update]]).
- Record each source + credit in [[Free Animation Credits - Attribution Lines]].
- Hero/signature moves: invest in custom animation; free clips are fine for crowds, NPCs and prototypes but players recognise the common Mixamo moves.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free Animations - Hub]]

**Related notes:** [[Free Animation Sources - License Table]] · [[Animation - Hub]] · [[NPC Crowds, Animation LOD and Server Budgets]] · [[Zombie Crowd Director Blueprint]]

<!-- TDOD_GRAPH_END -->

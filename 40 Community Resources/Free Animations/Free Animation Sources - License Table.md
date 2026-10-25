---
area: "40 Community Resources"
cluster: "Free Animations"
source_note: "community/free-animations/free-animation-sources-license-table"
title: "Free Animation Sources - License Table"
tags: [roblox, community, animation, free-assets, "cluster/free-animations"]
verified: 2026-10-25
license: "mixed - see table"
sources:
  - https://www.mixamo.com/
  - https://community.adobe.com/questions-696/mixamo-faq-licensing-royalties-ownership-eula-and-tos-589400
  - http://mocap.cs.cmu.edu/faqs.php
  - https://rancidmilk.itch.io/free-character-animations
  - https://accad.osu.edu/research/motion-lab/mocap-system-and-data
  - https://quaternius.itch.io/universal-animation-library
  - https://quaternius.itch.io/universal-animation-library-2
  - https://rokoko.com/resources/rokoko-mocap-16-free-walk-and-run-cycle-animations
  - https://www.rokoko.com/resources/rokoko-mocap-free-magic-themed-animations
  - https://create.roblox.com/docs/animation/using
  - https://create.roblox.com/docs/animation/capture
cssclasses: [tg-a40]
---

# Free Animation Sources - License Table

> **One-line rule:** "free to use in your game" and "free to put in a bundle / asset pack" are two different licenses. Every row below was checked on the resource's **own** page on 2026-10-25. Reddit was used only to discover names; Reddit "it's free" claims were never trusted.

## Vault policy (how to read the "Bundle-safe" column)
- **Bundle-safe = YES** only for CC0, CC BY 4.0 (credit recorded) or MIT / no-copyright, and only when the vault owner has not excluded the source.
- **Use-only** = you may ship the animation *inside your Roblox game* (as an uploaded animation asset), but you may **not** redistribute the raw FBX/BVH files, sell them, or put them in the vault's asset library.
- Mixamo, CMU mocap and Quaternius are **listed as not bundle-safe by owner policy** (see [[Asset Licenses and Credits]]) even where their terms are generous.

## The table

Resource | What | License (source page) | Redistribute raw files? | Bundle-safe (vault) | Link
---|---|---|---|---|---
Roblox catalog animation packs (Ninja, Knight, Rthro...) | Official Roblox animation IDs for every state | Roblox-owned assets, listed in the official docs as replacement defaults | No (they are IDs, not files) | n/a - use IDs in-game | [docs](https://create.roblox.com/docs/animation/using)
Roblox Animation Capture | Webcam face + uploaded video body capture in Studio | Built-in Studio feature, output is your animation | Your own work | Your own work | [docs](https://create.roblox.com/docs/animation/capture)
Mixamo (Adobe) | Thousands of humanoid mocap/keyframe clips, auto-rigger | Adobe FAQ: royalty-free for commercial/non-commercial projects incl. games; no raw-file redistribution; no ML training | **No** | **No - use-only** | [mixamo.com](https://www.mixamo.com/)
CMU Graphics Lab Mocap DB | Large academic mocap library (ASF/AMC, C3D, video) | "Free for all uses"; may include in commercial products; may not resell the data directly, even converted | Copy/redistribute allowed, **resale not** | **No - owner policy** | [mocap.cs.cmu.edu](http://mocap.cs.cmu.edu/)
cgspeed BVH conversion of CMU (Bruce Hahne) | CMU data as BVH | CMU terms + "no additional restrictions" per the converter's readme | As CMU | **No - owner policy** | (see [[CMU Mocap Database - License and Converted Sets]])
RancidMilk "Free Character Animations" | 2,000+ CMU clips retargeted to a Quaternius CC0 body, FBX/glTF | Free to use/modify/redistribute, **not to sell**; Blender scripts GPL-3.0 | Yes, but not for sale | **No - CMU-derived** | [itch.io](https://rancidmilk.itch.io/free-character-animations)
ACCAD Motion Lab (Ohio State) | Sample mocap datasets (C3D, BVH, AMC) | CC BY 3.0 Unported | Yes, with credit | **Not on the bundle list** (CC BY 3.0, not 4.0) - use with credit | [accad.osu.edu](https://accad.osu.edu/research/motion-lab/mocap-system-and-data)
Quaternius Universal Animation Library (UAL 1) | 45 free (120+ paid) clips on a universal humanoid rig | CC0 1.0 on the itch.io and quaternius.com pages | CC0 allows it | **No - owner policy** | [itch.io](https://quaternius.itch.io/universal-animation-library)
Quaternius Universal Animation Library 2 | 42 free (130+ paid) clips: melee, parkour, farming, zombie walk | CC0 1.0 on the itch.io page | CC0 allows it | **No - owner policy** | [itch.io](https://quaternius.itch.io/universal-animation-library-2)
Rokoko free mocap packs (walk/run cycles, magic, TV-themed) | Small FBX packs, 30 fps, Mixamo/UE/HumanIK skeletons | Page text: use in any game incl. commercial | **Not granted** | **No - use-only** | [rokoko.com](https://rokoko.com/resources/rokoko-mocap-16-free-walk-and-run-cycle-animations)
100STYLE mocap | Locomotion styles | CC BY 4.0 | Yes, with credit | **Already in the vault** | [[100STYLE Mocap - Catalog]]
Kenney animated characters | idle / run / jump on Kenney bodies | CC0 | Yes | **Already in the vault** | [[Importing FBX Animations and Retargeting - Kenney Rig Walkthrough]]

## What to do with each class
- **Use-only sources** (Mixamo, Rokoko packs, CMU-derived): retarget, upload to Roblox under the game owner, keep the source FBX in a private folder, never commit raw files to a public repo or vault bundle.
- **Credit-required sources** (ACCAD, 100STYLE): put the credit line in your game's credits screen and in [[Free Animation Credits - Attribution Lines]].
- **Left-out sources** (non-commercial datasets, unclear terms, leaks): see [[Animation Sources Checked and Left Out]].

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free Animations - Hub]]

**Related notes:** [[Asset Licenses and Credits]] · [[More Free Sources - Hub]] · [[100STYLE Mocap - Catalog]] · [[Animation - Hub]]

<!-- TDOD_GRAPH_END -->

---
area: "40 Community Resources"
cluster: "Free Animations"
source_note: "community/free-animations/mixamo-license-terms"
title: "Mixamo - License Terms for Roblox Games"
tags: [roblox, community, animation, free-assets, "cluster/free-animations"]
verified: 2026-10-25
license: "Adobe Mixamo terms - royalty-free use, no raw-file redistribution (use-only)"
sources:
  - https://www.mixamo.com/
  - https://helpx.adobe.com/creative-cloud/faq/mixamo-faq.html
  - https://community.adobe.com/questions-696/mixamo-faq-licensing-royalties-ownership-eula-and-tos-589400
  - https://www.adobe.com/legal/terms.html
  - https://devforum.roblox.com/t/mixamo-plugin-released/2298825
cssclasses: [tg-a40]
---

# Mixamo - License Terms for Roblox Games

> **Status in this vault:** **not bundle-safe - use-only.** Fine to animate your own game with; never redistribute the files. Listed in [[Asset Licenses and Credits]] under "Checked and left out".

## What Mixamo is
Adobe's free web service (sign in with an Adobe account) with a large library of humanoid animations plus an auto-rigger. Downloads are FBX (or DAE) on Mixamo's own skeleton (`mixamorig:Hips`, `mixamorig:Spine`... ).

## The license in plain words
Adobe's Mixamo FAQ (the helpx page blocks automated fetches; its text is reproduced by Adobe Community moderator **TylerG 3D**, 29 Sep 2022) says:

Allowed | Not allowed
---|---
Royalty-free use in personal, commercial, non-profit, research and school projects | Distributing the **raw** character or animation files
Video games, DLC/add-ons, films, prints, merch | Selling or giving away asset packs / engine templates that contain the raw files
Sharing the files inside your own project team | Giving the files to customers or people outside the team
You keep rights to what you make with them | Using Mixamo content to train machine-learning models

The FAQ's own summary: "the only thing you can't do is distribute the raw character and animation files".

## What that means on Roblox
- **OK:** retarget a Mixamo clip to R15, upload it as an animation asset owned by your game's owner, and play it in your experience. Players never receive an FBX.
- **Not OK:** publishing a free model / Creator Store pack / plugin whose purpose is to hand Mixamo animations to other creators. That is redistribution of the raw animation data in another form.
- **Watch out:** a 2023 DevForum "Mixamo plugin" (by orxginaldw) offers a built-in list of Mixamo animations for creators to pick from. The thread never discusses the license; based on Adobe's terms, treat plugins like that as risky and download from mixamo.com yourself.
- **Not OK:** committing raw Mixamo FBX files to a public GitHub repo or into the vault's FBX library.

## Practical download settings (for Roblox use)
- Format **FBX Binary**, **Without Skin** (just the skeleton + motion) when you only need motion.
- Tick **In Place** on locomotion clips when offered (Roblox moves the character with the Humanoid, not with root motion).
- **30 fps** matches most Roblox-authored clips; keyframe reduction **none** (clean up later).
- Next step: [[Mixamo to R15 - Blender Retarget Workflow]].

## Caveat
The FAQ text dates from Mixamo's "technology preview" era. Adobe's general [Terms of Use](https://www.adobe.com/legal/terms.html) apply on top. Re-check before shipping a commercial game.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free Animations - Hub]]

**Related notes:** [[Free Animation Sources - License Table]] · [[Asset Licenses and Credits]] · [[Mixamo to R15 - Blender Retarget Workflow]] · [[Importing FBX Animations and Retargeting - Kenney Rig Walkthrough]]

<!-- TDOD_GRAPH_END -->

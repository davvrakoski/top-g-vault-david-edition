---
area: "40 Community Resources"
cluster: "Free Animations"
source_note: "community/free-animations/cmu-mocap-license"
title: "CMU Mocap Database - License and Converted Sets"
tags: [roblox, community, animation, free-assets, "cluster/free-animations"]
verified: 2026-10-25
license: "CMU: free for all uses, no direct resale (not bundle-safe by vault policy)"
sources:
  - http://mocap.cs.cmu.edu/
  - http://mocap.cs.cmu.edu/faqs.php
  - https://rancidmilk.itch.io/free-character-animations
  - https://github.com/Shriinivas/cmubvh
cssclasses: [tg-a40]
---

# CMU Mocap Database - License and Converted Sets

> **Status in this vault:** **not bundle-safe** (owner policy, see [[Asset Licenses and Credits]]). You may still use CMU clips inside your own Roblox game.

## The source
**CMU Graphics Lab Motion Capture Database** (Carnegie Mellon University, funded by NSF grant EIA-0196217). Captured on a 12-camera Vicon system at 120 Hz; files are ASF/AMC skeleton + motion, C3D markers, and reference video. Main categories on the site: Human Interaction, Interaction with Environment, Locomotion, Physical Activities & Sports (includes boxing), Situations & Scenarios, Test Motions. Search by keyword (e.g. "run") or subject number.

## License, read on CMU's own pages
- Home page: the dataset is "free for all uses".
- You **may include it in commercially-sold products**, but you **may not resell the data directly, even in converted form**.
- FAQ: the data "may be copied, modified, or redistributed without permission".
- Requested (not required) acknowledgement: *"The data used in this project was obtained from mocap.cs.cmu.edu. The database was created with funding from NSF EIA-0196217."*
- Disclaimers: no quality guarantee; categories may be inaccurate.

**Roblox reading:** uploading a retargeted CMU clip as an animation in your game = including it in a product, which is fine. Selling a "CMU mocap pack" (even converted to FBX/R15) is not.

## Converted versions (save the ASF/AMC hassle)

Set | Creator | Format | License on its page | Notes
---|---|---|---|---
cgspeed BVH conversion | Bruce Hahne (hobbyist) | BVH, MotionBuilder-friendly | CMU terms + "no additional restrictions" (readme wording as quoted by the GitHub project Shriinivas/cmubvh) | No hand data
Free Character Animations | RancidMilk (itch.io) | FBX + glTF, 2,000+ clips on a Quaternius CC0 body; Blender file with control rig | Use/modify/redistribute, **not sell**; must pass the same rule on; Blender scripts GPL-3.0 | Clips are not in-place, some jitter, no fingers

## Using CMU clips on Roblox
1. Prefer the RancidMilk FBX set: it is already on a Mixamo-like humanoid, so it retargets with the same map as Mixamo ([[R15 Joint Map for Retargeting]]).
2. Retarget to R15 ([[Mixamo to R15 - Blender Retarget Workflow]]), then **make loops in-place** - CMU walks travel across the capture volume ([[Mocap Cleanup for Roblox - In-Place, Loops and Foot Slide]]).
3. CMU was captured at 120 Hz; resample to 30 fps before export to keep upload size and keyframe count sane.
4. Credit CMU in your game credits even though it is only requested ([[Free Animation Credits - Attribution Lines]]).

## Do not confuse with
- **AMASS** (MPI research archive that re-packs CMU and other sets) - its own license allows only non-commercial research, education or art; see [[Animation Sources Checked and Left Out]].

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free Animations - Hub]]

**Related notes:** [[Free Animation Sources - License Table]] · [[Asset Licenses and Credits]] · [[100STYLE Mocap - Catalog]] · [[Mocap Cleanup for Roblox - In-Place, Loops and Foot Slide]]

<!-- TDOD_GRAPH_END -->

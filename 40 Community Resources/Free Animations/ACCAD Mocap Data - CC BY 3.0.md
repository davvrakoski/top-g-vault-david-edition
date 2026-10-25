---
area: "40 Community Resources"
cluster: "Free Animations"
source_note: "community/free-animations/accad-mocap-cc-by-3"
title: "ACCAD Mocap Data - CC BY 3.0"
tags: [roblox, community, animation, free-assets, "cluster/free-animations"]
verified: 2026-10-25
license: "CC BY 3.0 Unported (credit required) - usable with credit, not on the vault's bundle-safe list"
sources:
  - https://accad.osu.edu/research/motion-lab/mocap-system-and-data
  - https://creativecommons.org/licenses/by/3.0/
cssclasses: [tg-a40]
---

# ACCAD Mocap Data - CC BY 3.0

> **What:** sample motion-capture datasets published by the **Advanced Computing Center for the Arts and Design (ACCAD), The Ohio State University** Motion Lab. One of the few academic mocap sources with a real Creative Commons license instead of a research-only one.

## Facts from the ACCAD page
Item | Value
---|---
Creator | ACCAD Motion Lab, Ohio State University
License | **Creative Commons Attribution 3.0 Unported** (stated on the data page)
Commercial use | CC BY 3.0 allows it, with attribution
Redistribution | Allowed under CC BY 3.0 with attribution and a license link
Formats | C3D (most sets), **BVH** (e.g. Female 1, Male 1, Male 2 and several figure sets), AMC, TVD, TXT, sample MOV video, PDF docs
Content | Per-performer sets (Female 1, Male 1, Male 2...) and figure / performance sets; check each set's PDF or video for what it contains

## Vault status
- The vault's bundle rule accepts **CC BY 4.0**, not 3.0, so ACCAD is **not listed as bundle-safe**. It is fine to use in your own game with credit.
- No download was made for the vault; grab the BVH files from the ACCAD page yourself.

## Credit line to use
*"Motion capture data from the ACCAD Motion Lab, The Ohio State University (accad.osu.edu), licensed CC BY 3.0 (creativecommons.org/licenses/by/3.0/). Retargeted to R15."*
Add it to your in-game credits and to [[Free Animation Credits - Attribution Lines]]. CC BY also asks you to say you changed the work, hence "Retargeted to R15".

## Roblox workflow
1. Use the **BVH** sets (C3D is raw markers and needs a solver).
2. Import BVH into Blender (built-in BVH importer), check the scale, then retarget to R15 with [[R15 Joint Map for Retargeting]].
3. Trim, make in-place, resample to 30 fps ([[Mocap Cleanup for Roblox - In-Place, Loops and Foot Slide]]).
4. Import via the Clip Editor and publish under the game owner.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free Animations - Hub]]

**Related notes:** [[Free Animation Sources - License Table]] · [[100STYLE Mocap - Catalog]] · [[CMU Mocap Database - License and Converted Sets]] · [[Open Source Licensing - Hub]]

<!-- TDOD_GRAPH_END -->

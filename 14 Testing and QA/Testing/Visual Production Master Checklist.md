---
area: "14 Testing and QA"
cluster: "Testing"
source_note: "24_Visual_Reference_Production/30_Visual_Production_Master_Checklist"
title: "Visual Production Master Checklist"
tags: [roblox, premium, visual-reference, "cluster/testing"]
verified: 2026-10-25
cssclasses: [tg-a14]
---

# Visual Production Master Checklist

Use this before calling any environment, VFX or hero asset "done."

## Reference
[ ] reference decomposed into geometry/material/lighting/VFX/animation/gameplay
[ ] final design is original and rights are documented

## Geometry
[ ] silhouette reads at gameplay distance
[ ] collision is intentional and simpler than visuals
[ ] no useless hidden/internal geometry
[ ] scale/origin/pivots are correct

## Materials
[ ] PBR/material choice matches style
[ ] no fake baked lighting that breaks under new lighting
[ ] texture resolution is justified
[ ] repeated materials are reused where practical

## Lighting
[ ] focal point readable
[ ] dark areas still playable
[ ] bloom/exposure restrained
[ ] low graphics quality checked

## VFX
[ ] clear anticipation/peak/decay
[ ] damage/hitbox is separate from cosmetics
[ ] particle count/lifetime reasonable
[ ] distance/quality LOD exists
[ ] flash accessibility considered

## Characters
[ ] rig deforms in extreme poses
[ ] equipment does not clip badly
[ ] materials differentiate skin/cloth/metal
[ ] combat distance silhouette works

## Environments
[ ] route readable
[ ] streaming behavior tested
[ ] vegetation collision sane
[ ] interior/exterior transitions work

## Performance
[ ] worst-case scene profiled
[ ] mobile/low-end test completed
[ ] memory tested after a longer session
[ ] no unnecessary per-frame scripts

## Release
[ ] source/license log complete
[ ] thumbnails honestly represent actual game quality

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Testing - Hub|Testing]]

**Related:** [[Visual Production Atlas - Hub|Visual Production Atlas]] · [[Official Roblox Rendering and Art Sources — October 2026|Official Roblox rendering & art sources]]

<!-- TDOD_GRAPH_END -->

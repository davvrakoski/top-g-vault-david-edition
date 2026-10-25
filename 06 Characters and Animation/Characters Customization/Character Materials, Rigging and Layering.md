---
area: "06 Characters and Animation"
cluster: "Characters Customization"
source_note: "24_Visual_Reference_Production/22_Character_Materials_Rigging_and_Layering"
title: "Character Materials, Rigging & Layering"
tags: [roblox, premium, visual-reference, "cluster/characters-customization"]
verified: 2026-10-25
cssclasses: [tg-a06]
---

# Character Materials, Rigging & Layering

A premium character needs the art and deformation systems to agree.

## Rig first principles
- bone placement matches joint rotation,
- topology loops support elbows/knees/shoulders,
- weights are clean at extreme poses,
- accessories follow the intended body part,
- collision is simpler than the visual mesh.

## Layered clothing/accessories
Roblox layered accessories use cage/WrapLayer/WrapTarget systems. Use the official specifications when creating publishable avatar content. For game-specific custom rigs, test your own cage/attachment system carefully rather than assuming Marketplace rules automatically solve it.

## Material separation
Skin, cloth, metal, rubber and plastic should have different roughness/normal behavior. Reusing one material response across all equipment makes the character look flat.

## Clipping test set
T-pose/A-pose, idle, sprint, crouch, jump, aim, reload, melee, ragdoll/get-up.

## LOD
Reduce tiny accessory geometry and secondary material detail at distance. Do not destroy the silhouette that identifies the character.

Related: [[Roblox Mesh and Avatar Geometry Specs — 2026 Snapshot|Mesh/Avatar Specs]] · [[3D Asset QA Scorecard|Asset QA Scorecard]]

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Characters Customization - Hub|Characters Customization]]

**Related:** [[Visual Production Atlas - Hub|Visual Production Atlas]] · [[Official Roblox Rendering and Art Sources — October 2026|Official Roblox rendering & art sources]]

<!-- TDOD_GRAPH_END -->

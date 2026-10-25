---
area: "40 Community Resources"
cluster: "Characters Avatars and UGC"
source_note: "community/characters-ugc/which-avatar-item-first"
title: "Which Avatar Item to Make First - Classic, Rigid or Layered"
tags: [roblox, community, "cluster/characters-avatars-and-ugc", ugc, beginner, decision-guide]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/avatar/classic-clothing
  - https://create.roblox.com/docs/avatar/rigid-accessories
  - https://create.roblox.com/docs/avatar/layered-accessories
  - https://create.roblox.com/docs/marketplace/marketplace-fees-and-commissions
  - https://create.roblox.com/docs/avatar/accessory-fitting-tool
---
# Which Avatar Item to Make First - Classic, Rigid or Layered

A decision guide for new UGC creators and for game devs making in-game cosmetics.

| Type | What it is | Skill needed | Publishing advance (non-Limited) | Works on |
| --- | --- | --- | --- | --- |
| **Classic t-shirt, shirt, pants** | 2D image on the classic body surface (t-shirt is a square image such as 512 x 512; shirts and pants use the official template layout) | Image editor | 10 Robux | Classic-style bodies. The docs warn that many UGC bodies do not support classic clothing. |
| **Rigid accessory** | A 3D mesh on an attachment point (hat, hair, back, waist, face, shoulder, neck, front) | Basic modeling, no skinning | 1,000 to 1,500 | Every R15 body; players can nudge position |
| **Layered clothing** | 3D clothing with inner and outer cages that wraps any body | Modeling plus cages plus skinning or auto-skin | 600 | Every R15 body with standard cages |
| **Body or head** | Full avatar or dynamic head | Rigging, skinning, FACS, cages | 1,500 (head) to 2,500 (body) | Everyone |

## Recommendation path

1. **First item: a rigid accessory.** No cages, no skinning, 4,000 triangle budget, use the **Accessory Fitting Tool** to set attachment and fit. Teaches import, validation and publishing with the fewest failure points.
2. **Second: layered clothing.** Highest demand category for outfits, cheaper advance than hats, but cage work is the hard part (see [[Layered Clothing in Blender - Cage Editing Rules]]).
3. **Later: heads and bodies.** Use Avatar Setup to generate the hard parts, then refine (see [[Avatar Setup Tool - Auto Rig, Cage and Skin Notes]]).
4. **Classic clothing**: cheap to make and publish, but limited reach on modern bodies; good for group stores tied to a classic-style game.

## For game developers (in-game cosmetics only)

- You do not need to publish to the Marketplace or pass validation for items used only inside your game.
- Rigid accessories as `Accessory` instances are the simplest in-game cosmetic.
- Layered clothing in-game needs standard cages (for player avatars) or your own cage system (see [[Layered Clothing on Custom and Non-R15 Rigs]]).

## Credits

- Roblox Creator Docs: *Classic clothing*, *Rigid accessories*, *Layered accessories*, *Accessory Fitting Tool*, *Marketplace fees and commissions* (CC BY 4.0). Recommendations are our own.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Characters Avatars and UGC - Hub]]

**Related notes:** [[Classic clothing]] · [[Accessory Fitting Tool]] · [[Rigid accessory specifications]] · [[UGC Money Math - Upload Fee, Publishing Advance and Revenue Share]] · [[Layered Clothing Explained - Cages, WrapLayer and WrapTarget]]

<!-- TDOD_GRAPH_END -->

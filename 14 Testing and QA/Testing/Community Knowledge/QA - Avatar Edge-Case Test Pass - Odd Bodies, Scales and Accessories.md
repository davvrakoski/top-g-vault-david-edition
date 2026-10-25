---
area: "14 Testing and QA"
cluster: "Testing"
title: "QA - Avatar Edge-Case Test Pass - Odd Bodies, Scales and Accessories"
tags: [roblox, community-knowledge, testing, qa, avatars, characters]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/characters/appearance
  - https://create.roblox.com/docs/reference/engine/classes/HumanoidDescription
  - https://create.roblox.com/docs/reference/engine/classes/Players
---
# QA - Avatar Edge-Case Test Pass - Odd Bodies, Scales and Accessories

Your dev team tests with its own avatars, which are usually normal-sized R15 bodies. Real players arrive as tiny proportions, very tall bodies, huge layered coats, animation packs, wide wings, and heads with no face. Hitboxes, doors, seats, cameras and first-person views then break in ways no one on the team ever saw. A 20-minute avatar pass with a fixed set of test outfits catches this before players post the clip.

## Build a test outfit set

Make a `ServerStorage.QAOutfits` folder of `HumanoidDescription` instances (or saved outfit IDs) and a gated QA command that applies one with `Humanoid:ApplyDescription()`:

| Outfit | Settings to push | What it breaks |
|---|---|---|
| **Tiny** | `HeightScale` and `WidthScale` at their lowest allowed values, small `HeadScale` | Can't reach buttons, falls through gaps, camera clips floor |
| **Giant** | Highest `HeightScale`, `WidthScale` | Doors, vents, vehicles, ceilings, hitboxes |
| **Wide coat** | Several layered clothing items | Seats, capes clipping, viewport previews |
| **Accessory heavy** | Wings, back items, big hats | Collision with doors (should be non-colliding), first-person view blocked |
| **Animation pack** | Non-default run/idle/jump | Custom state layers expecting default timing |
| **Faceless / dynamic head** | Head with FACS controls vs classic | Face expression systems, head-shot detection |
| **Pure default** | Blank description | Baseline |

Also test one **R6** account if your game allows R6 avatars in settings.

## Test steps per outfit (about 3 minutes each)

1. Spawn, walk through the tightest door and vent in each map.
2. Sit in every seat type and vehicle.
3. Enter first-person; check the view is not blocked by hair/hats (see [[True First Person - Seeing Your Own Body with LocalTransparencyModifier]]).
4. Get hit and deal damage: are hitboxes and headshots consistent with the visible body?
5. Open the shop/try-on preview and the character select viewport.
6. Die and respawn; confirm appearance and scale are kept.
7. Equip every tool type; grips still in the hand.

## Decide what you enforce

If giant or tiny avatars give an advantage (hiding, hitbox size) decide on purpose:
- Game Settings > Avatar lets you fix scale ranges or body type for the whole game.
- Or normalise at spawn by editing the description's scale values on the server before applying (see [[Resizing Characters at Runtime - Model ScaleTo vs Body Scale Values]]).
- Hitboxes for competitive modes should come from a fixed-size part, not from the avatar mesh.

## Bug report tips

Always include the outfit name from the QA set in the report; "it breaks on my avatar" cannot be reproduced. Attach the description values (the QA command can print them).

## Related
[[Testing - Hub]] · [[Avatar Scale Rules - Height, Width, BodyType and Proportion]] · [[Resizing Characters at Runtime - Model ScaleTo vs Body Scale Values]] · [[QA Test Commands - Gated Cheats for Testers]]

---
area: "40 Community Resources"
cluster: "Characters Avatars and UGC"
source_note: "community/characters-ugc/avatar-settings-vs-scripts"
title: "Avatar Settings vs Scripts - Who Controls the Player Avatar"
tags: [roblox, community, "cluster/characters-avatars-and-ugc", avatar, studio-settings]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/studio/avatar-settings
  - https://create.roblox.com/docs/characters/appearance
  - https://create.roblox.com/docs/reference/engine/classes/HumanoidDescription
---
# Avatar Settings vs Scripts - Who Controls the Player Avatar

There are three layers that can change a player's avatar. Bugs happen when two of them fight. Decide up front which layer owns which rule.

## The three layers

| Layer | Where | Good for | Watch out |
| --- | --- | --- | --- |
| **Avatar Settings** | File or Avatar tab, Avatar Settings | Game-wide rules: rig type, height range, clothing and accessory limits, collision mode, animation packs, CCL on/off | The docs warn these change hidden game defaults you cannot see from scripts. Teammates and other places in the universe can be surprised. |
| **StarterCharacter** | A Model named `StarterCharacter` in StarterPlayer | Fixed-look games (one hero, one class body) | Replaces the avatar entirely; see [[StarterCharacter Setup Checklist]]. |
| **Scripts** | `HumanoidDescription` on the server | Per-player changes: team uniforms, shop items, morphs, round-based looks | Must start from the applied description, or you undo Avatar Settings work. |

## What the Avatar Settings tabs control (2026 window)

- **General presets**: *Player Choice* (load avatars unchanged) or *Consistent Gameplay* (same height and same box collider for everyone).
- **Body**: Scale (Player Choice or Custom Scale with min and max height in studs; classic avatars are about 5 studs), Appearance (override body parts by ID), Build (limit body type, height, width, head size, proportions).
- **Clothing**: remove clothing that exceeds bounds; override a layered slot or classic clothing type by ID (blank ID removes that slot).
- **Accessories**: scale or remove oversized accessories, override or remove accessory types, and toggle accessory VFX, sound and emissives.
- **Movement**: collision mode (*Default* OuterBox, *Single Collider*, *Legacy* InnerBox), animation packs (Player Choice, Standard R15, Standard R6), custom clips layered on top, and Abilities (*Legacy Humanoid* or *Character Controller Library*).

## Picking a layer

- **Competitive game (PvP, obby with tight gaps)**: Avatar Settings, *Consistent Gameplay* or Single Collider, plus a height range. No script needed.
- **Roleplay or hangout**: Player Choice, plus script-driven outfits from your shop.
- **Team game with uniforms**: keep body and scale from Avatar Settings, apply shirt and pants by script on spawn.
- **Horror or story game with a fixed protagonist**: StarterCharacter.

## Keeping NPCs in line

`HumanoidDescription.UseAvatarSettings = true` makes `ApplyDescriptionAsync` and `CreateHumanoidModelFromDescriptionAsync` apply the same Avatar Settings to NPC models. Use it for player-clone statues and lobby mannequins so they match real players.

## Team habit

Write the chosen Avatar Settings into your design doc or a README in the place. The window has a preview lineup (an `AvatarPreview` folder under the camera) that you should check after every change.

## Credits

- Roblox Creator Docs, *Avatar Settings*, *Character appearance*, HumanoidDescription reference (CC BY 4.0). Summarized in our own words.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Characters Avatars and UGC - Hub]]

**Related notes:** [[Avatar Settings]] · [[Avatar Scale Rules - Height, Width, BodyType and Proportion]] · [[HumanoidDescription Recipes - Async APIs and Safe Apply Order]] · [[Built-in Studio Tools That Replace Old Plugins]] · [[Humanoid vs Character Controller Library - Choosing a Movement Stack]]

<!-- TDOD_GRAPH_END -->

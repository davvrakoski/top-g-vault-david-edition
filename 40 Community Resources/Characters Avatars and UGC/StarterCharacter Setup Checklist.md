---
area: "40 Community Resources"
cluster: "Characters Avatars and UGC"
source_note: "community/characters-ugc/startercharacter-checklist"
title: "StarterCharacter Setup Checklist"
tags: [roblox, community, "cluster/characters-avatars-and-ugc", custom-character, startercharacter]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/reference/engine/classes/StarterPlayer
  - https://create.roblox.com/docs/avatar/character-bodies/import
  - https://devforum.roblox.com/t/startercharacter-can-not-walk/631691
  - https://devforum.roblox.com/t/custom-character-not-working/1474494
  - https://devforum.roblox.com/t/2638034
  - https://devforum.roblox.com/t/2388253
  - https://devforum.roblox.com/t/humanoidapplydescriptionfinished-never-fires/3948914
---
# StarterCharacter Setup Checklist

A Model named `StarterCharacter` inside StarterPlayer becomes every player's character. Most "my custom character can't walk / float / won't animate" DevForum threads trace back to one of the items below.

## Structure

- [ ] Model is named exactly `StarterCharacter` and sits directly in **StarterPlayer** (only one).
- [ ] It has a `Humanoid` and a part named `HumanoidRootPart`; set the Model's **PrimaryPart** to the root.
- [ ] `Humanoid.RigType` matches the rig (R15 for 15-part rigs, R6 for 6-part).
- [ ] An `Animator` exists under the Humanoid (or let the engine add one). Use `Animator:LoadAnimation`, not the deprecated `Humanoid:LoadAnimation`.
- [ ] Every joint is a `Motor6D` (or a skinned rig with bones) connecting parts in the right parent-child order; the root part is joined to the torso.

## Physics

- [ ] **Nothing is anchored.** Anchored parts float the character and freeze animations (the top fix in several DevForum threads).
- [ ] Root part: `CanCollide` off is fine; legs or a collider must touch the floor, or `HipHeight` must be correct.
- [ ] `Humanoid.HipHeight` matches the distance from the root's bottom to the ground for R15-style rigs. Wrong values cause hovering or sinking.
- [ ] Massless decorative parts so the character does not tip.

## Scripts

- [ ] The default `Animate` script is inserted at spawn. A DevForum thread (topic 2638034) reports a custom `Animate` placed inside the StarterCharacter being replaced by the default one. The common community fix is to put your own LocalScript named `Animate` in **StarterCharacterScripts**, which takes the default's place.
- [ ] Animations must match the rig: R15 clips on R15, R6 on R6. See [[Animation Will Not Play - Troubleshooting Checklist]].
- [ ] Health, sound and other default scripts can be overridden the same way with same-named scripts in StarterCharacterScripts.

## Appearance

- [ ] A StarterCharacter ignores the player's avatar. To keep the player's look on your rig, apply their description after spawn (`Players:GetHumanoidDescriptionFromUserIdAsync`, then `ApplyDescriptionAsync`). This only works if the rig is a standard R15 body.
- [ ] Do not also set Avatar Settings body overrides that fight the rig. Pick one owner (see [[Avatar Settings vs Scripts - Who Controls the Player Avatar]]).

## Fast test loop

1. Import or build the rig, then rename it `StarterCharacter` and drag it into StarterPlayer (the official character-body test steps use this exact trick).
2. Press Play, walk, jump, climb a truss, sit in a seat, die and respawn.
3. Check Output for joint and animation warnings.

## Credits

- Roblox Creator Docs: StarterPlayer reference, *Import character bodies* and *Studio tests for character bodies* (CC BY 4.0).
- DevForum Scripting Support threads linked above (anchoring, root welding, Animate replacement, rig mismatch answers by their respective repliers).

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Characters Avatars and UGC - Hub]]

**Related notes:** [[R6 vs R15 vs Custom Rigs - Choosing a Character Rig]] · [[Morphs and Character Swaps at Runtime]] · [[Animation Will Not Play - Troubleshooting Checklist]] · [[Character Controllers]] · [[Avatar Body from Blender - Part Names, Attachments and FBX Export]]

<!-- TDOD_GRAPH_END -->

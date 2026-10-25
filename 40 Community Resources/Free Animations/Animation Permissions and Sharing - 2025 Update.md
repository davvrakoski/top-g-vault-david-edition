---
area: "40 Community Resources"
cluster: "Free Animations"
source_note: "community/free-animations/animation-permissions-sharing"
title: "Animation Permissions and Sharing - 2025 Update"
tags: [roblox, community, animation, free-assets, "cluster/free-animations"]
verified: 2026-10-25
license: "n/a - platform rules summary"
sources:
  - https://devforum.roblox.com/t/sharing-animation-assets-with-connections-and-groups/3892540
  - https://create.roblox.com/docs/projects/assets/privacy
  - https://create.roblox.com/docs/animation/editor
  - https://devforum.roblox.com/t/group-animation-not-playing/33934
  - https://devforum.roblox.com/t/animations-wont-play-under-group-game/839286
  - https://devforum.roblox.com/t/why-does-the-animation-work-for-me-but-not-for-others/823535
cssclasses: [tg-a40]
---

# Animation Permissions and Sharing - 2025 Update

> **The #1 animation question on Reddit and the DevForum:** "it plays in Studio but not for other players / not in my group game." Almost always an **ownership** problem.

## The old rule (still the default)
- An animation plays in an experience only if the experience's owner can use it: the **same user or group** that owns the place, or the animation is Roblox-owned.
- Studio can hide the problem: in Studio your own client can load your own animations, so a group game looks fine until you test a live server (DevForum threads 33934, 839286, 823535 all end with "re-publish under the group").
- The Animation Editor docs: when you publish an animation for a group-owned game, pick the **group** in the Creator field.

## What changed (DevForum announcement, 21 Aug 2025, by BobaMuncher)
- Animations moved into the asset **Permissions** system. On the Creator Hub, an animation's configuration page has **Permissions** with two tabs:
  - **Collaborators:** share with connections (friends) or groups. A collaborator (or group members with the right role) can then grant the animation to *their* experiences.
  - **Experiences:** grant a specific experience (by universe ID) permission to load the animation.
- The Asset privacy docs add: once you grant a game access, you **cannot revoke** that game's access; collaborator access can be revoked.
- Not done yet at announcement time: animations inside shared models/packages, bulk permission tools, public sharing through the Creator Store ("looking into" it).

## Practical rules
1. **Publish under the game owner** (group games = group as creator). Simplest and still the most robust.
2. **Working with an outside animator?** They keep ownership and grant your experience in Permissions > Experiences, or share with your group as a collaborator. No re-uploading.
3. **Free Creator Store models with KeyframeSequences:** importing one into the Clip Editor and publishing it under your group is technically possible, but only do it when the model's creator clearly allows reuse. "It was in the Toolbox" is not a license (the Creator Store docs only say uploaders must be the original creator).
4. **Catalog animation packs** (Ninja, Knight, Rthro...): the official docs publish their asset IDs specifically for replacing default animations in your experience - ID table in [[Use animations]], clean override code in [[Animator Priorities, Weights and Blending Done Right]]. Forum reports say some Roblox emote IDs fail to load from scripts, so test each ID.
5. **Always test in a live server** (or a published test place) with a non-owner account before calling an animation done.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free Animations - Hub]]

**Related notes:** [[Asset privacy]] · [[Animation Editor]] · [[Animation Will Not Play - Troubleshooting Checklist]] · [[Creator Store]]

<!-- TDOD_GRAPH_END -->

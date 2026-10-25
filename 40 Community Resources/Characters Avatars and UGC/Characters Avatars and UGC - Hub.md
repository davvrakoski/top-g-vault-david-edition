---
area: "40 Community Resources"
cluster: "Characters Avatars and UGC"
source_note: "community/characters-ugc/hub"
title: "Characters Avatars and UGC - Hub"
tags: [roblox, community, graph-hub, "cluster/characters-avatars-and-ugc"]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/characters/appearance
  - https://create.roblox.com/docs/players/avatar-editor
  - https://create.roblox.com/docs/avatar/layered-accessories
  - https://create.roblox.com/docs/avatar/dynamic-heads
  - https://create.roblox.com/docs/characters/character-controller-library
  - https://create.roblox.com/docs/marketplace/marketplace-fees-and-commissions
  - https://devforum.roblox.com/
---
# Characters Avatars and UGC - Hub

> Practical notes on Roblox characters and avatars in 2026: HumanoidDescription, avatar scale, custom characters, NPC looks, in-game avatar editors, layered clothing and cages, dynamic heads, avatar bodies from Blender, Humanoid vs the Character Controller Library, and selling UGC (rules, fees, validation). Facts come from the Roblox Creator Hub (CC BY 4.0) and DevForum threads (credited by username). All Luau is original. Checked 2026-10-25.
>
> Not repeated here: rig choice ([[R6 vs R15 vs Custom Rigs - Choosing a Character Rig]]), free animations ([[Free Animations - Hub]]), NPC crowd budgets ([[NPC Crowds, Animation LOD and Server Budgets]]).

## Appearance scripting
- [[HumanoidDescription Recipes - Async APIs and Safe Apply Order]] - the 2026 Async method names, Async vs ResetAsync, accessory fields, a queued server helper.
- [[ApplyDescription Problems - DevForum Fix List]] - symptom table for apply bugs, plus an isolation helper.
- [[Avatar Settings vs Scripts - Who Controls the Player Avatar]] - Avatar Settings tabs, StarterCharacter and scripts, and which one should own each rule.
- [[Avatar Scale Rules - Height, Width, BodyType and Proportion]] - the scale values, body scale standards, level design for all sizes.

## Custom characters and NPCs
- [[StarterCharacter Setup Checklist]] - structure, physics, Animate override, appearance on custom rigs.
- [[Morphs and Character Swaps at Runtime]] - the swap pattern the DevForum lands on, with original server and client code.
- [[NPC Appearance Pipeline - From HumanoidDescription to Spawned Rig]] - outfit cache, spawner, player-clone statues.

## In-game avatar editors and shops
- [[AvatarEditorService In-Game Editor - Build Order]] - search, details, inventory, conform, save, bulk buy, throttling.
- [[Catalog and Try-On Games - Limits Developers Hit in 2026]] - known gaps from the 2026 DevForum wishlist and how to plan around them.
- [[Character Preview in a ViewportFrame - WorldModel Pattern]] - animated rotating preview, original LocalScript.
- [[Character Customization UI Patterns - Slots, Outfits and Buy Flow]] - slot model, layout, try-buy-save, server validation.

## Layered clothing and cages
- [[Layered Clothing Explained - Cages, WrapLayer and WrapTarget]] - how cages match, Order, AutoSkin, deprecated properties.
- [[Layered Clothing in Blender - Cage Editing Rules]] - golden rules plus validation thresholds.
- [[Layered Clothing on Custom and Non-R15 Rigs]] - custom cages for game-only clothing, weld helper.

## Heads, bodies and rigs from Blender
- [[Dynamic Heads for Game Developers - FACS, FaceControls and Moods]] - FaceControls behavior, NotReplicated, NPC blink, the 17 required poses.
- [[Avatar Body from Blender - Part Names, Attachments and FBX Export]] - 15 parts, 19 attachments, cages, export settings.
- [[Skinning Avatar Bodies - Influence Limits and Advanced R15 Bones]] - 4 influences, no Root weights, advanced R15, auto skinning.
- [[Avatar Setup Tool - Auto Rig, Cage and Skin Notes]] - workflow and beta-thread community notes.

## Movement stack
- [[Humanoid vs Character Controller Library - Choosing a Movement Stack]] - Humanoid, CCL and raw ControllerManager compared.
- [[CCL Custom Ability Example - Ground Pound]] - original airborne ability built from documented fields.

## UGC: rules, money and validation
- [[UGC Publishing Requirements 2026 - Who Can Sell Avatar Items]] - ID, 2-step, Plus or Premium, limits, removal reasons.
- [[UGC Money Math - Upload Fee, Publishing Advance and Revenue Share]] - fees, advance rebates, progressive share, worked example.
- [[UGC Limiteds - Per-Unit Fees, Resale Split and Purchase Limits]] - free vs paid Limiteds, resale split, the 60-second rule.
- [[UGC Validation Failures - Triage by Error Type]] - what to fix in Blender vs Studio.
- [[Which Avatar Item to Make First - Classic, Rigid or Layered]] - beginner path and in-game cosmetic advice.
- [[Selling Avatar Items Inside Your Game - Commissions, Homestore and Creation Tokens]] - affiliate 40%, Homestore, Merch Booth, creation tokens.

## Sources
- [[Characters Avatars and UGC - Sources Checked and Left Out]] - what was not used or not bundled, and why.

## Credits
- Roblox Creator Hub documentation, Roblox Corporation, CC BY 4.0 (code samples MIT).
- DevForum authors named in each note (no license; summarized, not copied).

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Characters Avatars and UGC - Hub]]

**Related notes:** [[Characters Customization - Hub]] · [[Free Animations - Hub]] · [[Free Tools and Assets - Hub]] · [[Character Customization]] · [[Character Controllers]]

<!-- TDOD_GRAPH_END -->

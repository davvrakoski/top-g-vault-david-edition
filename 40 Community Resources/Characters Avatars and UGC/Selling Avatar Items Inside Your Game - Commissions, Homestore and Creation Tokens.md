---
area: "40 Community Resources"
cluster: "Characters Avatars and UGC"
source_note: "community/characters-ugc/selling-avatar-items-in-game"
title: "Selling Avatar Items Inside Your Game - Commissions, Homestore and Creation Tokens"
tags: [roblox, community, "cluster/characters-avatars-and-ugc", ugc, monetization, homestore]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/marketplace/marketplace-fees-and-commissions
  - https://create.roblox.com/docs/marketplace/ugc-homestore
  - https://create.roblox.com/docs/production/monetization/avatar-creation-token
  - https://create.roblox.com/docs/avatar/in-experience-creation
  - https://create.roblox.com/docs/players/avatar-inspect-menu
---
# Selling Avatar Items Inside Your Game - Commissions, Homestore and Creation Tokens

Avatar items sold inside a game pay the **game owner 40%** of the price. If you also created the item, you collect the 30% creator share too. Here are the four ways games earn from avatar items.

## 1. Sell anyone's items (affiliate)

- Prompt purchases with `MarketplaceService:PromptPurchase` or `PromptBulkPurchase` (server). In-game sales use the base 30% creator share; the game owner gets 40%.
- Items must be allowed to sell in your game (sale location) and, for other creators' items, **Allow Third Party Sales** must be on in Experience Settings, Security.
- Players buying from the **Avatar Inspect Menu** or through AvatarEditorService prompts in your game also count as in-game sales.

## 2. Sell your own items in your own store (Homestore)

The official **UGC Homestore** template (Studio start screen or File, Open from Roblox, Templates) gives:

- **Mannequins** configured by attributes: `accessoryIds`, `bundleIds` (shoes must be a bundle), `poseAnimation`, `skinColor`; each has a `Mannequin` tag for scripting.
- An **integrated shop** button that lists the game owner's items once published, or another creator's catalog via `ReplicatedStorage.Settings` (`DEFAULT_CREATOR_NAME`, `FETCH_CREATOR_NAME = false`).
- Modular building parts for the shopfront.

Selling your own items in your own game gives you 30% + 40% = 70% of each sale.

## 3. Let players create items in your game (avatar creation tokens)

`AvatarCreationService` APIs (`PromptCreateAvatarAsync` for bodies, `PromptCreateAvatarAssetAsync` for other item types, `PromptCreateMakeupAsync` for makeup) let players make an item in your game and buy it into their real inventory. You need an **avatar creation token** from the Creator Dashboard (Monetization, Avatar Creation Tokens):

- The token owner must meet Marketplace creator requirements (ID-verified, Plus or Premium) and keep meeting them.
- Each token costs a refundable **Creation Advance** plus a **Creation Fee**.
- You choose the item type (fixed after creation), the amount above the price floor, and optionally a minimum price. Buy several tokens for several price points.
- You earn as both creator and game owner on these sales.
- Created items still go through UGC validation and moderation.

## 4. Drop-in shop UI (Merch Booth)

Roblox's **Merch Booth** developer module ([[Merch Booth]]) sells avatar assets, passes and developer products from a ready-made in-game catalog UI. Selling other creators' items through it also needs **Allow Third Party Sales** turned on.

## Checklist before launch

- [ ] Sale locations set so items can sell in your game.
- [ ] Third-party sales enabled if you sell others' items.
- [ ] Ownership re-checked on the server before granting in-game perks (purchase-finished events from bulk prompts are not trusted).
- [ ] Limited claims respect the 60-second in-game rule (see [[UGC Limiteds - Per-Unit Fees, Resale Split and Purchase Limits]]).

## Credits

- Roblox Creator Docs: *Marketplace fees and commissions*, *UGC Homestore*, *Avatar creation token*, *Avatar in-experience creation*, *Avatar Inspect Menu* (CC BY 4.0). Summarized in our own words.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Characters Avatars and UGC - Hub]]

**Related notes:** [[UGC Homestore]] · [[Avatar creation token]] · [[Avatar in-experience creation]] · [[AvatarEditorService In-Game Editor - Build Order]] · [[Roblox Studio Templates - Official Uncopylocked Starter Games]]

<!-- TDOD_GRAPH_END -->

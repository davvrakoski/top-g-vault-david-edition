---
area: "40 Community Resources"
cluster: "Characters Avatars and UGC"
source_note: "community/characters-ugc/catalog-tryon-limits"
title: "Catalog and Try-On Games - Limits Developers Hit in 2026"
tags: [roblox, community, "cluster/characters-avatars-and-ugc", avatar-editor, catalog]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/avatar-catalog-try-on-engine-wishlist-aes-commerce-outfits-thumbnails-ownership/4739855
  - https://devforum.roblox.com/t/in-game-avatar-editor-v2/1347497
  - https://create.roblox.com/docs/reference/engine/classes/AvatarEditorService
  - https://create.roblox.com/docs/reference/engine/classes/MarketplaceService
---
# Catalog and Try-On Games - Limits Developers Hit in 2026

A July 2026 DevForum feature-request thread by **stuckinthismood** (ContextWorks) lists the pain points of building catalog and try-on games on `AvatarEditorService`. Use it as a design checklist: plan around each limit before you build.

| Limit (as reported) | Plan around it |
| --- | --- |
| No supported way to render an arbitrary avatar description to a 2D thumbnail | Show 3D previews only for the selected item; use catalog item thumbnails for grids. |
| Building layered or UGC outfits in ViewportFrames is slow the first time | Keep one preview rig alive and re-dress it; show a loading shimmer. |
| Search, details, favorites and recommendations share one experience-wide budget that does not grow with player count | Cache across servers if you can (MemoryStore), debounce search, page lazily. The documented cap is 100 requests per second for the listed endpoints. |
| Search results often need a second details call for price and ownership | Fetch details only for visible cards. |
| Batch details can return fewer rows than requested, without a stable mapping | Key results by item ID and treat missing rows as "unknown", not "free". |
| Asset IDs and bundle IDs can collide numerically | Always key items by (type, id). |
| Bundle members can look not-for-sale when the bundle is purchasable | Sell the bundle, not the member asset. |
| Bulk purchase is capped around 20 lines with no reliable server completion signal | Split big outfits; re-check ownership on the server afterwards. |
| "Not owned", "privacy blocked" and "error" can look identical | Show a neutral state and a retry, never "you don't own this" on an error. |
| Descriptions store asset IDs, so bundle identity is lost after wearing | Keep your own record of which bundle the player picked. |
| Undocumented 429 responses from description and marketplace APIs under load | Exponential backoff, and never apply on every click. |

## Older community editors

The **In Game Avatar Editor v2** resource by 0_1195 (2021) shipped a model, plugin, catalog database of StringValues and an open-source demo place. Its author noted the catalog database was out of date. No license is stated on the post, so treat it as a reference to study, not code to copy into a product. It also predates the Async APIs.

## What this means for scope

- A small catalog game should start with a curated list (a few hundred items you tested) rather than live search for everything.
- Monetization still works: in-game sales pay the game owner 40% (see [[Selling Avatar Items Inside Your Game - Commissions, Homestore and Creation Tokens]]).

## Credits

- DevForum: stuckinthismood (ContextWorks), *Avatar catalog / try-on engine wishlist* (July 2026); 0_1195, *In Game Avatar Editor v2* (2021). Points summarized in our own words.
- Roblox Creator Docs: AvatarEditorService and MarketplaceService references (CC BY 4.0).

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Characters Avatars and UGC - Hub]]

**Related notes:** [[AvatarEditorService In-Game Editor - Build Order]] · [[Character Preview in a ViewportFrame - WorldModel Pattern]] · [[Character Customization UI Patterns - Slots, Outfits and Buy Flow]] · [[MarketplaceService]]

<!-- TDOD_GRAPH_END -->

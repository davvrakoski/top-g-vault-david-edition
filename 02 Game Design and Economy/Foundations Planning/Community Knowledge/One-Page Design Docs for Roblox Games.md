---
area: "02 Game Design and Economy"
cluster: "Foundations Planning"
title: "One-Page Design Docs for Roblox Games"
tags: [roblox, community-knowledge, game-design-doc, planning, gdd, team]
cssclasses: [tg-a02]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://gdcvault.com/play/1012356/One-Page
  - https://www.gamedeveloper.com/design/video-one-page-designs
  - https://www.gamedeveloper.com/design/-the-goal-of-design-is-to-efficiently-communicate-ideas-
  - https://create.roblox.com/docs/production/game-design/prototyping
  - https://create.roblox.com/docs/production/game-design/core-loops
---
# One-Page Design Docs for Roblox Games

Most Roblox teams are tiny, part-time and spread across time zones, and nobody reads a 40-page design bible. Stone Librande (then at EA/Maxis) argued at GDC 2010 in *One-Page Designs* that traditional design documents and wikis fail because they are long, stale and unread; his alternative was a single annotated page, mostly diagrams, per system. Game Developer later revisited the talk as still practical, summing up his thesis that the goal of design is to communicate an idea efficiently.

## Rules of a one-pager

1. **One page, literally.** If it doesn't fit, it's two systems; split it.
2. **Picture first, words as callouts.** A map, a flow diagram or a UI mock with arrows and short labels.
3. **Numbers on the page.** Prices, timers, drop rates, damage. Vague docs create arguments; numbers create tests.
4. **Print it or pin it.** It lives where the team sees it (Discord pinned image, Obsidian note, wall).
5. **Update or delete.** An outdated one-pager is worse than none; put a date on it.

## A Roblox one-page template

Draw these blocks on one canvas (Figma, Excalidraw, paper photo):

| Block | Content |
|---|---|
| **Pitch** | One sentence: "Co-op mall survival where you craft weapons from store items." |
| **Core loop diagram** | 3-5 boxes with arrows (e.g. explore -> loot -> craft -> fight -> upgrade). Roblox's core loop guide frames this as minute-to-minute actions, the most repeated set of actions, and the progression engine. |
| **First 5 minutes** | Storyboard of 4-6 frames from spawn to first reward. |
| **Economy box** | Currencies, main sources and sinks, one example price ladder. |
| **Monetization box** | Passes / products list with prices; what is never sold. |
| **Social hook** | Why play with friends; invite or party feature. |
| **Platforms** | Phone first? Controller? Notes on UI scale. |
| **Out of scope** | Bullet list of features you are *not* building this version. |

Per-system one-pagers (inventory, trading, boss fight) follow the same pattern: diagram, numbers, edge cases, "done when" checklist.

## How it fits Roblox's prototyping advice

Roblox's prototyping guide pushes building a playable test early to answer specific questions. Use the one-pager to state the **question** ("is looting fun without combat?") and the **success signal** (testers keep looting for 10 minutes unprompted). After the playtest, update the page.

## Working with the vault

- Store the one-pager image plus a short text version (searchable) in the project's planning note.
- Link each one-pager to its implementation notes (blueprints, data shapes) so code and design stay connected.

## Common mistakes

- Writing lore before the loop works.
- Docs without numbers ("enemies get harder").
- No "out of scope" list, so the scope creeps every week.

## Related
[[Foundations Planning - Hub]] - [[Project Planning]] - [[Master Build Order]] - [[Reference Decomposition Method — Turn Any Image Into a Build Plan]]

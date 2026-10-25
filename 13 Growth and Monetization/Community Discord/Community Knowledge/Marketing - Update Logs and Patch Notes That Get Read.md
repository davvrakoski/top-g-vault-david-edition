---
area: "13 Growth and Monetization"
cluster: "Community Discord"
title: "Marketing - Update Logs and Patch Notes That Get Read"
tags: [roblox, community-knowledge, marketing, patch-notes, updates, liveops]
cssclasses: [tg-a13]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/promotion/experience-events
  - https://create.roblox.com/docs/production/promotion/social-media-links
  - https://create.roblox.com/docs/production/promotion/experience-notifications
---
# Marketing - Update Logs and Patch Notes That Get Read

An update only brings players back if they **hear about it and understand why it matters**. For a Roblox game the update message is written several times over: a 60-character Roblox announcement, an in-game "What's new" panel, a Discord post, a social caption and maybe a Short. Each one has a different reader and a different length limit. This note gives a template set, so one update becomes five pieces of comms with little extra work.

## 1. Lead with what players get, then the fixes
Order every patch note like this:
1. **Headline feature** (one line, player benefit): "New map: the Flooded Food Court".
2. **2-4 other new things**, each one line.
3. **Balance changes**, with the reason ("Shotgun range down 15%: it was beating every other weapon at mid range").
4. **Fixes**, named specifically ("Fixed: falling through the escalator on level 2").
5. **Known issues** you're working on. Being honest here prevents a lot of angry posts.

Use player language, not code names. "Fixed `WaveManager` nil index" means nothing to players.

## 2. The five versions of one update

| Surface | Limit / rule | Template |
|---|---|---|
| **Roblox update announcement** (Dashboard > Events & Updates, old updates form) | **60 chars**, once every **3 days**, goes to opted-in followers | `NEW: Flooded Food Court map + 2 new zombies!` |
| **In-game "What's new"** | shown once per version per player | headline + 3 bullets + "Full notes: see the game page" |
| **Game description** | top 2 lines are visible without expanding | `🆕 v1.4 (Nov 8): Flooded Food Court...` |
| **Discord #updates** | full notes; mention a role, not @everyone | the full template from section 1 + one image or GIF |
| **Social post / Short** | hook, then 3 shots, then date | "the mall is FLOODING Saturday" |

Roblox's docs say the same about announcements: describe what changed (not "bug fixes") and don't send so many that players unfollow. The **unfollow rate** stat for each update tells you when you've overdone it.

## 3. In-game "What's new" panel (small Luau pattern)
Store the last seen version per player and show the panel only when it changes:
```lua
local CURRENT_VERSION = "1.4.0"
-- server: on join, read profile.LastSeenVersion
if profile.LastSeenVersion ~= CURRENT_VERSION then
    WhatsNewRemote:FireClient(player, CURRENT_VERSION)
    profile.LastSeenVersion = CURRENT_VERSION
end
```
Keep in-game text free of URLs and handles (Roblox rules). Point players to "Social Links on the game page".

## 4. Version names and timing
- A **visible version** number (v1.4) in the menu and notes makes bug reports clearer ("happened on 1.4.0").
- **Update at a consistent time** (for example Saturday 17:00 UTC). Players learn the rhythm and creators know when to record.
- Tease 2-3 days ahead with one shot, post notes at release, and follow with a "what you missed" clip 2-3 days later.

## 5. Changelog archive
Keep a pinned Discord forum post or a community forum thread with every version's notes. It helps returning players, content creators and your own memory. Roblox communities have **forum** features with roles to manage posts.

## Pitfalls
- Hiding a big nerf at the bottom. Players find it and trust drops. Put it in "Balance" with a reason.
- Announcing an update that isn't live on all servers yet. Restart servers or migrate first, then announce.
- Using the 60-character announcement on minor fixes. Save it for content.

## Related
[[Community Discord - Hub]] · [[Community Management Playbook - Discord, Feedback and Crisis Comms]] · [[LiveOps Calendar and Update Cadence Planner]] · [[Marketing - Pre-Launch Hype on Roblox - Events, Notify Me and Community Joins]]

---
area: "13 Growth and Monetization"
cluster: "LiveOps Social"
title: "Patch Notes and In-Game Update Boards Players Actually Read"
tags: [roblox, community-knowledge, liveops, updates, patch-notes, communication]
cssclasses: [tg-a13]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/promotion/experience-events
  - https://create.roblox.com/docs/production/publishing/descriptions
  - https://create.roblox.com/docs/production/game-design/liveops-essentials
  - https://create.roblox.com/docs/production/configs
  - https://create.roblox.com/docs/production/localization
---
# Patch Notes and In-Game Update Boards Players Actually Read

An update players don't notice is an update that didn't help retention. On Roblox most players never visit Discord or the DevForum, and social links are hidden from anyone not age-verified 16+. So the update has to be **announced inside the game and on the game page**, in a format a 10-year-old on a phone reads in five seconds.

## The four places an update should appear

| Where | Format | Limit / rule |
|---|---|---|
| **Update announcement** (Creator Hub > Updates) | one punchy line | 60 characters, once every 3 days, goes to opted-in followers |
| **Description "Recent updates" line** | 1-2 lines with [NEW] tag | Roblox's description guide: keep it short so main content stays high |
| **In-game update board / popup** | 3 bullets + image | shown once per version per player |
| **Community/Discord post** | full notes | for engaged players |

## Writing the in-game version

- **Lead with the fun:** "NEW: Volcano zone + 6 fire pets" before "fixed 23 bugs".
- **Three bullets max** on the first screen, each starting with a verb or a [NEW]/[BUFF]/[FIX] tag.
- **Show, don't list:** one screenshot or a 3D preview of the headline item.
- **Point to it:** a button "Go there" that teleports or opens the relevant shop/zone turns notes into play.
- **Say what changed for them:** "Your pets now earn 20% more" beats "pet formula rebalanced".
- **Compensation notes** after outages or nerfs belong at the top, with the reward claim button right there.

## Showing it once, reliably

```lua
-- Own example: show the board once per version
local CURRENT_NOTES_VERSION = 42   -- bump when notes change

local function shouldShowNotes(profile): boolean
	return (profile.SeenNotesVersion or 0) < CURRENT_NOTES_VERSION
end
-- after the player closes the board: profile.SeenNotesVersion = CURRENT_NOTES_VERSION
```

Keep the notes text in **Experience configs** (`ConfigService`, JSON value up to 100,000 characters) or a localization table so you can fix typos or translate without a new publish; keep the version number with the text.

## Full patch notes (Discord/DevForum)

Structure that scales:

1. Headline + date + version label (match an in-game build label so bug reports reference it).
2. **New** - features and content.
3. **Changes** - balance with numbers ("Sword damage 40 -> 35").
4. **Fixes** - grouped by area.
5. **Known issues** - builds trust and cuts duplicate bug reports.

Balance changes with numbers stop rumor cycles; vague "adjusted drop rates" invites conspiracy theories, especially for paid random items (where odds shown in-game must stay accurate anyway).

## Timing

- Ship notes **with** the update, not hours later.
- If servers must restart, warn in-game first and announce the update reason (see server restart notes).
- Don't spend the once-per-3-days announcement on minor hotfixes.

## Related
[[LiveOps Social - Hub]] - [[LiveOps Calendar and Update Cadence Planner]] - [[Global Live Moments - Scheduled Cross-Server Events]] - [[Build Versioning - Git Tags, PlaceVersion and an In-Game Build Label]]

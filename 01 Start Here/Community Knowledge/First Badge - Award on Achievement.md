---
area: "01 Start Here"
cluster: "Start Here"
title: "First Badge - Award on Achievement"
tags: [roblox, community-knowledge, start-here, badges, engagement]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/publishing/badges
  - https://create.roblox.com/docs/reference/engine/classes/BadgeService
---
# First Badge - Award on Achievement

Badges are permanent awards that appear in a player's Roblox inventory: "Welcome", "Beat the obby", "Played 1 hour". They are free to make (within a daily limit), cost one server call to award, and give players goals and something to show off. They are also a cheap way to measure your funnel: a "reached stage 10" badge tells you how many players got that far.

## Create a badge

1. Creator Dashboard > your game > hover the thumbnail > **...** > **Create Badge** (or **Engagement > Badges**).
2. Upload a **512x512** image; it is cropped to a circle, so keep details inside it.
3. Name, description (say how to earn it), **Badge is Enabled** on.
4. Create, then copy its ID: hover the badge > **...** > **Copy Asset ID**.

Limits: **5 free badges per game per 24 hours (GMT)**; extra badges in that window cost **100 Robux** each. Disabled badges cannot be earned and are hidden from the game page. You can reorder up to 50 badges at once on the Badges page.

## Award it (server Script)

Badges can only be awarded from a **server-side** Script, with `BadgeService:AwardBadgeAsync` (the old `AwardBadge` is deprecated).

```lua
local BadgeService = game:GetService("BadgeService")
local Players = game:GetService("Players")

local WELCOME_BADGE = 0000000 -- your badge ID

local function awardBadge(player, badgeId)
	-- skip if they already have it (saves a request)
	local okHas, has = pcall(BadgeService.UserHasBadgeAsync, BadgeService, player.UserId, badgeId)
	if okHas and has then return end

	local okAward, result = pcall(BadgeService.AwardBadgeAsync, BadgeService, player.UserId, badgeId)
	if not okAward then
		warn("Badge award failed:", result)
	end
end

Players.PlayerAdded:Connect(function(player)
	awardBadge(player, WELCOME_BADGE)
end)
```

The official sample also calls `GetBadgeInfoAsync` first and checks `IsEnabled`, which avoids errors for disabled badges.

## Typical triggers

| Badge | Trigger |
| --- | --- |
| Welcome | `PlayerAdded` (as above) |
| Finished the obby | Touching the final checkpoint pad (server Touched) |
| Met the creator | A player joins while your UserId is in the server |
| Veteran | Session time or saved total playtime passes a threshold |
| First purchase | Inside your purchase-granting code |

```lua
finishPad.Touched:Connect(function(hit)
	local player = Players:GetPlayerFromCharacter(hit.Parent)
	if player then awardBadge(player, FINISH_BADGE) end
end)
```

Add a per-player debounce if a trigger can fire many times; even with `UserHasBadgeAsync` you do not want dozens of requests per second.

## Design tips

- Make the first badge easy (welcome or first stage) so players see the system early.
- Spread badges along the experience, not all at the end; each is a small goal.
- Do not promise rewards you cannot keep; badges themselves grant nothing in-game unless your code checks for them with `UserHasBadgeAsync`.
- Use them as analytics checkpoints: the Dashboard shows how many players earned each.

## Pitfalls

- Awarding from a LocalScript: it errors; badges are server-only.
- Using the image's asset ID instead of the badge ID.
- Calling `AwardBadgeAsync` in Studio tests repeatedly for yourself: fine, but remember it is a real award.

## Related
[[00 START HERE - Top G Vault]] · [[First Obby in 30 Minutes]] · [[Progression, XP, and Skill Tree Blueprint]] · [[Analytics Instrumentation Plan]] · [[30 Official Roblox Docs/Production/Publishing/Badges|Badges (official)]]

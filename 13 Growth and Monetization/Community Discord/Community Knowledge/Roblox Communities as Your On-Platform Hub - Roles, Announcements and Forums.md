---
area: "13 Growth and Monetization"
cluster: "Community Discord"
title: "Roblox Communities as Your On-Platform Hub - Roles, Announcements and Forums"
tags: [roblox, community-knowledge, community, groups, roles, permissions, safety]
cssclasses: [tg-a13]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/projects/groups
  - https://create.roblox.com/docs/reference/engine/classes/GroupService
  - https://create.roblox.com/docs/production/promotion/social-media-links
  - https://create.roblox.com/docs/production/publishing/kids-and-select
---
# Roblox Communities as Your On-Platform Hub - Roles, Announcements and Forums

Discord is where many devs build community, but it is off-platform, has its own age rules, and Roblox shows social links only to age-verified 16+ users. A Roblox **Community** (the newer name for groups on roblox.com) reaches every player, including under-16s, and doubles as the permission system for your team. Treat it as your primary hub and Discord as the extra.

## Setup basics (from Roblox's groups doc)

- Creating a group/community costs **100 Robux**.
- Members can hold **multiple roles**; each role carries permissions in three categories: **General**, **Creation**, **Community**.
- Roles are ordered: some permissions only let a member manage roles **below** their own highest role.
- Roles can be **public** (shown on the community page and in games) or **private**.
- Server-side role changes from a game go through **Open Cloud Groups endpoints** via `HttpService` (see the doc's linked guide).

## Community features to use

| Feature | Permission names (Community category) | Use |
|---|---|---|
| Announcements | Announcement Viewer / Creator | Update notes, event times, codes |
| Forums | Forum Category Manager, Post Creator/Remover, Locks, Pins | Bug reports, suggestions, trading board |
| Moderation | Content Moderation Viewer/Manager | Review reported content |
| Slow mode | Slowmode Bypasser | Calm busy forums during updates |
| Analytics | Community Analytics Viewer | Track community growth |

## Team permissions worth knowing (Creation category)

Give staff only what they need:

- **Universe Player** (play unreleased games) for testers.
- **Universe Editor / Publisher** for builders and scripters; few people should publish.
- **Share Links Manager**, **Universe Events Manager** for marketing staff.
- **Universe Bans Manager** for mods (it includes read-only access to in-game chat, member must be 18+).
- **Universe Monetization Manager** for whoever sets prices.
- **Universe Analytics Viewer** and **Alerts Manager** for analysts.
- **Group Revenue Viewer/Manager**: keep "Manager" to the owner(s).
- **Data Stores Deleter** and **Api Key Manager**: owner only.

For group-owned games aimed at under-16 players, the **group owner** must meet the Kids/Select creator requirements (verification, 2SV, fee or subscription).

## In-game hooks

```lua
-- Own example (client): offer a cosmetic for joining the community
local GroupService = game:GetService("GroupService")
local Players = game:GetService("Players")
local GROUP_ID = 0000000 -- your community ID

local player = Players.LocalPlayer
if not player:IsInGroupAsync(GROUP_ID) then
	local status = GroupService:PromptJoinAsync(GROUP_ID)
	-- tell the server to re-check membership; never trust the client's result
end
```

- `Player:IsInGroupAsync` replaces the deprecated `IsInGroup`; `GroupService:GetRolesInGroupAsync(userId, groupId)` returns all roles (multi-role) and supersedes `GetRankInGroupAsync`.
- The server must verify membership itself before granting a reward; results are cached per peer, and joining via `PromptJoinAsync` clears the cache on the client that prompted.
- Use roles for in-game perks: tester tag, staff badge, "Member" chat tag.

## Pitfalls

- Everyone in one "Admin" role with all permissions (one compromised account = lost game).
- Revenue managers who aren't owners.
- Forums without moderators: set up Content Moderation roles before opening them.

## Related
[[Community Discord - Hub]] - [[Linking Discord to Roblox - Bloxlink Verification and Rank Binds]] - [[Developer Account Takeovers - Session Theft and Group Hygiene]] - [[Splitting Revenue With a Partner - Group Funds vs DevEx]]

---
area: "09 Maps and Worlds"
cluster: "Maps"
title: "World - Secret Areas and Easter Eggs"
tags: [roblox, community-knowledge, maps, secrets, exploration, badges]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/BadgeService
  - https://create.roblox.com/docs/production/publishing/badges
  - https://create.roblox.com/docs/reference/engine/classes/ProximityPrompt
  - https://create.roblox.com/docs/reference/engine/classes/DataStoreService
---
# World - Secret Areas and Easter Eggs

Secrets turn a map into something players talk about. They drive videos, "how to find" guides, replays and badge hunting. A good secret is **hinted, reachable and rewarded**; a bad one is a random invisible button nobody finds, or a glitch spot that breaks the map.

## Types of secrets
| Type | Example | Discovery hint |
|---|---|---|
| Hidden room | Fake wall, crawlspace, behind a waterfall | Cracked texture, draft particles, a sound behind the wall |
| Out-of-the-way reward | Rooftop chest, bottom of a well | Visible from a normal path but hard to reach |
| Sequence puzzle | Ring 3 bells in order | Clues written somewhere else on the map |
| Lore item | Note, photo, statue with a plaque | A light or glow on a dead end |
| Developer egg | Dev's desk, tiny model of the game | Fun reward, no gameplay value |

## Layout rules
1. **Hint from the main path.** Players should glimpse the secret's location (a ledge, a light, a gap) from somewhere they already walk.
2. **Use dead ends.** Every dead end should hold something: a secret, loot or a view. Empty dead ends teach players that exploring is pointless.
3. **Reach with existing moves.** Jumps, crouches and climbs the game already teaches. A secret that requires a glitch will be patched by accident later.
4. **One "legend" secret** per map that is truly hard, plus several easy ones so most players find at least one.
5. **Never block progress** behind a secret.

## Rewards
- A badge is the classic reward. Award it on the server, once:

```lua
local BadgeService = game:GetService("BadgeService")
local BADGE_ID = 0 -- your badge id
local awarded = {}
script.Parent.Touched:Connect(function(hit)
	local player = game.Players:GetPlayerFromCharacter(hit.Parent)
	if not player or awarded[player] then return end
	awarded[player] = true
	local ok, has = pcall(BadgeService.UserHasBadgeAsync, BadgeService, player.UserId, BADGE_ID)
	if ok and not has then
		pcall(BadgeService.AwardBadgeAsync, BadgeService, player.UserId, BADGE_ID)
	end
end)
```
Clear `awarded[player]` on `PlayerRemoving`. For non-badge rewards (titles, cosmetics) save the found secrets in a DataStore as a small set of IDs.

- Show a "Secrets found: 3/12" counter somewhere (a lobby board) to tell players more exist.

## Lighting and sound tips
- A faint light or particle at the entrance of a hidden area is a strong but subtle hint.
- Change ambience inside (reverb, a hum) so players know they found something.

## Performance budget
- Secret rooms are rarely visited: keep them in streamed models, or spawn their content only when a player gets close.
- Touch triggers: use one small invisible part with `CanTouch` on, everything else in the room off.

## Common mistakes
- Hint-free secrets that only data miners find.
- Badge awards spammed every touch (rate limits, errors) - track per player.
- Secrets reachable only by exploiting physics, then "fixed" by a later update, angering players who earned them.
- Easter eggs that use other games' characters or trademarks.

## Related
[[Maps - Hub]] - [[Gating Map Areas - Per-Player Barriers with Collision Groups and Local Parts]] - [[Wayfinding with Landmarks and Weenies]] - [[Position and Death Heatmaps for Map Playtests]]

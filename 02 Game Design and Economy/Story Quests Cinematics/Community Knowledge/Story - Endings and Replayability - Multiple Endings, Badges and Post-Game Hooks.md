---
area: "02 Game Design and Economy"
cluster: "Story Quests Cinematics"
title: "Endings and Replayability - Multiple Endings, Badges and Post-Game Hooks"
tags: [roblox, community-knowledge, story, endings, replayability, badges]
cssclasses: [tg-a02]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://www.gamedeveloper.com/design/multiple-endings-in-games
  - https://www.gamedeveloper.com/design/alternate-endings
  - https://create.roblox.com/docs/production/publishing/badges
  - https://create.roblox.com/docs/reference/engine/classes/BadgeService
  - https://en.wikipedia.org/wiki/Doors_(game)
---
# Endings and Replayability - Multiple Endings, Badges and Post-Game Hooks

A Roblox story game lives or dies on what happens **after** the first ending. Players who finish and find nothing new leave and do not come back; players who see a locked ending, a missing badge or a harder mode replay with friends and bring new players with them. But every extra ending costs writing, art and testing. This note covers how to choose ending structures, how to make them visible with badges, and cheaper post-game hooks that replay well.

## Two ways multiple endings work

Two Game Developer blog posts give complementary views:

- *Multiple endings in games* describes two approaches that work: a **canonical ending** with the others as bonuses, or a **sprawling story** where every player feels their path is the real one even though they never see it all.
- *Alternate endings* (a repost from dtwgames.com) argues that extra endings do raise replayability, but that this should not be the *reason* to add them; the first ending a player reaches is the one that matters most.

For Roblox, the canonical-plus-bonus model is usually right: one main ending most players reach, plus 1-3 **secret** or **bad** endings that reward curiosity.

## Ending types that are cheap to build

| Ending | Trigger | Content cost |
|---|---|---|
| **Main escape** | Finish the critical path | Full scene |
| **Bad ending** | Fail a story condition (left a survivor, ran out of time) | Short variant of main scene |
| **Secret ending** | Hidden puzzle or collectible set | Small unique scene |
| **Speed / no-hit ending** | Finish under a time or without dying | A title card and a badge |
| **Joke ending** | Absurd choice early on | 5-second gag; players share these |

Endings read story flags at the final bottleneck ([[Story - Branching Story Structures - Gauntlet, Branch and Bottleneck, Loop and Grow]]). Decide the conditions on paper first, then make sure every condition can be seen during play (a survivor you can save, a timer you can see).

## Make endings visible: badges

Roblox badges are the free, public trophy case for this.

- Award with `BadgeService:AwardBadgeAsync(userId, badgeId)` from a **server** script, wrapped in `pcall`; check `GetBadgeInfoAsync(badgeId).IsEnabled` first, as the docs' example does.
- Check ownership in bulk with `CheckUserBadgesAsync(userId, badgeIds)` to show a lobby "Endings: 2 / 5" board.
- Creation limit (per the badges docs): **5 free badges per game per 24 hours (GMT)**; more cost 100 Robux each. Plan badge creation over several days before launch.

```lua
-- Server: award an ending badge once, safely
local BadgeService = game:GetService("BadgeService")
local function awardEnding(player, badgeId)
	local okInfo, info = pcall(BadgeService.GetBadgeInfoAsync, BadgeService, badgeId)
	if not (okInfo and info.IsEnabled) then return end
	local ok, err = pcall(BadgeService.AwardBadgeAsync, BadgeService, player.UserId, badgeId)
	if not ok then warn("Badge award failed:", err) end
end
```

Also store the ending in your own save data, because badges can be deleted from inventories and you want your own record ([[Story - Story State Flags - Saving Chapter Progress Without Breaking Old Saves]]).

**Show locked endings** as silhouettes with a one-line hint ("Some survivors can still be saved"). A visible gap is the strongest replay prompt.

## Post-game hooks (cheaper than new endings)

- **Modifiers.** DOORS added modifiers that let players change the game after beating it (Wikipedia, August 2023 update). Toggles such as "monster faster", "no flashlight", "one life" multiply replay value from existing content.
- **Hard mode** with remixed item spawns and a stalker that unlocks behaviours earlier.
- **Collectible completion**: an ending-adjacent reward for finding every note ([[Story - Lore Drip - Notes, Tapes and Collectibles That Players Read]]).
- **Speedrun timer** shown on the end screen with a personal best.
- **New perspective**: replay a chapter as the monster or another survivor (reuses the map).
- **Randomized elements**: shuffled key locations, alternate room variants, so a second run is not a memorized route.

## End-screen checklist

- [ ] Ending name and a short, satisfying final beat (no instant kick to lobby).
- [ ] What you unlocked (badge, ending count, cosmetic).
- [ ] One hook: "3 endings left", "Hard mode unlocked", "Chapter 3 coming...".
- [ ] Buttons: **Play again with this party** first, then Lobby.
- [ ] Results saved before any teleport ([[Story - Chapter-Based Games - Places, Teleports and Chapter Select]]).

## Related
[[Story Quests Cinematics - Hub]] · [[Case Study - DOORS]] · [[Quest System Blueprint]] · [[Cinematic and Cutscene Direction]]

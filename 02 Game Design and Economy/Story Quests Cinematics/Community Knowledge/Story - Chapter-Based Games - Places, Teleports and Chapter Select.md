---
area: "02 Game Design and Economy"
cluster: "Story Quests Cinematics"
title: "Chapter-Based Games - Places, Teleports and Chapter Select"
tags: [roblox, community-knowledge, story, chapters, teleport, places, horror]
cssclasses: [tg-a02]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/projects/teleport
  - https://create.roblox.com/docs/reference/engine/classes/TeleportOptions
  - https://create.roblox.com/docs/reference/engine/classes/TeleportService
  - https://en.wikipedia.org/wiki/Doors_(game)
  - https://www.gamedeveloper.com/design/narrative-tips-for-mobile-games
---
# Chapter-Based Games - Places, Teleports and Chapter Select

Piggy, DOORS and many Roblox story games are built as **chapters**: a lobby, a choice of map or floor, a 10-30 minute run, then back to the lobby. Chapters fit Roblox well. A session is one chapter long, each update can add a chapter, and every new chapter is a reason for old players to come back. DOORS, for example, launched in August 2022 with one floor (The Hotel) and released a second floor (The Mines) in August 2024 (per Wikipedia). This note covers the technical shape (one place or many, teleports, passing party and chapter data) and the design rules that keep chapters coherent.

## One place or many?

| Option | How | Good for | Watch out for |
|---|---|---|---|
| **Single place, maps streamed in** | Chapter maps in `ServerStorage`, cloned into Workspace when a run starts | Small maps, fast iteration, one server per party | Memory if maps are big; one bad map breaks the place |
| **Lobby + one place per chapter** | Lobby teleports the party to the chapter place | Big maps, separate Lighting and settings per chapter | Teleport failures, data passing, more places to publish |

Most chapter horror games use **lobby + places**, because each chapter can have its own `Lighting`, terrain and scripts.

## Teleporting a party into a private run

From the Roblox teleport docs: teleports must be started on the **server** with `TeleportService:TeleportAsync(placeId, players, options)`; the old client-side `Teleport()` is deprecated. To give the party its own server, set `TeleportOptions.ShouldReserveServer = true`, or reserve one first with `TeleportService:ReserveServerAsync(placeId)` and pass the access code in `ReservedServerAccessCode`.

```lua
-- Lobby server: elevator full, start chapter 2 for this party
local TeleportService = game:GetService("TeleportService")
local CHAPTER_PLACES = {ch1 = 1111111111, ch2 = 2222222222} -- your place IDs

local function startChapter(chapterId, party, hostUserId)
	local options = Instance.new("TeleportOptions")
	options.ShouldReserveServer = true
	options:SetTeleportData({chapter = chapterId, host = hostUserId, mode = "normal"})
	local ok, err = pcall(function()
		return TeleportService:TeleportAsync(CHAPTER_PLACES[chapterId], party, options)
	end)
	if not ok then warn("Teleport failed", err) end -- show a retry button
end
```

Read it in the chapter place with `player:GetJoinData().TeleportData`. The docs warn that this data is visible to the client and unencrypted, so it is **not secure**: use it for the chapter and mode, but load anything valuable (unlocks, currency) from DataStores in the chapter place. Handle `TeleportService.TeleportInitFailed` and let players retry; teleports do fail. TeleportService does not work in Studio playtests, so test chapter flow in a published (private) build.

## Returning to the lobby

At the end of a run, save results in the chapter place **before** teleporting back (completion, ending, rewards), then teleport the party to the lobby place. The lobby reads the saved data on join. If saving fails, keep players a few seconds and retry rather than teleporting with unsaved progress.

## Chapter select design

- **Unlock order** reads from saves: chapter N needs chapter N-1 done ([[Story - Story State Flags - Saving Chapter Progress Without Breaking Old Saves]]). Allow a party to play any chapter **the host** has unlocked, so friends can join a veteran.
- **Show what is inside:** length estimate, difficulty, and whether it has jump scares or chases.
- **Recap card** for each chapter: two sentences on "story so far". A Game Developer piece on mobile narrative (2015) recommends repeating key information in small pieces because players take in story a bit at a time.
- **Self-contained chapters:** each one should be fun even if you skipped the last. Story continuity is a bonus layer, not a requirement.

## A chapter's internal shape

1. **Cold open (30-60 s):** an image or event that explains the chapter's goal without text (the exit is chained; a key is missing).
2. **Exploration:** a bushy puzzle chart ([[Story - Puzzle Dependency Charts - Keys, Locks and Gates]]).
3. **Midpoint bottleneck:** a reveal or a new threat.
4. **Climax:** a chase or a final puzzle under pressure.
5. **Ending + hook:** a short scene and one line pointing at the next chapter.

## Live updates

- Release new chapters as **events** with a date; tease them in the lobby (a locked elevator, a boarded door).
- Keep old chapters playable and rotate a "featured" chapter with bonus rewards to spread players.
- Version the chapter places together; a lobby that teleports to a chapter expecting different data is a classic update-day bug.

## Related
[[Story Quests Cinematics - Hub]] · [[Case Study - Piggy]] · [[Case Study - DOORS]] · [[Teleport between places]]

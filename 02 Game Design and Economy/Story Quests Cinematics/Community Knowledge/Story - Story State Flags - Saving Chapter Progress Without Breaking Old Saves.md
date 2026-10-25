---
area: "02 Game Design and Economy"
cluster: "Story Quests Cinematics"
title: "Story State Flags - Saving Chapter Progress Without Breaking Old Saves"
tags: [roblox, community-knowledge, story, datastore, save-data, progression]
cssclasses: [tg-a02]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/cloud-services/data-stores
  - https://create.roblox.com/docs/reference/engine/classes/GlobalDataStore
  - https://heterogenoustasks.wordpress.com/2015/01/26/standard-patterns-in-choice-based-games/
---
# Story State Flags - Saving Chapter Progress Without Breaking Old Saves

A story game's save is not just coins and items. It records **what the player has seen and decided**: which chapters are done, which NPCs are alive, which notes were found, which ending was reached. Story saves have their own failure modes. A renamed flag silently resets a choice. A new chapter added in an update leaves old saves in an impossible state. A co-op party mixes players at different points of the story. This note gives a small, durable shape for story state on top of your normal DataStore layer (session locking, retries and migrations are covered in [[DataStore Session Locking, Retries, Versioning and Erasure]]).

## Shape: three kinds of story data

```lua
local DEFAULT_STORY = {
	version = 3,
	chapters = {},     -- ["ch1"] = {done = true, bestTime = 412, ending = "escape"}
	flags = {},        -- ["savedMara"] = true, ["trust_mara"] = 2
	seen = {},         -- ["cut_ch1_intro"] = true, ["note_017"] = true
	checkpoint = nil,  -- {chapter = "ch2", node = "safe_room_b"}
}
```

| Bucket | Holds | Rule |
|---|---|---|
| `chapters` | completion, endings, records | Never removed, only added |
| `flags` | choices and counters that change later content | Named after **what happened** ("savedMara"), not the path |
| `seen` | cutscenes watched, notes and collectibles found | A set; used for "skip seen cutscenes" and codex UI |
| `checkpoint` | where to resume mid-chapter | Cleared when a chapter ends |

Ashwell's essay on choice-based structures points out that branch-and-bottleneck stories depend on heavy state tracking, so choices still matter after the branches merge. Flags are that tracking ([[Story - Branching Story Structures - Gauntlet, Branch and Bottleneck, Loop and Grow]]).

## Rules that prevent broken saves

1. **Flag names are permanent IDs.** Treat `"savedMara"` like a database column. If you rename it in code, write a migration that copies the old value.
2. **Missing = default.** Code reads `flags.savedMara == true`, never assumes the key exists. Old saves simply lack new flags.
3. **Version and migrate.** Bump `version` when the meaning of data changes, and run migrations in order on load:

```lua
local MIGRATIONS = {
	[2] = function(s) -- v1 -> v2: "ch1_done" boolean moved into chapters table
		if s.ch1_done then s.chapters.ch1 = {done = true} end
		s.ch1_done = nil
	end,
	[3] = function(s) -- v2 -> v3: added seen set
		s.seen = s.seen or {}
	end,
}
local function migrate(s)
	s.version = s.version or 1
	while MIGRATIONS[s.version + 1] do
		MIGRATIONS[s.version + 1](s)
		s.version += 1
	end
	return s
end
```

4. **Never store text.** Store IDs (`"note_017"`), not the note's text, so rewrites and translations do not touch saves.
5. **Server writes only.** The client can *request* "I watched the cutscene"; the server decides whether that sets anything that unlocks content.

## When to save

- On **chapter complete** and **ending reached**: save immediately (these are the moments players will be upset to lose).
- On **checkpoint** (safe room): update the session copy; let your autosave and `PlayerRemoving` / `game:BindToClose` write it.
- Do not write on every flag change; DataStore write limits are per key and per server. Batch through your session cache.

## Co-op parties and story state

Roblox players join friends who are at different points. Decide per game:

- **Host's story.** The party plays the leader's chapter; others get *credit* for completion (`chapters.ch3.done`) but their own `flags` are only changed by choices they voted on.
- **Lowest common chapter.** Matchmaking only offers chapters every member has unlocked.
- **Spoiler guard.** If a player has not seen a cutscene the host has, play it for them (or offer it) rather than skipping for the whole party ([[Story - Multiplayer Cutscene Sync - Server Clock, Late Joiners and Skip Votes]]).

## Updates that add story

- New chapters: unlocked by `chapters.<previous>.done`, so old saves just work.
- Changed endings: keep the old ending ID valid; map it to the new one in a migration if needed.
- Removed content: never delete the ID from saves; mark it unused in code.

## Debug tools (worth building on day one)

- An admin command to print a player's story table.
- Commands to set or clear one flag and jump to a checkpoint. Restrict these to your own user IDs or Studio (`RunService:IsStudio()`).

## Related
[[Story Quests Cinematics - Hub]] · [[Quest System Blueprint]] · [[Save Schema Migrations]] · [[DataStore Production Patterns]]

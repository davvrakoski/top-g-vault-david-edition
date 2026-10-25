---
area: "14 Testing and QA"
cluster: "Testing"
title: "QA Pass - Story and Chapter Games - Save State per Chapter, Replays and Party Progress"
tags: [roblox, community-knowledge, testing, qa, genre-qa, story, chapters, saves]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/projects/teleport
  - https://create.roblox.com/docs/reference/engine/classes/Player
  - https://create.roblox.com/docs/cloud-services/data-stores/best-practices
  - https://create.roblox.com/docs/production/publishing/badges
---
# QA Pass - Story and Chapter Games - Save State per Chapter, Replays and Party Progress

Chapter games (story horror, escape adventures, episodic co-op) save more state than most genres: which chapters are done, checkpoints inside a chapter, story flags, collectibles, endings and badges. Players also replay chapters, play with friends who are further ahead or behind, and come back after an update that added a new chapter. Every one of those moves can overwrite progress, and lost story progress is the review that sinks a story game.

## Bugs this genre always ships with
- **Replay overwrites progress.** Replaying chapter 2 after finishing chapter 5 saves "current chapter = 2", locking chapters 3 to 5.
- **Host progress applied to everyone.** A party is teleported to chapter 4 because the host unlocked it; members who never played chapter 3 get chapter 4 marked done, or lose it if they leave mid-chapter.
- **Chapter unlocks trusted from teleport data.** Teleport data is sent through the client, so the Player API warns it can be abused; an edited client can ask to start the final chapter.
- **Mid-chapter checkpoint mismatch.** A checkpoint saves position but not the items or flags collected so far, so the player respawns past a door with no key.
- **Collectibles counted twice.** Collected in a replay, counted again; "12/10 tapes found".
- **Ending flags.** Multiple endings stored as one "ending" value; reaching ending B erases A.
- **Badges awarded repeatedly or never** because the award runs before the chapter-complete save, or only on one place.
- **New chapter added.** Old saves have no field for it and the chapter select crashes or shows it unlocked.

## Test matrix
For each chapter N, play these profiles (fixture saves from the Save Migration note make this fast):

| Profile | Expect |
|---|---|
| Fresh account | Only chapter 1 open |
| Finished N-1 only | N open, N+1 locked |
| Finished all | All open; replaying N changes nothing above N |
| Mid-checkpoint in N | Resumes at checkpoint with that checkpoint's items and flags |
| Save from before the latest update | Loads, gets defaults for new chapters |

Then the party cases: host ahead of members, member ahead of host, member leaves at each checkpoint, host leaves mid-chapter.

## Test checklist
1. Finish chapter 3, replay chapter 1 to the end. Chapters 2 and 3 still done; best times and collectibles kept.
2. In a party with mixed progress, finish a chapter. Each member gets credit for what they actually played.
3. Edit teleport data from a test client (or send a fake request) asking for a locked chapter. Server refuses.
4. Leave at every checkpoint, rejoin. Position, items and flags match the checkpoint.
5. Collect every collectible twice across two runs. Count caps at the real total.
6. Reach each ending in turn. All reached endings stay recorded.
7. Complete chapters on a slow DataStore (add a delay) and leave during the results screen. Completion still saves.

## Exploit angles
- The chapter place reads unlocks from the player's own save, not from the teleport. Teleport data is fine for non-sensitive hints such as the party id; the Player API points to Memory Stores for sensitive cross-server data.
- Chapter completion fires from a server trigger at the real end, after checking the player's checkpoint sequence.

## Balance checks
- Track completion rate and quit point per chapter. A chapter where many players quit at one puzzle needs a hint, not a skip product.
- Check chapter length against session length data; a 40-minute chapter with no checkpoint loses mobile players.

## Data and save checks
- Store progress as merge-friendly data: a set of completed chapters, a set of flags, a set of collectible ids, a set of endings. Merging never lowers a value.
- Save with `UpdateAsync` and merge, so two places saving close together cannot drop each other's changes.
- Award badges after the save succeeds, and check ownership first so a replay does not retry forever.

## Debug helper: merge rule that can only move forward
```lua
-- Merge a fresh chapter result into the saved profile. Nothing ever decreases.
-- result.flags and result.collectibles are sets: { someFlag = true, tape_03 = true }
local function mergeProgress(saved, result)
	saved.chapters = saved.chapters or {}
	saved.flags = saved.flags or {}
	saved.collectibles = saved.collectibles or {}
	if result.completedChapter then
		saved.chapters[tostring(result.completedChapter)] = true
	end
	for flag in result.flags or {} do saved.flags[flag] = true end
	for id in result.collectibles or {} do saved.collectibles[id] = true end
	saved.highestChapter = math.max(saved.highestChapter or 1, result.completedChapter or 0)
	return saved
end
```
Run every test-matrix profile through this function in a unit test and assert that no field shrinks. Keys are strings so the table saves cleanly as JSON.

## Related
[[Testing - Hub]] - [[Story - Story State Flags - Saving Chapter Progress Without Breaking Old Saves]] - [[Story - Chapter-Based Games - Places, Teleports and Chapter Select]] - [[Story - Co-op Story Checkpoints - Respawn, Catch-Up and Party Wipes]] - [[Test - Teleport and Multi-Place Flow Test Pass]]

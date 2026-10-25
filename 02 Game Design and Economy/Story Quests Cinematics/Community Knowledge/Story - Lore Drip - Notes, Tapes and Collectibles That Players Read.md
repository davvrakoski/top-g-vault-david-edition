---
area: "02 Game Design and Economy"
cluster: "Story Quests Cinematics"
title: "Lore Drip - Notes, Tapes and Collectibles That Players Read"
tags: [roblox, community-knowledge, story, lore, collectibles, codex, narrative-design]
cssclasses: [tg-a02]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://soundingames.dei.uc.pt/index.php/Audio_Logs
  - https://www.gamedeveloper.com/design/narrative-tips-for-mobile-games
  - https://create.roblox.com/docs/reference/engine/classes/ProximityPrompt
  - https://create.roblox.com/docs/production/publishing/badges
---
# Lore Drip - Notes, Tapes and Collectibles That Players Read

Most players will never read a wall of backstory, but a lot of them will happily hunt for **27 hidden notes** and read each one, because it is short, optional and counted. "Lore drip" means spreading the deep story across small collectible pieces (notes, diary pages, audio tapes, photos) so players who care can assemble it while everyone else plays uninterrupted. BioShock's audio diaries are the classic example: the SoundInGames wiki describes them as recordings scattered through the world that give several perspectives on the same events. A 2015 Game Developer article on Christy Marx's mobile narrative work calls the same idea **breadcrumbing**: small story elements spread across separate quests that add up to the bigger story.

## What a good lore piece looks like

- **Short.** 40-80 words for a note, 15-30 seconds for a tape. If it needs more, split it.
- **One fact, one feeling.** Each piece reveals one thing (the doctor knew) and carries one emotion (guilt).
- **A person, not a narrator.** Written by someone in the world, to someone, at a moment. "Day 4. They moved Room 12's patient again. Nobody asked me." beats "The hospital was the site of experiments."
- **Placed where it means something.** The guard's note is in the guard booth; the warning is next to the door it warns about. Pair it with the room's environmental story ([[Environmental Storytelling - What Happened Here]]).
- **Useful sometimes.** Roughly one note in four should also help: a code, a hint, a map. Then even non-readers pick them up.

## Pacing the drip

1. **Early notes** set the mood and ask questions ("Don't let it hear you").
2. **Middle notes** answer one question and open a bigger one.
3. **Late notes** connect to the ending, and one or two only make sense after the ending (rewards replay).
4. **Optional notes** never hold critical-path information alone. If it is needed, also say it with a sign, sound or NPC.

## Data model

```lua
-- ReplicatedStorage/Lore
return {
	note_001 = {chapter = "ch1", title = "LORE_001_TITLE", body = "LORE_001_BODY", kind = "note"},
	tape_004 = {chapter = "ch1", title = "LORE_004_TITLE", audio = "rbxassetid://0", kind = "tape",
		subtitle = "LORE_004_SUB"},
	-- keys point at localization entries, never raw text
}
```

In the world, each pickup is a part tagged `LoreItem` with a `LoreId` attribute. A `ProximityPrompt` ("Read", `HoldDuration` 0) opens it.

## Collection flow

1. Client triggers the prompt; the **server** checks distance and marks `seen[loreId] = true` in story save data ([[Story - Story State Flags - Saving Chapter Progress Without Breaking Old Saves]]).
2. Client shows the reader UI: paper texture, the text, a close button; for tapes, play the audio with subtitles on by default.
3. A small toast: "Note 5 / 27 found".
4. Already-collected items appear slightly faded in the world so replayers do not re-read.

**Pause rules:** reading in a horror game should not be a free safe room, but also must not get players killed unfairly. Options: dim the screen edges and let the world continue (tense), or freeze threats near the reader for a few seconds (gentler). Tapes avoid the problem: they play while you move.

## The codex (journal) screen

- Grouped by chapter, with **locked slots** showing a silhouette and the area name ("??? - Kitchen"). Visible gaps drive collection.
- Re-readable at any time from the menu.
- Completion rewards: a badge per chapter set (badges: up to 5 free per game per day, then 100 Robux each, per the docs), a cosmetic, or a secret ending ([[Story - Endings and Replayability - Multiple Endings, Badges and Post-Game Hooks]]).

## Writing for Roblox players

- Plain words, short sentences; many readers are young or reading in a second language ([[Story - Writing for Kids and Teens on Roblox - Reading Level, Tone and Safety]]).
- Use handwriting fonts only for titles; body text in a clean font at a readable size.
- Localize: keep text in a `LocalizationTable` via keys so auto-translation and translators can cover it.

## Pitfalls

- **Lore dumps** in the first room. Start with questions, not answers.
- **Critical info only in a note.** Players who skip it get stuck.
- **Client-trusted collection.** An exploiter can fire "collected all" in one frame; validate distance and rate on the server.
- **Unreadable on phones.** Test the reader UI at phone width with the longest translated note.

## Related
[[Story Quests Cinematics - Hub]] · [[Environmental Storytelling - What Happened Here]] · [[Quest System Blueprint]] · [[Rich Text and Typewriter Dialogue - MaxVisibleGraphemes]]

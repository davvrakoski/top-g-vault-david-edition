---
area: "02 Game Design and Economy"
cluster: "Story Quests Cinematics"
title: "Puzzle Hint Systems - Tiered Nudges, Timers and Diegetic Clues"
tags: [roblox, community-knowledge, story, puzzles, hints, onboarding, accessibility]
cssclasses: [tg-a02]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://egoventure.readthedocs.io/en/main/docs/hints.html
  - https://www.pcgamer.com/uk/thimbleweed-park-gets-a-hint-system-and-player-character-dialogues
  - https://bit-tech.net/reviews/gaming/pc/yesterday-review/2/
  - https://gameaccessibilityguidelines.com/use-simple-clear-language/
---
# Puzzle Hint Systems - Tiered Nudges, Timers and Diegetic Clues

On Roblox a stuck player does not open a walkthrough; they leave, and they take their friends with them. Puzzle and escape games therefore need a hint system that rescues stuck players without spoiling the "aha" for everyone else. Adventure games solved this decades ago with **escalating hints**: the first hint is vague, each later one is more direct, and the final one is the answer. This note turns that into a Roblox system driven by your puzzle data ([[Story - Puzzle Dependency Charts - Keys, Locks and Gates]]).

## Patterns that have worked

- **Escalating hints per problem.** Classic Infocom-style hint books and many later games let players pick a problem and reveal hints one at a time, each more explicit.
- **Goal-linked notebook.** The open-source EgoVenture adventure engine documents a notebook of goals, each with hints that advance as the player progresses, stored in the save game.
- **In-character hints.** Thimbleweed Park added a hint system and character dialogue so hints come from the world rather than a menu (PC Gamer coverage).
- **Cooldowns.** The adventure game *Yesterday* limited hints to one every few minutes, per bit-tech's review, so players try before asking again.

## Three tiers for every lock

For each puzzle node, write three lines before you build it:

| Tier | Purpose | Example (generator puzzle) |
|---|---|---|
| 1. Direction | Where to look | "The lights died when the power went. Maybe there is a fuse box." |
| 2. Method | What to do | "The fuse box is missing a fuse. The kitchen had a drawer full of spares." |
| 3. Answer | Exact steps | "Kitchen, left drawer: take the fuse, put it in the basement fuse box." |

Keep each under 20 words and in plain language; the Game Accessibility Guidelines recommend simple, clear wording without "dumbing down" the content.

## When to offer hints

Trigger hints on **evidence of being stuck**, not just time:

- No new puzzle step completed for 3 minutes (tier 1 offered), 5 minutes (tier 2), 8 minutes (tier 3).
- The player has tried the same lock 3+ times without the item.
- The player keeps returning to an area already cleared.

Offer, do not force: a small "Need a hint?" button or an NPC line ("Psst..."). Players who want no help can turn auto-offers off in settings.

```lua
-- Server: which hint tier is unlocked for this player's current goal?
local THRESHOLDS = {180, 300, 480} -- seconds stuck before tier 1/2/3
local function unlockedTier(player)
	local stuckFor = os.clock() - (player:GetAttribute("LastProgressAt") or os.clock())
	local tier = 0
	for i, t in THRESHOLDS do
		if stuckFor >= t then tier = i end
	end
	return tier
end
```

Reset `LastProgressAt` every time a puzzle step completes. The current goal is the lowest unsolved node in the dependency chart that the player can reach.

## Diegetic hints (no UI at all)

These work for kids who skip text and for every language:

- **Light the answer.** A flickering light over the fuse box after 4 minutes.
- **Sound cue.** The key jingles when you walk past the drawer it is in.
- **Path decals.** Footprints, scratches or a dropped flashlight pointing toward the next room.
- **NPC glance.** A ghost or companion turns its head toward the solution.
- **Highlight.** A soft `Highlight` (low `FillTransparency`, slow pulse) on the item after the final timer. Use sparingly; it is tier 3.

## Co-op rules

- Hints are **per party**, not per player: the slowest player should not get the answer while the leader is about to find it. Use the party's latest progress time.
- Show who used a hint, gently ("Sam asked the ghost for help"). It stops arguments and is not shaming if worded kindly.
- If one player is far behind (in another room), give them a **catch-up hint** pointing toward the party ("Your friends are in the basement").

## Monetized hints? Be careful

Selling "skip puzzle" or "show answer" for Robux in a game aimed at young players creates a pay-to-progress trap and bad reviews. If you sell anything, sell cosmetics; keep hints free and timer-based.

## Checklist

- [ ] Every lock has 3 written tiers before it is built.
- [ ] Stuck detection uses progress, attempts and time.
- [ ] Diegetic hint at tier 2 or 3 for every critical-path puzzle.
- [ ] Hints can be turned off; answers are never forced.
- [ ] Tier text is localized ([[Translator API in Luau - FormatByKey, Parameters and Fallbacks]]).

## Related
[[Story Quests Cinematics - Hub]] · [[Quest Objective Framework]] · [[NPC Conversation UX - Prompts, Typewriter Text and Skipping]] · [[Story - Puzzle Dependency Charts - Keys, Locks and Gates]]

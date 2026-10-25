---
area: "02 Game Design and Economy"
cluster: "Story Quests Cinematics"
title: "Branching Story Structures - Gauntlet, Branch and Bottleneck, Loop and Grow"
tags: [roblox, community-knowledge, story, branching, narrative-design, choices]
cssclasses: [tg-a02]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://heterogenoustasks.wordpress.com/2015/01/26/standard-patterns-in-choice-based-games/
  - https://emshort.blog/2016/11/05/small-scale-structures-in-cyoa/
  - https://www.ifwiki.org/Standard_Patterns_in_Choice-Based_Games
---
# Branching Story Structures - Gauntlet, Branch and Bottleneck, Loop and Grow

"Your choices matter" is the most expensive promise in game writing. Every real branch doubles the content you must write, voice, test and translate. Roblox story games (choose-your-path roleplay, chapter horror with multiple endings, Story Games-style templates) need a **structure** decided before writing, so the branching is affordable. Sam Kabo Ashwell's 2015 essay *Standard Patterns in Choice-Based Games* names the common structures, and Emily Short's blog treats it as a reference for these terms. Below, each pattern is summarized with what it costs on Roblox and what state it needs. The *data format* for dialogue nodes is in [[Dialogue Trees as Data - Nodes, Conditions and Effects]]; this note is about the *shape* of the whole story.

## The patterns

| Pattern | Shape | State needed | Roblox fit |
|---|---|---|---|
| **Time Cave** | Branches everywhere, never rejoins | None | Short joke stories only; content explodes |
| **Gauntlet** | One main line; side branches end in death, backtrack, or rejoin quickly | Little | Chapter horror, obbies with story |
| **Branch and Bottleneck** | Splits, then rejoins at shared events | Heavy | Best default for story games |
| **Quest** | Modular clusters, few endings, organised by place | Some | Open maps with zones |
| **Open Map** | Reversible geography, revisit freely | Extensive | Hub towns, roleplay worlds |
| **Sorting Hat** | Early branching assigns you to one of several mostly linear routes | Heavy early | Class or faction choice at the start |
| **Floating Modules** | No central plot; encounters appear based on state or chance | Central | Live-ops events, roguelites (DOORS-style rooms) |
| **Loop and Grow** | A cycle that repeats with new options each loop (spoke-and-hub variant) | Central | Day/night survival, time-loop stories |

Ashwell notes most works mix patterns; these are lenses, not boxes.

## Pattern notes for Roblox

**Gauntlet** is the cheapest to author and makes sure every player sees the key story. Ashwell separates *deadly* gauntlets (wrong choice = death) from *friendly* ones (wrong choice rejoins quickly). On Roblox, prefer friendly: a death branch should cost seconds, not the whole chapter.

**Branch and Bottleneck** is the workhorse. The story splits (save the survivor or take the supplies), then rejoins at a shared event (the bridge collapses either way). The essay's warning: because branches merge, you need **state tracking** so earlier choices still show up later, or players feel the choice was fake. Pay it back cheaply:

- a line of dialogue that differs ("You left me behind!"),
- an NPC present or absent at the next bottleneck,
- a prop change (a door already broken),
- a different ending tally.

**Sorting Hat** is popular for "pick your side" games. Ashwell flags that the author effectively writes several separate games, and that the later linearity can surprise players. Keep the number of routes to 2-3.

**Floating Modules** fit DOORS-like rooms and live events: each module checks state to decide whether it can appear. The essay notes it is hard to write for (you cannot assume what happened before) and collapses into linearity without lots of content.

**Loop and Grow** suits survive-the-night games: every night repeats, but each loop opens or closes options. The repetition needs a reason (a curse, a time loop, a shift schedule).

## State as flags, not paths

Track **what happened**, not **which path** was taken. Flags compose; paths explode.

```lua
-- per player (or per party) story state
local story = {
	savedMara = true,
	tookSupplies = false,
	trust = 2,          -- a small counter beats many booleans
	chapter = 3,
}
-- at a bottleneck, read flags to vary presentation
local line = story.savedMara and "MARA_THANKS" or "MARA_GRAVE"
```

Persist this in your save data ([[Story - Story State Flags - Saving Chapter Progress Without Breaking Old Saves]]).

## Multiplayer choices

Roblox stories are often played in groups, so decide who chooses:

- **Vote** with a short timer (10-15 s) and a visible tally; ties break randomly.
- **Host chooses** (the party leader) for private servers.
- **Personal choices** for things only you see (your character's reply), group votes for world changes.

Whatever the rule, show it up front so nobody feels their choice was stolen.

## Budget rule of thumb

Count *unique content*, not choices. A branch that rejoins after one scene costs one scene. Plan so that unique content is at most about 30% of the total; the rest is shared and can be polished.

## Related
[[Story Quests Cinematics - Hub]] · [[Dialogue and Cutscene Blueprint]] · [[Dialogue Trees as Data - Nodes, Conditions and Effects]] · [[Quest System Blueprint]]

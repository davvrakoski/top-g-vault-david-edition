---
area: "02 Game Design and Economy"
cluster: "Story Quests Cinematics"
title: "Dialogue Trees as Data - Nodes, Conditions and Effects"
tags: [roblox, community-knowledge, dialogue, npc, quests, data-driven]
cssclasses: [tg-a02]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://github.com/inkle/ink
  - https://yarnspinner.dev/license
  - https://docs.yarnspinner.dev/
  - https://create.roblox.com/docs/production/game-design/introduction-to-quest-design
  - https://create.roblox.com/docs/production/localization
---
# Dialogue Trees as Data - Nodes, Conditions and Effects

Hard-coding NPC conversations in scripts (`if choice == 2 then ...`) collapses after the third quest. Professional narrative tools such as **ink** (inkle) and **Yarn Spinner** treat dialogue as data: nodes of lines, choices with conditions, and effects that change game state. You do not need either tool on Roblox (they target other engines), but their structure is the right model for a Luau dialogue system.

## The four building blocks

| Block | What it is | Example |
|---|---|---|
| **Node** | A chunk of lines said in order | `blacksmith_intro` |
| **Choice** | Player option that jumps to another node | "Got any work?" -> `blacksmith_quest` |
| **Condition** | Rule that shows/hides a choice or line | `quest.iron_ore == "active"` |
| **Effect** | State change when a line/choice runs | `startQuest("iron_ore")`, `give("Gold", 50)` |

Yarn and ink both also have **variables** (state the script can read) and **commands** that call back into the game. Keep that split: dialogue data never runs arbitrary code, it calls named effects your server code implements.

## A Luau data shape

```lua
-- Own example: one NPC's dialogue as a ModuleScript (shared, read-only)
return {
	start = "intro",
	nodes = {
		intro = {
			lines = { { who = "Smith", key = "SMITH_HELLO" } },
			choices = {
				{ key = "ASK_WORK", to = "offer", cond = { notStarted = "iron_ore" } },
				{ key = "TURN_IN", to = "reward", cond = { canComplete = "iron_ore" } },
				{ key = "BYE", to = nil },
			},
		},
		offer = {
			lines = { { who = "Smith", key = "SMITH_OFFER" } },
			effects = { { op = "startQuest", id = "iron_ore" } },
		},
		reward = {
			lines = { { who = "Smith", key = "SMITH_THANKS" } },
			effects = { { op = "completeQuest", id = "iron_ore" } },
		},
	},
}
```

- **Lines are keys, not text.** `SMITH_HELLO` maps to a localization table entry, so the same data works in every language (Roblox auto-translation and `LocalizationTable`).
- **Conditions are declarative** (`notStarted`, `canComplete`, `hasItem`), evaluated on the **server** for anything that grants rewards.
- **Effects are an allow-list** of ops. The server validates that the player is actually at the node that triggers them.

## Server authority

The client may *display* nodes and send "picked choice 2", but the server must track the current node per player and reject choices that are not valid from it. Otherwise an exploiter fires `completeQuest` directly.

## Authoring workflow

1. Write the conversation in plain text or a spreadsheet first (writers can use ink or Yarn's editors to draft and test branching, then export or hand-convert).
2. Convert to the Luau table above (a small script can do this).
3. Lint: every `to` exists, every key has a translation, no dead-end nodes without a "Bye".

## Design tips

- Keep branches shallow: 2-3 choices, re-converging quickly. Deep trees multiply writing cost.
- Always offer an exit choice.
- Use conditions to make NPCs remember the player (different greeting after a quest); that small touch sells the world.

## Related
[[Story Quests Cinematics - Hub]] - [[Dialogue and Cutscene Blueprint]] - [[Quest Objective Framework]] - [[Quest System Blueprint]]

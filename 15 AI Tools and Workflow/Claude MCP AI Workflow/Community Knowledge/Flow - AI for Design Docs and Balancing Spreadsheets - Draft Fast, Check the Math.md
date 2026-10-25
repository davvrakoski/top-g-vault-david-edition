---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
title: "AI for Design Docs and Balancing Spreadsheets - Draft Fast, Check the Math"
tags: [roblox, community-knowledge, ai-workflow, game-design, balancing]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/analytics/economy-events
  - https://create.roblox.com/docs/assistant/prompt-engineering
  - https://create.roblox.com/docs/reference/engine/classes/AnalyticsService
---
# AI for Design Docs and Balancing Spreadsheets - Draft Fast, Check the Math

AI is genuinely good at the boring half of design work: turning a messy idea into a structured one-pager, listing edge cases, generating a first pass of item tables and writing spreadsheet formulas. It is genuinely bad at the half that matters: knowing whether the numbers feel right, and doing arithmetic reliably in prose. The workflow below uses AI where it is strong and forces the numbers into a spreadsheet where you can see and test them.

## 1. Design docs: AI as editor, not author

Use AI to **restructure** your notes, never to invent the game.

1. Brain-dump the idea in your own words (bullets are fine).
2. Prompt: "Turn this into a one-page design doc with sections: core loop, session goal, progression, monetisation, risks. Do not add features I did not mention; list open questions separately."
3. Ask a second question: "List 10 ways a player could break or exploit this loop." This is where AI earns its keep.
4. You make the decisions; paste them back as the final doc.

Format reference: [[One-Page Design Docs for Roblox Games]].

## 2. Balancing: numbers live in a sheet, not in chat

Never accept a balance table typed out in a chat reply as final. Language models can produce plausible-looking numbers with arithmetic slips. Instead:

- Ask the AI for **formulas and column layout**, then build the sheet yourself.
- Ask for the formula in a form you can test: "Give a Google Sheets formula for XP needed at level L where total time to level 50 is 10 hours at 600 XP per minute."
- Put the outputs in columns you can chart. A curve you can see beats a table you have to trust.

Useful sheet columns for an item or upgrade table:

| Column | Meaning |
|---|---|
| `Level` | 1..N |
| `Cost` | currency to buy this level |
| `Gain` | income per minute after buying |
| `Payback (min)` | `Cost / (Gain - previous Gain)` |
| `Cumulative time (min)` | running total of time to afford every level |

Flag any row where payback jumps by more than ~2x compared with the previous row; that is usually where players quit or skip. (This 2x rule is a heuristic, not a measured constant.)

See [[Economy Sources and Sinks Spreadsheet Model]] and [[XP Curve Formulas - Time-to-Level Targets and Level Caps]] for worked models.

## 3. Prompts that work for balancing

- "Here are my sources and sinks per minute (pasted CSV). Which sink is too weak to matter? Show the calculation."
- "Write a Luau module that loads this table and asserts payback time never decreases between levels." (Turns your design rule into a test.)
- "Suggest three alternative curves (linear, exponential 1.15, polynomial L^1.8) and give the total time to max for each." Then check the totals in the sheet.

## 4. Close the loop with real data

AI-drafted numbers are a guess until players touch them. Log economy events in game (Roblox's Economy events analytics records sources and sinks) and compare real time-to-level against the sheet after the first weekend. Update the sheet, not the chat.

## 5. Keep the numbers in one place

Export the final table to a Luau config module (`Shared/EconomyConfig.luau`) generated from the sheet, so code and design never disagree:

```lua
--!strict
-- generated from Economy sheet v3; do not edit by hand
return {
	{ level = 1, cost = 50, gain = 2 },
	{ level = 2, cost = 120, gain = 4 },
}
```

## Pitfalls

- Asking AI "is this balanced?" with no target. Give the target: session length, time to max, spend per day.
- Letting AI copy a famous game's numbers. Your loop, session length and audience differ.
- Pasting real revenue or player data into a consumer AI app; see [[Flow - Local vs Cloud AI - Keeping Unreleased Game Code Private]].

## Related
[[Claude MCP AI Workflow - Hub]] · [[Game Design, Balancing and Difficulty]] · [[Economy Sources and Sinks Spreadsheet Model]] · [[One-Page Design Docs for Roblox Games]]

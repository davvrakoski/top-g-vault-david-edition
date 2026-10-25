---
area: "15 AI Tools and Workflow"
cluster: "Obsidian Workflow"
title: "Daily Devlog and Weekly Review in Obsidian"
tags: [roblox, community-knowledge, obsidian, devlog, planning]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://obsidian.md/help/plugins/daily-notes
  - https://obsidian.md/help/plugins/templates
  - https://blacksmithgu.github.io/obsidian-dataview/
---
# Daily Devlog and Weekly Review in Obsidian

A two-minute daily devlog is the cheapest productivity tool a Roblox dev can have. It answers "what did I do last Tuesday?", gives an AI assistant instant context when you resume, feeds your public update logs and devlog videos, and makes the weekly review honest. Obsidian's core **Daily notes** plugin plus one template is all you need.

## Setup (core plugins only)

1. **Settings > Core plugins**: enable **Daily notes** and **Templates**.
2. Daily notes options:
   - **Date format**: keep `YYYY-MM-DD` (sorts correctly). A format like `YYYY/MM/YYYY-MM-DD` creates month subfolders.
   - **New file location**: `10 Devlog`.
   - **Template file location**: `Templates/Daily Devlog`.
3. Bind the command **Open today's daily note** to a hotkey (e.g. `Ctrl+Shift+D`).

## The daily template

```markdown
---
type: devlog
date: {{date}}
build: 
hours: 
mood: 
---
# {{date}}

## Did
- 

## Learned / gotchas
- 

## Blocked by
- 

## Next session starts with
- 
```

Rules that keep it useful:

- **"Next session starts with" is the most important line.** Write it before closing Studio. It kills the 20-minute "where was I" warm-up.
- Link systems you touched (`[[Shop System]]`), so the system note's backlinks become its history.
- Put the build label or git tag in `build` when you publish ([[Build Versioning - Git Tags, PlaceVersion and an In-Game Build Label]]).
- Three bullets is a good day's entry. A devlog that takes 15 minutes stops being written.

## The weekly review (20 minutes, same day each week)

Create `10 Devlog/Weekly/2026-W43` from a weekly template:

```markdown
# Week {{date:YYYY-[W]WW}}
## Shipped
## Slipped (and why)
## Player signal (analytics, feedback, bugs)
## Cut or postponed
## Top 3 for next week
```

Pull the raw material with one Dataview query in the weekly note:

````markdown
```dataview
TABLE WITHOUT ID file.link AS "Day", hours, build
FROM "10 Devlog"
WHERE type = "devlog" AND date >= date(today) - dur(7 days)
SORT date ASC
```
````

Then answer one question honestly: **did the top 3 from last week ship?** If not two weeks in a row, the plan is too big, not you too slow; cut scope ([[Flow - Weekly Planning and Timeboxing for Solo Roblox Devs]]).

## Turning the devlog into content

- Weekly "Shipped" list becomes the in-game update log and Discord announcement ([[Marketing - Update Logs and Patch Notes That Get Read]]).
- "Learned / gotchas" bullets become short-form devlog video ideas.
- Monthly: skim the month's entries for the best before/after clip.

## Feeding AI assistants

Point your agent at the last 3 daily notes plus the project state note at the start of a session. That is far cheaper in context than re-explaining the project ([[Claude Context Efficiency]], [[Project State, Decisions and Resume Notes]]).

## Pitfalls

- Logging feelings instead of facts. Mood is one word in the property; the body is what happened.
- Only logging good days. Blocked days are the most useful entries in a review.
- Daily notes in the vault root: keep them in their own folder so the graph and search stay clean.

## Related
[[Obsidian Workflow - Hub]] · [[Project State, Decisions and Resume Notes]] · [[Templater for Game Design Notes - Prompts, Folder Templates and Safety]] · [[Flow - Sustainable Dev Pace - Spotting and Avoiding Burnout]]

---
area: "15 AI Tools and Workflow"
cluster: "Obsidian Workflow"
title: "Dataview Recipes for a Game Design Dashboard - GROUP BY, FLATTEN, Tasks and Orphans"
tags: [roblox, community-knowledge, obsidian, dataview, game-design]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://blacksmithgu.github.io/obsidian-dataview/queries/structure/
  - https://blacksmithgu.github.io/obsidian-dataview/
  - https://github.com/blacksmithgu/obsidian-dataview
---
# Dataview Recipes for a Game Design Dashboard - GROUP BY, FLATTEN, Tasks and Orphans

[[Obsidian Bases for Game Design Trackers]] covers editable tables, and [[Obsidian Workflow for a Roblox Dev Team]] shows two basic Dataview tables. This note goes further: a single **dashboard note** for a Roblox project built from Dataview queries that group features by milestone, pull open tasks out of every design note, list unbalanced items, and find orphan notes. Dataview is a community plugin (MIT licence); its query language (DQL) runs inside fenced code blocks tagged `dataview`.

## DQL in one paragraph

A query is `<TYPE> <fields>` (TABLE, LIST, TASK or CALENDAR; the type is the only mandatory part), then an optional `FROM` source (folder in quotes, `#tag`, or `[[link]]`), then any number of `WHERE`, `SORT`, `GROUP BY`, `FLATTEN` and `LIMIT` commands, which run in the order written. It is not SQL; read the docs' "differences to SQL" page if you know SQL.

## Properties to standardise first

Put these in your feature/system note template ([[Templater for Game Design Notes - Prompts, Folder Templates and Safety]]):

```yaml
type: feature        # feature | system | item | bug | playtest
status: planned      # idea | planned | building | testing | shipped | cut
milestone: M2
owner: tdod
cost_robux: 0
```

## Recipe 1: features grouped by milestone

````markdown
```dataview
TABLE WITHOUT ID milestone AS "Milestone", length(rows) AS "Count", rows.file.link AS "Features"
FROM "02 Systems"
WHERE type = "feature" AND status != "cut"
GROUP BY milestone
SORT milestone ASC
```
````

After `GROUP BY`, each row is a group; the original notes are in `rows`, so `rows.file.link` lists them and `length(rows)` counts them. `WITHOUT ID` hides the default first column.

## Recipe 2: every open task in design notes

````markdown
```dataview
TASK
FROM "02 Systems" OR "05 Playtests"
WHERE !completed
GROUP BY file.link
```
````

Write tasks anywhere (`- [ ] tune sword cooldown`); the dashboard collects them, and ticking a box in the dashboard ticks it in the source note.

## Recipe 3: one row per tag with FLATTEN

````markdown
```dataview
TABLE WITHOUT ID tag AS "Tag", length(rows) AS "Notes"
FROM "02 Systems"
FLATTEN file.etags AS tag
GROUP BY tag
SORT length(rows) DESC
```
````

`FLATTEN` turns a note with three tags into three rows, so you can count notes per tag (a fast way to see which systems are over- or under-documented).

## Recipe 4: items with suspicious balance

````markdown
```dataview
TABLE cost_robux, dps, round(dps / cost_robux, 2) AS "DPS per Robux"
FROM "03 Items"
WHERE type = "item" AND cost_robux > 0
SORT dps / cost_robux DESC
LIMIT 10
```
````

The top of this list is where pay-to-win complaints come from. Treat it as a prompt to check your spreadsheet, not as balance truth.

## Recipe 5: orphan notes and stale notes

````markdown
```dataview
LIST
FROM "02 Systems"
WHERE length(file.inlinks) = 0
```
````

````markdown
```dataview
TABLE file.mtime AS "Last edited", status
FROM "02 Systems"
WHERE status = "building" AND file.mtime < date(today) - dur(14 days)
```
````

The first finds notes nothing links to (link them to a hub or delete them); the second finds "building" features nobody touched in two weeks, usually silent scope creep or a blocked task.

## Performance and safety

- Dataview queries re-run as you edit; dozens of heavy queries on one page can slow large vaults. Keep dashboards to ~6 queries.
- Avoid `dataviewjs` blocks from strangers; they run JavaScript in your vault.
- Queries are plain text, so AI agents can read your dashboard source, but not its rendered result. For agents, keep the important state in a normal note ([[Project State, Decisions and Resume Notes]]).

## Related
[[Obsidian Workflow - Hub]] · [[Obsidian Bases for Game Design Trackers]] · [[Obsidian Workflow for a Roblox Dev Team]] · [[Vault Search, Tags, Properties and Conventions]]

---
area: "15 AI Tools and Workflow"
cluster: "Graph View Setup"
title: "Local Graph, Orphans and Unlinked Mentions - Keeping a Vault Connected"
tags: [roblox, community-knowledge, obsidian, graph-view, maintenance]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://obsidian.md/help/plugins/graph
  - https://obsidian.md/help/plugins/backlinks
  - https://blacksmithgu.github.io/obsidian-dataview/
---
# Local Graph, Orphans and Unlinked Mentions - Keeping a Vault Connected

A knowledge vault is only as useful as its links. A note about your DataStore retry logic that nothing links to will never be found by a teammate, and an AI agent following links from a hub will never read it. Obsidian gives you three maintenance tools for this: the **local graph** (what is around this note), the **Orphans** filter (what is connected to nothing) and **unlinked mentions** (where a note's name appears without a link). A 15-minute monthly pass with them keeps a growing game vault navigable.

## The local graph: context for one note

- Open with the command **Open local graph** (or from a note's menu). It shows only notes connected to the active note and supports all the global graph settings.
- **Depth** slider (top of the local graph's filter settings): 1 = direct links only; 2 = links of links. Use depth 1 to check a note's own links, depth 2 to see which hub it sits under.
- Pin the local graph in a side pane next to your editor. As you move between notes it follows, so you see instantly when a new note is floating alone.

What to look for:

1. **No hub in sight at depth 2**: the note is not reachable from any hub; add a link to its topic hub.
2. **Only outgoing links**: nothing points to it yet; link it from a related note or the hub.
3. **Link to a non-existent note** (enable non-existing files in filters): either create the note or remove the link.

## Orphans: notes linked to nothing

In the global graph, turn on the **Orphans** filter and zoom out; isolated dots at the edge are orphans. For a list instead of dots, a Dataview query works:

````markdown
```dataview
LIST
WHERE length(file.inlinks) = 0 AND length(file.outlinks) = 0
SORT file.ctime DESC
```
````

For each orphan decide: **link** it (to a hub and one sibling), **merge** it into a better note, or **archive** it. Do not leave it floating; orphans are where duplicated knowledge starts.

## Unlinked mentions: links you forgot to make

The **Backlinks** pane has two sections:

- **Linked mentions**: notes that link to this one.
- **Unlinked mentions**: places where this note's name appears as plain text. Files matching your **Excluded files** setting are skipped.

Options in the pane: collapse results, **show more context** (whole paragraph), change sort order, and a search filter. Open a note like `ProfileStore`, check unlinked mentions, and convert the meaningful ones to links (current versions show a **Link** button when you hover a result; the help page does not describe it, so unverified; editing the text by hand always works).

Tip: short or generic note names ("Shop", "UI") produce useless unlinked mentions. Specific names ("Shop System - Server Purchase Flow") produce useful ones. That is another reason to name notes precisely ([[Vault Search, Tags, Properties and Conventions]]).

## Aliases help both

Add `aliases: [PS, ProfileStore module]` in a note's properties. Links can then use the alias, and unlinked-mention search also finds aliases, so abbreviations used by the team stop hiding connections. (Alias matching in unlinked mentions is standard Obsidian behaviour; confirm on your version.)

## The monthly maintenance pass

1. Global graph, Orphans on: fix the newest 10 orphans.
2. Open each topic hub's local graph at depth 1: is every recent note linked?
3. For the 5 most-used system notes, process unlinked mentions.
4. Turn off "Existing files only" briefly: create or delete dangling links.
5. Write one line in the devlog: "vault pass: N orphans fixed".

## Why this matters for AI agents

Agents reading a vault usually start at an entry note and follow links (see [[Project State, Decisions and Resume Notes]]). An unlinked note does not exist to them. Keeping hubs complete is the cheapest way to make AI context accurate.

## Related
[[Graph View Setup - Hub]] · [[Obsidian MOCs, Atomic Notes and Links]] · [[Flow - Graph View Groups, Filters and Forces for a Game Dev Vault]] · [[Obsidian Workflow for a Roblox Dev Team]]
